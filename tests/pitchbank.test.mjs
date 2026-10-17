// Tests for the sequences in dingus.pitchBank.js outside Max: switching through the engine banks,
// the confirmation race, audio off, the sequences file, migration from the presets file, presets.
// Run: node tests/pitchbank.test.mjs
import { readFileSync } from "node:fs";
import { fileURLToPath } from "node:url";
import vm from "node:vm";
import assert from "node:assert/strict";

const SRC = readFileSync(fileURLToPath(new URL("../javascript/dingus.pitchBank.js", import.meta.url)), "utf8");
const FOLDER = "/Users/test/Dropbox/_maxPresets/";
const plain = (x) => JSON.parse(JSON.stringify(x));

const dicts = {};
function load(files = new Map()) {
	const out = [];
	const tasks = [];
	const buffers = new Map();
	class Buffer {
		constructor(name) {
			if (!buffers.has(name)) buffers.set(name, { frames: 1024, chans: 5, data: new Map() });
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
		mgraphics: mg, Buffer, File, Task, Global: function () {}, Dict: class { constructor(n) { this.d = dicts[n] || {}; } get(k) { return this.d[k] ?? null; } },
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
	ctx.buffer("pitch");
	return { ctx, out, files, run, fire, peek, msgs };
}

const close = (a, b) => Math.abs(a - b) < 1e-9;
// a list message (vals / rest / skip), as the multisliders send it through prepend
const list = (t, name, ...a) => {
	t.ctx.messagename = name;
	t.ctx.anything(...a);
};

// --- a first start: the current pitches become sequence 1; the grid gets them without output ---
{
	const t = load();
	t.ctx.steps(3);
	list(t, "vals", 60, 62, 64);
	list(t, "delays", 0, 0.5, 0);
	list(t, "offs", 0, 0, 1);
	t.ctx.seqname("lead");
	const f = JSON.parse(t.files.get(FOLDER + "uPITCHseq_lead.json"));
	assert.deepEqual(f.seqs[0].vals, [60, 62, 64]);
	assert.deepEqual(f.seqs[0].offs, [0, 0, 1]);
	const pg = t.out.find((m) => m[0] === "pg");
	assert.deepEqual(plain(pg), ["pg", "setstate", -2, 3, 60, 62, 64, 0, 0.5, 0, 0, 0, 1]);
	assert.equal(t.peek("pitch", 1, 1), 62, "degree index of step 2");
	assert.ok(close(t.peek("pitch", 4, 1), 0.5), "its delay");
	assert.equal(t.peek("pitch", 5, 2), 1, "step 3 deleted");
}

// --- the pitch table: 12-TET by default, then from the tuning dictionary ---
{
	const t = load();
	assert.ok(close(t.peek("pitch", 1, 256 + 69), 69), "12-TET: index 69 = MIDI 69");
	dicts.q = { size: 2, cents: [0, 600], range: 1200, tune: 440, center: 69 };
	t.ctx.dictionary("q");
	assert.ok(close(t.peek("pitch", 1, 256 + 70), 75), "two-step tuning: one degree up = 600 cents");
	assert.ok(close(t.peek("pitch", 1, 256 + 71), 81));
}

// --- skip in the range; migration from both pitch-grid formats ---
{
	const files = new Map();
	const slot = (k, grid) => ({ data: { number: [k], pitchgrid: grid, "multislider[1]": Array(k).fill(1), "multislider[2]": [0.2, 0.5, 1].slice(0, k), rslider: [0, k] } });
	files.set(FOLDER + "uPITCH_bass.json", JSON.stringify({ pattrstorage: { slots: { 1: slot(3, [-2, 3, 50, 51, 52, 0, 0.25, 0, 0, 1, 0]), 2: slot(2, [40, 41]), 99: slot(2, [30, 31]) } } }));
	const t = load(files);
	t.ctx.seqname("bass");
	const f = JSON.parse(files.get(FOLDER + "uPITCHseq_bass.json"));
	assert.deepEqual(f.seqs[0].vals, [50, 51, 52]);
	assert.deepEqual(f.seqs[0].dels, [0, 0.25, 0]);
	assert.deepEqual(f.seqs[1].vals, [40, 41], "old format: values only");
	assert.deepEqual(f.seqs[2].vals, [30, 31], "slot 99 goes to the first empty sequence");
	assert.ok(close(t.peek("pitch", 2, 0), 0.2), "skip raised in the range: 0.2 + 0");
	assert.ok(close(t.peek("pitch", 2, 2), 1));
}

// --- switching and the race ---
let t = load();
t.ctx.dsp(1);
t.ctx.seqname("x");
t.run("seqs[2] = " + JSON.stringify({ n: 2, vals: [70, 72], dels: [0, 0], offs: [0, 0], rest: [1, 1], skip: [1, 1], rs: 0, re: 1 }));
t.out.length = 0;
t.ctx.seq(2);
assert.deepEqual(plain(t.msgs("engine")), [["engine", "pendbank", 1]]);
assert.equal(t.peek("pitch", 1, 64 + 1), 72, "bank 1, step 2");
t.ctx.seq(4);
t.ctx.bankis(1);
assert.equal(t.run("cur"), 2);
assert.ok(t.out.some((m) => m[0] === "pg" && m[3] === 2), "the grid shows sequence 3");
assert.equal(t.run("pend"), 4);

// --- audio off, copy / paste, clear all ---
t = load();
t.ctx.seqname("y");
t.ctx.dsp(0);
t.ctx.seq(3);
assert.equal(t.run("cur"), 3);
t.ctx.steps(2);
list(t, "vals", 55, 57);
t.ctx.copyseq();
t.ctx.seq(8);
t.ctx.pasteseq();
assert.deepEqual(plain(t.run("vals")), [55, 57]);
t.fire();
assert.deepEqual(JSON.parse(t.files.get(FOLDER + "uPITCHseq_y.json")).seqs[8].vals, [55, 57]);
t.ctx.clearall();
assert.ok(t.run("seqs.every((s, i) => i === cur || s === null)"));

console.log("pitchbank: all tests passed");
