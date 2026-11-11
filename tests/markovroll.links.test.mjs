// Tests for the links of dingus.markovRoll.js outside Max.
// Run: node tests/markovroll.links.test.mjs
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
	return { ctx, out, files, run, fire, peek, msgs };
}



const t = load();
t.ctx.steps(8);
const X = (pos) => t.run(`xOf(${pos})`);
const Y = (p) => t.run(`noteY(rows(), {pitch: ${p}})`);
const press = (x, y, m = {}) => t.ctx.onclick(x, y, 1, 0, m.shift ? 1 : 0, 0, m.option ? 1 : 0, 0);
const move = (x, y, m = {}) => t.ctx.ondrag(x, y, 1, 0, m.shift ? 1 : 0, 0, 0, 0);
const up = (x, y) => t.ctx.ondrag(x, y, 0, 0, 0, 0, 0, 0);
const links = (i) => plain(t.run(`notes[${i}].lk.map((l) => [l.t ? notes.indexOf(l.t) : -1, Math.round(l.w * 100) / 100])`));
const targets = (i) => plain(t.run(`notes[${i}].lk.map((l) => notes.indexOf(linkTarget(notes[${i}], l)))`));

// three notes drawn with the mouse: each has one link to the next note; the last goes to the first
for (const [pos, p] of [[0.1, 40], [2.1, 43], [4.1, 45]]) { press(X(pos), Y(p)); move(X(pos + 1), Y(p)); up(X(pos + 1), Y(p)); }
assert.equal(t.run("notes.length"), 3);
assert.deepEqual([links(0), links(1), links(2)], [[[-1, 100]], [[-1, 100]], [[-1, 100]]], "a 'next' link per new note");
assert.deepEqual([targets(0), targets(1), targets(2)], [[1], [2], [0]], "next, wrapping to the first");
assert.deepEqual(plain(t.run("startLk.map((l) => notes.indexOf(linkTarget('S', l)))")), [0], "START goes to the first note");

// shift-drag from note 0 to note 2 = a link; the same drag again adds nothing
const linkDrag = (a, pa, b, pb) => { press(X(a), Y(pa), { shift: true }); move(X(b), Y(pb), { shift: true }); up(X(b), Y(pb)); };
linkDrag(0.5, 40, 4.5, 45);
assert.deepEqual(links(0), [[-1, 50], [2, 50]], "0 -> 2 added with an equal share");
linkDrag(0.5, 40, 4.5, 45);
assert.equal(links(0).length, 2, "no duplicate");
linkDrag(0.5, 40, 2.5, 43);
assert.equal(links(0).length, 2, "the next link already goes to note 1");
// a shift-click without a drag makes no link; out and back makes a link to itself
press(X(2.5), Y(43), { shift: true }); up(X(2.5), Y(43));
assert.equal(links(1).length, 1, "shift-click: nothing");
press(X(2.5), Y(43), { shift: true }); move(X(2.5), Y(43) - 30, { shift: true }); move(X(2.6), Y(43), { shift: true }); up(X(2.6), Y(43));
assert.deepEqual(links(1), [[-1, 50], [1, 50]], "a link to itself");

// chances: note 0 is selected by a click; drag the handle of its link to note 2 up by 12 px = +6 %
press(X(0.5), Y(40)); up(X(0.5), Y(40));
assert.ok(t.run("sel === notes[0]"), "a click selects the note");
const hr = plain(t.run("handleRect(sel, sel.lk[1], rows())"));
press(hr[0] + 5, hr[1] + 5); move(hr[0] + 5, hr[1] + 5 - 12); up(hr[0] + 5, hr[1] + 5 - 12);
assert.deepEqual(links(0), [[-1, 44], [2, 56]], "56 %, the other link has the rest");
assert.equal(t.run("notes.length"), 3, "the handle drag made no note");
// a long drag stops at 99 % and 1 %
press(hr[0] + 5, hr[1] + 5); move(hr[0] + 5, hr[1] + 5 - 400); up(hr[0] + 5, hr[1] + 5 - 400);
assert.deepEqual(links(0), [[-1, 1], [2, 99]], "99 % and 1 %");
press(hr[0] + 5, hr[1] + 5); move(hr[0] + 5, hr[1] + 5 + 400); up(hr[0] + 5, hr[1] + 5 + 400);
assert.deepEqual(links(0), [[-1, 99], [2, 1]], "1 % and 99 %");
press(hr[0] + 5, hr[1] + 5); move(hr[0] + 5, hr[1] + 5 - 148); up(hr[0] + 5, hr[1] + 5 - 148);
assert.deepEqual(links(0), [[-1, 25], [2, 75]]);
// a single link can't be changed: it stays 100 %
press(X(4.5), Y(45)); up(X(4.5), Y(45));
const h1 = plain(t.run("handleRect(sel, sel.lk[0], rows())"));
press(h1[0] + 5, h1[1] + 5); move(h1[0] + 5, h1[1] + 45); up(h1[0] + 5, h1[1] + 45);
assert.deepEqual(links(2), [[-1, 100]], "a single link stays 100 %");

