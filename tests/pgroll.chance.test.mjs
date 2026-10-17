// Tests for the chance lanes of dingus.pgRoll.js outside Max: zones, the op menu, the cell editor.
// Run: node tests/pgroll.chance.test.mjs
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


const t = load();
t.ctx.steps(4);
// one long note on steps 1-2 with one chance lane: the cell is wide (zones)
t.run("notes = [{st: 0, len: 2, pitch: 40, v: 1, gl: 0, r: 1, d: 0.5, fd: 0, ch: []}]; chN = 1; fitCells(notes[0]); n = 4;");
const X = (pos) => t.run(`xOf(${pos})`);
const cy = t.run("chTop()");
const CHH = t.run("CHH"), CHOP = t.run("CHOP"), CHBOT = t.run("CHBOT");
const click = (x, y, mods = {}) => {
	t.ctx.onclick(x, y, 1, 0, mods.shift ? 1 : 0, 0, mods.option ? 1 : 0, 0);
	t.ctx.ondrag(x, y, 0, 0, 0, 0, 0, 0);
};
const dragv = (x, y, dy) => {
	t.ctx.onclick(x, y, 1, 0, 0, 0, 0, 0);
	t.ctx.ondrag(x, y - dy, 1, 0, 0, 0, 0, 0);
	t.ctx.ondrag(x, y - dy, 0, 0, 0, 0, 0, 0);
};
const cell = () => plain(t.run("notes[0].ch[0]"));
assert.equal(CHH, 48);

// a click on the op band = the op menu
click(X(0.5), cy + 5);
assert.ok(t.run("menu !== null") && t.run("editor === null"), "op band: menu");
// pick JMP< from the grouped menu (JUMP column, first item)
const mr = plain(t.run("menuRect(dims()[0], dims()[1])"));
const MW = t.run("MENUW"), MH = t.run("MENUH"), MT = t.run("MENUTOP");
click(mr[0] + 2 + 1 * MW + 10, mr[1] + 2 + MT + 0 * MH + 8);
assert.equal(cell().op, 5, "JMP< chosen");
assert.equal(t.run("menu"), null);

// a click in the middle = the cell editor
click(X(1), cy + CHH / 2);
assert.ok(t.run("editor !== null"), "middle: editor");
const L = plain(t.run("edLayout(dims()[0], dims()[1])"));
const mid = (r) => [r[0] + r[2] / 2, r[1] + r[3] / 2];
// PROB slider at three quarters
click(L.prob[0] + L.prob[2] * 0.75, L.prob[1] + 5);
assert.ok(Math.abs(cell().p - 0.75) < 0.01, "PROB from the slider");
// amount + and -
const a0 = t.run("opAmount(notes[0].ch[0])");
click(...mid(L.amtPlus));
click(...mid(L.amtPlus));
click(...mid(L.amtMinus));
assert.equal(t.run("opAmount(notes[0].ch[0])"), a0 + 1, "amount +2 -1");
// PTN +
click(...mid(L.ptnPlus));
assert.deepEqual([cell().pa, cell().pb], [1, 2], "PTN 1 of every 2");
// an op from the editor's grid: RATCH (column 5)
click(L.grid[0] + 2 + 4 * MW + 10, L.grid[1] + 2 + MT + 8);
assert.equal(cell().op, 15, "RATCH from the editor grid");
assert.ok(t.run("editor !== null"), "the editor stays open");
// clear, then close with a click outside
click(...mid(L.clear));
assert.equal(cell().op, 0, "cleared");
click(2, 2);
assert.equal(t.run("editor"), null, "a click outside closes it");

