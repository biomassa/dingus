// ===========================================================
// dingus.gestureLoop.js  (v8)
//
// Gesture looper / sequencer for the LinnStrument (spec: linnstrument repo, docs/gesture-looper.md).
// Sits between [midiin "LinnStrument MIDI"] and a note bpatcher (linnSplit-b): every byte passes through
// at all times; rec records the per-note channels' MPE data into the current sequence; play loops it on
// the clock and merges it into the same stream on free channels.
//
// [v8 dingus.gestureLoop.js <name> <dict>]
//   <name>  file: <presets folder>/gestureLooper_<name>.json (all sequences)
//   <dict>  Dict the roll reads (key "seq": the current sequence as JSON)
//
// inlet 0:
//   int                 MIDI byte from midiin
//   rec / play / stop   transport (see docs/gesture-looper.md); rec while recording = stop
//   seq n               current sequence 0..31 (the bpatcher shows 1..32; while playing: at the next loop start)
//   seqstep d           the sequence d slots up / down (+ and - buttons)
//   copyseq / pasteseq  copy the current sequence / replace the current sequence with the copy (undoable)
//   clearseq            empty the current sequence (and its file entry)
//   overdub             while playing: add what is played (again = end it; stopped: play and overdub)
//   dub 1|0             overdub on / off
//   undo                the current sequence's last change (up to 30 steps in all)
//   zones lo hi lo hi   per-note channels of the two sides (default 2 8 9 15)
//   reset               clock step reset: playback restarts at the loop start (recording unaffected)
//   clock 0|1           clock running; 0 = sounding looped notes get their note-off
//   move dt id...       shift notes in time (steps)
//   copy dt id...       copies of the notes, dt steps later (the roll then selects the copies)
//   vel strike|lift v id...  strike (1..127) or lift (0..127) velocity
//   prob v id...        playback probability 0..1 (default 1), rolled on every pass of the loop
//   trim id start|end t set a note's start or end (steps, loop time)
//   loop a b            loop range (steps)
//   delete id...        remove notes
//   load / save         read / write the file (save also happens after each recording and edit)
//   dump                send the current sequence again
// inlet 1:
//   float               clock phase 0..1 (snapshot~ 4 of the rate~ output; one cycle = one step)
// outlet 0: MIDI bytes (live + playback), every message with its status byte
// outlet 1: state rec|play|stop, seq n pending, pos <loop position> <loop start> <loop end>, refresh <dict>,
//           error <text>, note <id> 1|0|-1 (a looped note starts sounding / ends / was cut: no free channel)
// ===========================================================

autowatch = 1;
inlets = 2;
outlets = 2;

var NSEQ = 32;
var EPS = 1e-6; // steps: float noise in the clock sums
const paths = require("dingus.paths.js");   // the presets folder (~/Dropbox/_maxPresets/ here)
var NORECORD_CC = { 6: 1, 38: 1, 96: 1, 97: 1, 98: 1, 99: 1, 100: 1, 101: 1 }; // NRPN/RPN, lights polling

var args = typeof jsarguments !== "undefined" ? jsarguments : [];
var name = args.length > 1 ? String(args[1]) : "default";
var dictName = args.length > 2 ? String(args[2]) : "";

var zone = [[2, 8], [9, 15]]; // 1-based channels
var seqs = [];
for (var i = 0; i < NSEQ; i++) seqs.push(emptySeq());
var cur = 0;
var pending = -1;
var state = "stop";
var clockOn = 1;

// clock
var phase = -1; // last phase; -1 = none yet
var cycles = 0;
var P = 0; // position in steps
var lastP = 0;

// --- MIDI parsing (running status, realtime inside messages) ---
var rs = 0;
var data = [];
function dataLen(st) {
	var h = st & 0xf0;
	return h === 0xc0 || h === 0xd0 ? 1 : 2;
}

function msg_int(b) {
	if (inlet === 1) return msg_float(b);
	b = b & 0xff;
	if (b >= 0xf8) return out([b]); // realtime: through, never recorded
	if (b >= 0xf0) {
		rs = 0;
		data = [];
		return out([b]); // system common / sysex bytes: through
	}
	if (b & 0x80) {
		rs = b;
		data = [];
		return;
	}
	if (!rs) return out([b]); // data of a sysex or without status: through
	data.push(b);
	if (data.length < dataLen(rs)) return;
	var m = [rs].concat(data);
	data = [];
	live(m);
}

