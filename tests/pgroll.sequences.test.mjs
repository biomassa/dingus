// Tests for the sequences in dingus.pgRoll.js outside Max: switching through the engine banks,
// the confirmation race, audio off, the sequences file, migration from the presets file, presets.
// Run: node tests/pgroll.sequences.test.mjs
import { readFileSync } from "node:fs";
import { fileURLToPath } from "node:url";
import vm from "node:vm";
import assert from "node:assert/strict";

const SRC = readFileSync(fileURLToPath(new URL("../javascript/dingus.pgRoll.js", import.meta.url)), "utf8");
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
	return { ctx, out, files, run, fire, peek, msgs };
}

// one note on step k: start length pitch vel glide ratch duty fade
const seqList = (steps, notes) => [-4, steps, 0, steps - 1, 0, 0, notes.length, ...notes.flatMap((st) => [st, 1, 40, 0.8, 0, 1, 0.5, 0])];

// --- a first start without files: the current notes become sequence 1 ---
{
	const t = load();
	t.ctx.steps(8);
	t.ctx.seqname("lead");
	const f = JSON.parse(t.files.get(FOLDER + "uPGseq_lead.json"));
	assert.equal(f.seqs.length, 32);
	assert.equal(f.current, 0);
	assert.equal(f.seqs[0][1], 8, "sequence 1 has 8 steps");
	assert.equal(t.peek("pg", 1, 4096), 8, "bank 0 meta: steps");
}

// --- migration: preset slot n = sequence n, slots above 32 fill the first empty ones ---
{
	const files = new Map();
	const preset = (pgroll) => ({ id: 1, data: { pgroll } });
	const withMask = (a) => [a[0], a[1], a[2], a[3], 2, 1, 0, ...a.slice(5)];
	files.set(FOLDER + "uPG_bass.json", JSON.stringify({ pattrstorage: { name: "x", slots: { 1: preset(withMask(seqList(4, [0]))), 3: preset(withMask(seqList(6, [1, 2]))), 40: preset(withMask(seqList(7, [3]))) } } }));
	const t = load(files);
	t.ctx.seqname("bass");
	const f = JSON.parse(files.get(FOLDER + "uPGseq_bass.json"));
	assert.equal(f.seqs[0][1], 4);
	assert.equal(f.seqs[2][1], 6);
	assert.equal(f.seqs[1][1], 7, "slot 40 goes to the first empty sequence");
	assert.equal(f.seqs[0][4], 0, "no mask in a sequence");
	assert.equal(t.run("notes.length"), 1, "sequence 1 shown");
}

// --- switching with audio on: the other bank, then the engine's confirmation ---
let t = load();
t.ctx.dsp(1);
t.ctx.steps(4);
t.ctx.seqname("x");
t.run("seqs[2] = " + JSON.stringify(seqList(6, [1, 3])));
t.out.length = 0;
t.ctx.seq(2);
assert.deepEqual(plain(t.msgs("engine")), [["engine", "pend", 1]]);
assert.equal(t.run("cur"), 0, "still showing sequence 1");
assert.equal(t.peek("pg", 1, 4097), 6, "bank 1 meta: 6 steps");
assert.equal(t.peek("pg", 1, 4096), 4, "bank 0 untouched");
assert.equal(t.peek("pg", 2, 2048 + 1 * 16), 1, "bank 1: the note on step 2 (length 1)");
// an edit now goes to the playing bank only
t.ctx.steps(5);
assert.equal(t.peek("pg", 1, 4096), 5);
assert.equal(t.peek("pg", 1, 4097), 6);
// the engine confirms
t.out.length = 0;
t.ctx.bankis(1);
assert.equal(t.run("cur"), 2);
assert.equal(t.run("bank"), 1);
assert.equal(t.run("n"), 6);
assert.deepEqual(plain(t.msgs("seqis")).at(-1), ["seqis", 3]);
assert.deepEqual(plain(t.msgs("stepsis")).at(-1), ["stepsis", 6]);
assert.equal(JSON.parse(JSON.stringify(t.run("seqs[0]")))[1], 5, "the edit stayed with sequence 1");

