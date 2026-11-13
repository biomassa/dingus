// ===========================================================
// dingus.toMidi.js  (v8)
//
// Notes for vst~ (and hardware MIDI) from a dingus pitch + gate pair (one voice: the sequencers are
// monophonic). The bpatcher dingus.toMidi.maxpat catches the gate's rises and falls at the sample
//   (gen~ dingus.toMidiIn, which also holds the velocity and pitch from the rise) and reads them every
//   2 ms: 'poll <rises> <falls> <vel> <pitch at the rise> <pitch now>'. A new rise count = a new note,
//   even a trigger shorter than a signal vector; rises > falls = the gate is up. Pitch comes in as the
//   dingus pitch CV (0..1.0494 = MIDI 0..127) or as MIDI ('pitchin').
//
// MODES (how a microtonal pitch reaches the synth)
//   retune  for synths that only know 12-TET: the nearest MIDI note plus a pitch bend for the rest,
//           in the synth's bend range ('synthbend', semitones; MPE synths usually 48, others 2).
//   scale   for synths that load the scale themselves (.scl + .kbm, e.g. Aalto, Kaivo): the note number
//           is the nearest degree index of the loaded scale (degree index 'center' sounds at 'tune' Hz,
//           as in th.scala), no bend. Load the same .scl (and a .kbm with that mapping) in the synth.
//   detune  the nearest MIDI note with vst~'s per-note detune (the 4th number of midievent, -63..64 cents):
//           no bend, so notes don't bend each other (non-MPE plug-ins); whether a plug-in honours it is up
//           to the plug-in. The raw MIDI bytes carry no detune. A pitch change while the gate is up = a new
//           note (legato with glide 1).
// CHANNELS
//   mpe 1 (default): every note gets the next channel of first..last (default 2..16), so a release tail
//           keeps its own bend. Set MPE and the bend range ('synthbend') in the plug-in itself.
//   mpe 0: all notes on 'channel' (hardware, non-MPE plugins); a bend then also bends a release tail.
// LEGATO (the pitch moves while the gate stays up)
//   glide 1 (default): retune mode follows it with the bend (a new note when it leaves the bend range);
//           scale and detune start the new note before ending the old one (legato).
//   glide 0: every pitch change is a new note (off, then on with the same velocity).
//
// inlet 0: poll <rises> <falls> <vel> <pitch> <pitch now> / on <vel 0..1> <pitch> / off / pitch <p> / mode retune|scale|detune / mpe 0|1 /
//          channel n / channels first last / synthbend n / glide 0|1 / pitchin cv|midi /
//          dictionary <th.scala dict> / panic
// outlet 0: midievent <status> <data1> <data2> (to vst~)
// outlet 1: the same as a list of raw MIDI bytes (to [iter] -> [midiout]; never into vst~: a number there
//           changes its preset)
// ===========================================================

inlets = 1;
outlets = 2;
autowatch = 1;

var CVMAX = 1.0494;     // dingus pitch CV: 0..CVMAX = MIDI 0..127
var curMode = 'retune';
var mpeOn = 1;
var chan = 0;           // non-MPE channel (0-based)
var first = 1, last = 15;   // MPE note channels (0-based): 2..16
var synthBend = 48;
var glideOn = 1;
var pitchIn = 'cv';
var scl = { size: 12, center: 69, tune: 440, range: 1200, cents: [0, 100, 200, 300, 400, 500, 600, 700, 800, 900, 1000, 1100] };

// the sounding note
var cur = null;         // { ch, note, vel, base } (base = the MIDI pitch the note number stands for)
var nextCh = 1;
var chBend = [];        // last bend sent per channel
for (var i = 0; i < 16; i++) chBend.push(8192);
var used = [];          // channels that have sounded (for panic)

function send(bytes, detune) {
	outlet(0, ['midievent'].concat(bytes, detune !== undefined ? [detune] : []));
	outlet(1, bytes);
}
send.local = 1;

function toMidiPitch(p) {
	return pitchIn === 'cv' ? p / CVMAX * 127 : p;
}
toMidiPitch.local = 1;

// --- the scale (as th.scala's dictionary) ---
function degreeOf(v) { return ((v - scl.center) % scl.size + scl.size) % scl.size; }
degreeOf.local = 1;
function periodOf(v) { return Math.floor((v - scl.center) / scl.size); }
periodOf.local = 1;
// the MIDI pitch of degree index v
function midiOf(v) {
	var d = degreeOf(v);
	return 69 + 12 * Math.log(scl.tune / 440) / Math.LN2 + (periodOf(v) * scl.range + scl.cents[d] - scl.cents[0]) / 100;
}
midiOf.local = 1;
// the degree index (0..127) whose pitch is nearest p
function nearestDegree(p) {
	var best = 0, bd = 1e9;
	for (var v = 0; v < 128; v++) {
		var dd = Math.abs(midiOf(v) - p);
		if (dd < bd) { bd = dd; best = v; }
	}
	return best;
}
nearestDegree.local = 1;

// --- notes ---
function bendFor(off) {
	return Math.max(0, Math.min(16383, Math.round(8192 + off / synthBend * 8192)));
}
bendFor.local = 1;

