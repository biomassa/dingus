// Tests for the sequences in dingus.voltBank.js outside Max: switching through the engine banks,
// the confirmation race, audio off, the sequences file, migration from the presets file, presets.
// Run: node tests/voltbank.test.mjs
import { readFileSync } from "node:fs";
import { fileURLToPath } from "node:url";
import vm from "node:vm";
import assert from "node:assert/strict";

const SRC = readFileSync(fileURLToPath(new URL("../javascript/dingus.voltBank.js", import.meta.url)), "utf8");
const FOLDER = "/Users/test/Dropbox/_maxPresets/";
const plain = (x) => JSON.parse(JSON.stringify(x));

function load(files = new Map()) {
	const out = [];
	const tasks = [];
	const buffers = new Map();
	class Buffer {
		constructor(name) {
			if (!buffers.has(name)) buffers.set(name, { frames: 256, chans: 3, data: new Map() });
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
	ctx.buffer("volt");
	return { ctx, out, files, run, fire, peek, msgs };
}

const close = (a, b) => Math.abs(a - b) < 1e-9;
// a list message (vals / rest / skip), as the multisliders send it through prepend
const list = (t, name, ...a) => {
	t.ctx.messagename = name;
	t.ctx.anything(...a);
};

// --- a first start: the current values become sequence 1; the controls are set ---
{
	const t = load();
	t.ctx.steps(4);
	list(t, "vals", 0.1, 0.2, 0.3, 0.4);
	t.ctx.seqname("lead");
	const f = JSON.parse(t.files.get(FOLDER + "uVOLTseq_lead.json"));
	assert.equal(f.seqs.length, 32);
	assert.deepEqual(f.seqs[0].vals, [0.1, 0.2, 0.3, 0.4]);
	assert.equal(t.peek("volt", 1, 128), 4, "meta: steps");
	assert.ok(t.out.some((m) => m[0] === "msv" && m[1] === "setlist"));
}

// --- the tables: skip raised in the range so its highest is 1, 0 outside ---
{
	const t = load();
	t.ctx.steps(5);
	list(t, "skip", 0.2, 0.5, 0.25, 1, 0);
	t.ctx.range(0, 2);
	assert.ok(close(t.peek("volt", 2, 1), 1), "highest in the range: 1");
	assert.ok(close(t.peek("volt", 2, 0), 0.7));
	assert.ok(close(t.peek("volt", 2, 2), 0.75));
	assert.equal(t.peek("volt", 2, 3), 0, "outside the range");
	assert.equal(t.peek("volt", 2, 129), 0, "range start");
	assert.equal(t.peek("volt", 3, 128), 2, "range end");
}

// --- migration from the presets file's slots ---
{
	const files = new Map();
	const slot = (k, v) => ({ data: { number: [k], multislider: v, "multislider[1]": Array(k).fill(1), "multislider[2]": Array(k).fill(1), rslider: [0, k - 1] } });
	files.set(FOLDER + "uVOLT_bass.json", JSON.stringify({ pattrstorage: { slots: { 1: slot(3, [0.1, 0.2, 0.3]), 4: slot(2, [0.9, 0.8]) } } }));
	const t = load(files);
	t.ctx.seqname("bass");
	const f = JSON.parse(files.get(FOLDER + "uVOLTseq_bass.json"));
	assert.deepEqual(f.seqs[0].vals, [0.1, 0.2, 0.3]);
	assert.equal(f.seqs[3].n, 2);
	assert.equal(f.seqs[1], null);
}

// --- switching through the engine banks, and the confirmation race ---
let t = load();
t.ctx.dsp(1);
t.ctx.seqname("x");
t.run("seqs[2] = " + JSON.stringify({ n: 3, vals: [0.5, 0.6, 0.7], rest: [1, 1, 1], skip: [1, 1, 1], rs: 0, re: 2 }));
t.out.length = 0;
t.ctx.seq(2);
assert.deepEqual(plain(t.msgs("engine")), [["engine", "pendbank", 1]]);
assert.equal(t.peek("volt", 1, 128 + 1), 3, "bank 1 meta");
assert.ok(close(t.peek("volt", 1, 64 + 1), 0.6), "bank 1 value of step 2");
assert.equal(t.run("cur"), 0);
t.ctx.seq(5);
assert.equal(t.run("queued"), 5);
t.ctx.bankis(1);
assert.equal(t.run("cur"), 2);
assert.equal(t.run("n"), 3);
assert.ok(t.out.some((m) => m[0] === "msv" && m[1] === "size" && m[2] === 3), "controls follow");
assert.equal(t.run("pend"), 5, "the waiting choice goes on");
t.ctx.bankis(0);
assert.equal(t.run("cur"), 5);

// --- audio off, copy / paste, clear, the file ---
t = load();
t.ctx.seqname("y");
t.ctx.dsp(0);
t.out.length = 0;
t.ctx.seq(3);
assert.equal(t.run("cur"), 3);
assert.deepEqual(plain(t.msgs("engine")), [["engine", "pendbank", 1], ["engine", "swapnow", 1]]);
t.ctx.steps(6);
list(t, "vals", 1, 2, 3, 4, 5, 6);
t.ctx.copyseq();
t.ctx.seq(9);
t.ctx.pasteseq();
assert.deepEqual(plain(t.run("vals")), [1, 2, 3, 4, 5, 6]);
t.fire();
assert.deepEqual(JSON.parse(t.files.get(FOLDER + "uVOLTseq_y.json")).seqs[9].vals, [1, 2, 3, 4, 5, 6]);
t.ctx.clear();
assert.deepEqual(plain(t.run("vals")), [0, 0, 0, 0, 0, 0]);
t.ctx.clearall();
assert.ok(t.run("seqs.every((s, i) => i === cur || s === null)"));

console.log("voltbank: all tests passed");
