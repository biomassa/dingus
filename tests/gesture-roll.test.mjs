// Tests for dingus.gestureRoll.js outside Max.
// Run: node tests/gesture-roll.test.mjs
import { readFileSync } from "node:fs";
import { fileURLToPath } from "node:url";
import vm from "node:vm";
import assert from "node:assert/strict";

const SCRIPT = fileURLToPath(new URL("../javascript/dingus.gestureRoll.js", import.meta.url));
const src = readFileSync(SCRIPT, "utf8");

const plain = (x) => JSON.parse(JSON.stringify(x));

function load(seq, w = 640, h = 400) {
	const out = [];
	let draws = 0;
	const mg = new Proxy(
		{ size: [w, h], init() {}, redraw() {} },
		{
			get(o, k) {
				if (k in o) return o[k];
				return () => draws++;
			},
			set(o, k, v) {
				o[k] = v;
				return true;
			},
		}
	);
	const store = { seq };
	class Dict {
		stringify() {
			return JSON.stringify(store);
		}
	}
	const ctx = {
		jsarguments: ["dingus.gestureRoll.js", "gl_dict"],
		mgraphics: mg,
		Dict,
		Task: class {
			schedule() {}
		},
		outlet: (i, ...a) => out.push(a.length === 1 && Array.isArray(a[0]) ? plain(a[0]) : plain(a)),
	};
	vm.createContext(ctx);
	vm.runInContext(src, ctx);
	ctx.loadseq();
	return { ctx, out, paint: () => (ctx.paint(), draws) };
}

// a sequence of 4 steps: note 60 on channel 2 from 0 to 2, bending up 1 pad halfway; note 64 on
// channel 10 (right side) from 2 to 3
const bendUp = [0xe1, 0, 64 + 64 / 48]; // 1 pad up with bend range 48 (8192 + 8192/48 ~ 8362)
const seq = {
	length: 4,
	loopStart: 0,
	loopEnd: 4,
	notes: [
		{ id: 1, ch: 2, note: 60, vel: 100, off: 40, start: 0, len: 2, pre: [[0xe1, 0, 64], [0xb1, 74, 0], [0xd1, 10]], ev: [[1, 0xe1, 0x2a, 66], [1, 0xd1, 120], [1.5, 0xb1, 74, 127]] },
		{ id: 2, ch: 10, note: 64, vel: 50, off: 90, start: 2, len: 1, pre: [], ev: [] },
	],
};
let t = load(seq);
assert.ok(t.paint() > 0, "paints");

// samples: bend in pads, pressure, Y
{
	const s = plain(t.ctx.samples(seq.notes[0]));
	assert.equal(s.length, 3);
	assert.deepEqual([s[0].t, s[0].bend, s[0].press, s[0].y], [0, 0, 10, 0]);
	assert.equal(s[1].t, 1);
	assert.ok(Math.abs(s[1].bend - (0x2a + 66 * 128 - 8192) / 8192 * 48) < 1e-9);
	assert.equal(s[1].press, 120);
	assert.equal(s[2].y, 127);
}

// hit testing: on the trace, its start/end grab zones, empty space
{
	const x = t.ctx.xOf(0.5),
		y = t.ctx.yOf(60);
	const h = t.ctx.hitNote(x, y);
	assert.equal(h.n.id, 1);
	assert.equal(h.part, "body");
	assert.equal(t.ctx.hitNote(t.ctx.xOf(2) - 2, t.ctx.yOf(60 + seq.notes[0].pre.length * 0 + plain(t.ctx.samples(seq.notes[0]))[2].bend)).part, "end");
	assert.equal(t.ctx.hitNote(t.ctx.xOf(0) + 2, y).part, "start");
	assert.equal(t.ctx.hitNote(t.ctx.xOf(3.5), t.ctx.yOf(55)), null);
}

