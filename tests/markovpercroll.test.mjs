// Tests for dingus.markovPercRoll.js outside Max: editing with the mouse, the stored list, and what the
// engine (code/dingus.markovPerc.gendsp, run as JavaScript) plays from the buffers the roll writes.
// Run: node tests/markovpercroll.test.mjs
import { readFileSync } from "node:fs";
import { fileURLToPath } from "node:url";
import vm from "node:vm";
import assert from "node:assert/strict";

const SRC = readFileSync(fileURLToPath(new URL("../javascript/dingus.markovPercRoll.js", import.meta.url)), "utf8");
const GEN = JSON.parse(readFileSync(fileURLToPath(new URL("../code/dingus.markovPerc.gendsp", import.meta.url)), "utf8"));
const CODE = GEN.patcher.boxes.find((b) => b.box.maxclass === "codebox").box.code;
const plain = (x) => JSON.parse(JSON.stringify(x));
const W = 150 + 640, H = 900;

function load(files = new Map()) {
	const out = [], tasks = [], buffers = new Map();
	class Buffer {
		constructor(name) {
			if (!buffers.has(name)) buffers.set(name, { frames: name.endsWith("ch") ? 65536 : 16408, chans: name.endsWith("ch") ? 5 : 11, data: new Map() });
			this.b = buffers.get(name);
		}
		framecount() { return this.b.frames; }
		channelcount() { return this.b.chans; }
		poke(ch, frame, vals) { vals.forEach((v, i) => this.b.data.set(ch + ":" + (frame + i), v)); }
	}
	class File {
		constructor(p, mode) { this.p = p; this.mode = mode; this.isopen = mode === "read" ? files.has(p) : true; this.buf = mode === "read" ? files.get(p) || "" : ""; this.position = 0; }
		get eof() { return this.buf.length; }
		set eof(v) { this.buf = this.buf.slice(0, v); }
		writestring(s) { this.buf += s; this.position = this.buf.length; }
		readstring(n) { const s = this.buf.slice(this.position, this.position + n); this.position += s.length; return s; }
		close() { if (this.mode !== "read") files.set(this.p, this.buf); }
	}
	class Task { constructor(fn) { this.fn = fn; tasks.push(this); } schedule() { this.due = true; } cancel() {} repeat() {} }
	const mg = new Proxy({ size: [W, H] }, { get: (t, k) => (k in t ? t[k] : k === "text_measure" ? () => [10, 10] : () => {}) });
	const ctx = {
		mgraphics: mg, Buffer, File, Task, Global: function () {}, Dict: function () {},
		require: () => ({ presetFolder: () => "/presets/" }),
		patcher: { filepath: "/x.maxpat" },
		box: { attrs: { presentation_rect: [0, 0, W, H], patching_rect: [0, 0, W, H] }, getattr(k) { return this.attrs[k]; }, setattr(k, v) { this.attrs[k] = v; } },
		outlet: (i, ...a) => out.push(a), post() {}, notifyclients() {}, setinletassist() {}, setoutletassist() {},
		arrayfromargs: (a) => Array.from(a), messagename: "", inlet: 0,
	};
	vm.createContext(ctx);
	vm.runInContext(SRC, ctx);
	const run = (code) => vm.runInContext(code, ctx);
	ctx.buffer("mp");
	ctx.chbuffer("mpch");
	const fire = () => tasks.filter((t) => t.due).forEach((t) => { t.due = false; t.fn(); });
	return { ctx, out, run, buffers, files, fire };
}

