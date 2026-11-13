import json, re, copy, sys, os
# Builds patchers/dingus.markovPerc.maxpat from the working parts of dingus.markovSeq.maxpat plus the new
# engine and roll. Run from the package folder: python3 extras/build/build_markovPerc.py
sys.path.insert(0, os.path.dirname(__file__))
from pbuild import paramify
HERE = os.path.join(os.path.dirname(__file__), '..', '..', 'patchers')
SRC, DST = os.path.join(HERE, 'dingus.markovSeq.maxpat'), os.path.join(HERE, 'dingus.markovPerc.maxpat')
d = json.load(open(SRC))
p = d['patcher']
B = {o['box']['id']: o['box'] for o in p['boxes']}

COPY = ['mcp', 'hdr', 'use', 'roll', 'lb', 'bufdel', 'bufm', 'bufgen',
        'un_cmt', 'un_key', 'un_expr', 'un_sel', 'un_undo', 'un_redo',
        'help_btn', 'help_t', 'help_open', 'help_pc', 'help_p',
        'g_in-clock', 'g_in-reset', 'g_in-rreset', 'g_in-play', 'g_in-lmod', 'g_in-rmod', 'in-cscale', 'in-bar', 'sq_in',
        'g_rate', 'g_c-rate', 'g_ratesig', 'g_rateadd', 'g_ratereset_t', 'g_ratereset', 'g_ratetilde',
        'g_scope-rate', 'ck_ticks', 'g_stepreset_t', 'g_click', 'g_playmsg',
        'mk_freeze', 'mk_fc', 'mk_freezem', 'mk_mc', 'mk_mutate', 'mk_mutdiv', 'mk_mutatem',
        'ptm', 'ptmc', 'ptmm', 'csm', 'barrt', 'barct', 'barzero', 'barm',
        'apat', 'ppre', 'plogic', 'pstore', 'pjs', 'pjs_slotfilter', 'pcm',
        'sq_bchg', 'sq_bpp', 'sq_dsp', 'sq_dsppp', 'sq_setsq', 'sq_cmt', 'sq_box', 'sq_m1', 'sq_pseq',
        'sq_minus', 'sq_minus_m', 'sq_plus', 'sq_plus_m', 'sq_copy', 'sq_copy_m', 'sq_paste', 'sq_paste_m',
        'sq_clear', 'sq_clear_m', 'sq_dlg', 'obj-8', 'obj-9',
        'obj-12', 'snc', 'snpp', 'obj-13', 'obj-3', 'obj-7', 'obj-5', 'obj-4',
        'g_scope-gate', 'g_scope-env']
boxes = {i: copy.deepcopy(B[i]) for i in COPY}
lines = [l for l in p['lines'] if l['patchline']['source'][0] in boxes and l['patchline']['destination'][0] in boxes]
# the old engine's wiring goes; the old roll's scope lines too
lines = [l for l in lines if not (l['patchline']['source'][0] == 'g_ratetilde' and l['patchline']['destination'][0] == 'ck_ticks')]

def setp(i, pr):
    boxes[i]['presentation'] = 1
    boxes[i]['presentation_rect'] = [float(v) for v in pr]

# --- renames ---
b = boxes
b['mcp']['text'] = 'maxmcp uMP'
b['hdr']['text'] = 'uMP'
b['use']['text'] = 'USE [bpatcher dingus.markovPerc.maxpat @args NAME]'
b['roll'].update({'filename': 'dingus.markovPercRoll.js', 'varname': 'mproll',
                  'textfile': {'filename': 'dingus.markovPercRoll.js', 'flags': 0, 'embed': 0, 'autowatch': 1}})
b['bufm']['text'] = 'buffer #0-mp, chbuffer #0-mpch, seqname #1'
b['bufgen']['text'] = 'gb #0-mp, cb #0-mpch'
b['ppre']['pattrstorage'] = '#1_uMP'
b['pstore'].update({'text': 'pattrstorage #1_uMP @savemode 0 @autorestore 0', 'varname': '#1_uMP', 'priority': {'rate': -2, 'mproll': -1}})
b['pjs']['text'] = 'v8 dingus.presetFile.js uMP #1'
b['pcm']['text'] = 'PRESETS: _maxPresets/uMP_<bpatcher argument>.json (click = recall, shift-click = store)'
for o in b['plogic']['patcher']['boxes']:
    x = o['box']
    if x['id'] == 'pri': x['text'] = 'priority rate -2, priority mproll -1'
    if x['id'] == 'bind': x['text'] = 'pattrstorage #1_uMP'
    if x['id'] == 'cm': x['text'] = 'presets: file _maxPresets/uMP_<bpatcher argument>.json, read at load, written on every store'