// START: a drag from the marker to note 1; then it has two links
press(10, 5); move(X(2.5), Y(43)); up(X(2.5), Y(43));
assert.ok(t.run("sel === 'S'"));
assert.deepEqual(plain(t.run("startLk.map((l) => [l.t ? notes.indexOf(l.t) : -1, l.w])")), [[-1, 50], [1, 50]]);

// stored and read back: the same links (as a sequence and as a full list)
const before = plain(t.run("flat()"));
t.run("unflat(flat())");
assert.deepEqual(plain(t.run("flat()")), before, "flat / unflat round trip");
assert.deepEqual(links(0), [[-1, 25], [2, 75]]);

// a double-click on a handle deletes the link
press(X(0.5), Y(40)); up(X(0.5), Y(40));
const hr2 = plain(t.run("handleRect(sel, sel.lk[1], rows())"));
press(hr2[0] + 5, hr2[1] + 5); up(hr2[0] + 5, hr2[1] + 5);
t.ctx.ondblclick(hr2[0] + 5, hr2[1] + 5, 1, 0, 0, 0, 0, 0);
assert.deepEqual(links(0), [[-1, 100]], "link deleted; the one left is 100 %");
assert.equal(t.run("notes.length"), 3);

// deleting a note removes the links to it; the next links follow the new order
linkDrag(0.5, 40, 4.5, 45);
t.ctx.ondblclick(X(4.5), Y(45), 1, 0, 0, 0, 0, 0);
assert.equal(t.run("notes.length"), 2);
assert.deepEqual(links(0), [[-1, 100]], "the link to the deleted note is gone");
assert.deepEqual([targets(0), targets(1)[0]], [[1], 0]);
// an option-drag copy keeps the links of its source
press(X(2.5), Y(43), { option: true }); t.ctx.ondrag(X(5.5), Y(43), 1, 0, 0, 0, 1, 0); up(X(5.5), Y(43));
assert.equal(t.run("notes.length"), 3);
assert.deepEqual(links(2), [[-1, 50], [1, 50]], "the copy links to the note its source links to");

// the op menu has no skip, jump, repeat or reverse ops
const offered = plain(t.run("[].concat.apply([], MENUCOLS)"));
for (const op of [3, 4, 5, 6, 7, 8, 22, 23, 25, 26]) assert.ok(!offered.includes(op), "op " + op + " not offered");
assert.equal(t.run("MENUCOLS.length"), t.run("MENUHEAD.length"));

// a sequence switch and back keeps the links
t.ctx.seq(1);
t.ctx.bankis(t.run("pend"));
assert.equal(t.run("notes.length"), 0, "sequence 2 is empty");
assert.deepEqual(plain(t.run("startLk.map((l) => l.w)")), [100], "with a fresh START link");
t.ctx.seq(0);
t.ctx.bankis(t.run("pend"));
assert.deepEqual(links(2), [[-1, 50], [1, 50]], "sequence 1 came back with its links");

