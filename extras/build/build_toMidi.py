"""Builds patchers/dingus.toMidi.maxpat. Run from the package folder: python3 extras/build/build_toMidi.py"""
import os, sys
sys.path.insert(0, os.path.dirname(__file__))
from pbuild import Patch

GREY = [0.45, 0.45, 0.45, 1.0]
SCLDIR = '~/Dropbox/musicstuff/Max 9/Library/th.scala/scl/'      # the same folder as the sequencers' tuning menus

P = Patch(rect=(60, 80, 1900, 1000))
P.comment('dingus.toMidi', 40, 10, bold=True, fontsize=20.0)
P.comment('a pitch + gate pair (markovSeq, pitchGateSeq, pitchSeq) -> notes for vst~ or a MIDI synth, '
          'with microtonal pitch as MPE bends (retune) or for synths that load the scale.   '
          'USE [bpatcher dingus.toMidi.maxpat]', 40, 42, width=1500)

# --- INPUTS ---
X0, Y = 40, 100
P.comment('INPUTS', X0, Y, bold=True)
P.comment('gen~ dingus.toMidiIn counts the gate\'s rises and falls at the sample and holds the velocity and pitch\n'
          'of each rise; every 2 ms they are read -> "poll <rises> <falls> <vel> <pitch> <pitch now>", so no note is\n'
          'missed, even a trigger shorter than a signal vector (Max reads signals once per vector)', X0, Y + 26,
          width=900, lines=3, textcolor=GREY)
Y += 110
XG, XP = X0 + 260, X0 + 580
P.comment('gate', XG, Y)
P.comment('pitch', XP, Y)
ig = P.inlet(XG, Y + 26, 'gate (signal; level = velocity)')
ip = P.inlet(XP, Y + 26, 'pitch (signal; dingus pitch CV 0..1.0494 = MIDI 0..127, or MIDI with "in midi")')
gen = P.obj('gen~ dingus.toMidiIn', XG, Y + 96, 2, 4, ['signal'] * 4, w=300)
P.connect(ig, 0, gen, 0)
P.connect(ip, 0, gen, 1)
lb0 = P.obj('loadbang', X0, Y + 156, 1, 1)
mt = P.obj('metro 2', X0, Y + 206, 2, 1, ['bang'])
P.comment('read every 2 ms', X0 + 90, Y + 206, width=140, textcolor=GREY)
tb = P.obj('t b b b b b', X0, Y + 286, 1, 5, ['bang'] * 5, w=180)
P.chain(lb0, mt, tb)
# one snapshot~ per value; the trigger reads them right to left, the rise count last (it sends the list)
SXS = [XG, XG + 100, XG + 200, XG + 300, XP + 120]
snaps = []
for k, x in enumerate(SXS):
    sn = P.obj('snapshot~', x, Y + 346, 2, 1, ['float'], w=90)
    P.connect(tb, k, sn, 0)
    snaps.append(sn)
for k in range(4):
    P.connect(gen, k, snaps[k], 0)
P.connect(ip, 0, snaps[4], 0)
pk = P.obj('pack 0. 0. 0. 0. 0.', XG, Y + 406, 5, 1, w=520)
for k, sn in enumerate(snaps):
    P.connect(sn, 0, pk, k)
ppl = P.obj('prepend poll', XG, Y + 456, 1, 1)
P.connect(pk, 0, ppl, 0)
rcv = P.obj('r #0-tomidi', XP + 220, Y + 456, 1, 1)
P.comment('settings', XP + 220, Y + 426, width=100, textcolor=GREY)

# --- CONVERTER and OUTPUTS ---
YC = Y + 540
XV = XG
js = P.obj('v8 dingus.toMidi.js', XV, YC, 1, 2, w=220)
for m in (ppl, rcv):
    P.connect(m, 0, js, 0)
P.comment('CONVERTER: retune / scale / detune,\nMPE channels or one channel', XV + 240, YC, width=500, lines=2, textcolor=GREY)
it = P.obj('iter', XV + 180, YC + 60, 1, 1)
o1 = P.outlet(XV, YC + 120, 'to vst~ (midievent messages)')
o2 = P.outlet(XV + 180, YC + 120, 'raw MIDI bytes (to midiout; NEVER into vst~: a number there changes its preset)')
P.comment('OUTPUTS:  left = to vst~ (midievent),\nright = raw MIDI bytes for [midiout] (never into vst~)', XV + 240, YC + 112, width=500, lines=2)
P.connect(js, 0, o1, 0)
P.connect(js, 1, it, 0)
P.connect(it, 0, o2, 0)

# --- SETTINGS: one column per setting; each ends in its own [s #0-tomidi] ---
SX, SY = 1100, 100
P.comment('SETTINGS (the panel)', SX, SY, bold=True, width=300)
P.comment('defaults at load: retune, MPE on channels 2-16, bend range 48, glide on, pitch in as CV;\n'
          'a preset of the parent patch overrides them', SX, SY + 26, width=760, lines=2, textcolor=GREY)
y0 = SY + 90
lb = P.obj('loadbang', SX, y0, 1, 1)
yd, yu, ym, ys = y0 + 50, y0 + 110, y0 + 170, y0 + 230      # defaults, UI, message, send rows
cols = []

def column(x, default, ui, msgtext, prep=False):
    d = P.msg(default, x, yd) if default is not None else None
    m = P.obj(msgtext, x, ym, 1, 1) if prep else P.msg(msgtext, x, ym)
    s = P.obj('s #0-tomidi', x, ys, 1, 0, [])
    if d:
        P.connect(lb, 0, d, 0)
        P.connect(d, 0, ui, 0)
    return m, s

