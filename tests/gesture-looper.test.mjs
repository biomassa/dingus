// Tests for dingus.gestureLoop.js outside Max.
// Run: node tests/gesture-looper.test.mjs
import { readFileSync } from "node:fs";
import { fileURLToPath } from "node:url";
import vm from "node:vm";
import assert from "node:assert/strict";

const SCRIPT = fileURLToPath(new URL("../javascript/dingus.gestureLoop.js", import.meta.url));
const src = readFileSync(SCRIPT, "utf8");

function load(files = new Map()) {
	const midi = [];
	const info = [];
	class File {
		constructor(p, mode) {
			this.p = p;
			this.mode = mode;
			this.isopen = mode === "read" ? files.has(p) : true;
			this.buf = mode === "read" ? files.get(p) || "" : "";
			this.position = 0;
		}
		get eof() {
			return this.buf.length;
		}
		set eof(v) {
			this.buf = this.buf.slice(0, v);
		}
		writestring(s) {
			this.buf = this.buf.slice(0, this.position) + s + this.buf.slice(this.position + s.length);
			this.position += s.length;
		}
		readstring(n) {
			const s = this.buf.slice(this.position, this.position + n);
			this.position += s.length;
			return s;
		}
		close() {
			if (this.mode !== "read") files.set(this.p, this.buf);
		}
	}
	const dicts = new Map();
	class Dict {
		constructor(n) {
			this.n = n;
		}
		parse(s) {
			dicts.set(this.n, JSON.parse(s));
		}
	}
	const ctx = {
		jsarguments: ["dingus.gestureLoop.js", "t1", "gl_dict"],
		// dingus.paths.js stand-in: the presets folder
		require: () => ({ presetFolder: () => "/Users/ars/Dropbox/_maxPresets/" }),
		inlet: 0,
		messagename: "",
		File,
		Dict,
		Task: class {
			constructor(fn) {
				this.fn = fn;
			}
			schedule() {}
		},
		post: () => {},
		outlet: (i, ...a) => (i === 0 ? midi.push(a[0]) : info.push(a)),
	};
	vm.createContext(ctx);
	vm.runInContext(src, ctx);
	let ph = 0;
	const t = {
		ctx,
		midi,
		info,
		files,
		dicts,
		bytes: (...b) => {
			ctx.inlet = 0;
			b.flat().forEach((x) => ctx.msg_int(x));
		},
		// advance the clock by n steps in increments of 0.01 step
		run: (n) => {
			ctx.inlet = 1;
			const k = Math.round(n * 100);
			for (let i = 0; i < k; i++) {
				ph = Math.round((ph + 0.01) * 100) / 100;
				if (ph >= 1) ph -= 1;
				ctx.msg_float(ph);
			}
			ctx.inlet = 0;
		},
		take: () => midi.splice(0),
		msgs: () => {
			const m = midi.splice(0);
			const r = [];
			for (let i = 0; i < m.length; ) {
				const h = m[i] & 0xf0;
				const n = h === 0xc0 || h === 0xd0 ? 2 : 3;
				r.push(m.slice(i, i + n));
				i += n;
			}
			return r;
		},
		cmd: (name, ...a) => {
			ctx.inlet = 0;
			if (name === "delete") {
				ctx.messagename = "delete";
				return ctx.anything(...a);
			}
			return ctx[name](...a);
		},
	};
	t.run(0.01); // first phase seen
	return t;
}
const seqOf = (t) => t.ctx.seqs[t.ctx.cur];
const plain = (x) => JSON.parse(JSON.stringify(x));

// --- pass-through ---
let t = load();
t.bytes([0x91, 60, 100], [0xe1, 0, 64], [0xb0, 64, 127], 0xd1, 30, 31); // running status
t.bytes(0x92, 61, 0xf8, 90); // realtime inside a message
assert.deepEqual(t.take(), [0x91, 60, 100, 0xe1, 0, 64, 0xb0, 64, 127, 0xd1, 30, 0xd1, 31, 0xf8, 0x92, 61, 90]);