b['apat'].pop('restore', None)
b['apat'].pop('restore_extra', None)
b['apat']['varname'] = 'u_mp_autopattr'
b['obj-5']['text'] = 'loadmess 1'           # beat: grid lines per row step
b['g_in-lmod']['comment'] = 'freeze: 1 = on, 0 = off'
for k in ('annotation', 'hint'): b['g_in-lmod'].pop(k, None)
b['sq_in']['comment'] = 'sequence 1-32 (takes over at the phasor wrap)'

# inlet order = left to right
INL = ['g_in-clock', 'in-trig', 'g_in-reset', 'g_in-rreset', 'g_in-play', 'g_in-lmod', 'g_in-rmod', 'in-cscale', 'in-bar', 'sq_in']
new = {}
def box(i, cls, rect, **kw):
    x = {'id': i, 'maxclass': cls, 'patching_rect': [float(v) for v in rect]}
    x.update(kw)
    new[i] = x
    return x
def obj(i, text, rect, nin, nout, otype=None, **kw):
    return box(i, 'newobj', rect, text=text, numinlets=nin, numoutlets=nout, outlettype=otype if otype is not None else [''] * nout, fontsize=16.0, **kw)
def msg(i, text, rect, **kw):
    return box(i, 'message', rect, text=text, numinlets=2, numoutlets=1, outlettype=[''], fontsize=16.0, **kw)
def cmt(i, text, rect, pr=None, **kw):
    x = box(i, 'comment', rect, text=text, numinlets=1, numoutlets=0, fontsize=16.0, **kw)
    if pr: x.update(presentation=1, presentation_rect=[float(v) for v in pr])
    return x
def num(i, rect, pr, var, lo=None, hi=None, flo=False, **kw):
    x = box(i, 'flonum' if flo else 'number', rect, numinlets=1, numoutlets=2, outlettype=['', 'bang'], fontsize=16.0,
            parameter_enable=0, presentation=1, presentation_rect=[float(v) for v in pr], varname=var, **kw)
    if lo is not None: x['minimum'] = lo
    if hi is not None: x['maximum'] = hi
    if flo: x['format'] = 6
    return x
def tog(i, rect, pr, var):
    return box(i, 'toggle', rect, numinlets=1, numoutlets=1, outlettype=['int'], parameter_enable=0,
               presentation=1, presentation_rect=[float(v) for v in pr], varname=var)
L = []
def ln(s, so, t, ti): L.append({'patchline': {'source': [s, so], 'destination': [t, ti]}})

# the trigger clock inlet
box('in-trig', 'inlet', [0, 0, 30, 22], numinlets=0, numoutlets=1, outlettype=[''], index=0,
    comment='trigger clock (signal): rows set to T step on every div-th rising edge')
for k, i in enumerate(INL):
    (b.get(i) or new[i])['patching_rect'] = [700.0 + k * 60, 20.0, 30.0, 22.0]

# --- the engine ---
GX, GY = 700, 420
obj('mp_gen', 'mc.gen~ dingus.markovPerc @chans 8', [GX, GY, 420, 26], 4, 5, ['multichannelsignal'] * 5, varname='mpgen')
obj('mp_dupP', 'mc.dup~ 8', [GX, GY - 60, 90, 26], 1, 1, ['multichannelsignal'])
obj('mp_dupT', 'mc.dup~ 8', [GX + 110, GY - 60, 90, 26], 1, 1, ['multichannelsignal'])
obj('mp_dupR', 'mc.dup~ 8', [GX + 220, GY - 60, 90, 26], 1, 1, ['multichannelsignal'])
ln('g_ratetilde', 0, 'mp_dupP', 0)
ln('mp_dupP', 0, 'mp_gen', 0)
ln('in-trig', 0, 'mp_dupT', 0)
ln('mp_dupT', 0, 'mp_gen', 1)
ln('g_click', 0, 'mp_dupR', 0)
ln('mp_dupR', 0, 'mp_gen', 2)
ln('in-trig', 0, 'ck_ticks', 0)
for s in ('g_playmsg', 'mk_freezem', 'mk_mutatem', 'ptmm', 'csm', 'barm', 'bufgen'):
    ln(s, 0, 'mp_gen', 0)
