"""layoutcheck.py <patch.maxpat> [presentation]: lists overlapping boxes, and patch cords that pass
through boxes other than their own ends (the patching view), to check a generated layout without Max."""
import json, sys

p = json.load(open(sys.argv[1]))['patcher']
pres = len(sys.argv) > 2
B = {o['box']['id']: o['box'] for o in p['boxes']}

def rect(b):
    if pres:
        return b.get('presentation_rect') if b.get('presentation') else None
    return b['patching_rect']

def name(i):
    b = B[i]
    return '%s(%s)' % (b['maxclass'], (b.get('text') or b.get('varname') or b.get('comment') or '')[:24])

ids = [i for i in B if rect(B[i])]
bad = 0
for a in range(len(ids)):
    for c in range(a + 1, len(ids)):
        r, q = rect(B[ids[a]]), rect(B[ids[c]])
        if r[0] < q[0] + q[2] - 1 and q[0] < r[0] + r[2] - 1 and r[1] < q[1] + q[3] - 1 and q[1] < r[1] + r[3] - 1:
            # a scope drawn over another on purpose is fine; report the rest
            print('overlap:', name(ids[a]), r, '|', name(ids[c]), q)
            bad += 1
if not pres:
    def seg_hits(x1, y1, x2, y2, r):
        # sample the cord
        for k in range(1, 40):
            t = k / 40
            x, y = x1 + (x2 - x1) * t, y1 + (y2 - y1) * t
            if r[0] + 2 < x < r[0] + r[2] - 2 and r[1] + 2 < y < r[1] + r[3] - 2:
                return True
        return False
    for l in p['lines']:
        s, so = l['patchline']['source']
        t, ti = l['patchline']['destination']
        a, c = B[s]['patching_rect'], B[t]['patching_rect']
        no, ni = max(1, B[s].get('numoutlets', 1)), max(1, B[t].get('numinlets', 1))
        x1 = a[0] + (a[2] - 8) * (so / (no - 1) if no > 1 else 0) + 4
        x2 = c[0] + (c[2] - 8) * (ti / (ni - 1) if ni > 1 else 0) + 4
        y1, y2 = a[1] + a[3], c[1]
        if y2 < y1 - 2:
            print('cord goes up:', name(s), '->', name(t))
            bad += 1
        for i in ids:
            if i in (s, t): continue
            if seg_hits(x1, y1, x2, y2, rect(B[i])):
                print('cord through:', name(s), '->', name(t), 'crosses', name(i))
                bad += 1
print('issues:', bad)