// click + drag a note = move it, snapped to the grid (0.25 steps)
{
	const x = t.ctx.xOf(0.5),
		y = t.ctx.yOf(60);
	t.ctx.onclick(x, y, 1, 0, 0, 0, 0, 0);
	t.ctx.ondrag(t.ctx.xOf(0.5 + 0.6), y, 1, 0, 0, 0, 0, 0);
	t.ctx.ondrag(t.ctx.xOf(0.5 + 0.6), y, 0, 0, 0, 0, 0, 0);
	assert.deepEqual(t.out.pop(), ["move", 0.5, 1]);
	// cmd = free
	t.ctx.onclick(x, y, 1, 1, 0, 0, 0, 0);
	t.ctx.ondrag(t.ctx.xOf(0.5 + 0.6), y, 0, 1, 0, 0, 0, 0);
	const m = t.out.pop();
	assert.equal(m[0], "move");
	assert.ok(Math.abs(m[1] - 0.6) < 1e-6);
	// option = copy (snapped); the original isn't moved in the preview
	t.ctx.onclick(x, y, 1, 0, 0, 0, 1, 0);
	t.ctx.ondrag(t.ctx.xOf(0.5 + 0.6), y, 1, 0, 0, 0, 1, 0);
	assert.equal(t.ctx.dtOf(seq.notes[0]), 0);
	t.paint();
	t.ctx.ondrag(t.ctx.xOf(0.5 + 0.6), y, 0, 0, 0, 0, 1, 0);
	assert.deepEqual(t.out.pop(), ["copy", 0.5, 1]);
}

// shift-click adds to the selection; moving moves both
{
	const x = load(seq);
	x.ctx.onclick(x.ctx.xOf(0.5), x.ctx.yOf(60), 1, 0, 0, 0, 0, 0);
	x.ctx.ondrag(x.ctx.xOf(0.5), x.ctx.yOf(60), 0, 0, 0, 0, 0, 0);
	x.ctx.onclick(x.ctx.xOf(2.5), x.ctx.yOf(64), 1, 0, 1, 0, 0, 0);
	x.ctx.ondrag(x.ctx.xOf(2.5 + 1), x.ctx.yOf(64), 0, 0, 0, 0, 0, 0);
	assert.deepEqual(x.out.pop(), ["move", 1, 1, 2]);
	x.ctx.deleteselected();
	assert.deepEqual(x.out.pop(), ["delete", 1, 2]);
}

// trimming the end
{
	const x = load(seq);
	const ye = x.ctx.yOf(64);
	x.ctx.onclick(x.ctx.xOf(3) - 2, ye, 1, 0, 0, 0, 0, 0);
	x.ctx.ondrag(x.ctx.xOf(2.6), ye, 0, 0, 0, 0, 0, 0);
	assert.deepEqual(x.out.pop(), ["trim", 2, "end", 2.5]);
}

// loop strip: ends snap to bars (loopsnap 2, 4 steps), steps with loopsnap 1
{
	const s2 = { ...seq, length: 8, loopEnd: 8 };
	const x = load(s2);
	x.ctx.onclick(x.ctx.xOf(8), 5, 1, 0, 0, 0, 0, 0);
	x.ctx.ondrag(x.ctx.xOf(5.2), 5, 0, 0, 0, 0, 0, 0);
	assert.deepEqual(x.out.pop(), ["loop", 0, 4]);
	x.ctx.loopsnap(1);
	x.ctx.onclick(x.ctx.xOf(0), 5, 1, 0, 0, 0, 0, 0);
	x.ctx.ondrag(x.ctx.xOf(1.2), 5, 0, 0, 0, 0, 0, 0);
	assert.deepEqual(x.out.pop(), ["loop", 1, 8]);
}

// box selection, double-click delete
{
	const x = load(seq);
	x.ctx.onclick(x.ctx.xOf(1.8), x.ctx.yOf(67), 1, 0, 0, 0, 0, 0);
	x.ctx.ondrag(x.ctx.xOf(3.5), x.ctx.yOf(62), 0, 0, 0, 0, 0, 0);
	assert.deepEqual(Object.keys(plain(x.ctx.sel)), ["2"]);
	x.ctx.ondblclick(x.ctx.xOf(0.5), x.ctx.yOf(60), 1, 0, 0, 0, 0, 0);
	assert.deepEqual(x.out.pop(), ["delete", 1]);
}

// an empty sequence paints without errors
{
	const x = load({ length: 0, loopStart: 0, loopEnd: 0, notes: [] });
	assert.ok(x.paint() > 0);
}

