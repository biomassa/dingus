// Tests for the engine of dingus.markovSeq outside Max: the gen~ code of the patch runs as JavaScript
// (History = state that stays, the rest per sample) on the tables that dingus.markovRoll.js writes.
// This checks the logic, not that gen~ compiles it.
// Run: node tests/markovseq.engine.test.mjs
import { readFileSync } from "node:fs";
import { fileURLToPath } from "node:url";
import vm from "node:vm";
import assert from "node:assert/strict";

const SRC = readFileSync(fileURLToPath(new URL("../javascript/dingus.markovRoll.js", import.meta.url)), "utf8");
const FOLDER = "/Users/test/Dropbox/_maxPresets/";
const plain = (x) => JSON.parse(JSON.stringify(x));

function load(files = new Map()) {
	const out = [];
	const tasks = [];
	const buffers = new Map();
	class Buffer {
		constructor(name) {
			if (!buffers.has(name)) buffers.set(name, { frames: name.endsWith("ch") ? 65536 : 4352, chans: name.endsWith("ch") ? 5 : 22, data: new Map() });
			this.b = buffers.get(name);
		}
		framecount() { return this.b.frames; }
		channelcount() { return this.b.chans; }
		poke(ch, frame, vals) { vals.forEach((v, i) => this.b.data.set(ch + ":" + (frame + i), v)); }
	}
	class File {
		constructor(p, mode) {
			this.p = p; this.mode = mode;
			this.isopen = mode === "read" ? files.has(p) : true;
			this.buf = mode === "read" ? files.get(p) || "" : "";
			this.position = 0;
		}
		get eof() { return this.buf.length; }
		set eof(v) { this.buf = this.buf.slice(0, v); }
		writestring(s) { this.buf += s; this.position = this.buf.length; }
		readstring(n) { const s = this.buf.slice(this.position, this.position + n); this.position += s.length; return s; }
		close() { if (this.mode !== "read") files.set(this.p, this.buf); }
	}
	class Task {
		constructor(fn) { this.fn = fn; tasks.push(this); }
		schedule() { this.due = true; }
		cancel() {}
		repeat() {}
	}
	const mg = new Proxy({ size: [770, 510] }, { get: (t, k) => (k in t ? t[k] : k === "text_measure" ? () => [10, 10] : () => {}) });
	const ctx = {
		mgraphics: mg, Buffer, File, Task, Global: function () {}, Dict: function () {},
		require: () => ({ presetFolder: () => FOLDER }),
		patcher: { filepath: "/Users/test/x.maxpat" },
		box: {
			rect: [0, 0, 770, 510],
			attrs: { presentation_rect: [177, 23, 770, 510], patching_rect: [386, 280, 770, 510] },
			getattr(k) { return this.attrs[k]; },
			setattr(k, v) { this.attrs[k] = v; },
		},
		outlet: (i, ...a) => out.push(a), post() {}, notifyclients() {}, setinletassist() {}, setoutletassist() {},
		arrayfromargs: (a) => Array.from(a), messagename: "", inlet: 0,
	};
	vm.createContext(ctx);
	vm.runInContext(SRC, ctx);
	const run = (code) => vm.runInContext(code, ctx);
	const fire = () => tasks.filter((t) => t.due).forEach((t) => { t.due = false; t.fn(); });
	const peek = (name, ch, frame) => buffers.get(name).data.get(ch + ":" + frame) ?? 0;
	const msgs = (k) => out.filter((m) => m[0] === k);
	ctx.buffer("pg");
	ctx.chbuffer("pgch");
	return { ctx, out, files, run, fire, peek, msgs, buffers };
}




function genCode() {
	const d = JSON.parse(readFileSync(fileURLToPath(new URL("../patchers/dingus.markovSeq.maxpat", import.meta.url)), "utf8"));
	let code = null;
	(function walk(p) { for (const b of p.boxes) { if (b.box.maxclass === "codebox") code = b.box.code; if (b.box.patcher) walk(b.box.patcher); } })(d.patcher);
	return code;
}
const CODE = genCode();
assert.ok(CODE && CODE.includes("uMK engine"), "the patch has the chain engine");

