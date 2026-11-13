"""Builds patchers/dingus.toDrums.maxpat. Run from the package folder: python3 extras/build/build_toDrums.py"""
import os, sys
sys.path.insert(0, os.path.dirname(__file__))
from pbuild import Patch

P = Patch(rect=(60, 80, 1900, 900))
P.comment('dingus.toDrums', 40, 10, bold=True, fontsize=20.0)
P.comment('8 trigger / gate rows (markovPerc, gatesSeq) -> drum notes for vst~ or a MIDI synth.   '
          'USE [bpatcher dingus.toDrums.maxpat]', 40, 42, width=1100)

# --- INPUTS: one column per row (220 px each); the settings come in as one more source on the left ---
GREY = [0.45, 0.45, 0.45, 1.0]
COLW, X0, Y0 = 220, 40, 90
XC = X0 + 180            # the first row's column
P.comment('INPUTS: one column per row', XC, Y0, bold=True, width=400)
P.comment('gen~ dingus.toDrumsIn catches each rise at the sample and holds its level (= the velocity): one number\n'
          'per row (rise count, velocity, up). Every 2 ms all 8 are read -> "poll <c1> .. <c8>", so no hit is missed,\n'
          'even a trigger shorter than a signal vector (Max reads signals once per vector)', XC, Y0 + 26, width=1000, lines=3,
          textcolor=GREY)
Y = Y0 + 110
lb0 = P.obj('loadbang', X0, Y + 26, 1, 1)
mt = P.obj('metro 2', X0, Y + 76, 2, 1, ['bang'])
P.comment('read every\n2 ms', X0 + 90, Y + 76, width=100, lines=2, textcolor=GREY)
tb = P.obj('t b b', X0, Y + 136, 1, 2, ['bang', 'bang'])
stk = P.obj('s #0-tick', X0 + 60, Y + 296, 1, 0, [])
P.chain(lb0, mt, tb)
P.connect(tb, 1, stk, 0)          # rows 2-8 first (cold inlets of the pack) ...
P.comment('rows 2-8 first,\nrow 1 last', X0 + 80, Y + 126, width=140, lines=2, textcolor=GREY)
pk = P.obj('pack ' + ' '.join(['0.'] * 8), XC, Y + 306, 8, 1, ['list'], w=7 * COLW + 100)
for k in range(8):
    x = XC + k * COLW
    P.comment('row %d' % (k + 1), x + 100, Y - 26 + 26, width=80)
    i = P.inlet(x + 100, Y + 26, 'row %d trigger / gate (signal; level = velocity)' % (k + 1))
    g = P.obj('gen~ dingus.toDrumsIn', x + 100, Y + 86, 1, 1, ['signal'], w=110)
    sn = P.obj('snapshot~', x + 100, Y + 246, 2, 1, ['float'], w=90)
    P.connect(i, 0, g, 0)
    P.connect(g, 0, sn, 0)
    if k == 0:
        P.connect(tb, 0, sn, 0)    # ... then row 1, which sends the list
    else:
        rt = P.obj('r #0-tick', x, Y + 196, 1, 1, w=90)
        P.connect(rt, 0, sn, 0)
    P.connect(sn, 0, pk, k)
ppl = P.obj('prepend poll', XC, Y + 356, 1, 1)
P.connect(pk, 0, ppl, 0)
rcv = P.obj('r #0-todrums', X0, Y + 356, 1, 1)
P.comment('settings', X0, Y + 326, width=100, textcolor=GREY)
msgs = [ppl, rcv]

# --- CONVERTER and OUTPUTS, under the middle of the rows ---
YC = Y + 460
XV = XC + 3 * COLW + 60
js = P.obj('v8 dingus.toDrums.js', XV, YC, 1, 2, w=240)
P.comment('CONVERTER: note on at each hit; note off after "off ms"\n(or at the fall when off ms = 0)', XV + 260, YC,
          width=520, lines=2, textcolor=[0.45, 0.45, 0.45, 1.0])
for m in msgs:
    P.connect(m, 0, js, 0)