function msg_float(f) {
	if (inlet !== 1) return;
	clockPhase(f);
}

// --- channels ---
function sideOf(ch) {
	for (var s = 0; s < 2; s++) if (ch >= zone[s][0] && ch <= zone[s][1]) return s;
	return -1;
}
// output channel use: null, "live" or "loop"
var busy = {};
var liveMap = {}; // input channel -> output channel while a live note is held
var liveHeld = {}; // channel state held back (input channel had no live note, output busy with a loop note)
var chState = {}; // last values per input channel: {bend:[l,m], press:v, cc:{n:v}, poly:{n:v}}

function stateOf(ch) {
	if (!chState[ch]) chState[ch] = { bend: null, press: null, cc: {}, poly: {} };
	return chState[ch];
}
function stateMsgs(st, ch) {
	var s = 0x00 | (ch - 1);
	var r = [];
	if (st.bend) r.push([0xe0 | s, st.bend[0], st.bend[1]]);
	for (var n in st.cc) r.push([0xb0 | s, +n, st.cc[n]]);
	if (st.press !== null) r.push([0xd0 | s, st.press]);
	return r;
}
function rememberState(st, m) {
	var h = m[0] & 0xf0;
	if (h === 0xe0) st.bend = [m[1], m[2]];
	else if (h === 0xd0) st.press = m[1];
	else if (h === 0xb0 && !NORECORD_CC[m[1]]) st.cc[m[1]] = m[2];
	else if (h === 0xa0) st.poly[m[1]] = m[2];
}
function onChannel(m, ch) {
	var r = m.slice();
	r[0] = (m[0] & 0xf0) | (ch - 1);
	return r;
}
function freeChannel(side, prefer) {
	if (prefer && !busy[prefer]) return prefer;
	for (var c = zone[side][0]; c <= zone[side][1]; c++) if (!busy[c]) return c;
	return 0;
}

// --- live input ---
var recSeen = {}; // channel -> note-ons during the current recording (for the Console report)
function live(m) {
	var h = m[0] & 0xf0;
	var ch = (m[0] & 0x0f) + 1;
	if (state === "rec" && h === 0x90 && m[2] > 0) recSeen[ch] = (recSeen[ch] || 0) + 1;
	var side = sideOf(ch);
	if (side < 0 || h === 0xf0) return out(m); // main channels etc.: through, not recorded
	var isOn = h === 0x90 && m[2] > 0;
	var isOff = h === 0x80 || (h === 0x90 && m[2] === 0);
	if (state === "rec") record(m, ch, isOn, isOff);
	else if (dubbing) dubRecord(m, ch, isOn, isOff);
	var st = stateOf(ch);
	if (isOn) {
		var o = liveMap[ch];
		if (o) {
			// a second note-on on a held channel: keep its channel
			out(onChannel(m, o));
			return;
		}
		o = freeChannel(side, ch);
		if (!o) {
			// no free channel: cut the looped note on the played channel, the live note takes it
			cutLoopOn(ch);
			o = ch;
		}
		busy[o] = "live";
		liveMap[ch] = o;
		if (o !== ch || liveHeld[ch]) stateMsgs(st, o).forEach(out);
		liveHeld[ch] = false;
		out(onChannel(m, o));
		return;
	}
	if (isOff) {
		var oo = liveMap[ch] || ch;
		out(onChannel(m, oo));
		if (liveMap[ch]) {
			if (busy[oo] === "live") busy[oo] = null;
			delete liveMap[ch];
		}
		return;
	}
	rememberState(st, m);
	if (liveMap[ch]) return out(onChannel(m, liveMap[ch]));
	if (busy[ch]) {
		liveHeld[ch] = true; // a looped note uses this channel: held until the live note-on
		return;
	}
	out(m);
}

// --- recording ---
var recStart = 0;
var recNotes = {}; // channel -> note being recorded
var nextId = 1;

