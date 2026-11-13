"""pbuild: write Max patches (.maxpat) from Python with a readable patching layout.

Conventions (the dingus patches):
- font size 16 everywhere; objects 26 px tall
- signal flow top to bottom, left to right; inlets at the top, outlets at the bottom
- each part of the patch is a section: a header comment, then its objects on a grid
- comments explain the steps that aren't obvious

Positions are given in grid cells (col, row) inside a section: one cell is CW x RH px.
"""
import json, re

FS = 16.0
OH = 26.0          # object height at font 16
CW, RH = 10, 40    # grid cell: 10 px wide, 40 px tall (one object row plus a gap for patch cords)
CHARW = 9.0        # about one character at font 16


class Section:
    def __init__(self, patch, x, y, title, note=None):
        self.p, self.x, self.y = patch, x, y
        patch.comment(title, x, y, bold=True, width=max(200, len(title) * 10 + 20))
        self.top = y + 34
        if note:
            lines = note.count('\n') + 1
            patch.comment(note, x, self.top, width=self.p.notew, lines=lines, color=[0.55, 0.55, 0.55, 1.0])
            self.top += lines * 20 + 10

    def at(self, col, row):
        return self.x + col * CW, self.top + row * RH


class Patch:
    def __init__(self, rect=(60, 80, 1400, 900), presentation=True):
        self.boxes, self.lines, self.n = [], [], 0
        self.rect = list(map(float, rect))
        self.presentation = presentation
        self.notew = 360

    def _id(self, hint):
        self.n += 1
        return '%s_%d' % (re.sub(r'[^A-Za-z0-9]', '', hint)[:12] or 'obj', self.n)

    def _add(self, b):
        self.boxes.append({'box': b})
        return b['id']

    def width(self, text, minw=40):
        return max(minw, len(text) * CHARW + 18)

    def obj(self, text, x, y, nin, nout, otype=None, w=None, **kw):
        b = {'id': kw.pop('id', None) or self._id(text.split(' ')[0]), 'maxclass': 'newobj', 'text': text,
             'numinlets': nin, 'numoutlets': nout, 'outlettype': otype if otype is not None else [''] * nout,
             'fontsize': FS, 'patching_rect': [float(x), float(y), float(w or self.width(text)), OH]}
        b.update(kw)
        return self._add(b)

    def msg(self, text, x, y, w=None, **kw):
        b = {'id': kw.pop('id', None) or self._id('m'), 'maxclass': 'message', 'text': text, 'numinlets': 2,
             'numoutlets': 1, 'outlettype': [''], 'fontsize': FS,
             'patching_rect': [float(x), float(y), float(w or self.width(text)), OH]}
        b.update(kw)
        return self._add(b)

    def comment(self, text, x, y, width=None, lines=None, bold=False, color=None, pres=None, **kw):
        b = {'id': kw.pop('id', None) or self._id('c'), 'maxclass': 'comment', 'text': text, 'numinlets': 1,
             'numoutlets': 0, 'fontsize': FS,
             'patching_rect': [float(x), float(y), float(width or self.width(text)), 24.0 * (lines or 1)]}
        if lines and lines > 1: b['linecount'] = lines
        if bold: b['fontface'] = 1
        if color: b['textcolor'] = color
        if pres: b.update(presentation=1, presentation_rect=[float(v) for v in pres])
        b.update(kw)
        return self._add(b)

    def ui(self, cls, x, y, w, h, pres=None, **kw):
        b = {'id': kw.pop('id', None) or self._id(cls), 'maxclass': cls,
             'patching_rect': [float(x), float(y), float(w), float(h)]}
        if pres: b.update(presentation=1, presentation_rect=[float(v) for v in pres])
        b.update(kw)
        return self._add(b)

    def number(self, x, y, pres=None, var=None, lo=None, hi=None, flo=False, w=60, **kw):
        kw.setdefault('fontsize', FS)
        b = dict(numinlets=1, numoutlets=2, outlettype=['', 'bang'], parameter_enable=0)
        if var: b['varname'] = var
        if lo is not None: b['minimum'] = lo
        if hi is not None: b['maximum'] = hi
        if flo: b['format'] = 6
        b.update(kw)
        return self.ui('flonum' if flo else 'number', x, y, w, OH, pres, **b)

    def toggle(self, x, y, pres=None, var=None, **kw):
        b = dict(numinlets=1, numoutlets=1, outlettype=['int'], parameter_enable=0)
        if var: b['varname'] = var
        b.update(kw)
        return self.ui('toggle', x, y, 24, 24, pres, **b)

    def button(self, text, x, y, pres=None, w=None, **kw):
        b = dict(text=text, numinlets=1, numoutlets=3, outlettype=['', '', 'int'], parameter_enable=0, fontsize=FS)
        b.update(kw)
        return self.ui('textbutton', x, y, w or self.width(text, 30), OH, pres, **b)

    def menu(self, items, x, y, w, pres=None, var=None, **kw):
        it = []
        for i, s in enumerate(items):
            if i: it.append(',')
            it.append(s)
        b = dict(items=it, numinlets=1, numoutlets=3, outlettype=['int', '', ''], parameter_enable=0, fontsize=FS)
        if var: b['varname'] = var
        b.update(kw)
        return self.ui('umenu', x, y, w, OH, pres, **b)

    def inlet(self, x, y, comment):
        return self._add({'id': self._id('in'), 'maxclass': 'inlet', 'comment': comment, 'index': 0,
                          'numinlets': 0, 'numoutlets': 1, 'outlettype': [''],
                          'patching_rect': [float(x), float(y), 30.0, 30.0]})

    def outlet(self, x, y, comment):
        return self._add({'id': self._id('out'), 'maxclass': 'outlet', 'comment': comment, 'index': 0,
                          'numinlets': 1, 'numoutlets': 0, 'patching_rect': [float(x), float(y), 30.0, 30.0]})

    def connect(self, a, ao, b, bi):
        self.lines.append({'patchline': {'source': [a, ao], 'destination': [b, bi]}})

    def chain(self, *ids):
        for a, b in zip(ids, ids[1:]):
            self.connect(a, 0, b, 0)

    def save(self, path):
        for x in self.boxes:
            paramify(x['box'])
        P = {'fileversion': 1,
             'appversion': {'major': 9, 'minor': 2, 'revision': 1, 'architecture': 'x64', 'modernui': 1},
             'classnamespace': 'box', 'rect': self.rect, 'openinpresentation': 1 if self.presentation else 0,
             'default_fontsize': FS, 'gridsize': [10.0, 10.0], 'integercoordinates': 1,
             'boxes': self.boxes, 'lines': self.lines}
        ids = {b['box']['id'] for b in self.boxes}
        idx = {b['box']['id']: b['box'] for b in self.boxes}
        for l in self.lines:
            s, so = l['patchline']['source']
            t, ti = l['patchline']['destination']
            assert s in ids and t in ids, l
            assert so < idx[s].get('numoutlets', 0), ('outlet', s, so)
            assert ti < idx[t].get('numinlets', 0), ('inlet', t, ti)
        txt = json.dumps({'patcher': P}, indent=4)
        txt = re.sub(r'\[\s*\n([^\[\]{}]*?)\n\s*\]',
                     lambda m: '[ ' + ', '.join(x.strip().rstrip(',') for x in m.group(1).split('\n')) + ' ]', txt)
        open(path, 'w').write(txt + '\n')
        return len(self.boxes), len(self.lines)