// zones: drag the amount (bottom left) and PTN (bottom right)
t.run("notes[0].ch[0] = {op: 5, p: 0.5, pa: 0, pb: 0, amt: 1}");
dragv(X(0.3), cy + CHH - 5, 12);
assert.equal(cell().amt, 3, "amount +2 by dragging 12 px");
dragv(X(1.7), cy + CHH - 5, 20);
assert.deepEqual([cell().pa, cell().pb], plain(t.run("PTNS[2]")), "PTN two steps on");
dragv(X(1), cy + CHH / 2, 25);
assert.ok(Math.abs(cell().p - 0.75) < 1e-9, "PROB in the middle zone");
assert.equal(t.run("editor"), null, "drags open nothing");

// a narrow cell: no zones, a click opens the editor, a drag sets PROB
t.run("notes = [{st: 0, len: 0.25, pitch: 40, v: 1, gl: 0, r: 1, d: 0.5, fd: 0, ch: [{op: 1, p: 0.5, pa: 0, pb: 0, amt: 0}]}];");
click(X(0.1), cy + 5);
assert.ok(t.run("editor !== null && menu === null"), "narrow: the op band opens the editor");
click(2, 2);
dragv(X(0.1), cy + CHH / 2, 10);
assert.ok(Math.abs(cell().p - 0.6) < 1e-9);

// the old shortcuts still work
click(X(0.1), cy + CHH / 2, { shift: 1 });
assert.deepEqual([cell().pa, cell().pb], [1, 2], "shift-click = next PTN");
t.run("editor = null; menu = null;");
t.ctx.ondblclick(X(0.1), cy + CHH / 2, 1, 0, 0, 0, 0, 0);
assert.equal(cell().op, 0, "double-click clears");

// painting with the editor and the menu open does not throw
t.run("notes[0].ch[0] = {op: 16, p: 0.5, pa: 1, pb: 4, amt: 3}; editor = {nt: notes[0], li: 0, x: 200, y: chTop()};");
t.ctx.paint();
t.run("editor = null; menu = {nt: notes[0], li: 0, x: 200, y: chTop()};");
t.ctx.paint();
t.run("chN = 0;");
t.run("editor = {nt: notes[0], li: 0, x: 200, y: 100};");
t.ctx.paint();
assert.equal(t.run("editor"), null, "an editor on a removed lane closes");

// sliders: amount and PTN from a click / drag along them; quick clicks (a double-click) stay in the editor
t.run("notes[0].ch[0] = {op: 8, p: 0.5, pa: 0, pb: 0, amt: 1}; chN = 1; editor = {nt: notes[0], li: 0, x: 200, y: chTop()}; menu = null;");
const L2 = plain(t.run("edLayout(dims()[0], dims()[1])"));
click(L2.amtVal[0] + L2.amtVal[2] - 1, L2.amtVal[1] + 5);
assert.equal(cell().amt, t.run("amtMax(OPS[8])"), "the amount slider's right end = the most");
t.ctx.onclick(L2.ptnVal[0] + 2, L2.ptnVal[1] + 5, 1, 0, 0, 0, 0, 0);
t.ctx.ondrag(L2.ptnVal[0] + L2.ptnVal[2] - 1, L2.ptnVal[1] + 5, 1, 0, 0, 0, 0, 0);
t.ctx.ondrag(L2.ptnVal[0] + L2.ptnVal[2] - 1, L2.ptnVal[1] + 5, 0, 0, 0, 0, 0, 0);
assert.deepEqual([cell().pa, cell().pb], plain(t.run("PTNS[PTNS.length - 1]")), "PTN dragged to the last choice");
const before = cell().amt;
const pm = [L2.amtMinus[0] + 5, L2.amtMinus[1] + 5];
click(...pm);
t.ctx.ondblclick(pm[0] + 1, pm[1], 1, 0, 0, 0, 0, 0);
assert.ok(t.run("editor !== null"), "a double-click on - keeps the editor open");
assert.equal(cell().amt, before - 2, "and counts as two steps");
click(...pm);
t.ctx.ondblclick(...pm, 1, 0, 0, 0, 0, 0);
assert.equal(cell().amt, before - 3, "not twice when onclick took the same click");

console.log("pgroll.chance: all tests passed");