it = P.obj('iter', XV + 200, YC + 60, 1, 1)
o1 = P.outlet(XV, YC + 120, 'to vst~ (midievent messages)')
o2 = P.outlet(XV + 200, YC + 120, 'raw MIDI bytes (to midiout; NEVER into vst~: a number there changes its preset)')
P.comment('OUTPUTS:  left = to vst~ (midievent),  right = raw MIDI bytes for [midiout] (never into vst~)', XV + 260, YC + 122, width=800)
P.connect(js, 0, o1, 0)
P.connect(js, 1, it, 0)
P.connect(it, 0, o2, 0)

# --- SETTINGS (the panel), right of the inputs: one column per setting, each into its own [s #0-todrums] ---
SX, SY = XC + 8 * COLW + 40, Y0
P.comment('SETTINGS (the panel)', SX, SY, bold=True, width=300)
P.comment('defaults at load; a preset of the parent patch overrides them', SX, SY + 26, width=560,
          textcolor=[0.45, 0.45, 0.45, 1.0])
XCH, XOFF, XN, XP = SX, SX + 130, SX + 260, SX + 260 + 8 * 36 + 30
y = SY + 70
lb = P.obj('loadbang', XCH, y, 1, 1)
y += 50
dch = P.msg('10', XCH, y)
doff = P.msg('50', XOFF, y)
dn = P.msg('36 38 42 46 45 48 49 51', XN, y)
P.comment('GM: kick, snare, hats, toms, crash, ride', XN, y - 26, width=340, textcolor=[0.45, 0.45, 0.45, 1.0])
un = P.obj('unpack 0 0 0 0 0 0 0 0', XN, y + 50, 1, 8, w=280)
y += 110
ch = P.number(XCH, y, pres=(30, 30, 44, 26), var='channel', lo=1, hi=16, w=50)
off = P.number(XOFF, y, pres=(138, 30, 50, 26), var='offms', lo=0, hi=2000, w=60)
nums = [P.number(XN + k * 36, y, pres=(4 + k * 33, 84, 31, 26), var='note%d' % (k + 1), lo=0, hi=127, w=34, triangle=0)
        for k in range(8)]
pb = P.button('panic', XP, y, pres=(4, 116, 60, 24))
y += 60
chm = P.msg('channel $1', XCH, y)
offm = P.msg('offms $1', XOFF, y)
pak = P.obj('pak 36 38 42 46 45 48 49 51', XN, y, 8, 1, w=280)
pm = P.msg('panic', XP, y)
pn = P.obj('prepend notes', XN, y + 50, 1, 1)
y += 110
sends = [P.obj('s #0-todrums', x, y, 1, 0, []) for x in (XCH, XOFF, XN, XP)]
P.obj('autopattr @autorestore 0', SX, y + 70, 1, 4, varname='u_todrums_autopattr')
P.comment("autopattr: the panel's values reach the parent patch's presets", SX, y + 100, width=520,
          textcolor=[0.45, 0.45, 0.45, 1.0])

# the panel's labels (presentation only), out of the way in the patching view
LX, LY = SX + 700, SY + 70
P.comment('panel labels:', LX, LY, width=130, textcolor=[0.45, 0.45, 0.45, 1.0])
P.comment('toDrums', LX, LY + 30, bold=True, pres=(4, 2, 100, 24))
P.comment('ch', LX, LY + 60, pres=(4, 30, 26, 24))
P.comment('off ms', LX, LY + 90, pres=(84, 30, 54, 24))
P.comment('notes, rows 1-8', LX, LY + 120, pres=(4, 60, 140, 24))

P.connect(lb, 0, dch, 0)
P.connect(lb, 0, doff, 0)
P.connect(lb, 0, dn, 0)
P.connect(dch, 0, ch, 0)
P.connect(doff, 0, off, 0)
P.chain(dn, un)
for k in range(8):
    P.connect(un, k, nums[k], 0)
    P.connect(nums[k], 0, pak, k)
P.chain(ch, chm, sends[0])
P.chain(off, offm, sends[1])
P.chain(pak, pn, sends[2])
P.chain(pb, pm, sends[3])

out = os.path.join(os.path.dirname(__file__), '..', '..', 'patchers', 'dingus.toDrums.maxpat')
print(P.save(out))