// --- recording: pre-note values, events relative to the note, lift velocity, length as played ---
t = load();
t.cmd("rec");
t.run(0.5);
t.bytes([0xe1, 0, 70], [0xb1, 74, 20], [0xd1, 5]); // before the note-on
t.bytes([0x91, 60, 100]);
t.run(0.25);
t.bytes([0xe1, 0, 72], [0xd1, 50], [0xb1, 74, 30]);
t.run(0.25);
t.bytes([0x81, 60, 33]);
t.bytes([0xb0, 1, 5], [0xb1, 99, 1], [0xb1, 6, 0]); // main channel; NRPN CCs: not recorded
t.run(0.37);
t.cmd("stop");
{
	const s = seqOf(t);
	assert.equal(s.notes.length, 1);
	const n = s.notes[0];
	assert.equal(n.ch, 2);
	assert.equal(n.note, 60);
	assert.equal(n.vel, 100);
	assert.equal(n.off, 33);
	assert.ok(Math.abs(n.start - 0.5) < 1e-9);
	assert.ok(Math.abs(n.len - 0.5) < 1e-9);
	assert.deepEqual(plain(n.pre), [[0xe1, 0, 70], [0xb1, 74, 20], [0xd1, 5]]);
	assert.deepEqual(plain(n.ev.map((e) => e.slice(1))), [[0xe1, 0, 72], [0xd1, 50], [0xb1, 74, 30]]);
	assert.ok(Math.abs(n.ev[0][0] - 0.25) < 1e-9);
	assert.ok(Math.abs(s.length - 1.37) < 1e-9, "length as played, not rounded");
	assert.equal(s.loopStart, 0);
	assert.ok(Math.abs(s.loopEnd - 1.37) < 1e-9);
	assert.ok(t.files.has("/Users/ars/Dropbox/_maxPresets/gestureLooper_t1.json"), "saved after the recording");
	assert.equal(t.dicts.get("gl_dict").seq.notes.length, 1, "published for the roll");
}
// recording passes the live bytes through unchanged
{
	const x = load();
	x.cmd("rec");
	x.bytes([0x93, 64, 80], [0xe3, 1, 64], [0x83, 64, 10]);
	assert.deepEqual(x.take(), [0x93, 64, 80, 0xe3, 1, 64, 0x83, 64, 10]);
}

// --- playback: pre-values, note-on, events at their times, note-off; loops ---
t.take();
t.cmd("play");
assert.deepEqual(t.msgs(), [], "nothing at time 0 in this sequence");
t.run(0.5);
assert.deepEqual(t.msgs(), [[0xe1, 0, 70], [0xb1, 74, 20], [0xd1, 5], [0x91, 60, 100]]);
t.run(0.25);
assert.deepEqual(t.msgs(), [[0xe1, 0, 72], [0xd1, 50], [0xb1, 74, 30]]);
t.run(0.25);
assert.deepEqual(t.msgs(), [[0x81, 60, 33]]);
t.run(0.37 + 0.5); // across the loop end, into the second pass
assert.deepEqual(t.msgs(), [[0xe1, 0, 70], [0xb1, 74, 20], [0xd1, 5], [0x91, 60, 100]]);
// stop: the sounding looped note ends
t.cmd("stop");
assert.deepEqual(t.msgs(), [[0x81, 60, 33]]);

// a sequence with a note held at stop: it ends at the length; a note crossing the loop end ends there
function recordHeld() {
	const x = load();
	x.cmd("rec");
	x.bytes([0x92, 62, 90]);
	x.run(1);
	x.cmd("stop"); // finger still down
	x.bytes([0x82, 62, 0]);
	x.take();
	return x;
}
{
	const x = recordHeld();
	const n = seqOf(x).notes[0];
	assert.ok(Math.abs(n.len - 1) < 1e-9);
	x.cmd("play");
	assert.deepEqual(x.msgs(), [[0x92, 62, 90]], "a note at the loop start sounds at play");
	x.run(1);
	assert.deepEqual(x.msgs(), [[0x82, 62, 64], [0x92, 62, 90]], "ends at the loop end, starts again");
	x.cmd("clock", 0);
	assert.deepEqual(x.msgs(), [[0x82, 62, 64]], "clock pause ends sounding notes");
}

