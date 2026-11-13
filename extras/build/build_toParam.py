"""Builds patchers/dingus.toParam.maxpat. Run from the package folder: python3 extras/build/build_toParam.py"""
import os, sys
sys.path.insert(0, os.path.dirname(__file__))
from pbuild import Patch

GREY = [0.45, 0.45, 0.45, 1.0]
NS = 4
P = Patch(rect=(60, 80, 1700, 900))
P.comment('dingus.toParam', 40, 10, bold=True, fontsize=20.0)
P.comment('up to 4 modulation signals -> 0..1 floats for the PARAM inlets of the dingus plug-in hosts '
          '(pluginStereo, plugin16in, ...), sent only when they change. The host picks the parameter.   '
          'USE [bpatcher dingus.toParam.maxpat]', 40, 42, width=1500)

# --- INPUTS: one column per slot ---
X0, Y0, COLW = 40, 100, 200
XC = X0 + 180
P.comment('INPUTS: one column per slot', XC, Y0, bold=True, width=400)
P.comment('each input is read every "rate" ms (snapshot~); a value goes out only when it has\n'
          'moved by "delta", and the last small move once the input has been still for "settle" ms',
          XC, Y0 + 26, width=780, lines=2, textcolor=GREY)
Y = Y0 + 100
vals = []
for k in range(NS):
    x = XC + k * COLW
    P.comment('slot %d' % (k + 1), x, Y, width=80)
    i = P.inlet(x, Y + 26, 'slot %d (signal)' % (k + 1))
    rr = P.obj('r #0-rate', x + 90, Y + 26, 1, 1)
    sn = P.obj('snapshot~ 10', x, Y + 96, 2, 1, ['float'])
    v = P.msg('val %d $1' % (k + 1), x, Y + 156)
    P.connect(i, 0, sn, 0)
    P.connect(rr, 0, sn, 1)       # the read interval
    P.connect(sn, 0, v, 0)
    vals.append(v)
rcv = P.obj('r #0-toparam', X0, Y + 156, 1, 1)
P.comment('settings', X0, Y + 126, width=100, textcolor=GREY)
vals.append(rcv)

# --- CONVERTER and OUTPUTS: one outlet per slot ---
YC = Y + 260
js = P.obj('v8 dingus.toParam.js', XC, YC, 1, 5, w=4 * COLW + 30)
for m in vals:
    P.connect(m, 0, js, 0)
P.comment('CONVERTER: the input range lo..hi -> 0..1; sent on change, the final value when still;\noptionally each slot as a MIDI CC too', X0, YC + 210, width=760, lines=2, textcolor=GREY)
for k in range(NS):
    o = P.outlet(XC + k * COLW, YC + 80, 'slot %d: 0..1 (to a plug-in host\'s PARAM inlet)' % (k + 1))
    P.connect(js, k, o, 0)
it = P.obj('iter', XC + NS * COLW, YC + 40, 1, 1)
P.connect(js, 4, it, 0)
oc = P.outlet(XC + NS * COLW, YC + 80, 'CCs as raw MIDI bytes (to midiout; NEVER into vst~: a number there changes its preset)')
P.connect(it, 0, oc, 0)
P.comment('OUTPUTS: slot 1 .. 4, 0..1 -> the PARAM inlets of a plug-in host;\nrightmost: the CCs as raw MIDI bytes for [midiout] (never into vst~)', XC, YC + 120, width=760, lines=2)

# --- SETTINGS (the panel) ---
SX, SY = XC + NS * COLW + 140, Y0
P.comment('SETTINGS (the panel)', SX, SY, bold=True, width=300)
P.comment('per slot: lo..hi = the input range that maps to 0..1 (default 0..1); cc = the MIDI CC number\n'
          'for hardware (-1 = off, the default). Defaults at load; a preset of the parent patch overrides them',
          SX, SY + 26, width=820, lines=2, textcolor=GREY)