# mode: retune / scale / detune
mmenu = P.menu(['retune', 'scale', 'detune'], SX, yu, 100, pres=(56, 30, 100, 26), var='mode')
m, s = column(SX, '0', mmenu, 'prepend mode', prep=True)
P.connect(mmenu, 1, m, 0); P.connect(m, 0, s, 0)
# mpe on / off
tm = P.toggle(SX + 130, yu, pres=(206, 31, 24, 24), var='mpe')
m, s = column(SX + 130, '1', tm, 'mpe $1'); P.chain(tm, m, s)
# non-MPE channel
nch = P.number(SX + 260, yu, pres=(194, 60, 44, 26), var='channel', lo=1, hi=16, w=50)
m, s = column(SX + 260, '1', nch, 'channel $1'); P.chain(nch, m, s)
# MPE channel range
nf = P.number(SX + 390, yu, pres=(70, 60, 40, 26), var='mpefirst', lo=1, hi=16, w=44, triangle=0)
nl = P.number(SX + 440, yu, pres=(114, 60, 40, 26), var='mpelast', lo=1, hi=16, w=44, triangle=0)
d1 = P.msg('2', SX + 390, yd); d2 = P.msg('16', SX + 440, yd)
P.connect(lb, 0, d1, 0); P.connect(lb, 0, d2, 0); P.connect(d1, 0, nf, 0); P.connect(d2, 0, nl, 0)
pkc = P.obj('pak 2 16', SX + 390, ym, 2, 1, w=94)
pch = P.obj('prepend channels', SX + 390, ys, 1, 1)
sch = P.obj('s #0-tomidi', SX + 390, ys + 50, 1, 0, [])
P.connect(nf, 0, pkc, 0); P.connect(nl, 0, pkc, 1); P.chain(pkc, pch, sch)
# synth bend range
nb = P.number(SX + 590, yu, pres=(50, 90, 50, 26), var='synthbend', lo=1, hi=96, w=56)
m, s = column(SX + 590, '48', nb, 'synthbend $1'); P.chain(nb, m, s)
# glide
tg = P.toggle(SX + 730, yu, pres=(156, 92, 24, 24), var='glide')
m, s = column(SX + 730, '1', tg, 'glide $1'); P.chain(tg, m, s)
# pitch in: cv / midi
pmenu = P.menu(['cv', 'midi'], SX + 860, yu, 70, pres=(210, 90, 47, 26), var='pitchin')
m, s = column(SX + 860, '0', pmenu, 'prepend pitchin', prep=True)
P.connect(pmenu, 1, m, 0); P.connect(m, 0, s, 0)

# tuning: the .scl menu -> th.scala (its dictionary, for scale mode)
TY = ys + 120
P.comment('TUNING: the same scales as the sequencers; pick the one the sequencer uses (for scale mode)',
          SX, TY, width=860, textcolor=GREY)
tmenu = P.menu([], SX, TY + 40, 220, pres=(58, 162, 199, 26), var='tuningmenu',
               autopopulate=1, prefix=SCLDIR, prefix_mode=2, pattrmode=1)
ld = P.msg('load $1', SX, TY + 160)
ths = P.obj('th.scala #0_tomidi @tune 440 @center 69', SX, TY + 220, 1, 2, w=360)
sths = P.obj('s #0-tomidi', SX, TY + 280, 1, 0, [])
P.connect(tmenu, 1, ld, 0)
P.chain(ld, ths, sths)
# buttons
BX = SX + 600
bpa = P.button('panic', BX, TY + 40, pres=(169, 2, 60, 24))
P.chain(bpa, P.msg('panic', BX, TY + 100), P.obj('s #0-tomidi', BX, TY + 160, 1, 0, []))
P.comment('panic: all notes off, bends centred', BX + 80, TY + 40, width=320, textcolor=GREY)
P.obj('autopattr @autorestore 0', SX, TY + 340, 1, 4, varname='u_tomidi_autopattr')
P.comment("autopattr: the panel's values reach the parent patch's presets", SX, TY + 370, width=520, textcolor=GREY)

# the panel's labels (presentation only), out of the way in the patching view
LX, LY = SX + 1040, SY + 90
P.comment('panel labels:', LX, LY, width=130, textcolor=GREY)
for k, (t, pr, bold) in enumerate((('toMidi', (4, 2, 100, 24), True), ('mode', (4, 30, 50, 24), False),
                                   ('MPE', (164, 30, 43, 24), False), ('ch', (166, 60, 26, 24), False),
                                   ('MPE ch', (4, 60, 65, 24), False), ('bend', (4, 90, 46, 24), False),
                                   ('glide', (108, 90, 46, 24), False), ('in', (188, 90, 22, 24), False),
                                   ('tuning', (-2, 162, 60, 24), False))):
    P.comment(t, LX, LY + 30 + k * 30, bold=bold, pres=pr)
# the scale group: only for synths that load the .scl themselves, on one channel
P.comment('relevant when nonMPE / scale / Scala-aware synths:', LX, LY + 30 + 10 * 30, width=280, lines=2,
          textcolor=GREY, pres=(4, 118, 249, 42))

out = os.path.join(os.path.dirname(__file__), '..', '..', 'patchers', 'dingus.toMidi.maxpat')
print(P.save(out))