// --- channels: a looped note avoids a live finger's channel ---
{
	const x = recordHeld(); // looped note on channel 3
	x.bytes([0x92, 70, 100]); // live finger on channel 3
	x.take();
	x.cmd("play");
	assert.deepEqual(x.msgs(), [[0x91, 62, 90]], "moved to channel 2, the first free one of the left side");
}
// a live finger on a looped note's channel is re-mapped, with its held-back channel data
{
	const x = recordHeld(); // looped note on channel 3
	x.cmd("play");
	x.take();
	x.bytes([0xe2, 0, 80], [0xb2, 74, 9]); // live data on channel 3, no live note there: held back
	assert.deepEqual(x.msgs(), []);
	x.bytes([0x92, 71, 100]);
	assert.deepEqual(x.msgs(), [[0xe1, 0, 80], [0xb1, 74, 9], [0x91, 71, 100]], "to channel 2, data first");
	x.bytes([0xe2, 0, 90], [0x82, 71, 20]);
	assert.deepEqual(x.msgs(), [[0xe1, 0, 90], [0x81, 71, 20]]);
}
// a full side: the live note takes its channel and the looped note on it is cut
{
	const x = recordHeld();
	for (const c of [1, 3, 4, 5, 6, 7]) x.bytes([0x90 | c, 50 + c, 90]); // live on 2, 4-8
	x.take();
	x.cmd("play"); // looped note goes to channel 3 (the only free one)
	assert.deepEqual(x.msgs(), [[0x92, 62, 90]]);
	x.bytes([0x92, 40, 99]); // live on 3
	assert.deepEqual(x.msgs(), [[0x82, 62, 64], [0x92, 40, 99]]);
	x.run(0.5);
	assert.deepEqual(x.msgs(), [], "the cut note stays silent");
}
// the right side keeps to channels 9-15
{
	const x = load();
	x.cmd("rec");
	x.bytes([0x9a, 80, 90]); // channel 11
	x.run(0.5);
	x.bytes([0x8a, 80, 0]);
	x.run(0.5);
	x.cmd("stop");
	x.bytes([0x9a, 81, 90]); // live on 11
	x.take();
	x.cmd("play");
	assert.deepEqual(x.msgs(), [[0x98, 80, 90]], "channel 9");
}

// --- sequences: switching while playing waits for the loop end ---
{
	const x = recordHeld(); // sequence 0: note 62, length 1
	x.cmd("seq", 1);
	x.cmd("rec");
	x.bytes([0x93, 65, 70]);
	x.run(0.5);
	x.bytes([0x83, 65, 0]);
	x.run(1.5);
	x.cmd("stop");
	x.cmd("seq", 0);
	x.take();
	x.cmd("play");
	x.cmd("seq", 1);
	assert.deepEqual(x.info.at(-1), ["seq", 1, 1], "pending");
	assert.deepEqual(x.msgs(), [[0x92, 62, 90]]);
	x.run(0.5);
	assert.deepEqual(x.msgs(), []);
	x.run(0.5);
	assert.deepEqual(x.msgs(), [[0x82, 62, 64], [0x93, 65, 70]], "sequence 1 from its start");
	assert.equal(x.ctx.cur, 1);
}