function setBend(ch, b) {
	if (chBend[ch] === b) return;
	chBend[ch] = b;
	send([0xe0 + ch, b & 127, b >> 7]);
}
setBend.local = 1;

function pickChannel() {
	if (!mpeOn) return chan;
	var n = last - first + 1;
	var ch = first + ((nextCh - first) % n + n) % n;
	nextCh = ch + 1 > last ? first : ch + 1;
	return ch;
}
pickChannel.local = 1;

// the note number for MIDI pitch p, and the pitch that number stands for
function place(p) {
	if (curMode === 'scale') {
		var v = nearestDegree(p);
		return { note: v, base: midiOf(v) };
	}
	var nn = Math.max(0, Math.min(127, Math.round(p)));
	return { note: nn, base: nn };
}
place.local = 1;

function noteOn(p, vel, ch) {
	var pl = place(p);
	if (ch === undefined) ch = pickChannel();
	setBend(ch, curMode === 'retune' ? bendFor(p - pl.base) : 8192);
	var v = Math.max(1, Math.min(127, Math.round(vel * 127)));
	if (curMode === 'detune') send([0x90 + ch, pl.note, v], Math.max(-63, Math.min(64, Math.round((p - pl.base) * 100))));
	else send([0x90 + ch, pl.note, v]);
	if (used.indexOf(ch) < 0) used.push(ch);
	return { ch: ch, note: pl.note, vel: vel, base: pl.base, p: p };
}
noteOn.local = 1;

function noteOff(n) {
	send([0x80 + n.ch, n.note, 0]);
}
noteOff.local = 1;

function on(vel, p) {
	offTask.cancel();
	p = toMidiPitch(+p);
	vel = +vel;
	if (cur) noteOff(cur);
	cur = vel > 0 ? noteOn(p, vel) : null;
}

function off() {
	offTask.cancel();
	if (cur) noteOff(cur);
	cur = null;
}

// --- the reader: counts from gen~ dingus.toMidiIn ---
var MINMS = 5;          // a note whose gate was already down when read (a short trigger) sounds this long
var lastR = 0, lastF = 0;
var offTask = new Task(off, this);
function poll(r, f, vel, p, pnow) {
	var up = r > f;
	if (r !== lastR) {
		// a reset of the counts (DSP restarted): only take it as a note if the gate is up
		if (r > lastR || up) {
			on(vel, p);
			if (!up) offTask.schedule(MINMS);
		}
	} else if (f !== lastF && !up) off();
	lastR = r;
	lastF = f;
	if (up) pitch(pnow);
}

// the pitch while the gate is up
function pitch(p) {
	if (!cur) return;
	p = toMidiPitch(+p);
	if (Math.abs(p - cur.p) < 0.001) return;
	if (glideOn && curMode === 'retune' && Math.abs(p - cur.base) <= synthBend) {
		cur.p = p;
		setBend(cur.ch, bendFor(p - cur.base));
		return;
	}
	var pl = place(p);
	if (glideOn && pl.note === cur.note) { cur.p = p; return; }   // the same note (scale / detune)
	if (glideOn) {
		// legato: the new note starts before the old one ends
		var old = cur;
		cur = noteOn(p, old.vel, mpeOn ? undefined : old.ch);
		noteOff(old);
	} else {
		var vel = cur.vel;
		noteOff(cur);
		cur = noteOn(p, vel);
	}
}

// --- settings ---
function anything() {
	var a = arrayfromargs(arguments);
	if (messagename === 'mode') {
		var m = String(a[0]);
		if (m === 'retune' || m === 'scale' || m === 'detune') { off(); curMode = m; }
	} else if (messagename === 'pitchin') {
		pitchIn = String(a[0]) === 'midi' ? 'midi' : 'cv';
	} else post('dingus.toMidi: unknown message ' + messagename + '\n');
}

function msg_int(v) {}
function msg_float(v) {}

function mpe(v) { off(); mpeOn = v ? 1 : 0; }

function channel(c) { off(); chan = Math.max(0, Math.min(15, Math.round(c) - 1)); }

function channels(a, b) {
	off();
	first = Math.max(0, Math.min(15, Math.round(a) - 1));
	last = Math.max(first, Math.min(15, Math.round(b) - 1));
	nextCh = first;
}

function synthbend(n) { synthBend = Math.max(1, Math.min(96, +n || 48)); }

function glide(v) { glideOn = v ? 1 : 0; }

function dictionary(name) {
	var d = new Dict(name);
	var size = d.get('size'), cents = d.get('cents');
	if (!size || !cents) return;
	scl.size = size;
	scl.cents = (typeof cents === 'object') ? cents.slice(0, size) : [cents];
	scl.range = d.get('range') || 1200;
	scl.tune = d.get('tune') || 440;
	var c = d.get('center');
	scl.center = (c === null || c === undefined) ? 69 : c;
}

function panic() {
	cur = null;
	for (var i = 0; i < used.length; i++) {
		send([0xb0 + used[i], 123, 0]);
		setBend(used[i], 8192);
	}
	used = [];
}
