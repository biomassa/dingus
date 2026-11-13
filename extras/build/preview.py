"""preview.py <patch.maxpat> <out.svg> [presentation]: draws a patch's patching (or presentation) view
as an SVG, to check a generated layout without Max."""
import json, sys, html

src, dst = sys.argv[1], sys.argv[2]
pres = len(sys.argv) > 3
p = json.load(open(src))['patcher']
B = {o['box']['id']: o['box'] for o in p['boxes']}

def rect(b):
    if pres:
        return b.get('presentation_rect') if b.get('presentation') else None
    return b['patching_rect']

W = H = 0
items = []
for b in B.values():
    r = rect(b)
    if not r: continue
    W, H = max(W, r[0] + r[2] + 20), max(H, r[1] + r[3] + 20)
    cls = b['maxclass']
    txt = b.get('text', '') if cls in ('newobj', 'message', 'comment', 'textbutton') else cls
    fill = {'newobj': '#e8e8e8', 'message': '#cfd8e8', 'comment': 'none', 'inlet': '#7fbf7f', 'outlet': '#bf7f7f'}.get(cls, '#f0e0b0')
    stroke = 'none' if cls == 'comment' else '#555'
    items.append('<rect x="%g" y="%g" width="%g" height="%g" fill="%s" stroke="%s"/>' % (r[0], r[1], r[2], r[3], fill, stroke))
    weight = 'bold' if b.get('fontface') == 1 else 'normal'
    for i, line in enumerate(str(txt).split('\n')):
        items.append('<text x="%g" y="%g" font-size="%g" font-weight="%s" font-family="Arial">%s</text>'
                     % (r[0] + 3, r[1] + 17 + i * 20, min(16, b.get('fontsize', 12)), weight, html.escape(line)))
cords = []
if not pres:
    for l in p['lines']:
        s, so = l['patchline']['source']
        t, ti = l['patchline']['destination']
        a, c = B[s]['patching_rect'], B[t]['patching_rect']
        no, ni = max(1, B[s].get('numoutlets', 1)), max(1, B[t].get('numinlets', 1))
        x1 = a[0] + (a[2] - 8) * (so / (no - 1) if no > 1 else 0) + 4
        x2 = c[0] + (c[2] - 8) * (ti / (ni - 1) if ni > 1 else 0) + 4
        cords.append('<line x1="%g" y1="%g" x2="%g" y2="%g" stroke="#c33" stroke-width="1.2"/>' % (x1, a[1] + a[3], x2, c[1]))
open(dst, 'w').write('<svg xmlns="http://www.w3.org/2000/svg" width="%d" height="%d" style="background:#fff">%s%s</svg>'
                     % (W, H, ''.join(items), ''.join(cords)))
print(dst, int(W), int(H))
