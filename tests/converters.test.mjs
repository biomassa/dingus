// Tests for the vst~ converters outside Max: dingus.toMidi.js, dingus.toDrums.js, dingus.toParam.js.
// Run: node tests/converters.test.mjs
import { readFileSync } from "node:fs";
import { fileURLToPath } from "node:url";
import vm from "node:vm";
import assert from "node:assert/strict";

const src = (n) => readFileSync(fileURLToPath(new URL("../javascript/" + n, import.meta.url)), "utf8");
const plain = (x) => JSON.parse(JSON.stringify(x));

// a script with a fake clock: Tasks run when 'advance' passes their time
function load(name, files = new Map()) {
	const out = [], tasks = [];
	let now = 0;
	class Task {
		constructor(fn, obj, ...args) { this.fn = fn; this.args = args; this.due = null; tasks.push(this); }
		schedule(ms) { this.due = now + ms; }
		cancel() { this.due = null; }
	}
	class Dict {
		constructor(n) { this.d = files.get("dict:" + n) || {}; }
		get(k) { return this.d[k] ?? null; }
	}
	class File {
		constructor(p, mode) { this.p = p; this.mode = mode; this.isopen = mode === "read" ? files.has(p) : true; this.b = mode === "read" ? [...(files.get(p) || [])] : []; this.position = 0; }
		get eof() { return this.b.length; }
		set eof(v) { this.b.length = v; }
		readbytes(n) { const c = this.b.slice(this.position, this.position + n); this.position += c.length; return c; }
		writebytes(a) { this.b.push(...a); this.position = this.b.length; }
		close() { if (this.mode !== "read") files.set(this.p, this.b); }
	}
	const ctx = {
		Task, Dict, File, outlet: (i, ...a) => out.push([i, ...a.flat()]), post() {}, setinletassist() {}, setoutletassist() {},
		arrayfromargs: (a) => Array.from(a), messagename: "", inlet: 0, patcher: { filepath: "/Users/me/x.maxpat" },
	};
	vm.createContext(ctx);
	vm.runInContext(src(name), ctx);
	const advance = (ms) => {
		const end = now + ms;
		for (;;) {
			const due = tasks.filter((t) => t.due !== null && t.due <= end).sort((a, b) => a.due - b.due)[0];
			if (!due) break;
			now = due.due;
			due.due = null;
			due.fn(...due.args);
		}
		now = end;
	};
	const msg = (m, ...a) => { ctx.messagename = m; return ctx[m] ? ctx[m](...a) : ctx.anything(...a); };
	const ev = () => out.filter((o) => o[0] === 0 && o[1] === "midievent").map((o) => o.slice(2));
	return { ctx, out, advance, msg, ev, clear: () => (out.length = 0), files };
}
const CV = (midi) => midi / 127 * 1.0494;