ln('g_in-lmod', 0, 'mk_freeze', 0)
# 8 trigger outlets, then 8 envelope outlets (plain signals)
obj('mp_unpT', 'mc.unpack~ 8', [GX, GY + 220, 120, 26], 1, 8, ['signal'] * 8)
obj('mp_unpE', 'mc.unpack~ 8', [GX + 700, GY + 220, 120, 26], 1, 8, ['signal'] * 8)
ln('mp_gen', 0, 'mp_unpT', 0)
ln('mp_gen', 1, 'mp_unpE', 0)
for k in range(8):
    box('out-t%d' % k, 'outlet', [GX + k * 60, GY + 300, 30, 22], numinlets=1, numoutlets=0, index=0,
        comment='row %d trigger (signal, level = velocity)' % (k + 1))
    box('out-e%d' % k, 'outlet', [GX + 700 + k * 60, GY + 300, 30, 22], numinlets=1, numoutlets=0, index=0,
        comment='row %d envelope (signal, peak = velocity)' % (k + 1))
    ln('mp_unpT', k, 'out-t%d' % k, 0)
    ln('mp_unpE', k, 'out-e%d' % k, 0)
# the scopes of the outputs: all rows summed
obj('mp_mixT', 'mc.mixdown~ 1', [GX, GY + 60, 120, 26], 2, 1, ['multichannelsignal'])
obj('mp_mixE', 'mc.mixdown~ 1', [GX + 200, GY + 60, 120, 26], 2, 1, ['multichannelsignal'])
ln('mp_gen', 0, 'mp_mixT', 0)
ln('mp_gen', 1, 'mp_mixE', 0)
ln('mp_mixT', 0, 'g_scope-gate', 0)
ln('mp_mixE', 0, 'g_scope-env', 0)
# the hits that play -> the roll's playheads; the bank -> bankis
# per row: mc.unpack~ 8 -> snapshot~ -> pak (one list of the 8 hits)
obj('mp_hunp', 'mc.unpack~ 8', [GX + 420, GY + 60, 120, 26], 1, 8, ['signal'] * 8)
ln('mp_gen', 2, 'mp_hunp', 0)
obj('mp_hpak', 'pak -1 -1 -1 -1 -1 -1 -1 -1', [GX + 420, GY + 140, 260, 26], 8, 1)
for k in range(8):
    obj('mp_hs%d' % k, 'snapshot~ 30', [GX + 420 + k * 95, GY + 100, 90, 26], 2, 1, ['float'])
    ln('mp_hunp', k, 'mp_hs%d' % k, 0)
    ln('mp_hs%d' % k, 0, 'mp_hpak', k)
ln('mp_hpak', 0, 'roll', 1)
obj('mp_bsnap', 'mc.snapshot~ 20', [GX + 600, GY + 60, 130, 26], 2, 1)
obj('mp_bfirst', 'zl.slice 1', [GX + 600, GY + 95, 90, 26], 2, 2)
ln('mp_gen', 3, 'mp_bsnap', 0)
ln('mp_bsnap', 0, 'mp_bfirst', 0)
ln('mp_bfirst', 0, 'sq_bchg', 0)
# the roll's messages
obj('mp_rt', 'route needbuffer engine seqis', [GX, GY + 160, 260, 26], 1, 4)
ln('roll', 0, 'mp_rt', 0)
ln('mp_rt', 0, 'bufm', 0)
ln('mp_rt', 1, 'mp_gen', 0)
ln('mp_rt', 2, 'sq_setsq', 0)
# buffers
obj('mp_buf', 'buffer~ #0-mp @samps 16408 @chans 11', [40, 560, 300, 26], 1, 2, ['float', 'bang'])
obj('mp_chbuf', 'buffer~ #0-mpch @samps 65536 @chans 5', [40, 600, 320, 26], 1, 2, ['float', 'bang'])