// --- edits ---
{
	const x = load();
	x.cmd("rec");
	x.bytes([0x91, 60, 100]);
	x.run(0.2);
	x.bytes([0xe1, 0, 70]);
	x.run(0.2);
	x.bytes([0xe1, 0, 75]);
	x.run(0.2);
	x.bytes([0x81, 60, 10]);
	x.run(0.4);
	x.cmd("stop");
	const n = seqOf(x).notes[0];
	x.cmd("move", 0.25, n.id);
	assert.ok(Math.abs(n.start - 0.25) < 1e-9);
	x.cmd("trim", n.id, "start", 0.5); // 0.25 into the note: the first bend becomes its starting value
	assert.ok(Math.abs(n.start - 0.5) < 1e-9);
	assert.ok(Math.abs(n.len - 0.35) < 1e-9);
	assert.deepEqual(plain(n.pre), [[0xe1, 0, 70]]);
	assert.equal(n.ev.length, 1);
	assert.ok(Math.abs(n.ev[0][0] - 0.15) < 1e-9);
	x.cmd("trim", n.id, "end", 0.6);
	assert.ok(Math.abs(n.len - 0.1) < 1e-9);
	assert.equal(n.ev.length, 0, "events after the new end are cut");
	x.cmd("loop", 0.4, 0.8);
	assert.equal(seqOf(x).loopStart, 0.4);
	assert.equal(seqOf(x).loopEnd, 0.8);
	x.take();
	x.cmd("play");
	x.run(0.1);
	assert.deepEqual(x.msgs(), [[0xe1, 0, 70], [0x91, 60, 100]]);
	x.run(0.1);
	assert.deepEqual(x.msgs(), [[0x81, 60, 10]]);
	x.cmd("stop");
	// copy: a new note with its own id, its data, dt later; the roll is told to select it
	x.cmd("copy", 1, n.id);
	const c = seqOf(x).notes[1];
	assert.notEqual(c.id, n.id);
	assert.ok(Math.abs(c.start - (n.start + 1)) < 1e-9);
	assert.deepEqual(plain(c.pre), plain(n.pre));
	assert.deepEqual(plain(x.dicts.get("gl_dict").select), [c.id]);
	c.pre.push([0xd1, 1]);
	assert.equal(n.pre.length, 1, "a real copy, not shared");
	x.cmd("delete", c.id);
	x.cmd("delete", n.id);
	assert.equal(seqOf(x).notes.length, 0);
}

// --- note states for the roll, clearseq ---
{
	const x = recordHeld();
	const id = seqOf(x).notes[0].id;
	x.cmd("play");
	assert.ok(x.info.some((m) => m[0] === "note" && m[1] === id && m[2] === 1), "sounding");
	x.take();
	x.cmd("clearseq");
	assert.ok(x.info.some((m) => m[0] === "note" && m[1] === id && m[2] === 0), "ended");
	assert.deepEqual(x.msgs(), [[0x82, 62, 64]], "the sounding note ends");
	assert.equal(seqOf(x).notes.length, 0);
	assert.equal(x.ctx.state, "stop");
	assert.equal(JSON.parse(x.files.get("/Users/ars/Dropbox/_maxPresets/gestureLooper_t1.json")).seqs[0].notes.length, 0, "saved empty");
}

// --- no length limit: a long recording through step resets keeps its time ---
{
	const x = load();
	x.cmd("rec");
	x.bytes([0x91, 60, 100]);
	x.run(3);
	x.cmd("reset");
	x.run(500); // 500 steps
	x.cmd("reset");
	x.bytes([0x81, 60, 10], [0x92, 61, 90]);
	x.run(1.5);
	x.bytes([0x82, 61, 10]);
	x.run(0.5);
	x.cmd("stop");
	const s = seqOf(x);
	assert.ok(Math.abs(s.length - 505) < 1e-6, "length " + s.length);
	assert.ok(Math.abs(s.notes[0].len - 503) < 1e-6);
	assert.ok(Math.abs(s.notes[1].start - 503) < 1e-6);
}

// --- file: all sequences come back ---
{
	const x = recordHeld();
	const y = load(x.files);
	y.ctx.startTask.fn(); // read shortly after the script starts (no loadbang after an autowatch reload)
	assert.equal(y.ctx.seqs[0].notes.length, 1);
	assert.equal(y.ctx.seqs[0].notes[0].note, 62);
	assert.ok(y.ctx.nextId > y.ctx.seqs[0].notes[0].id);
}