// ---------- toMidi ----------
{
	const t = load("dingus.toMidi.js");
	// retune, MPE: 60.3 = note 60 + 0.3 semitone; bend range 48: 8192 + 0.3/48*8192 = 8243
	t.msg("on", 0.5, CV(60.3));
	assert.deepEqual(t.ev(), [[0xe1, 8243 & 127, 8243 >> 7], [0x91, 60, 64]], "bend, then the note on channel 2");
	t.clear();
	t.msg("off");
	assert.deepEqual(t.ev(), [[0x81, 60, 0]]);
	t.clear();
	// the next note on the next channel (its release tail keeps its pitch); raw bytes too
	t.msg("on", 1, CV(62));
	assert.deepEqual(t.ev(), [[0x92, 62, 127]], "channel 3; no bend sent (it is centred)");
	assert.deepEqual(t.out.filter((o) => o[0] === 1).map((o) => o.slice(1)), [[0x92, 62, 127]], "raw bytes for midiout");
	t.clear();
	// glide: the pitch moves while the gate is up -> the bend follows
	t.msg("pitch", CV(63));
	const b = Math.round(8192 + 1 / 48 * 8192);
	assert.deepEqual(t.ev(), [[0xe2, b & 127, b >> 7]], "the bend follows the pitch");
	t.clear();
	t.msg("pitch", CV(63));
	assert.deepEqual(t.ev(), [], "no change, nothing sent");
	t.msg("off");
	t.clear();
	// glide 0: a pitch change is a new note
	t.msg("glide", 0);
	t.msg("on", 1, CV(50));
	t.clear();
	t.msg("pitch", CV(52));
	assert.deepEqual(t.ev().map((e) => e[0] & 0xf0), [0x80, 0x90], "off, then on (no bend: exactly 52)");
	t.msg("off");
	t.clear();
	// non-MPE: everything on 'channel'
	t.msg("mpe", 0);
	t.msg("channel", 5);
	t.msg("synthbend", 2);
	t.msg("on", 1, CV(64.4));
	const b2 = Math.round(8192 + 0.4 / 2 * 8192);
	assert.deepEqual(t.ev(), [[0xe4, b2 & 127, b2 >> 7], [0x94, 64, 127]], "channel 5, bend range 2");
	t.clear();
	t.msg("on", 1, CV(70));
	assert.deepEqual(t.ev().map((e) => e[0]), [0x84, 0xe4, 0x94], "a new rise ends the old note first");
	t.msg("off");
	t.clear();
	t.msg("panic");
	assert.ok(t.ev().some((x) => x[1] === 123), "all notes off");
}
// toMidi, the reader ('poll <rises> <falls> <vel> <pitch> <pitch now>' every 2 ms from gen~ dingus.toMidiIn)
{
	const t = load("dingus.toMidi.js");
	t.msg("mode", "detune");
	const notes = () => t.ev().map((e) => [e[0] & 0xf0, e[1]]);
	t.msg("poll", 0, 0, 0, 0, 0);
	assert.deepEqual(notes(), [], "nothing yet");
	// a trigger shorter than a vector: rise and fall between two reads -> the note, its off 5 ms later
	t.msg("poll", 1, 1, 0.8, CV(60), CV(60));
	assert.deepEqual(notes(), [[0x90, 60]], "the short trigger plays");
	t.clear();
	t.advance(5);
	assert.deepEqual(notes(), [[0x80, 60]], "and ends after the minimum length");
	t.clear();
	// a held note, then the next one after a 3 ms gap inside one read: one off, one on
	t.msg("poll", 2, 1, 1, CV(62), CV(62));
	t.msg("poll", 2, 1, 1, CV(62), CV(62));
	assert.deepEqual(notes(), [[0x90, 62]]);
	t.clear();
	t.msg("poll", 3, 2, 0.5, CV(64), CV(64));
	assert.deepEqual(notes(), [[0x80, 62], [0x90, 64]], "the gap: 62 ends, 64 starts");
	assert.equal(t.ev()[1][2], 64, "velocity 0.5");
	t.clear();
	t.msg("poll", 3, 3, 0.5, CV(64), CV(64));
	assert.deepEqual(notes(), [[0x80, 64]], "the fall");
	t.clear();
	t.advance(10);
	assert.deepEqual(notes(), [], "no second off");
}
// toMidi, detune mode: the nearest note with vst~'s 4th midievent number (cents); no bend; raw bytes without it
{
	const t = load("dingus.toMidi.js");
	t.msg("mode", "detune");
	t.msg("on", 1, CV(60.31));
	assert.deepEqual(t.ev(), [[0x91, 60, 127, 31]], "+31 cents");
	assert.deepEqual(t.out.filter((o) => o[0] === 1).map((o) => o.slice(1)), [[0x91, 60, 127]], "the bytes have no detune");
	t.clear();
	t.msg("on", 1, CV(61.6));
	assert.deepEqual(t.ev().pop(), [0x92, 62, 127, -40], "-40 cents on the next channel");
}
// toMidi, scale mode: a 7-note JI scale; the note number = the nearest degree index
{
	const files = new Map();
	const cents = [0, 203.9, 386.3, 498, 702, 884.4, 1088.3];
	files.set("dict:sc", { size: 7, cents, range: 1200, tune: 440, center: 69 });
	files.set("/scl/ji_7.scl", [...Buffer.from("! ji\nji 7\n7\n9/8\n5/4\n4/3\n3/2\n5/3\n15/8\n2/1\n")]);
	const t = load("dingus.toMidi.js", files);
	t.msg("dictionary", "sc");
	t.msg("mode", "scale");
	// degree index 71 = 69 + 2 = 440 Hz + 386.3 cents = MIDI 72.863
	t.msg("on", 1, CV(72.86));
	assert.deepEqual(t.ev().pop(), [0x91, 71, 127], "degree index 71");
	t.msg("off");
	t.clear();
	t.msg("on", 1, CV(68.9));
	assert.deepEqual(t.ev().pop(), [0x92, 69, 127], "degree index 69 (A)");
	// glide in scale mode: within the same degree nothing happens; a new degree = legato (on, then off)
	t.clear();
	t.msg("pitch", CV(69.05));
	assert.deepEqual(t.ev(), []);
	t.msg("pitch", CV(71.04));       // degree index 70 = 69 + 203.9 cents
	assert.deepEqual(t.ev().map((x) => [x[0] & 0xf0, x[1]]), [[0x90, 70], [0x80, 69]], "legato");
}