// heat-map colours: blue for an unlikely link, red for a certain one
const hot = plain(t.run("heat(1)")), cold = plain(t.run("heat(0)"));
assert.ok(hot[0] > 0.9 && hot[2] < 0.3, "chance 1 is red");
assert.ok(cold[2] > 0.9 && cold[0] < 0.3, "chance 0 is blue");
// stacked notes: a second note at the same time on another row; on the same row it is refused
{
	const u = load();
	u.ctx.steps(8);
	const UX = (pos) => u.run(`xOf(${pos})`), UY = (p) => u.run(`noteY(rows(), {pitch: ${p}})`);
	const draw = (pos, p, len = 1) => { u.ctx.onclick(UX(pos), UY(p), 1, 0, 0, 0, 0, 0); u.ctx.ondrag(UX(pos + len), UY(p), 1, 0, 0, 0, 0, 0); u.ctx.ondrag(UX(pos + len), UY(p), 0, 0, 0, 0, 0, 0); };
	draw(0.1, 40); draw(2.1, 40); draw(2.1, 45); draw(4.1, 43);
	assert.deepEqual(plain(u.run("notes.map((n) => [n.st, n.pitch])")), [[0, 40], [2, 40], [2, 45], [4, 43]], "two notes at step 3, in pitch order");
	u.ctx.onclick(UX(2.5), UY(45), 1, 0, 0, 0, 0, 0); u.ctx.ondrag(UX(2.5), UY(45), 0, 0, 0, 0, 0, 0);
	assert.equal(u.run("notes.length"), 4, "a click on a note makes no second note on its row");
	assert.equal(u.run("notes.indexOf(sel)"), 2, "it selects the note on that row");
	// 'next' = the first note that starts later: both stacked notes go on to the note at step 5
	assert.deepEqual(plain(u.run("[1, 2].map((i) => notes.indexOf(linkTarget(notes[i], notes[i].lk[0])))")), [3, 3]);
	assert.equal(u.run("notes.indexOf(linkTarget(notes[0], notes[0].lk[0]))"), 1, "the note before goes to the lower one");
	// a link to the upper stacked note: the drag ends near its row
	u.ctx.onclick(UX(0.5), UY(40), 1, 0, 1, 0, 0, 0); u.ctx.ondrag(UX(2.5), UY(45), 1, 0, 1, 0, 0, 0); u.ctx.ondrag(UX(2.5), UY(45), 0, 0, 0, 0, 0, 0);
	assert.deepEqual(plain(u.run("notes[0].lk.map((l) => notes.indexOf(linkTarget(notes[0], l)))")), [1, 2], "links to both stacked notes");
	// the lanes show the selected note where notes share their time
	u.ctx.onclick(UX(2.5), UY(45), 1, 0, 0, 0, 0, 0); u.ctx.ondrag(UX(2.5), UY(45), 0, 0, 0, 0, 0, 0);
	assert.equal(u.run("notes.indexOf(noteAt(2.5))"), 2);
	const lr = plain(u.run("laneRects()[0]"));
	u.ctx.onclick(UX(2.5), lr.top + lr.h - 3, 1, 0, 0, 0, 0, 0); u.ctx.ondrag(UX(2.5), lr.top + lr.h - 3, 0, 0, 0, 0, 0, 0);
	assert.ok(u.run("notes[2].v") < 0.2 && u.run("notes[1].v") === 1, "VEL changes on the selected note only");
	// a lane click under another note still sets the selected note; without a selection it does nothing
	u.ctx.onclick(UX(0.5), lr.top + lr.h / 2, 1, 0, 0, 0, 0, 0); u.ctx.ondrag(UX(0.5), lr.top + lr.h / 2, 0, 0, 0, 0, 0, 0);
	assert.ok(u.run("notes[0].v") === 1 && Math.abs(u.run("notes[2].v") - 0.5) < 0.1, "the lane edits the selected note only");
	u.run("sel = null");
	u.ctx.onclick(UX(0.5), lr.top + 3, 1, 0, 0, 0, 0, 0); u.ctx.ondrag(UX(0.5), lr.top + 3, 0, 0, 0, 0, 0, 0);
	assert.ok(u.run("notes[0].v") === 1 && u.run("notes[2].v") < 0.7, "no selection: no edit");
	// a chance cell opens only for the selected note
	const cyy = u.run("chTop()") + 20;
	u.ctx.onclick(UX(0.5), cyy, 1, 0, 0, 0, 0, 0); u.ctx.ondrag(UX(0.5), cyy, 0, 0, 0, 0, 0, 0);
	assert.ok(u.run("menu === null && editor === null"), "no cell editor without the note selected");
	u.ctx.onclick(UX(0.5), UY(40), 1, 0, 0, 0, 0, 0); u.ctx.ondrag(UX(0.5), UY(40), 0, 0, 0, 0, 0, 0);
	u.ctx.onclick(UX(0.5), cyy, 1, 0, 0, 0, 0, 0); u.ctx.ondrag(UX(0.5), cyy, 0, 0, 0, 0, 0, 0);
	assert.ok(u.run("editor !== null && editor.nt === notes[0]"), "the selected note's cell opens");
	u.ctx.onclick(2, 300, 1, 0, 0, 0, 0, 0); u.ctx.ondrag(2, 300, 0, 0, 0, 0, 0, 0);
	u.run("editor = null; menu = null");
	// a double-click deletes the note on that row only
	u.ctx.ondblclick(UX(2.5), UY(40), 1, 0, 0, 0, 0, 0);
	assert.deepEqual(plain(u.run("notes.map((n) => n.pitch)")), [40, 45, 43]);
	// a note can't be dragged onto a taken place on its row
	draw(2.1, 43);
	u.ctx.onclick(UX(2.5), UY(43), 1, 0, 0, 0, 0, 0); u.ctx.ondrag(UX(4.5), UY(43), 1, 0, 0, 0, 0, 0); u.ctx.ondrag(UX(4.5), UY(43), 0, 0, 0, 0, 0, 0);
	assert.deepEqual(plain(u.run("notes.filter((n) => n.pitch === 43).map((n) => n.st)")), [2, 4], "blocked on the same row");
	u.run("paint()");
}