function make(setup, params = {}) {
	const t = load();
	t.ctx.steps(8);
	setup(t);
	t.run("changed(false)");
	const gbd = t.buffers.get("pg").data, cbd = t.buffers.get("pgch").data;
	let src = CODE.replace(/\/\/.*$/gm, "");
	const S = {};
	for (const m of src.matchAll(/^History (\w+)\(([^)]*)\);/gm)) S[m[1]] = +m[2];
	const P = { play: 1, trig: 0, everyr: 1, cscale: 1, ptnmode: 0, barcount: 0, pend: -1, swapnow: 0, restart: 1, freeze: 0, mutate: 0, steps: 5, dir: 0, rstart: 0, rend: 63, lanes: 0, ...params };
	src = src.replace(/^(History|Param|Buffer) .*$/gm, "");
	const fn = new Function("S", "P", "in1", "in2", "in3", "peek", "noise", "clamp", "wrap", "min", "max", "floor", "abs", "pow", "samplerate", "gb", "cb",
		`with(P){with(S){ ${src}; return [out1,out2,out3,out4,out5,out6]; }}`);
	const peek = (b, f, c) => (b === "gb" ? gbd : cbd).get((c + 1) + ":" + f) ?? 0;
	const wrap = (x, a, b) => { const r = b - a; return a + ((x - a) % r + r) % r; };
	let sv = 1;
	const noise = () => { sv = (sv * 48271) % 2147483647; return sv / 2147483647 * 2 - 1; };
	const tick = (ph, rs = 0, fz = 0) => fn(S, P, ph, rs, fz, peek, noise, (x, a, b) => Math.min(Math.max(x, a), b), wrap, Math.min, Math.max, Math.floor, Math.abs, Math.pow, 1000, "gb", "cb");
	return { t, S, P, tick };
}
// phasor cycles of N samples (1 cycle = 8 steps); note-on events: time in steps, note index, pitch, level
function play(e, cycles, hook, N = 8000) {
	const ev = [];
	let was = 0;
	for (let i = 0; i < N * cycles; i++) {
		if (hook) hook(i / N, e);
		const r = e.tick((i % N) / N);
		if (r[0] > 0 && was === 0) ev.push({ t: +(i / N * 8).toFixed(2), n: r[2], p: +r[4].toFixed(1), v: +r[0].toFixed(2) });
		was = r[0];
	}
	return ev;
}
const notes = (t, arr) => t.run(`notes = ${JSON.stringify(arr)}.map((a) => newNote(a[0], a[1], a[2]));`);
const seq = (ev) => ev.map((x) => x.t + ":" + x.n).join(" ");
const four = (t) => notes(t, [[0, 1, 40], [1, 1, 42], [2, 2, 43], [4, 0.5, 45]]);

// the 'next' links: the notes in order, each for its length (the loop is 4.5 steps); a restart at the wrap
assert.equal(seq(play(make(four), 1.5)), "0:0 1:1 2:2 4:3 4.5:0 5.5:1 6.5:2 8:0 9:1 10:2", "in order, restart at 8");
// fractional restart periods
assert.equal(seq(play(make(four, { restart: 0.5 }), 1)), "0:0 1:1 2:2 4:0 5:1 6:2", "restart every half cycle");
assert.equal(seq(play(make(four, { restart: 1.25 }), 1.5)), "0:0 1:1 2:2 4:3 4.5:0 5.5:1 6.5:2 8.5:3 9:0 10:0 11:1", "restart every 1.25 cycles (10 steps)");
// pitches come from the tuning table
assert.deepEqual(play(make(four), 0.5).map((x) => x.p), [40, 42, 43], "pitches");

// a branch: note 1 goes back to note 0 at 75 %, on to note 2 at 25 %
const branch = (t) => { notes(t, [[0, 1, 40], [1, 1, 42], [2, 1, 43]]); t.run("addLink(notes[1], notes[0]); setChance(notes[1], notes[1].lk[1], 75)"); };
{
	const ev = play(make(branch, { restart: 64 }), 40);
	let back = 0, fwd = 0;
	for (let i = 0; i < ev.length - 1; i++) if (ev[i].n === 1) { if (ev[i + 1].n === 0) back++; else if (ev[i + 1].n === 2) fwd++; }
	const ratio = back / (back + fwd);
	assert.ok(back + fwd > 100 && ratio > 0.65 && ratio < 0.85, "about 75 % back (" + ratio.toFixed(2) + ")");
}