// the engine on the roll's buffers: 8 rows, a phasor of N samples per cycle; onsets per row {i, n, v}
function engine(t, params = {}) {
	const gb = t.buffers.get("mp").data, cb = t.buffers.get("mpch").data;
	let src = CODE.replace(/\/\/.*$/gm, "");
	const hist = [...src.matchAll(/^History (\w+)\(([^)]*)\);/gm)].map((m) => [m[1], +m[2]]);
	const P = { play: 1, pend: -1, swapnow: 0, freeze: 0, mutate: 0, cscale: 1, ptnmode: 0, barcount: 0, trigms: 1, accvel: 0.3, accdec: 1.5, ...params };
	src = src.replace(/^(History|Param|Buffer) .*$/gm, "");
	const fn = new Function("S", "P", "mc_channel", "in1", "in2", "in3", "in4", "peek", "poke", "noise", "clamp", "wrap", "min", "max", "floor", "pow", "samplerate", "gb", "cb",
		`with(P){with(S){ ${src}; return [out1,out2,out3,out4,out5]; }}`);
	const peek = (b, f, c) => (b === "gb" ? gb : cb).get((c + 1) + ":" + f) ?? 0;
	const poke = (b, v, f, c) => (b === "gb" ? gb : cb).set((c + 1) + ":" + f, v);
	const wrap = (x, a, b) => { const r = b - a; return a + ((x - a) % r + r) % r; };
	const S = [], noises = [];
	for (let r = 0; r < 8; r++) {
		S.push(Object.fromEntries(hist));
		let sv = 7 + r * 31;
		noises.push(() => { sv = (sv * 48271) % 2147483647; return sv / 2147483647 * 2 - 1; });
	}
	const clamp = (x, a, b) => Math.min(Math.max(x, a), b);
	const tick = (ph, tr = 0) => S.map((s, r) => fn(s, P, r + 1, ph, tr, 0, 0, peek, poke, noises[r], clamp, wrap, Math.min, Math.max, Math.floor, Math.pow, 1000, "gb", "cb"));
	return { P, tick };
}
function play(e, cycles, N = 1600, tr) {
	const ev = [[], [], [], [], [], [], [], []], was = new Array(8).fill(0);
	for (let i = 0; i < N * cycles; i++) {
		const rs = e.tick((i % N) / N, tr ? tr(i) : 0);
		rs.forEach((o, r) => { if (o[0] > 0 && was[r] === 0) ev[r].push({ i, n: o[2], v: +o[0].toFixed(2) }); was[r] = o[0]; });
	}
	return ev;
}

const t = load();
// geometry: label 150, 16 steps of 40 px; rows 57 px from y 14
const X = (r, pos) => t.run(`xOf(${r}, ${pos})`);
const Y = (r) => t.run(`hitY(${r})`);
const press = (x, y, m = {}) => t.ctx.onclick(x, y, 1, 0, m.shift ? 1 : 0, 0, m.option ? 1 : 0, 0);
const drag = (x, y, m = {}) => t.ctx.ondrag(x, y, 1, 0, m.shift ? 1 : 0, 0, m.option ? 1 : 0, 0);
const up = (x, y) => t.ctx.ondrag(x, y, 0, 0, 0, 0, 0, 0);
const draw = (r, a, b) => { press(X(r, a + 0.5), Y(r)); drag(X(r, b), Y(r)); up(X(r, b), Y(r)); };

assert.equal(t.run("colW(0)"), 40);
// row 1: four kicks of 4 steps; row 2: two snares, at 4 and 12, 4 steps... 8 steps each (the first goes from 4)
for (const a of [0, 4, 8, 12]) draw(0, a, a + 4);
draw(1, 4, 12);
draw(1, 12, 16);
assert.deepEqual(plain(t.run("rowHits(0).map((h) => [h.st, h.len])")), [[0, 4], [4, 4], [8, 4], [12, 4]], "drawn with the mouse, snapped to steps");
assert.deepEqual(plain(t.run("rowHits(1).map((h) => [h.st, h.len])")), [[4, 8], [12, 4]]);
{
	const ev = play(engine(t), 2);
	assert.deepEqual(ev[0].map((x) => x.i), [0, 400, 800, 1200, 1600, 2000, 2400, 2800], "4 kicks a cycle");
	assert.deepEqual(ev[0].map((x) => x.n), [0, 1, 2, 3, 0, 1, 2, 3]);
	// row 2's walk starts at its first hit at the cycle start (gaps take no time): 0 then 8 steps later
	assert.deepEqual(ev[1].map((x) => x.i), [0, 800, 1200, 1600, 2400, 2800], "8 + 4 steps, then the restart at 16");
	assert.equal(ev[2].length, 0);
}