// a group: shift-drag over empty space picks notes; they move and delete together
{
	const u = load();
	u.ctx.steps(8);
	const UX = (pos) => u.run(`xOf(${pos})`), UY = (p) => u.run(`noteY(rows(), {pitch: ${p}})`);
	const draw = (pos, p) => { u.ctx.onclick(UX(pos), UY(p), 1, 0, 0, 0, 0, 0); u.ctx.ondrag(UX(pos + 1), UY(p), 1, 0, 0, 0, 0, 0); u.ctx.ondrag(UX(pos + 1), UY(p), 0, 0, 0, 0, 0, 0); };
	draw(0.1, 40); draw(1.1, 42); draw(2.1, 44); draw(5.1, 40);
	// the rectangle from above note 0 to below note 1
	u.ctx.onclick(UX(0.2), UY(43), 1, 0, 1, 0, 0, 0);
	u.ctx.ondrag(UX(1.8), UY(39), 1, 0, 1, 0, 0, 0);
	u.run("paint()");
	u.ctx.ondrag(UX(1.8), UY(39), 0, 0, 0, 0, 0, 0);
	assert.deepEqual(plain(u.run("group.map((q) => notes.indexOf(q))")), [0, 1], "two notes picked");
	assert.equal(u.run("notes.length"), 4, "the rectangle made no note and no link");
	assert.equal(u.run("notes[0].lk.length"), 1);
	// drag note 1 two steps right and one row up: both move
	u.ctx.onclick(UX(1.5), UY(42), 1, 0, 0, 0, 0, 0);
	u.ctx.ondrag(UX(3.5), UY(43), 1, 0, 0, 0, 0, 0);
	u.ctx.ondrag(UX(3.5), UY(43), 0, 0, 0, 0, 0, 0);
	assert.deepEqual(plain(u.run("notes.map((q) => [q.st, q.pitch])")), [[2, 41], [2, 44], [3, 43], [5, 40]], "the group moved by 2 steps and 1 row");
	assert.equal(u.run("group.length"), 2, "still picked");
	// a move that would put one of them on another note is refused as a whole
	u.ctx.onclick(UX(3.5), UY(43), 1, 0, 0, 0, 0, 0);
	u.ctx.ondrag(UX(6.5), UY(42), 1, 0, 0, 0, 0, 0);
	u.ctx.ondrag(UX(6.5), UY(42), 0, 0, 0, 0, 0, 0);
	assert.deepEqual(plain(u.run("notes.map((q) => [q.st, q.pitch])")), [[2, 41], [2, 44], [3, 43], [5, 40]], "blocked: note 0 would land on the note at step 6");
	// a lane sets the value of every picked note
	{
		const glr = plain(u.run("laneRects()[0]"));
		u.ctx.onclick(UX(7.5), glr.top + glr.h / 2, 1, 0, 0, 0, 0, 0); u.ctx.ondrag(UX(7.5), glr.top + glr.h / 2, 0, 0, 0, 0, 0, 0);
		const vs = plain(u.run("notes.map((q) => Math.round(q.v * 10) / 10)"));
		assert.deepEqual(vs, [0.5, 1, 0.5, 1], "VEL of the two picked notes");
	}
	// a double-click on one of them deletes both
	u.ctx.ondblclick(UX(2.5), UY(41), 1, 0, 0, 0, 0, 0);
	assert.deepEqual(plain(u.run("notes.map((q) => [q.st, q.pitch])")), [[2, 44], [5, 40]], "the group is deleted");
	// a plain click on a note lets a group go
	u.ctx.onclick(UX(0.2), UY(46), 1, 0, 1, 0, 0, 0); u.ctx.ondrag(UX(7), UY(39), 1, 0, 1, 0, 0, 0); u.ctx.ondrag(UX(7), UY(39), 0, 0, 0, 0, 0, 0);
	assert.equal(u.run("group.length"), 2);
	u.ctx.onclick(UX(2.5), UY(44), 1, 0, 0, 0, 0, 0); u.ctx.ondrag(UX(2.5), UY(44), 0, 0, 0, 0, 0, 0);
	assert.equal(u.run("group.length"), 2, "a click on a picked note keeps the group");
	u.ctx.onclick(UX(6.5), UY(47), 1, 0, 0, 0, 0, 0); u.ctx.ondrag(UX(6.5), UY(47), 0, 0, 0, 0, 0, 0);
	assert.equal(u.run("group.length"), 0, "a click elsewhere lets it go");
}