// --- a choice before the confirmation waits for it ---
t.out.length = 0;
t.ctx.seq(0);
t.ctx.seq(4);
assert.equal(t.run("pend"), 0);
assert.equal(t.run("queued"), 4);
assert.deepEqual(plain(t.msgs("engine")), [["engine", "pend", 0]], "bank 1 (playing) is not written again");
t.ctx.bankis(0);
assert.equal(t.run("cur"), 0);
assert.equal(t.run("pend"), 4, "the waiting choice goes on");
assert.deepEqual(plain(t.msgs("engine")).at(-1), ["engine", "pend", 1]);
t.ctx.bankis(1);
assert.equal(t.run("cur"), 4);

// --- seqstep counts from the waiting choice ---
t.ctx.seqstep(1);
t.ctx.seqstep(1);
assert.equal(t.run("pend"), 5);
assert.equal(t.run("queued"), 6);

// --- audio off: at once, and the engine takes the bank when audio starts ---
t = load();
t.ctx.seqname("y");
t.ctx.dsp(0);
t.out.length = 0;
t.ctx.seq(3);
assert.equal(t.run("cur"), 3);
assert.equal(t.run("bank"), 1);
assert.deepEqual(plain(t.msgs("engine")), [["engine", "pend", 1], ["engine", "swapnow", 1]]);
t.ctx.bankis(1); // when audio starts: nothing more to do
assert.equal(t.run("cur"), 3);

// --- the file follows the changes ---
t.ctx.steps(9);
t.fire();
let f = JSON.parse(t.files.get(FOLDER + "uPGseq_y.json"));
assert.equal(f.current, 3);
assert.equal(f.seqs[3][1], 9);

// --- copy, paste, clear, clear all ---
t.ctx.copyseq();
t.ctx.seq(7);
t.ctx.pasteseq();
assert.equal(t.run("n"), 9);
assert.equal(JSON.parse(JSON.stringify(t.run("seqs[7]")))[1], 9);
t.run("notes = [{st: 0, len: 1, pitch: 40, v: 1, gl: 0, r: 1, d: 0.5, fd: 0, ch: []}]");
t.ctx.clear();
assert.equal(t.run("notes.length"), 0);
t.ctx.clearall();
assert.ok(t.run("seqs.every(function (s, i) { return i === cur ? s[6] === 0 : s === null; })"));

// --- presets: the sequence number and the mask; an old preset only gives its mask ---
t = load();
t.ctx.seqname("z");
t.ctx.dsp(0);
t.run("mask = [1, 0, 1]; scl.size = 3;");
t.ctx.seq(5);
assert.deepEqual(plain(t.ctx.getvalueof()), [-5, 5, 3, 1, 0, 1]);
t.ctx.setvalueof(-5, 2, 3, 0, 1, 1);
assert.equal(t.run("cur"), 2);
assert.deepEqual(plain(t.run("mask")), [0, 1, 1]);
t.run("notes = [{st: 0, len: 1, pitch: 40, v: 1, gl: 0, r: 1, d: 0.5, fd: 0, ch: []}]");
t.ctx.setvalueof(-4, 8, 0, 7, 3, 1, 1, 0, 0, 0);
assert.equal(t.run("notes.length"), 1, "an old preset doesn't replace the notes");
assert.deepEqual(plain(t.run("mask")), [1, 1, 0]);

// --- the box follows the chance lanes of the shown sequence, not of a waiting one ---
t = load();
t.ctx.seqname("w");
t.ctx.dsp(1);
const lanes2 = [-4, 4, 0, 3, 0, 2, 1, 0, 1, 40, 0.8, 0, 1, 0.5, 0, 1, 0.5, 1, 1, 0, 2, 0.5, 1, 1, 0];
t.run("seqs[1] = " + JSON.stringify(lanes2));
const h0 = t.ctx.box.attrs.presentation_rect[3];
t.ctx.seq(1);
assert.equal(t.ctx.box.attrs.presentation_rect[3], h0, "unchanged while sequence 2 waits");
t.ctx.bankis(1);
assert.equal(t.run("chN"), 2);
assert.equal(t.ctx.box.attrs.presentation_rect[3], h0 + 2 * t.run("CHH"), "taller by two chance lanes");
t.ctx.seq(0);
t.ctx.bankis(0);
assert.equal(t.ctx.box.attrs.presentation_rect[3], h0, "back");

console.log("pgroll.sequences: all tests passed");