// --- playback probability: rolled on every pass; a losing note is silent with all its data ---
{
	const x = load();
	x.cmd("rec");
	x.bytes([0x91, 60, 100]);
	x.run(0.25);
	x.bytes([0xe1, 0, 70]);
	x.run(0.25);
	x.bytes([0x81, 60, 0]);
	x.run(0.5);
	x.cmd("stop");
	const n = seqOf(x).notes[0];
	x.cmd("prob", 0.5, n.id);
	assert.equal(n.prob, 0.5);
	assert.equal(x.dicts.get("gl_dict").seq.notes[0].prob, 0.5, "published for the roll");
	x.cmd("prob", 7, n.id);
	assert.equal(n.prob, 1, "clamped");
	x.cmd("prob", 0.5, n.id);
	const rolls = [0.9, 0.1]; // first pass loses (0.9 >= 0.5), second plays
	x.ctx.rand = () => rolls.shift();
	x.take();
	x.cmd("play");
	x.run(0.9);
	assert.deepEqual(x.msgs(), [], "silent pass: no note-on, no bend, no note-off");
	x.run(0.2); // into the second pass
	assert.deepEqual(x.msgs(), [[0x91, 60, 100]]);
}

// --- velocities: strike 1..127 (never 0), lift 0..127; playback uses them ---
{
	const x = recordHeld(); // note 62 on channel 3, vel 90, lift 64
	const n = seqOf(x).notes[0];
	x.cmd("vel", "strike", 0, n.id);
	assert.equal(n.vel, 1, "a strike of 0 would be a note-off");
	x.cmd("vel", "strike", 110, n.id);
	x.cmd("vel", "lift", 0, n.id);
	assert.equal(n.off, 0);
	x.take();
	x.cmd("play");
	assert.deepEqual(x.msgs(), [[0x92, 62, 110]]);
	x.run(1);
	assert.deepEqual(x.msgs().slice(0, 1), [[0x82, 62, 0]]);
}

// --- overdub: notes played over the loop are added at the loop position; a note joins when it ends
// and plays from the next pass; a held note across the loop end keeps its real length ---
{
	const x = recordHeld(); // sequence: note 62 on channel 3, 0..1 (length 1)
	x.cmd("play");
	x.run(0.25);
	x.cmd("overdub");
	assert.equal(x.ctx.dubbing, true);
	assert.deepEqual(x.info.at(-1), ["state", "dub"]);
	x.bytes([0x95, 70, 80]); // live note on channel 6 at loop position 0.25
	x.run(0.25);
	x.bytes([0xe5, 0, 70]);
	x.run(0.25);
	x.bytes([0x85, 70, 30]);
	assert.equal(seqOf(x).notes.length, 2, "joined at its note-off");
	const d = seqOf(x).notes[1];
	assert.ok(Math.abs(d.start - 0.25) < 0.02, "start " + d.start);
	assert.ok(Math.abs(d.len - 0.5) < 0.02);
	assert.equal(d.off, 30);
	assert.ok(Math.abs(d.ev[0][0] - 0.25) < 0.02);
	assert.equal(d.startP, undefined, "no working fields saved");
	// a note held across the loop end: start near the end, real length
	x.run(0.15); // loop position 0.9
	x.bytes([0x96, 72, 90]);
	x.run(0.3); // wraps
	x.bytes([0x86, 72, 10]);
	const w = seqOf(x).notes[2];
	assert.ok(Math.abs(w.start - 0.9) < 0.02 && Math.abs(w.len - 0.3) < 0.02, w.start + " " + w.len);
	// the added note plays on the next pass (on a free channel)
	x.take();
	x.run(1);
	const ons = x.msgs().filter((m) => (m[0] & 0xf0) === 0x90).map((m) => m[1]);
	assert.ok(ons.includes(70), "overdubbed note plays: " + JSON.stringify(ons));
	// overdub again = end it, playback goes on
	x.cmd("overdub");
	assert.equal(x.ctx.dubbing, false);
	assert.equal(x.ctx.state, "play");
	// undo removes the whole overdub pass
	x.cmd("undo");
	assert.equal(seqOf(x).notes.length, 1);
	x.cmd("stop");
}
// held notes join when the overdub ends; stop ends both
{
	const x = recordHeld();
	x.cmd("play");
	x.cmd("overdub");
	x.bytes([0x95, 70, 80]);
	x.run(0.4);
	x.cmd("stop");
	assert.equal(x.ctx.dubbing, false);
	assert.equal(x.ctx.state, "stop");
	assert.equal(seqOf(x).notes.length, 2);
	assert.ok(Math.abs(seqOf(x).notes[1].len - 0.4) < 0.02);
}
// overdub when stopped: plays and overdubs; on an empty sequence it is a plain rec
{
	const x = recordHeld();
	x.cmd("overdub");
	assert.equal(x.ctx.state, "play");
	assert.equal(x.ctx.dubbing, true);
	x.cmd("stop");
	const y = load();
	y.cmd("overdub");
	assert.equal(y.ctx.state, "rec");
}