function record(m, ch, isOn, isOff) {
	var t = P - recStart;
	var s = seqs[cur];
	if (isOn) {
		if (recNotes[ch]) endRecNote(ch, t, 64);
		var st = stateOf(ch);
		var n = { id: nextId++, ch: ch, note: m[1], vel: m[2], off: 64, start: t, len: 0, pre: stateMsgs(st, ch), ev: [] };
		recNotes[ch] = n;
		s.notes.push(n);
		return;
	}
	if (isOff) {
		if (recNotes[ch] && recNotes[ch].note === m[1]) endRecNote(ch, t, m[0] >> 4 === 8 ? m[2] : 64);
		return;
	}
	var h = m[0] & 0xf0;
	if (h === 0xb0 && NORECORD_CC[m[1]]) return;
	var rn = recNotes[ch];
	if (rn) rn.ev.push([t - rn.start].concat(m));
}
function endRecNote(ch, t, lift) {
	var n = recNotes[ch];
	n.len = Math.max(0, t - n.start);
	n.off = lift;
	delete recNotes[ch];
}

// --- transport ---
// --- overdub: while playing, what is played is added at the loop position (wrapping); a note joins
// the sequence when it ends (and plays from the next pass); held notes join when the overdub ends ---
var dubbing = false;
var dubNotes = {}; // channel -> note being overdubbed (its startP: absolute position of its start)
function overdub() {
	if (state === "rec") return;
	if (dubbing) return endDub();
	if (!seqs[cur].length) return rec(); // nothing to play over: a plain recording
	if (state !== "play") play();
	if (state !== "play") return;
	pushUndo();
	dubbing = true;
	dubNotes = {};
	outlet(1, "state", "dub");
}
// dub 1|0: overdub on / off (the toggle inlet; the button sends overdub, which switches)
function dub(on) {
	if (on && !dubbing) overdub();
	else if (!on && dubbing) endDub();
}
function endDub() {
	if (!dubbing) return;
	for (var ch in dubNotes) finishDubNote(+ch, 64);
	dubbing = false;
	dubNotes = {};
	if (state === "play") outlet(1, "state", "play");
	publish();
	save();
}
function dubRecord(m, ch, isOn, isOff) {
	if (isOn) {
		if (dubNotes[ch]) finishDubNote(ch, 64);
		var n = { id: nextId++, ch: ch, note: m[1], vel: m[2], off: 64, start: cursor, len: 0, pre: stateMsgs(stateOf(ch), ch), ev: [] };
		n.startP = P;
		dubNotes[ch] = n;
		return;
	}
	var dn = dubNotes[ch];
	if (isOff) {
		if (dn && dn.note === m[1]) finishDubNote(ch, m[0] >> 4 === 8 ? m[2] : 64);
		return;
	}
	if ((m[0] & 0xf0) === 0xb0 && NORECORD_CC[m[1]]) return;
	if (dn) dn.ev.push([P - dn.startP].concat(m));
}
function finishDubNote(ch, lift) {
	var n = dubNotes[ch];
	n.len = Math.max(0, P - n.startP);
	n.off = lift;
	delete n.startP;
	delete dubNotes[ch];
	seqs[cur].notes.push(n); // the timeline is rebuilt at the loop end: it plays from the next pass
}

// --- undo: snapshots of a sequence before each change, newest last (UNDO_MAX in all) ---
var UNDO_MAX = 30;
var undoStack = [];
function pushUndo() {
	undoStack.push({ i: cur, d: JSON.stringify(seqs[cur]) });
	if (undoStack.length > UNDO_MAX) undoStack.shift();
}
// undo: the current sequence's last change (an overdub in progress ends first and is undone)
function undo() {
	if (state === "rec") stop();
	if (dubbing) endDub();
	for (var k = undoStack.length - 1; k >= 0; k--) {
		if (undoStack[k].i !== cur) continue;
		var u = undoStack.splice(k, 1)[0];
		if (state === "play") stopSounding();
		seqs[cur] = JSON.parse(u.d);
		var s = seqs[cur];
		if (state === "play") {
			if (!s.length) {
				state = "stop";
				outlet(1, "state", "stop");
			} else {
				if (cursor < s.loopStart || cursor >= s.loopEnd) cursor = s.loopStart;
				timeline = buildTimeline(s);
				ti = firstIndex(timeline, cursor);
			}
		}
		publish();
		save();
		return;
	}
	outlet(1, "error", "nothing to undo in sequence " + (cur + 1));
}