y0 = SY + 130
GW = 300
for k in range(NS):
    gx = SX + k * GW
    ry = 52 + k * 28
    lb = P.obj('loadbang', gx, y0, 1, 1)
    P.comment('slot %d' % (k + 1), gx, y0 - 26, width=80, textcolor=GREY)
    dr = P.msg('0. 1.', gx, y0 + 50)
    dc = P.msg('-1', gx + 150, y0 + 50)
    nc = P.number(gx + 150, y0 + 150, pres=(162, ry, 50, 26), var='cc%d' % (k + 1), lo=-1, hi=127, w=56, triangle=0)
    mc = P.msg('cc %d $1' % (k + 1), gx + 150, y0 + 200)
    sc = P.obj('s #0-toparam', gx + 150, y0 + 300, 1, 0, [])
    P.connect(lb, 0, dc, 0)
    P.connect(dc, 0, nc, 0)
    P.chain(nc, mc, sc)
    ur = P.obj('unpack 0. 1.', gx, y0 + 100, 1, 2, w=110)
    lo = P.number(gx, y0 + 150, pres=(30, ry, 60, 26), var='lo%d' % (k + 1), flo=True, w=50, triangle=0)
    hi = P.number(gx + 60, y0 + 150, pres=(96, ry, 60, 26), var='hi%d' % (k + 1), flo=True, w=50, triangle=0)
    pr = P.obj('pak 0. 1.', gx, y0 + 200, 2, 1, w=110)
    mr = P.obj('prepend range %d' % (k + 1), gx, y0 + 250, 1, 1, w=140)
    sr = P.obj('s #0-toparam', gx, y0 + 300, 1, 0, [])
    P.chain(lb, dr, ur)
    P.connect(ur, 0, lo, 0); P.connect(ur, 1, hi, 0)
    P.connect(lo, 0, pr, 0); P.connect(hi, 0, pr, 1)
    P.chain(pr, mr, sr)

GY = y0 + 400
P.comment('global: rate = how often the inputs are read (ms); delta = the smallest move sent at once (0..1);\n'
          'settle = the stillness before the last small move goes out (ms); ch = the CCs\' MIDI channel', SX, GY, width=780, lines=2, textcolor=GREY)
GY += 60
lb2 = P.obj('loadbang', SX, GY, 1, 1)
GY += 50
glob = (('10', 'rate', None, 1, 1000, False, (44, 168, 50, 26)),
        ('0.004', 'delta', 'delta $1', 0., 0.5, True, (150, 168, 64, 26)),
        ('80', 'settle', 'settle $1', 1, 2000, False, (64, 196, 54, 26)),
        ('1', 'channel', 'channel $1', 1, 16, False, (250, 168, 44, 26)))
for k, (dv, var, mt, lo_, hi_, flo, pres) in enumerate(glob):
    gx = SX + k * 160
    d = P.msg(dv, gx, GY)
    n = P.number(gx, GY + 50, pres=pres, var=var, lo=lo_, hi=hi_, flo=flo, w=70)
    P.connect(lb2, 0, d, 0)
    P.connect(d, 0, n, 0)
    if mt is None:
        sr = P.obj('s #0-rate', gx, GY + 160, 1, 0, [])
        P.comment('-> the snapshot~s', gx, GY + 190, width=150, textcolor=GREY)
        P.connect(n, 0, sr, 0)
    else:
        m = P.msg(mt, gx, GY + 100)
        sx = P.obj('s #0-toparam', gx, GY + 160, 1, 0, [])
        P.chain(n, m, sx)
br = P.button('resend', SX + 4 * 160, GY + 50, pres=(130, 196, 80, 24))
mrs = P.msg('resend', SX + 4 * 160, GY + 100)
srs = P.obj('s #0-toparam', SX + 4 * 160, GY + 160, 1, 0, [])
P.chain(br, mrs, srs)
P.comment('resend: every slot\'s value again\n(e.g. after loading a plug-in)', SX + 4 * 160 + 100, GY + 50, width=260, lines=2, textcolor=GREY)
P.obj('autopattr @autorestore 0', SX, GY + 250, 1, 4, varname='u_toparam_autopattr')
P.comment("autopattr: the panel's values reach the parent patch's presets", SX, GY + 280, width=520, textcolor=GREY)

# the panel's labels (presentation only), out of the way in the patching view
LX, LY = SX + NS * GW + 40, SY + 90
P.comment('panel labels:', LX, LY, width=130, textcolor=GREY)
labels = [('toParam', (4, 2, 100, 24), True), ('lo', (30, 28, 30, 24), False), ('hi', (96, 28, 30, 24), False),
          ('cc', (162, 28, 30, 24), False), ('rate', (4, 168, 40, 24), False), ('delta', (100, 168, 50, 24), False),
          ('ch', (222, 168, 26, 24), False), ('settle', (4, 196, 58, 24), False)]
labels += [(str(k + 1), (4, 52 + k * 28, 18, 24), False) for k in range(NS)]
for k, (t, pr, bold) in enumerate(labels):
    P.comment(t, LX, LY + 30 + k * 30, bold=bold, pres=pr)

out = os.path.join(os.path.dirname(__file__), '..', '..', 'patchers', 'dingus.toParam.maxpat')
print(P.save(out))