// dub 1|0 (toggle inlet): on / off, repeated values change nothing
{
	const x = recordHeld();
	x.cmd("play");
	x.cmd("dub", 1);
	x.cmd("dub", 1);
	assert.equal(x.ctx.dubbing, true);
	x.cmd("dub", 0);
	assert.equal(x.ctx.dubbing, false);
	assert.equal(x.ctx.state, "play");
	x.cmd("stop");
}

// --- copy a sequence and paste it into another, then overdub it; 32 slots ---
{
	const x = recordHeld(); // sequence 1 (index 0)
	x.cmd("copyseq");
	x.cmd("seq", 31);
	assert.equal(x.ctx.cur, 31, "32 slots");
	x.cmd("pasteseq");
	const a = x.ctx.seqs[0],
		b = x.ctx.seqs[31];
	assert.equal(b.notes.length, 1);
	assert.notEqual(b.notes[0].id, a.notes[0].id, "new ids");
	assert.equal(b.length, a.length);
	b.notes[0].vel = 5;
	assert.equal(a.notes[0].vel, 90, "a real copy");
	x.cmd("overdub");
	x.bytes([0x95, 70, 80]);
	x.run(0.3);
	x.bytes([0x85, 70, 0]);
	x.cmd("stop");
	assert.equal(x.ctx.seqs[31].notes.length, 2);
	assert.equal(x.ctx.seqs[0].notes.length, 1, "the original is untouched");
	x.cmd("undo"); // the overdub
	x.cmd("undo"); // the paste
	assert.equal(x.ctx.seqs[31].length, 0);
	const y = load();
	y.cmd("pasteseq");
	assert.ok(y.info.some((m) => m[0] === "error" && String(m[1]).includes("nothing copied")));
}

// seqstep: + / - through the sequences, clamped; while playing it counts from the pending one
{
	const x = load();
	x.cmd("seqstep", -1);
	assert.equal(x.ctx.cur, 0);
	x.cmd("seqstep", 1);
	x.cmd("seqstep", 1);
	assert.equal(x.ctx.cur, 2);
	x.ctx.cur = 31;
	x.cmd("seqstep", 1);
	assert.equal(x.ctx.cur, 31);
	const y = recordHeld();
	y.cmd("play");
	y.cmd("seqstep", 1);
	y.cmd("seqstep", 1);
	assert.equal(y.ctx.pending, 2);
	assert.equal(y.ctx.cur, 0);
}