// ---------- toDrums ----------
{
	const t = load("dingus.toDrums.js");
	t.msg("hit", 1, 0.5);
	assert.deepEqual(t.ev(), [[0x99, 36, 64]], "kick on channel 10");
	t.clear();
	t.advance(49);
	assert.deepEqual(t.ev(), []);
	t.advance(1);
	assert.deepEqual(t.ev(), [[0x89, 36, 0]], "off after 50 ms");
	t.clear();
	t.msg("hit", 2, 1);
	t.advance(20);
	t.msg("hit", 2, 0.8);
	assert.deepEqual(t.ev(), [[0x99, 38, 127], [0x89, 38, 0], [0x99, 38, 102]], "a new hit ends the old note first");
	t.advance(100);
	t.clear();
	// offms 0: the note lasts until the fall
	t.msg("offms", 0);
	t.msg("hit", 3, 1);
	t.advance(500);
	assert.deepEqual(t.ev(), [[0x99, 42, 127]]);
	t.msg("release", 3);
	assert.deepEqual(t.ev().pop(), [0x89, 42, 0]);
	t.clear();
	// note map and channel
	t.msg("notes", 60, 61, 62, 63, 64, 65, 66, 67);
	t.msg("channel", 1);
	t.clear();
	t.msg("hit", 8, 1);
	assert.deepEqual(t.ev(), [[0x90, 67, 127]]);
	t.msg("hit", 9, 1);
	t.msg("hit", 1, 0);
	assert.equal(t.ev().length, 1, "row 9 and a zero level: nothing");
}

// toDrums, the reader: 'poll <c1> .. <c8>', c = (rises mod 1024) * 256 + vel (0..127) * 2 + up
{
	const t = load("dingus.toDrums.js");
	const C = (n, v, up) => n * 256 + v * 2 + up;
	const z = [0, 0, 0, 0, 0, 0, 0, 0];
	t.msg("poll", ...z);
	assert.deepEqual(t.ev(), [], "the first read only learns the counts");
	// a 5 ms trigger on row 2, already down when read: the hit with its held velocity
	t.msg("poll", 0, C(1, 100, 0), 0, 0, 0, 0, 0, 0);
	assert.deepEqual(t.ev(), [[0x99, 38, 100]]);
	t.clear();
	t.msg("poll", 0, C(1, 100, 0), 0, 0, 0, 0, 0, 0);
	assert.deepEqual(t.ev(), [], "no new rise, nothing");
	t.advance(50);
	assert.deepEqual(t.ev(), [[0x89, 38, 0]], "off after offms");
	t.clear();
	// offms 0: a held gate ends at its fall; a short one after the minimum length
	t.msg("offms", 0);
	t.msg("poll", C(1, 127, 1), C(1, 100, 0), 0, 0, 0, 0, 0, 0);
	assert.deepEqual(t.ev(), [[0x99, 36, 127]]);
	t.clear();
	t.msg("poll", C(1, 127, 0), C(1, 100, 0), 0, 0, 0, 0, 0, 0);
	assert.deepEqual(t.ev(), [[0x89, 36, 0]], "the fall");
	t.clear();
	t.msg("poll", C(1, 127, 0), C(2, 64, 0), 0, 0, 0, 0, 0, 0);
	assert.deepEqual(t.ev(), [[0x99, 38, 64]]);
	t.clear();
	t.advance(5);
	assert.deepEqual(t.ev(), [[0x89, 38, 0]], "5 ms later");
	// the count wraps at 1024
	t.clear();
	t.msg("poll", C(1, 127, 0), C(0, 64, 0), 0, 0, 0, 0, 0, 0);
	assert.equal(t.ev().length, 0 + 1, "1023 -> 0 is a new hit too (here 2 -> 0)");
}