function rec() {
	if (state === "rec") return stop(); // a second rec ends the recording, like stop
	if (dubbing) endDub();
	if (seqs[cur].length) pushUndo();
	if (state === "play") stopPlayback();
	var s = (seqs[cur] = emptySeq());
	recNotes = {};
	recSeen = {};
	recStart = P;
	state = "rec";
	outlet(1, "state", "rec");
	publish();
	return s;
}
function stop() {
	if (state === "rec") {
		var len = P - recStart;
		for (var ch in recNotes) endRecNote(+ch, len, 64);
		var s = seqs[cur];
		if (len <= 0) {
			seqs[cur] = emptySeq();
			outlet(1, "error", "nothing recorded: is the clock running?");
		} else {
			s.length = len;
			s.loopStart = 0;
			s.loopEnd = len;
		}
		state = "stop";
		outlet(1, "state", "stop");
		var seen = Object.keys(recSeen)
			.map(function (c) {
				return "ch" + c + ":" + recSeen[c];
			})
			.join(" ");
		post("gestureLooper " + name + ": sequence " + cur + ", " + seqs[cur].notes.length + " notes in " + Math.round(len * 100) / 100 + " steps; note-ons by channel: " + (seen || "none") + " (recorded: " + zone[0][0] + "-" + zone[0][1] + ", " + zone[1][0] + "-" + zone[1][1] + ")\n");
		publish();
		save();
		return;
	}
	if (dubbing) endDub();
	if (state === "play") stopPlayback();
	state = "stop";
	outlet(1, "state", "stop");
}
function play() {
	if (state === "rec") stop();
	if (dubbing) endDub();
	if (state === "play") stopPlayback();
	var s = seqs[cur];
	if (!s.length) {
		outlet(1, "error", "sequence " + (cur + 1) + " is empty");
		outlet(1, "state", state); // the play button goes dark again
		return;
	}
	state = "play";
	cursor = s.loopStart;
	timeline = buildTimeline(s);
	ti = firstIndex(timeline, cursor);
	outlet(1, "state", "play");
	advance(0); // events at the loop start sound now
}
// copyseq / pasteseq: a clipboard for whole sequences (in memory); paste replaces the current one
var clip = null;
function copyseq() {
	if (!seqs[cur].length) {
		outlet(1, "error", "sequence " + (cur + 1) + " is empty: nothing copied");
		return;
	}
	clip = JSON.stringify(seqs[cur]);
}
function pasteseq() {
	if (!clip) {
		outlet(1, "error", "nothing copied yet");
		return;
	}
	if (state === "rec") stop();
	if (dubbing) endDub();
	pushUndo();
	if (state === "play") stopSounding();
	var s = (seqs[cur] = JSON.parse(clip));
	s.notes.forEach(function (n) {
		n.id = nextId++; // the copy's notes are new notes
	});
	if (state === "play") {
		if (cursor < s.loopStart || cursor >= s.loopEnd) cursor = s.loopStart;
		timeline = buildTimeline(s);
		ti = firstIndex(timeline, cursor);
	}
	publish();
	save();
}
// clearseq: empties the current sequence (stops it first) and saves
function clearseq() {
	if (state === "rec") recNotes = {};
	if (dubbing) endDub();
	pushUndo();
	if (state !== "stop") {
		stopPlayback();
		state = "stop";
		outlet(1, "state", "stop");
	}
	seqs[cur] = emptySeq();
	publish();
	save();
}
// seqstep d: the sequence d slots up or down (from a pending one while playing), 1..32 without wrapping
function seqstep(d) {
	var from = pending >= 0 ? pending : cur;
	var n = Math.max(0, Math.min(NSEQ - 1, from + (d | 0)));
	if (n !== from) seq(n);
}
function seq(n) {
	n = Math.max(0, Math.min(NSEQ - 1, n | 0));
	if (state === "play" && n !== cur) {
		pending = n;
		outlet(1, "seq", n, 1);
		return;
	}
	if (state === "rec") stop();
	cur = n;
	pending = -1;
	outlet(1, "seq", n, 0);
	publish();
}
function zones(a, b, c, d) {
	zone = [[a, b], [c, d]];
}
// step reset: playback restarts at the loop start. The position counter keeps running (it only
// measures time), so a reset during a recording doesn't cut or shift it: no length limit.
function reset() {
	if (state === "play") {
		stopSounding();
		cursor = seqs[cur].loopStart;
		ti = firstIndex(timeline, cursor);
		advance(0);
	}
}
function clock(on) {
	clockOn = on ? 1 : 0;
	if (!clockOn) stopSounding();
}