// cached drawing: a playhead frame doesn't redraw the notes; an edit does
{
	let made = 0;
	const x = load(seq);
	x.ctx.MGraphics = class {
		constructor() {
			made++;
			return new Proxy({}, { get: (o, k) => (k in o ? o[k] : () => {}), set: (o, k, v) => ((o[k] = v), true) });
		}
	};
	x.ctx.Image = class {};
	x.ctx.state("play");
	x.paint();
	const after = made;
	x.ctx.pos(1, 0, 4);
	x.ctx.note(1, 1);
	x.paint();
	x.ctx.pos(1.5, 0, 4);
	x.paint();
	assert.equal(made, after, "playhead frames and sounding notes reuse the cached picture");
	x.ctx.note(2, -1); // a cut note changes the picture
	x.paint();
	assert.equal(made, after + 1);
	x.ctx.clearsel();
	x.paint();
	assert.equal(made, after + 2);
}

// position goes to the strip (outlet 1) as 0..1 along the time axis, with no redraw
{
	const outs = [];
	const x = load(seq);
	x.ctx.outlet = (i, ...a) => outs.push([i, ...a]);
	x.ctx.state("play");
	x.ctx.pos(1, 0, 4);
	assert.deepEqual(outs.at(-1), [1, 0.25]);
	x.ctx.state("stop");
	assert.deepEqual(outs.at(-1), [1, "off"]);
}

// zoom and scroll in the bar-number row: up = zoom in around the grabbed time, sideways = scroll,
// double-click = the whole sequence; edits keep working in the zoomed view
{
	const x = load(seq); // 4 steps
	const yh = 14 + 8; // inside the bar-number row
	const xg = x.ctx.xOf(2);
	x.ctx.onclick(xg, yh, 1, 0, 0, 0, 0, 0);
	x.ctx.ondrag(xg, yh - 40, 1, 0, 0, 0, 0, 0); // up 40 px = zoom x2
	assert.ok(Math.abs(x.ctx.zoom - 2) < 1e-9);
	assert.ok(Math.abs(x.ctx.tOf(xg) - 2) < 1e-9, "the grabbed time stays under the pointer");
	const before = x.ctx.tOf(xg);
	x.ctx.ondrag(xg - 100, yh - 40, 0, 0, 0, 0, 0, 0); // and sideways = scroll
	assert.ok(Math.abs(x.ctx.tOf(xg - 100) - before) < 1e-9);
	const v = plain(x.ctx.viewSpan());
	assert.ok(Math.abs(v[1] - v[0] - 2) < 1e-9, "half of 4 steps visible");
	assert.ok(x.paint() > 0);
	// a note is still hit and moved where it is drawn
	x.ctx.onclick(x.ctx.xOf(2.5), x.ctx.yOf(64), 1, 0, 0, 0, 0, 0);
	x.ctx.ondrag(x.ctx.xOf(3), x.ctx.yOf(64), 0, 0, 0, 0, 0, 0);
	assert.deepEqual(x.out.pop(), ["move", 0.5, 2]);
	// the strip hides positions outside the view
	const outs = [];
	x.ctx.outlet = (i, ...a) => outs.push([i, ...a]);
	x.ctx.state("play");
	x.ctx.pos(v[0] - 0.5, 0, 4);
	assert.deepEqual(outs.at(-1), [1, "off"]);
	x.ctx.ondblclick(xg, yh, 1, 0, 0, 0, 0, 0);
	assert.equal(x.ctx.zoom, 1);
	assert.deepEqual(plain(x.ctx.viewSpan()), [0, 4]);
}