// ghosts: the walk over the first cycle; 5 steps, note A (1 step) -> B (3.5 steps) -> A, restart every cycle
{
	const u = load();
	u.ctx.steps(5);
	const GX = (pos) => u.run(`xOf(${pos})`), GY = (p) => u.run(`noteY(rows(), {pitch: ${p}})`);
	for (const [pos, p] of [[0.1, 40], [1.1, 43]]) { u.ctx.onclick(GX(pos), GY(p), 1, 0, 0, 0, 0, 0); u.ctx.ondrag(GX(pos + 0.9), GY(p), 1, 0, 0, 0, 0, 0); u.ctx.ondrag(GX(pos + 0.9), GY(p), 0, 0, 0, 0, 0, 0); }
	u.run("notes[1].len = 3.5");
	const walk = () => plain(u.run("walkGhosts().map((e) => [notes.indexOf(e.nt), e.t, e.len, e.cut])"));
	assert.deepEqual(walk(), [[0, 0, 1, false], [1, 1, 3.5, false], [0, 4.5, 0.5, true]], "A, B, A cut by the restart");
	u.ctx.restart(0.5);
	assert.deepEqual(walk(), [[0, 0, 1, false], [1, 1, 1.5, true], [0, 2.5, 1, false], [1, 3.5, 1.5, true]], "restart every half cycle");
	u.ctx.restart(1);
	// two links from A: the walk follows the likelier one, and its chance dims the ghosts after it
	u.run("notes[0].lk.push({ t: notes[0], w: 3 }); notes[0].lk[0].w = 1");
	const w2 = plain(u.run("walkGhosts().map((e) => [notes.indexOf(e.nt), e.t, Math.round(e.p * 100)])"));
	assert.deepEqual(w2.slice(0, 3), [[0, 0, 100], [0, 1, 75], [0, 2, 56]], "A -> A at 75 %");
	u.ctx.ghosts(0);
	u.run("paint()");
	u.ctx.ghosts(1);
	u.run("paint()");
}

t.run("paint()");
console.log("markovroll.links: all tests passed");