// --- clock ---
function clockPhase(f) {
	if (phase >= 0 && f < phase - 0.5) cycles++;
	else if (phase >= 0 && f > phase + 0.5) cycles--; // running backwards
	phase = f;
	lastP = P;
	P = cycles + f;
	if (state === "play" && clockOn) {
		var d = P - lastP;
		if (d > 0) advance(d);
		posOut();
	} else if (state === "rec") posOut();
}
// playhead for the roll: at most every POSMS ms (each one is a redraw there)
var POSMS = 40;
var lastPosOut = 0;
function posOut() {
	var now = Date.now();
	if (now - lastPosOut < POSMS) return;
	lastPosOut = now;
	var s = seqs[cur];
	if (state === "rec") outlet(1, "pos", P - recStart, 0, P - recStart);
	else outlet(1, "pos", cursor, s.loopStart, s.loopEnd);
}

// --- playback ---
var timeline = [];
var ti = 0;
var cursor = 0;
var sounding = {}; // note id -> {n: note, o: output channel}
var dropped = {}; // note id -> true (no channel)

function buildTimeline(s) {
	var ev = [];
	s.notes.forEach(function (n) {
		if (n.start < s.loopStart || n.start >= s.loopEnd) return;
		var end = Math.min(n.start + n.len, s.loopEnd);
		ev.push({ t: n.start, k: 0, n: n });
		n.ev.forEach(function (e) {
			var t = n.start + e[0];
			if (t < end) ev.push({ t: t, k: 1, n: n, m: e.slice(1) });
		});
		ev.push({ t: end, k: 2, n: n });
	});
	// at the same time: note-offs first, then note-ons, then data
	var order = [1, 2, 0];
	ev.sort(function (a, b) {
		return a.t - b.t || order[a.k] - order[b.k];
	});
	return ev;
}
function firstIndex(tl, t) {
	var i = 0;
	while (i < tl.length && tl[i].t < t) i++;
	return i;
}
// play the events in [cursor, cursor + d), wrapping at the loop end
function advance(d) {
	var s = seqs[cur];
	var target = cursor + d;
	for (var guard = 0; guard < 1000; guard++) {
		var end = Math.min(target, s.loopEnd);
		while (ti < timeline.length && (timeline[ti].t < end + EPS || timeline[ti].t <= cursor + EPS)) fire(timeline[ti++]);
		if (target < s.loopEnd - EPS) {
			cursor = target;
			return;
		}
		// loop end: everything sounding ends here, a pending sequence takes over
		stopSounding();
		target -= s.loopEnd - s.loopStart;
		if (pending >= 0) {
			if (dubbing) endDub();
			var over = target - s.loopStart; // how far into the next pass
			cur = pending;
			pending = -1;
			s = seqs[cur];
			outlet(1, "seq", cur, 0);
			publish();
			if (!s.length) {
				state = "stop";
				outlet(1, "state", "stop");
				return;
			}
			target = s.loopStart + over;
		}
		timeline = buildTimeline(s);
		cursor = s.loopStart;
		ti = 0;
		if (dubbing) publish(); // the roll shows each pass's added notes (one repaint per pass)
		if (s.loopEnd - s.loopStart <= 0) return;
		d = target - cursor;
		if (target <= cursor) {
			// exactly on the loop start: its events sound now
			while (ti < timeline.length && timeline[ti].t <= cursor + EPS) fire(timeline[ti++]);
			return;
		}
	}
}
var rand = Math.random; // replaced in tests
function fire(e) {
	var n = e.n;
	if (e.k === 0) {
		// playback probability, rolled on every pass: a note that loses is silent with all its data
		var p = n.prob === undefined ? 1 : n.prob;
		if (p < 1 && rand() >= p) {
			dropped[n.id] = true;
			return;
		}
		var side = sideOf(n.ch);
		var o = side < 0 ? 0 : freeChannel(side, n.ch);
		if (!o) {
			dropped[n.id] = true;
			outlet(1, "note", n.id, -1);
			return;
		}
		busy[o] = "loop";
		sounding[n.id] = { n: n, o: o };
		outlet(1, "note", n.id, 1);
		n.pre.forEach(function (m) {
			out(onChannel(m, o));
		});
		out([0x90 | (o - 1), n.note, n.vel]);
		return;
	}
	var oc = sounding[n.id] ? sounding[n.id].o : 0;
	if (!oc) {
		if (e.k === 2) delete dropped[n.id];
		return;
	}
	if (e.k === 1) {
		out(onChannel(e.m, oc));
		return;
	}
	noteOff(n, oc);
}
function noteOff(n, oc) {
	out([0x80 | (oc - 1), n.note, n.off]);
	if (busy[oc] === "loop") busy[oc] = null;
	delete sounding[n.id];
	if (!dropped[n.id]) outlet(1, "note", n.id, 0);
}
function stopSounding() {
	for (var id in sounding) noteOff(sounding[id].n, sounding[id].o);
	sounding = {};
	dropped = {};
}
function stopPlayback() {
	stopSounding();
	pending = -1;
}
// a live note needs channel ch: the looped note on it ends
function cutLoopOn(ch) {
	for (var id in sounding)
		if (sounding[id].o === ch) {
			dropped[id] = true;
			noteOff(sounding[id].n, ch);
			outlet(1, "note", +id, -1);
		}
}