// PROB lane: drag a bar = set the note's probability; selected notes together; double-click = 100%
{
	const x = load(seq);
	const lh = x.ctx.lanesH() / 5;
	const top = x.ctx.laneTop("PROB");
	const yAt = (v) => top + lh - 2 - v * (lh - 4);
	x.ctx.onclick(x.ctx.xOf(2), yAt(1), 1, 0, 0, 0, 0, 0);
	x.ctx.ondrag(x.ctx.xOf(2), yAt(0.25), 1, 0, 0, 0, 0, 0);
	assert.equal(x.ctx.probOf(seq.notes[1]), 0.25, "preview while dragging");
	x.ctx.ondrag(x.ctx.xOf(2), yAt(0.25), 0, 0, 0, 0, 0, 0);
	assert.deepEqual(x.out.pop(), ["prob", 0.25, 2]);
	// select both, drag one bar: both get it
	x.ctx.onclick(x.ctx.xOf(0.5), x.ctx.yOf(60), 1, 0, 0, 0, 0, 0);
	x.ctx.ondrag(x.ctx.xOf(0.5), x.ctx.yOf(60), 0, 0, 0, 0, 0, 0);
	x.ctx.onclick(x.ctx.xOf(2.5), x.ctx.yOf(64), 1, 0, 1, 0, 0, 0);
	x.ctx.ondrag(x.ctx.xOf(2.5), x.ctx.yOf(64), 0, 0, 0, 0, 0, 0);
	x.ctx.onclick(x.ctx.xOf(0), yAt(1), 1, 0, 0, 0, 0, 0);
	x.ctx.ondrag(x.ctx.xOf(0), yAt(0.5), 0, 0, 0, 0, 0, 0);
	assert.deepEqual(x.out.pop(), ["prob", 0.5, 1, 2]);
	x.ctx.ondblclick(x.ctx.xOf(2), yAt(0.5), 1, 0, 0, 0, 0, 0);
	assert.deepEqual(x.out.pop(), ["prob", 1, 2]);
	assert.ok(x.paint() > 0);
}

// VEL lane: drag the strike bar (start) or the lift bar (end)
{
	const x = load(seq);
	const lh = x.ctx.lanesH() / 5;
	const top = x.ctx.laneTop("VEL");
	const yAt = (v) => top + lh - 2 - (v / 127) * (lh - 4);
	x.ctx.onclick(x.ctx.xOf(2), yAt(50), 1, 0, 0, 0, 0, 0); // note 2 starts at 2 (note 1 ends there too: nearest wins)
	x.ctx.ondrag(x.ctx.xOf(2), yAt(127), 0, 0, 0, 0, 0, 0);
	const m = x.out.pop();
	assert.equal(m[0], "vel");
	assert.equal(m[2], 127);
	x.ctx.onclick(x.ctx.xOf(3), yAt(90), 1, 0, 0, 0, 0, 0); // note 2's end: lift
	x.ctx.ondrag(x.ctx.xOf(3), yAt(20), 1, 0, 0, 0, 0, 0);
	assert.equal(x.ctx.velOf(seq.notes[1], "lift"), 20, "preview");
	x.ctx.ondrag(x.ctx.xOf(3), yAt(20), 0, 0, 0, 0, 0, 0);
	assert.deepEqual(x.out.pop(), ["vel", "lift", 20, 2]);
	x.ctx.onclick(x.ctx.xOf(0), yAt(10), 1, 0, 0, 0, 0, 0); // note 1's strike, down to the bottom: 1, not 0
	x.ctx.ondrag(x.ctx.xOf(0), top + lh + 20, 0, 0, 0, 0, 0, 0);
	assert.deepEqual(x.out.pop(), ["vel", "strike", 1, 1]);
}

// a chord: bars at the same time are spread side by side (lowest note first) and each can be grabbed
{
	const chord = { length: 4, loopStart: 0, loopEnd: 4, notes: [
		{ id: 1, ch: 2, note: 67, vel: 90, off: 40, start: 1, len: 1, pre: [], ev: [] },
		{ id: 2, ch: 3, note: 60, vel: 80, off: 40, start: 1, len: 2, pre: [], ev: [] },
		{ id: 3, ch: 4, note: 64, vel: 70, off: 40, start: 1, len: 2.5, pre: [], ev: [] },
	] };
	const x = load(chord);
	const bars = plain(x.ctx.barLayout("prob").map((b) => [b.n.id, b.x]));
	assert.deepEqual(bars.map((b) => b[0]), [2, 3, 1], "lowest note first");
	assert.ok(bars[1][1] - bars[0][1] >= 5 && bars[2][1] - bars[1][1] >= 5, "spread apart");
	const lh = x.ctx.lanesH() / 5;
	const top = x.ctx.laneTop("PROB");
	for (const [id, bx] of bars) {
		x.ctx.onclick(bx, top + lh / 2, 1, 0, 0, 0, 0, 0);
		x.ctx.ondrag(bx, top + lh / 2, 0, 0, 0, 0, 0, 0);
		assert.equal(x.out.pop()[2], id, "bar of note " + id);
	}
	assert.ok(x.paint() > 0);
}

console.log("gesture-roll: all tests passed");