// freeze: from the next restart on, the period before repeats exactly; unfreeze: it varies again
{
	const ev = play(make(branch), 12, (c, e) => { e.P.freeze = c >= 3 && c < 8 ? 1 : 0; });
	const per = (k) => ev.filter((x) => x.t >= k * 8 && x.t < (k + 1) * 8).map((x) => x.n).join("");
	for (let k = 3; k < 8; k++) assert.equal(per(k), per(2), "period " + k + " repeats period 2");
	const after = new Set([8, 9, 10, 11].map(per));
	assert.ok(after.size > 1 || !after.has(per(2)), "free again after the freeze");
	// the freeze inlet (in3) does the same as the parameter
	const e2 = make(branch);
	const ev2 = [];
	let was = 0;
	for (let i = 0; i < 8000 * 6; i++) { const r = e2.tick((i % 8000) / 8000, 0, i >= 8000 * 3 ? 1 : 0); if (r[0] > 0 && was === 0) ev2.push({ t: i / 1000, n: r[2] }); was = r[0]; }
	const per2 = (k) => ev2.filter((x) => x.t >= k * 8 && x.t < (k + 1) * 8).map((x) => x.n).join("");
	assert.equal(per2(4), per2(2)); assert.equal(per2(5), per2(2));
}

// a note without links ends the walk until the restart
assert.equal(seq(play(make((t) => { notes(t, [[0, 1, 40], [1, 1, 42]]); t.run("notes[1].lk = []"); }), 1.2)), "0:0 1:1 8:0 9:1");
// a rest (VEL 0) takes its time, with no gate
assert.equal(seq(play(make((t) => { notes(t, [[0, 1, 40], [1, 1, 42], [2, 1, 43]]); t.run("notes[1].v = 0"); }), 0.7)), "0:0 2:2 3:0 5:2");
// GATE 50 % of a 2-step note: the gate is high for 1 step
{
	const e = make((t) => { notes(t, [[0, 2, 40], [2, 2, 42]]); t.run("notes[0].g = 0.5"); });
	let on = 0;
	for (let i = 0; i < 2000; i++) if (e.tick(i / 8000)[0] > 0) on++;
	assert.ok(Math.abs(on - 1000) <= 2, "gate high for 1 of the 2 steps (" + on + " ms)");
}
// START with two links: both notes open a period
{
	const ev = play(make((t) => { notes(t, [[0, 1, 40], [1, 1, 42]]); t.run("addLink('S', notes[1])"); }, { restart: 0.25 }), 30);
	const st = ev.filter((x) => Math.abs(x.t / 2 - Math.round(x.t / 2)) < 1e-9);
	const n0 = st.filter((x) => x.n === 0).length, n1 = st.filter((x) => x.n === 1).length;
	assert.ok(n0 > 30 && n1 > 30, "START picks both (" + n0 + " / " + n1 + ")");
}
// chance ops: MUTE at 100 % silences its note; VEL- 30 lowers the level
{
	const ev = play(make((t) => { notes(t, [[0, 1, 40], [1, 1, 42]]); t.run("notes[0].ch[0] = {op: 1, p: 1, pa: 0, pb: 0, amt: 0}; notes[1].ch[0] = {op: 9, p: 1, pa: 0, pb: 0, amt: 30}"); }), 0.5);
	assert.ok(ev.length >= 2 && ev.every((x) => x.n === 1 && x.v === 0.7), "note 0 muted, note 1 at 0.7");
}
// the restart inlet (in2): the walk starts again at once
{
	const e = make(four);
	let r;
	for (let i = 0; i < 1500; i++) r = e.tick(i / 8000);
	assert.equal(r[2], 1, "on note 1 after 1.5 steps");
	r = e.tick(1500 / 8000, 1);
	assert.equal(r[2], 0, "restart: back on the first note");
}

// stacked notes: note 0 goes to either of two notes at the same place; both go on to the last note
{
	const ev = play(make((t) => { notes(t, [[0, 1, 40], [1, 1, 42], [1, 1, 47], [2, 1, 45]]); t.run("changed(false); addLink(notes[0], notes[2])"); }, { restart: 64 }), 30);
	const after0 = ev.filter((x, i) => i > 0 && ev[i - 1].n === 0).map((x) => x.n);
	assert.ok(after0.includes(1) && after0.includes(2) && after0.every((k) => k === 1 || k === 2), "either stacked note follows note 0");
	assert.ok(ev.filter((x, i) => i > 0 && (ev[i - 1].n === 1 || ev[i - 1].n === 2)).every((x) => x.n === 3), "then the last note");
}

// a pause does not move the restarts off the phasor wraps
{
	const ev = play(make(four), 4, (c, e) => { e.P.play = c >= 1.3 && c < 1.6 ? 0 : 1; });
	const starts = ev.filter((x) => x.n === 0 && x.t > 12).map((x) => x.t);
	assert.ok(starts.includes(16) && starts.includes(24), "restarts at 16 and 24 after a pause (" + starts.join(" ") + ")");
}

console.log("markovseq.engine: all tests passed");