// --- edits (from the roll) ---
function findNotes(ids) {
	var want = {};
	ids.forEach(function (i) {
		want[i] = 1;
	});
	return seqs[cur].notes.filter(function (n) {
		return want[n.id];
	});
}
function edited(select) {
	if (state === "play") {
		stopSounding();
		timeline = buildTimeline(seqs[cur]);
		ti = firstIndex(timeline, cursor);
	}
	publish(select);
	save();
}
function move(dt, ...ids) {
	pushUndo();
	findNotes(ids).forEach(function (n) {
		n.start += dt;
	});
	edited();
}
// vel strike|lift v id...: strike (note-on, 1..127) or lift (note-off, 0..127) velocity of notes
function vel(which, v, ...ids) {
	pushUndo();
	v = Math.round(v);
	findNotes(ids).forEach(function (n) {
		if (which === "lift") n.off = Math.max(0, Math.min(127, v));
		else n.vel = Math.max(1, Math.min(127, v));
	});
	edited();
}
// prob v id...: playback probability 0..1 of notes (rolled on every pass)
function prob(v, ...ids) {
	pushUndo();
	v = Math.max(0, Math.min(1, v));
	findNotes(ids).forEach(function (n) {
		n.prob = v;
	});
	edited();
}
// copy dt id...: copies of the notes, dt steps later; the roll selects the copies
function copy(dt, ...ids) {
	pushUndo();
	var made = [];
	findNotes(ids).forEach(function (n) {
		var c = JSON.parse(JSON.stringify(n));
		c.id = nextId++;
		c.start += dt;
		seqs[cur].notes.push(c);
		made.push(c.id);
	});
	edited(made);
}
function trim(id, which, t) {
	var n = findNotes([id])[0];
	if (!n) return;
	pushUndo();
	if (which === "end") {
		n.len = Math.max(0, t - n.start);
		n.ev = n.ev.filter(function (e) {
			return e[0] < n.len;
		});
	} else if (which === "start") {
		var cut = Math.max(0, Math.min(n.len, t - n.start));
		// the data before the new start becomes the note's starting values
		var st = { bend: null, press: null, cc: {}, poly: {} };
		n.pre.forEach(function (m) {
			rememberState(st, m);
		});
		var keep = [];
		n.ev.forEach(function (e) {
			if (e[0] < cut) rememberState(st, e.slice(1));
			else keep.push([e[0] - cut].concat(e.slice(1)));
		});
		n.pre = stateMsgs(st, n.ch);
		n.ev = keep;
		n.start += cut;
		n.len -= cut;
	}
	edited();
}
function loop(a, b) {
	var s = seqs[cur];
	if (!(b > a)) return;
	pushUndo();
	s.loopStart = Math.max(0, a);
	s.loopEnd = b;
	if (cursor < s.loopStart || cursor >= s.loopEnd) cursor = s.loopStart;
	edited();
}
function anything(...a) {
	if (messagename === "delete") {
		var ids = {};
		a.forEach(function (i) {
			ids[i] = 1;
		});
		pushUndo();
		if (state === "play") stopSounding();
		seqs[cur].notes = seqs[cur].notes.filter(function (n) {
			return !ids[n.id];
		});
		edited();
	}
}