// ---------- toParam: signals -> 0..1 floats for the hosts' PARAM inlets, sent on change ----------
{
	const t = load("dingus.toParam.js");
	const out = (k) => t.out.filter((o) => o[0] === k).map((o) => +o[1].toFixed(3));
	t.msg("val", 1, 0.5);
	assert.deepEqual(out(0), [0.5], "the first value goes out of slot 1's outlet");
	t.clear();
	t.msg("val", 1, 0.5);
	t.msg("val", 1, 0.502);          // below delta: held back
	assert.deepEqual(out(0), []);
	t.advance(79);
	assert.deepEqual(out(0), []);
	t.advance(1);
	assert.deepEqual(out(0), [0.502], "the last small move after 80 ms of stillness");
	t.clear();
	t.msg("val", 1, 0.6);
	assert.deepEqual(out(0), [0.6], "a big move at once");
	t.advance(200);
	assert.deepEqual(out(0), [0.6], "nothing more: it was sent");
	t.clear();
	// a moving input: out while it moves by >= delta, the final value after it stops
	for (let i = 1; i <= 10; i++) { t.msg("val", 1, 0.6 + i * 0.001); t.advance(10); }
	assert.deepEqual(out(0), [0.604, 0.608], "every 4th step");
	t.advance(100);
	assert.deepEqual(out(0), [0.604, 0.608, 0.61], "then the final value");
	t.clear();
	// range -1..1 -> 0..1, on slot 3's outlet
	t.msg("range", 3, -1, 1);
	t.msg("val", 3, 0);
	t.msg("val", 3, 1);
	assert.deepEqual(out(2), [0.5, 1]);
	t.msg("val", 3, 5);
	assert.deepEqual(out(2), [0.5, 1], "clamped at 1: nothing new");
	t.clear();
	t.msg("resend");
	assert.deepEqual([out(0), out(1), out(2)], [[0.61], [], [1]], "resend: the slots that have a value");
	// CC for hardware: slot 2 as CC 74 on channel 3, out of outlet 4 as raw bytes, when the 7-bit value changes
	t.clear();
	const ccs = () => t.out.filter((o) => o[0] === 4).map((o) => o.slice(1));
	t.msg("cc", 2, 74);
	t.msg("channel", 3);
	t.msg("val", 2, 0.5);
	assert.deepEqual(ccs(), [[0xb2, 74, 64]]);
	assert.deepEqual(out(1), [0.5], "the float goes out too");
	t.msg("val", 2, 0.503);
	t.advance(200);
	assert.deepEqual(ccs(), [[0xb2, 74, 64]], "the same 7-bit value: no CC (the float is sent at settle)");
	t.msg("val", 2, 1);
	assert.deepEqual(ccs().pop(), [0xb2, 74, 127]);
	t.msg("cc", 2, -1);
	t.msg("val", 2, 0);
	assert.equal(ccs().length, 2, "off: no CC");
	assert.equal(t.out.filter((o) => o[0] === 4 && o.length !== 4).length, 0);
}
console.log("converters: all tests passed");
