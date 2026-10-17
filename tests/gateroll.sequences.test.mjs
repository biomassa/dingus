// Tests for the sequences in dingus.gateRoll.js outside Max: switching through the engine banks,
// the confirmation race, audio off, the sequences file, migration from the presets file, presets.
// Run: node tests/gateroll.sequences.test.mjs
import { readFileSync } from "node:fs";
import { fileURLToPath } from "node:url";
import vm from "node:vm";
import assert from "node:assert/strict";

const SRC = readFileSync(fileURLToPath(new URL("../javascript/dingus.gateRoll.js", import.meta.url)), "utf8");
const FOLDER = "/Users/test/Dropbox/_maxPresets/";
const plain = (x) => JSON.parse(JSON.stringify(x));

function load(files = new Map()) {
	const out = [];
	const tasks = [];
	const buffers = new Map();
	class Buffer {
		constructor(name) {
			if (!buffers.has(name)) buffers.set(name, { frames: 256, chans: 9, data: new Map() });
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
	ctx.buffer("gates");
	return { ctx, out, files, run, fire, peek, msgs };
}

// a sequence: steps, full range, all steps played, one 1-step gate on each given step
const seqList = (steps, starts) => [-3, steps, 0, steps - 1, ...Array(steps).fill(1), ...starts.flatMap((s) => [s, 1, 1, 1, 1, 0.8, 0.5, 0])];

// --- a first start without files: the current gates become sequence 1 ---
{
	const t = load();
	t.ctx.steps(8);
	t.ctx.seqname("lead");
	const f = JSON.parse(t.files.get(FOLDER + "uGATEseq_lead.json"));
	assert.equal(f.seqs.length, 32);
	assert.equal(f.seqs[0][1], 8);
	assert.equal(t.peek("gates", 1, 128), 8, "bank 0 meta: steps");
}

// --- migration from any stored format: slot n = sequence n, above 32 the first empty ones ---
{
	const files = new Map();
	const old7 = [4, 1, 1, 1, 1, 0, 1, 1, 1, 0.8, 0.5]; // unversioned: n, skips, 7-field gates
	files.set(FOLDER + "uGATE_bass.json", JSON.stringify({ pattrstorage: { slots: { 1: { data: { gateroll: seqList(4, [0]) } }, 2: { data: { gateroll: old7 } }, 40: { data: { gateroll: seqList(7, [3]) } } } } }));
	const t = load(files);
	t.ctx.seqname("bass");
	const f = JSON.parse(files.get(FOLDER + "uGATEseq_bass.json"));
	assert.equal(f.seqs[0][1], 4);
	assert.equal(f.seqs[1][0], -3, "the old format is converted");
	assert.equal(f.seqs[1][1], 4);
	assert.equal(f.seqs[2][1], 7, "slot 40 goes to the first empty sequence");
}

// --- switching with audio on ---
let t = load();
t.ctx.dsp(1);
t.ctx.steps(4);
t.ctx.seqname("x");
t.run("seqs[2] = " + JSON.stringify(seqList(6, [1, 3])));
t.out.length = 0;
t.ctx.seq(2);
assert.deepEqual(plain(t.msgs("engine")), [["engine", "pendbank", 1]]);
assert.equal(t.run("cur"), 0);
assert.equal(t.peek("gates", 1, 129), 6, "bank 1 meta: 6 steps");
assert.equal(t.peek("gates", 1, 64 + 1), 1, "bank 1: the gate on step 2");
assert.equal(t.peek("gates", 1, 128), 4, "bank 0 untouched");
t.ctx.steps(5);
assert.equal(t.peek("gates", 1, 128), 5, "an edit goes to the playing bank");
assert.equal(t.peek("gates", 1, 129), 6);
t.out.length = 0;
t.ctx.bankis(1);
assert.equal(t.run("cur"), 2);
assert.equal(t.run("n"), 6);
assert.deepEqual(plain(t.msgs("seqis")).at(-1), ["seqis", 3]);
assert.deepEqual(plain(t.msgs("stepsis")).at(-1), ["stepsis", 6]);

// --- a choice before the confirmation waits ---
t.out.length = 0;
t.ctx.seq(0);
t.ctx.seq(4);
assert.equal(t.run("queued"), 4);
assert.deepEqual(plain(t.msgs("engine")), [["engine", "pendbank", 0]]);
t.ctx.bankis(0);
assert.equal(t.run("pend"), 4);
t.ctx.bankis(1);
assert.equal(t.run("cur"), 4);

// --- audio off: at once ---
t = load();
t.ctx.seqname("y");
t.ctx.dsp(0);
t.out.length = 0;
t.ctx.seq(3);
assert.equal(t.run("cur"), 3);
assert.deepEqual(plain(t.msgs("engine")), [["engine", "pendbank", 1], ["engine", "swapnow", 1]]);

// --- the file, copy / paste, clear, clear all ---
t.ctx.steps(9);
t.fire();
assert.equal(JSON.parse(t.files.get(FOLDER + "uGATEseq_y.json")).seqs[3][1], 9);
t.ctx.copyseq();
t.ctx.seq(7);
t.ctx.pasteseq();
assert.equal(t.run("n"), 9);
t.run("gates = [{s: 0, span: 1, f: 1, p: 1, r: 1, v: 1, d: 0.5, dl: 0}]");
t.ctx.clear();
assert.equal(t.run("gates.length"), 0);
t.ctx.clearall();
assert.ok(t.run("seqs.every(function (s, i) { return i === cur || s === null; })"));

// --- presets: the sequence number; an old preset is ignored after the migration ---
t = load();
t.ctx.seqname("z");
t.ctx.dsp(0);
t.ctx.seq(5);
assert.deepEqual(plain(t.ctx.getvalueof()), [-5, 5]);
t.ctx.setvalueof(-5, 2);
assert.equal(t.run("cur"), 2);
t.run("gates = [{s: 0, span: 1, f: 1, p: 1, r: 1, v: 1, d: 0.5, dl: 0}]");
t.ctx.setvalueof(...seqList(4, []));
assert.equal(t.run("gates.length"), 1, "an old preset doesn't replace the gates");

console.log("gateroll.sequences: all tests passed");