// --- roll and file ---
function emptySeq() {
	return { length: 0, loopStart: 0, loopEnd: 0, notes: [] };
}
// select: ids the roll should select (after a copy)
function publish(select) {
	if (dictName) {
		try {
			// a Dict can't hold arrays inside arrays: each message becomes {t, m}
			var s = seqs[cur];
			var flat = {
				length: s.length,
				loopStart: s.loopStart,
				loopEnd: s.loopEnd,
				notes: s.notes.map(function (n) {
					return {
						id: n.id, ch: n.ch, note: n.note, vel: n.vel, off: n.off, start: n.start, len: n.len,
						prob: n.prob === undefined ? 1 : n.prob,
						pre: n.pre.map(function (m) { return { t: 0, m: m }; }),
						ev: n.ev.map(function (e) { return { t: e[0], m: e.slice(1) }; }),
					};
				}),
			};
			var d = new Dict(dictName);
			d.parse(JSON.stringify({ index: cur, seq: flat, select: select || [] }));
		} catch (e) {}
	}
	outlet(1, "refresh", dictName);
}
function dump() {
	publish();
	outlet(1, "state", state);
	outlet(1, "seq", cur, pending >= 0 ? 1 : 0);
}
function filePath() {
	return paths.presetFolder(this.patcher) + "gestureLooper_" + name + ".json";
}
function save() {
	try {
		var txt = JSON.stringify({ format: 1, current: cur, seqs: seqs });
		var f = new File(filePath(), "write", "TEXT");
		if (!f.isopen) throw new Error("can't open");
		for (var i = 0; i < txt.length; i += 4096) f.writestring(txt.substring(i, i + 4096));
		f.eof = f.position;
		f.close();
	} catch (e) {
		outlet(1, "error", "can't write " + filePath());
	}
}
// the file into memory; no outlets (also runs while the script starts, before it has any)
function readFile() {
	try {
		var f = new File(filePath(), "read");
		if (!f.isopen) return false;
		var txt = "";
		while (f.position < f.eof) txt += f.readstring(4096);
		f.close();
		var o = JSON.parse(txt);
		if (!o || !o.seqs) return false;
		for (var i = 0; i < NSEQ; i++) seqs[i] = o.seqs[i] || emptySeq();
		cur = Math.max(0, Math.min(NSEQ - 1, o.current | 0));
		var maxId = 0;
		seqs.forEach(function (s) {
			s.notes.forEach(function (n) {
				maxId = Math.max(maxId, n.id);
			});
		});
		nextId = maxId + 1;
		return true;
	} catch (e) {
		readError = true;
		return false;
	}
}
var readError = false;
function load() {
	readError = false;
	readFile();
	if (readError) outlet(1, "error", "can't read " + filePath());
	dump();
}
function loadbang() {
	dump();
	post("gestureLooper " + name + ": ready, file " + filePath() + ", dict " + dictName + "\n");
}
// read the file soon after the script starts: also when it reloads after an edit (autowatch), where
// Max sends no loadbang; otherwise the next save would write only what was recorded since.
// Not in the global code: the presets folder is found from the patcher, which isn't there yet.
var startTask = new Task(function () {
	readFile();
	dump();
}, this);
startTask.schedule(100);

function out(m) {
	for (var i = 0; i < m.length; i++) outlet(0, m[i]);
}