# --- the new controls ---
CX, CY = 40, 700
def ctl(i, label, var, pr_num, pr_cmt, msgtext, default, lo=None, hi=None, flo=False, k=0, div=None):
    y = CY + k * 40
    num(i, [CX, y, 60, 26], pr_num, var, lo, hi, flo)
    cmt(i + '_c', label, [CX + 70, y, 90, 26], pr_cmt)
    obj(i + '_lm', 'loadmess ' + str(default), [CX + 170, y, 110, 26], 1, 1)
    ln(i + '_lm', 0, i, 0)
    src = i
    if div:
        obj(i + '_div', '/ ' + div, [CX + 290, y, 60, 26], 2, 1)
        ln(i, 0, i + '_div', 0)
        src = i + '_div'
    m = msg(i + '_m', msgtext, [CX + 360, y, 130, 26])
    ln(src, 0, i + '_m', 0)
    return m
ctl('mp_cycles', 'cycles', 'cycles', [60, 110, 44, 26], [2, 110, 56, 24], 'cycles $1', 1, 1, 8, k=0)
ctl('mp_trigms', 'trig ms', 'trigms', [60, 230, 50, 26], [2, 230, 60, 24], 'trigms $1', 5, 0.5, 50, True, k=1)
ctl('mp_accvel', 'acc vel', 'accvel', [60, 260, 44, 26], [2, 260, 60, 24], 'accvel $1', 30, 0, 100, k=2, div='100.')
ctl('mp_accdec', 'x dec', 'accdec', [160, 260, 50, 26], [110, 260, 50, 24], 'accdec $1', 1.5, 0.1, 10, True, k=3)
ln('mp_cycles_m', 0, 'roll', 0)
for s in ('mp_trigms_m', 'mp_accvel_m', 'mp_accdec_m'):
    ln(s, 0, 'mp_gen', 0)
tog('mp_ghosts', [CX, CY + 200, 24, 24], [100, 140, 20, 20], 'ghosts')
cmt('mp_ghosts_c', 'ghosts', [CX + 30, CY + 200, 70, 26], [122, 137, 60, 24])
obj('mp_ghosts_lm', 'loadmess 1', [CX + 110, CY + 200, 100, 26], 1, 1)
msg('mp_ghosts_m', 'ghosts $1', [CX + 220, CY + 200, 100, 26])
ln('mp_ghosts_lm', 0, 'mp_ghosts', 0)
ln('mp_ghosts', 0, 'mp_ghosts_m', 0)
ln('mp_ghosts_m', 0, 'roll', 0)
obj('mp_rate_lm', 'loadmess 1.', [1330, 160, 100, 26], 1, 1)
ln('mp_rate_lm', 0, 'g_rate', 0)
cmt('mp_outc', 'out: triggers / envelopes', [CX, CY + 240, 220, 26], [2, 400, 180, 24])

# --- presentation layout (left column 0..186, top row from 190) ---
setp('hdr', [2, 0, 60, 27])
setp('g_rate', [2, 32, 54, 26]); setp('g_c-rate', [58, 33, 50, 24])
setp('g_scope-rate', [2, 60, 182, 46]); setp('ck_ticks', [2, 60, 182, 46])
setp('obj-7', [110, 110, 40, 24]); setp('obj-3', [148, 110, 36, 26])          # beat
setp('obj-12', [2, 140, 20, 20]); setp('snc', [24, 137, 50, 24])               # snap
setp('mk_freeze', [2, 170, 20, 20]); setp('mk_fc', [24, 167, 56, 24])
setp('mk_mc', [82, 167, 76, 24]); setp('mk_mutate', [146, 166, 38, 26])
setp('ptm', [2, 200, 20, 20]); setp('ptmc', [24, 197, 157, 24])
setp('help_btn', [158, 228, 26, 22])
setp('ppre', [2, 292, 182, 52])
setp('g_scope-gate', [2, 424, 182, 40]); setp('g_scope-env', [2, 468, 182, 50])
setp('sq_cmt', [190, 2, 36, 24]); setp('sq_box', [228, 1, 44, 26])
setp('sq_minus', [276, 2, 24, 22]); setp('sq_plus', [304, 2, 24, 22])
setp('sq_copy', [336, 2, 52, 22]); setp('sq_paste', [392, 2, 56, 22]); setp('sq_clear', [452, 2, 54, 22])
setp('obj-8', [512, 2, 80, 22])
b['g_scope-gate']['range'] = [0.0, 1.5]
b['g_scope-env']['range'] = [0.0, 1.5]
b['g_scope-gate']['activelinecolor'] = [0.85, 0.65, 0.30, 1.0]
ROLLW, ROLLH = 1300.0, 808.0
b['roll']['presentation_rect'] = [190.0, 32.0, ROLLW, ROLLH]
b['roll']['patching_rect'] = [1300.0, 900.0, ROLLW, ROLLH]