def paramify(b):
    """Parameter mode on a named control, the way Max writes it, so presets keep it: number boxes and
    sliders as stored values (type 3, not automated), toggles and fixed menus as enums. Not for menus that
    fill themselves (autopopulate: an index would point at another item when the folder changes; they keep
    storing the item's name through pattr), nor for momentary buttons (nothing to store)."""
    c, var = b.get('maxclass'), b.get('varname')
    if not var or b.get('noparam'):
        b.pop('noparam', None)
        return
    if c in ('number', 'flonum', 'slider', 'multislider', 'rslider'):
        v = {'parameter_invisible': 1, 'parameter_longname': var, 'parameter_modmode': 0,
             'parameter_shortname': var, 'parameter_type': 3}
    elif c == 'toggle':
        v = {'parameter_enum': ['off', 'on'], 'parameter_longname': var, 'parameter_mmax': 1,
             'parameter_modmode': 0, 'parameter_shortname': var, 'parameter_type': 2}
    elif c == 'umenu' and not b.get('autopopulate'):
        items = [i for i in b.get('items', []) if i != ',']
        if not items:
            return
        v = {'parameter_enum': items, 'parameter_longname': var, 'parameter_mmax': len(items) - 1,
             'parameter_modmode': 0, 'parameter_shortname': var, 'parameter_type': 2}
    else:
        return
    b['parameter_enable'] = 1
    b.setdefault('saved_attribute_attributes', {})['valueof'] = v