// --- undo: each change of the current sequence, newest first ---
{
	const x = recordHeld(); // note at 0, length 1
	const n0 = seqOf(x).notes[0];
	x.cmd("move", 0.5, n0.id);
	x.cmd("prob", 0.3, n0.id);
	x.cmd("vel", "strike", 10, n0.id);
	x.cmd("undo");
	assert.equal(seqOf(x).notes[0].vel, 90);
	assert.equal(seqOf(x).notes[0].prob, 0.3);
	x.cmd("undo");
	assert.equal(seqOf(x).notes[0].prob, undefined);
	assert.ok(Math.abs(seqOf(x).notes[0].start - 0.5) < 1e-9);
	x.cmd("undo");
	assert.ok(Math.abs(seqOf(x).notes[0].start) < 1e-9);
	// clear and a new recording are undoable too
	x.cmd("clearseq");
	assert.equal(seqOf(x).notes.length, 0);
	x.cmd("undo");
	assert.equal(seqOf(x).notes.length, 1);
	assert.equal(JSON.parse(x.files.get("/Users/ars/Dropbox/_maxPresets/gestureLooper_t1.json")).seqs[0].notes.length, 1, "saved");
	// nothing left: an error, nothing changes
	x.cmd("undo");
	x.cmd("undo");
	assert.ok(x.info.some((m) => m[0] === "error" && String(m[1]).includes("nothing to undo")));
	assert.equal(seqOf(x).notes.length, 1);
	// undo belongs to its sequence
	x.cmd("seq", 1);
	x.cmd("undo");
	assert.equal(x.ctx.seqs[0].notes.length, 1);
}

// --- rec while recording = stop ---
{
	const x = load();
	x.cmd("rec");
	x.bytes([0x91, 60, 100]);
	x.run(1);
	x.bytes([0x81, 60, 0]);
	x.run(1);
	x.cmd("rec");
	assert.equal(x.ctx.state, "stop");
	assert.ok(Math.abs(seqOf(x).length - 2) < 1e-6);
	assert.equal(seqOf(x).notes.length, 1);
}

// --- rec with a stopped clock records nothing ---
{
	const x = load();
	x.cmd("rec");
	x.bytes([0x91, 60, 100]);
	x.cmd("stop");
	assert.equal(seqOf(x).length, 0);
	assert.ok(x.info.some((m) => m[0] === "error"));
}

// --- the roll reads what the looper publishes (Dict form: no arrays inside arrays) ---
{
	const x = load();
	x.cmd("rec");
	x.bytes([0xe1, 0, 70], [0x91, 60, 100]);
	x.run(0.25);
	x.bytes([0xe1, 0, 72], [0xd1, 50]);
	x.run(0.25);
	x.bytes([0x81, 60, 33]);
	x.run(0.5);
	x.cmd("stop");
	const pub = x.dicts.get("gl_dict");
	const nested = (v) => Array.isArray(v) ? v.some((e) => Array.isArray(e) || nested(e)) : v && typeof v === "object" ? Object.values(v).some(nested) : false;
	assert.ok(!nested(pub), "no array directly inside an array");
	// the roll script, fed from that Dict
	const rsrc = readFileSync(fileURLToPath(new URL("../javascript/dingus.gestureRoll.js", import.meta.url)), "utf8");
	const mg = new Proxy({ size: [600, 400], init() {}, redraw() {} }, { get: (o, k) => (k in o ? o[k] : () => {}), set: (o, k, v) => ((o[k] = v), true) });
	class RDict {
		stringify() {
			return JSON.stringify(pub);
		}
	}
	const rc = { jsarguments: ["dingus.gestureRoll.js"], mgraphics: mg, Dict: RDict, Task: class { schedule() {} }, outlet: () => {} };
	vm.createContext(rc);
	vm.runInContext(rsrc, rc);
	rc.loadseq("gl_dict");
	const n = rc.seq.notes[0];
	assert.deepEqual(plain(n.pre), [[0xe1, 0, 70]]);
	assert.deepEqual(plain(n.ev.map((e) => e.slice(1))), [[0xe1, 0, 72], [0xd1, 50]]);
	const smp = plain(rc.samples(n));
	assert.equal(smp.length, 2);
	assert.equal(smp[1].press, 50);
	rc.paint();
}

console.log("gesture-looper: all tests passed");