// the row strip: 3 steps per cycle for row 3 (drag the steps box down), polyrhythm against row 1
{
	const sr = plain(t.run("stripRect(2, 'st')"));
	press(sr[0] + 5, sr[1] + 5); drag(sr[0] + 5, sr[1] + 5 + 52); up(sr[0] + 5, sr[1] + 5 + 52);
	assert.equal(t.run("rowCfg[2].steps"), 3, "16 - 13");
	t.ctx.row(3, "restart", 3);
	assert.equal(t.run("colW(2)").toFixed(2), (640 / 3).toFixed(2));
	draw(2, 0, 1);
	const ev = play(engine(t), 1);
	assert.deepEqual(ev[2].map((x) => x.i), [0, 534, 1067], "3 a cycle against 4");
}
// mute from the strip
{
	const mr = plain(t.run("stripRect(2, 'm')"));
	press(mr[0] + 3, mr[1] + 3); up(mr[0] + 3, mr[1] + 3);
	assert.equal(t.run("rowCfg[2].mute"), 1);
	assert.equal(play(engine(t), 1)[2].length, 0, "muted");
	press(mr[0] + 3, mr[1] + 3); up(mr[0] + 3, mr[1] + 3);
}
// lanes: velocity and accent of the selected hit
{
	press(X(0, 4.5), Y(0)); up(X(0, 4.5), Y(0));
	assert.equal(t.run("rowIndex(sel)"), 1, "a click selects the hit");
	const lr = plain(t.run("laneRects()"));
	const vel = lr[0], acc = lr[2];
	press(X(0, 4.5), vel.top + vel.h * 0.75); up(X(0, 4.5), vel.top + vel.h * 0.75);
	press(X(0, 4.5), acc.top + 3); up(X(0, 4.5), acc.top + 3);
	const ev = play(engine(t), 1);
	assert.deepEqual(ev[0].map((x) => x.v), [1, 0.51, 1, 1], "vel 0.21 + accent 0.3");
}
// links: shift-drag from hit 4 to hit 2 of row 1, then 100 % to it: 0 1 2 3 1 2 3 1 ...
{
	press(X(0, 12.5), Y(0), { shift: true }); drag(X(0, 4.5), Y(0), { shift: true }); up(X(0, 4.5), Y(0));
	assert.equal(t.run("rowHits(0)[3].lk.length"), 2);
	t.run("rowHits(0)[3].lk.shift(); changed(true)");
	t.ctx.row(1, "restart", 0);
	const ev = play(engine(t), 2);
	assert.deepEqual(ev[0].map((x) => x.n), [0, 1, 2, 3, 1, 2, 3, 1], "the link back to hit 2");
	t.ctx.row(1, "restart", 16);
}
// follow links: a shift-drag to another row's hit. Row 5 has hits at 0 and 2; the kick at 4 pushes row 5 to
// its hit at 2 (100 %): row 5 plays 0, 2, and 4 (pushed), then waits (its hit at 2 lasts 14 steps)
{
	draw(4, 0, 2);
	draw(4, 2, 16);
	press(X(0, 4.5), Y(0), { shift: true }); drag(X(4, 2.5), Y(4), { shift: true }); up(X(4, 2.5), Y(4));
	assert.equal(t.run("rowHits(0)[0].lk.length"), 1, "no same-row link made");
	assert.deepEqual(plain(t.run("rowHits(0)[1].fl.map((l) => [l.t.row, rowIndex(l.t), l.w])")), [[4, 1, 100]], "a follow link");
	let ev = play(engine(t), 1);
	assert.deepEqual(ev[4].map((x) => [x.i, x.n]), [[0, 0], [200, 1], [400, 1]], "pushed by the kick at 4, at once");
	// a second follow link into row 5: 50 / 50; then one of them 30 %: 30 / 50, 20 % no push
	press(X(0, 4.5), Y(0), { shift: true }); drag(X(4, 0.5), Y(4), { shift: true }); up(X(4, 0.5), Y(4));
	assert.deepEqual(plain(t.run("rowHits(0)[1].fl.map((l) => Math.round(l.w))")), [50, 50]);
	t.run("setFollow(rowHits(0)[1], rowHits(0)[1].fl[1], 30); changed(true)");
	assert.deepEqual(plain(t.run("rowHits(0)[1].fl.map((l) => Math.round(l.w))")), [50, 30], "the rest = no push");
	t.run("setFollow(rowHits(0)[1], rowHits(0)[1].fl[1], 80); changed(true)");
	assert.deepEqual(plain(t.run("rowHits(0)[1].fl.map((l) => Math.round(l.w))")), [20, 80], "the other gives way at 100");
	// over many cycles, with restart 0 on row 5 and no own links, the pushes pick hit 0 or 1 by chance
	t.run("rowHits(4).forEach((h) => (h.lk = [])); startLk[4] = []; changed(true)");
	ev = play(engine(t), 40);
	const pushes = ev[4].map((x) => x.n);
	const c0 = pushes.filter((n) => n === 0).length / pushes.length;
	assert.ok(pushes.length === 40 && c0 > 0.6 && c0 < 0.95, "about 80 % the first hit (" + c0 + " of " + pushes.length + ")");
	// stored and read back with the follow links
	const before = plain(t.run("flat()"));
	t.run("unflat(flat())");
	assert.deepEqual(plain(t.run("flat()")), before, "round trip with follow links");
	// a double-click on a follow handle deletes it
	press(X(0, 4.5), Y(0)); up(X(0, 4.5), Y(0));
	const fr = plain(t.run("followRect(sel.fl[0])"));
	press(fr[0] + 3, fr[1] + 3); up(fr[0] + 3, fr[1] + 3);
	t.ctx.ondblclick(fr[0] + 3, fr[1] + 3, 1, 0, 0, 0, 0, 0);
	assert.equal(t.run("rowHits(0)[1].fl.length"), 1, "deleted");
	t.run("rowHits(0)[1].fl = []; rowHits(4).forEach((h) => hits.splice(hits.indexOf(h), 1)); startLk[4] = [{ t: null, w: 100 }]; changed(true)");
}
// START: select it in the strip and drag to hit 3 of row 1
{
	const s = plain(t.run("stripRect(0, 's')"));
	press(s[0] + 5, s[1] + 5); drag(X(0, 9), Y(0)); up(X(0, 9), Y(0));
	assert.equal(t.run("sel"), "S0");
	assert.equal(t.run("startLk[0].length"), 2, "START has 2 links");
}
// the trigger clock: row 4, div 2, every 2nd edge a step
{
	t.ctx.row(4, "clock", 1);
	t.ctx.row(4, "div", 2);
	t.ctx.row(4, "restart", 0);
	draw(3, 0, 1);
	draw(3, 1, 2);
	const ev = play(engine(t), 1, 1600, (i) => (i % 100 < 5 && i >= 100 ? 1 : 0));
	assert.deepEqual(ev[3].slice(0, 4).map((x) => [x.i, x.n]), [[100, 0], [300, 1], [500, 0], [700, 1]]);
}
// ghosts: row 1 in one cycle
{
	const g = plain(t.run("walkGhosts(1).map((e) => [rowIndex(e.h), e.t, e.len])"));
	assert.deepEqual(g, [[0, 0, 8], [1, 8, 4], [0, 12, 4]], "row 2's walk: 8 + 4, then the first again, cut at 16");
}
// stored and read back
{
	const before = plain(t.run("flat()"));
	t.run("unflat(flat())");
	assert.deepEqual(plain(t.run("flat()")), before, "round trip");
}
// cycles 2: the rows show twice the steps
{
	t.ctx.cycles(2);
	assert.equal(t.run("span(0)"), 32);
	assert.equal(t.run("colW(0)"), 20);
	t.ctx.cycles(1);
}
// sequences: seq 2 is empty; back to 1 has the hits; the file has both
{
	const n1 = t.run("hits.length");
	t.ctx.seqname("a");
	t.ctx.dsp(0);
	t.ctx.seq(1);
	assert.equal(t.run("hits.length"), 0, "sequence 2 is empty");
	assert.equal(t.run("rowCfg[2].steps"), 3, "an empty sequence keeps the row settings");
	t.ctx.seq(0);
	assert.equal(t.run("hits.length"), n1);
	t.fire();
	const f = JSON.parse(t.files.get("/presets/uMPseq_a.json"));
	assert.equal(f.seqs[0][0], -23);
}
// undo
{
	const n0 = t.run("hits.length");
	press(X(0, 0.5), Y(0)); up(X(0, 0.5), Y(0));
	t.ctx.ondblclick(X(0, 0.5), Y(0), 1, 0, 0, 0, 0, 0);
	assert.equal(t.run("hits.length"), n0 - 1);
	t.ctx.undo();
	assert.equal(t.run("hits.length"), n0, "undo brings it back");
}
// vertical moves: a hit dragged into another row keeps its place in the cycle and its length in time
{
	t.ctx.row(8, "steps", 8);
	draw(6, 4, 6);                      // row 7 (16 steps): 4..6
	press(X(6, 4.5), Y(6)); drag(X(7, 2.5), Y(7)); up(X(7, 2.5), Y(7));
	assert.deepEqual(plain(t.run("rowHits(7).map((h) => [h.st, h.len])")), [[2, 1]], "row 8 (8 steps): 2..3");
	assert.equal(t.run("rowHits(6).length"), 0);
	assert.deepEqual(plain(t.run("rowHits(7)[0].lk.map((l) => l.t)")), [null], "its links start over");
	// option-drag: a copy back into row 7
	press(X(7, 2.5), Y(7), { option: true }); drag(X(6, 8.5), Y(6), { option: true }); up(X(6, 8.5), Y(6));
	assert.deepEqual(plain(t.run("[rowHits(6).map((h) => [h.st, h.len]), rowHits(7).length]")), [[[8, 2]], 1], "copied");
	// a follow link into the new row goes when the target moves into the source's row
	t.run("addFollow(rowHits(6)[0], rowHits(7)[0]); changed(true)");
	press(X(7, 2.5), Y(7)); drag(X(6, 1.5), Y(6)); up(X(6, 1.5), Y(6));
	assert.equal(t.run("rowHits(6).length"), 2);
	assert.equal(t.run("rowHits(6)[1].fl.length"), 0, "no follow link inside a row");
	t.run("rowHits(6).forEach((h) => hits.splice(hits.indexOf(h), 1)); changed(true)");
	t.ctx.row(8, "steps", 16);
}
// the playheads from the engine
{
	t.ctx.inlet = 1;
	t.run("inlet = 1");
	t.ctx.list(2, -1, 0, -1, -1, -1, -1, -1);
	assert.deepEqual(plain(t.run("playheads")), [2, -1, 0, -1, -1, -1, -1, -1]);
	t.run("inlet = 0");
}
t.run("paint()");
t.run("sel = rowHits(0)[0]; editor = { h: sel, li: 0, x: 400, y: 700 }; paint(); editor = null; menu = { h: sel, li: 0, x: 400, y: 700 }; paint(); menu = null");
console.log("markovpercroll: all tests passed");
