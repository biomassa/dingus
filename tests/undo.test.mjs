// Tests for undo / redo in dingus.pgRoll.js and dingus.markovRoll.js outside Max.
// Run: node tests/undo.test.mjs
import { readFileSync } from "node:fs";
import { fileURLToPath } from "node:url";
import vm from "node:vm";
import assert from "node:assert/strict";

const read = (f) => readFileSync(fileURLToPath(new URL("../javascript/" + f, import.meta.url)), "utf8");
let SRC = "";
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




// the Global is shared between the editors, as in Max
const shared = {};
function open(file) {
	SRC = read(file);
	const t = load();
	t.ctx.Global = function () { return shared; };
	t.run("undoWho = undefined");
	t.ctx.__shared = shared;
	t.run("undoWho = __shared");
	t.ctx.steps(8);
	const X = (pos) => t.run(`xOf(${pos})`);
	const Y = (p) => { const r = t.run(`rowOf(rows(), ${p})`); return r.top + r.h / 2; };
	t.draw = (pos, p) => { t.ctx.onclick(X(pos), Y(p), 1, 0, 0, 0, 0, 0); t.ctx.ondrag(X(pos + 1), Y(p), 1, 0, 0, 0, 0, 0); t.ctx.ondrag(X(pos + 1), Y(p), 0, 0, 0, 0, 0, 0); };
	t.dbl = (pos, p) => { t.ctx.onclick(X(pos), Y(p), 1, 0, 0, 0, 0, 0); t.ctx.ondrag(X(pos), Y(p), 0, 0, 0, 0, 0, 0); t.ctx.ondblclick(X(pos), Y(p), 1, 0, 0, 0, 0, 0); };
	t.pitches = () => plain(t.run("notes.map((q) => q.pitch)"));
	return t;
}

for (const file of ["dingus.pgRoll.js", "dingus.markovRoll.js"]) {
	const t = open(file);
	t.draw(0.1, 40); t.draw(1.1, 41); t.draw(2.1, 42);
	assert.deepEqual(t.pitches(), [40, 41, 42], file);
	t.ctx.undo();
	assert.deepEqual(t.pitches(), [40, 41], file + ": undo takes the last note away");
	t.ctx.undo();
	assert.deepEqual(t.pitches(), [40]);
	t.ctx.redo();
	assert.deepEqual(t.pitches(), [40, 41], file + ": redo");
	t.ctx.redo();
	assert.deepEqual(t.pitches(), [40, 41, 42]);
	t.ctx.redo();
	assert.deepEqual(t.pitches(), [40, 41, 42], "nothing more to redo");
	// a delete is undone; a new edit after an undo clears redo
	t.dbl(1.5, 41);
	assert.deepEqual(t.pitches(), [40, 42]);
	t.ctx.undo();
	assert.deepEqual(t.pitches(), [40, 41, 42], file + ": the deleted note is back");
	t.ctx.undo();
	t.draw(4.1, 45);
	t.ctx.redo();
	assert.deepEqual(t.pitches(), [40, 41, 45], "redo is empty after a new edit");
	// five levels
	for (let k = 0; k < 7; k++) t.draw(5.1, 30 + k === 45 ? 46 : 30 + k), t.dbl(5.5, 30 + k);
	const before = t.pitches();
	for (let k = 0; k < 9; k++) t.ctx.undo();
	t.ctx.undo();
	let steps = 0;
	for (let k = 0; k < 9; k++) { const p = JSON.stringify(t.pitches()); t.ctx.redo(); if (JSON.stringify(t.pitches()) !== p) steps++; }
	assert.equal(steps, 5, file + ": five levels");
	assert.deepEqual(t.pitches(), before);
	// a click that changes nothing adds no level
	t.ctx.onclick(t.run("xOf(0.5)"), 400, 1, 0, 0, 0, 0, 0); t.ctx.ondrag(t.run("xOf(0.5)"), 400, 0, 0, 0, 0, 0, 0);
	// a sequence switch starts a new history
	t.ctx.seq(1); t.ctx.bankis(t.run("pend"));
	t.ctx.undo();
	assert.equal(t.run("notes.length"), 0, file + ": no undo across sequences");
	t.ctx.seq(0); t.ctx.bankis(t.run("pend"));
	assert.deepEqual(t.pitches(), before, "sequence 1 is as it was");
}

// markov: links and chances are undone too
{
	const t = open("dingus.markovRoll.js");
	t.draw(0.1, 40); t.draw(1.1, 41); t.draw(2.1, 42);
	t.run("addLink(notes[0], notes[2]); changed(true)");
	assert.equal(t.run("notes[0].lk.length"), 2);
	t.ctx.undo();
	assert.equal(t.run("notes[0].lk.length"), 1, "the link is undone");
	t.ctx.redo();
	assert.deepEqual(plain(t.run("notes[0].lk.map((l) => Math.round(l.w))")), [50, 50]);
}

// two editors: undo acts only in the one used last
{
	const a = open("dingus.pgRoll.js");
	const b = open("dingus.markovRoll.js");
	a.draw(0.1, 40); a.draw(1.1, 41);
	b.draw(0.1, 50); b.draw(1.1, 51);
	a.ctx.undo(); b.ctx.undo();          // one Cmd+Z reaches both
	assert.deepEqual([a.pitches(), b.pitches()], [[40, 41], [50]], "only the editor used last");
	a.draw(3.1, 44);
	a.ctx.undo(); b.ctx.undo();
	assert.deepEqual([a.pitches(), b.pitches()], [[40, 41], [50]], "now the other one");
}

console.log("undo: all tests passed");