# --- help ---
H1 = ("ROWS (left strip)\n"
      "M = mute (the row keeps walking)\n"
      "S = the row's START: click, drag to a hit = link\n"
      "P / T = clock: phasor / trigger inlet\n"
      "steps: drag = steps per cycle\n"
      "   (T: left half = div, right half = steps drawn)\n"
      "rs: drag = restart every rs steps (- = never)\n"
      "   double-click = one cycle\n"
      "\n"
      "HITS\n"
      "click = new hit, drag right = length\n"
      "a hit's length = the time until its row moves on\n"
      "   (where it sits = only the order; gaps take no time)\n"
      "drag the end = length (alt = free)\n"
      "drag = move (up / down = into another row),\n"
      "   option-drag = copy\n"
      "double-click = delete\n"
      "shift-drag empty space = pick a group")
H2 = ("LINKS\n"
      "shift-drag hit to hit (same row) = link\n"
      "shift-drag to a hit in ANOTHER row = follow link\n"
      "   (teal): that row jumps there at once when this\n"
      "   hit plays; several into one row = one of them,\n"
      "   each its own %, the rest = no push\n"
      "click a hit or S: its links get % handles\n"
      "drag a handle = chance, double-click = delete\n"
      "grey ghosts = where each row's walk plays\n"
      "   (red end = cut by a restart)\n"
      "\n"
      "LANES (the selected hit)\n"
      "VEL  RATCH  ACC (accent)  ATK  DEC  CURVE\n"
      "CHANCE: click a cell = editor, op band = menu\n"
      "\n"
      "OUT: 8 trigger outlets (rows 1-8, level = velocity),\n"
      "then 8 envelope outlets\n"
      "Ctrl+Z / Ctrl+Shift+Z = undo / redo")
hp = b['help_p']['patcher']
FS, LH, colw = 16.0, 20.0, 440
cols = [H1, H2]
ch = int(max(c.count('\n') + 1 for c in cols) * LH + 16)
W, H = 20 + len(cols) * (colw + 20), ch + 40
hp['boxes'] = [{'box': {'id': 'help_c%d' % k, 'maxclass': 'comment', 'text': c, 'fontsize': FS, 'linecount': c.count('\n') + 1,
                        'numinlets': 1, 'numoutlets': 0, 'patching_rect': [20.0 + k * (colw + 20), 20.0, float(colw), float(ch)]}}
               for k, c in enumerate(cols)]
hp['boxes'].append({'box': {'id': 'help_in', 'maxclass': 'inlet', 'comment': '', 'index': 1, 'numinlets': 0, 'numoutlets': 1,
                            'outlettype': [''], 'patching_rect': [W - 40.0, H + 20.0, 30.0, 30.0]}})
hp['lines'] = []
hp['rect'] = [120.0, 120.0, float(W), float(H)]

out = {'patcher': {k: v for k, v in p.items() if k not in ('boxes', 'lines')}}
P = out['patcher']
P['rect'] = [34.0, 92.0, 1500.0, 900.0]
P['parameters'] = {k: v for k, v in p['parameters'].items() if k in ('obj-12', 'ptm', 'parameterbanks', 'inherited_shortname')}
P['boxes'] = [{'box': x} for x in list(b.values()) + list(new.values())]
# parameter mode on the named controls (presets); not the seq box (left out of autopattr on purpose: the
# roll keeps the sequence number) nor the ? button
for x in P['boxes']:
    if x['box']['id'] in ('sq_box', 'help_btn'):
        continue
    if not x['box'].get('parameter_enable'):
        paramify(x['box'])
P['lines'] = lines + L
ids = {x['box']['id'] for x in P['boxes']}
for l in P['lines']:
    assert l['patchline']['source'][0] in ids and l['patchline']['destination'][0] in ids, l
txt = json.dumps(out, indent=4)
txt = re.sub(r'\[\s*\n([^\[\]{}]*?)\n\s*\]', lambda m: '[ ' + ', '.join(x.strip().rstrip(',') for x in m.group(1).split('\n')) + ' ]', txt)
open(DST, 'w').write(txt + '\n')
print('ok', len(P['boxes']), 'boxes', len(P['lines']), 'lines')
