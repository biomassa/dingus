// ===========================================================
// dingus.toDrums.js  (v8)
//
// Drum notes for vst~ (and hardware MIDI) from up to 8 trigger / gate rows (markovPerc, gatesSeq).
// The bpatcher dingus.toDrums.maxpat catches each row's rises at the sample (gen~ dingus.toDrumsIn: one
// number per row = rise count, velocity, up) and reads all 8 every 2 ms: 'poll <c1> ... <c8>'. A new rise
// count = a hit, even a trigger shorter than a signal vector; the gate going down = a release. A hit sends a note-on (velocity = the level) with the row's note number; the note-off
// comes 'offms' ms later, or with the fall when offms is 0. A new hit on a row still sounding ends the
// old note first. Notes go out only on hits: nothing is sent while a level just sits.
//
// inlet 0: poll <c1> .. <c8> / hit <row 1..8> <level 0..1> / release <row> / notes <n1> ... <n8> / note <row> <n> /
//          channel <1..16> (default 10) / offms <ms> (default 50; 0 = at the fall) / panic
// outlet 0: midievent <status> <data1> <data2> (to vst~)
// outlet 1: the same as a list of raw MIDI bytes (to [iter] -> [midiout]; never into vst~: a number there
//           changes its preset)
// ===========================================================

inlets = 1;
outlets = 2;
autowatch = 1;

var NR = 8;
var noteNums = [36, 38, 42, 46, 45, 48, 49, 51];   // GM: kick, snare, closed hat, open hat, toms, crash, ride
var chan = 9;          // MIDI channel 10 (0-based)
var offMs = 50;
var sounding = [];     // per row: the note number that is on, or -1
var tasks = [];
for (var r0 = 0; r0 < NR; r0++) {
	sounding.push(-1);
	tasks.push(new Task(endRow, this, r0));
}

function send(bytes) {
	outlet(0, ['midievent'].concat(bytes));
	outlet(1, bytes);
}
send.local = 1;

function endRow(r) {
	if (sounding[r] < 0) return;
	send([0x80 + chan, sounding[r], 0]);
	sounding[r] = -1;
}
endRow.local = 1;

function hit(row, level) {
	var r = Math.round(row) - 1;
	if (r < 0 || r >= NR) return;
	level = +level;
	if (!(level > 0)) return;
	tasks[r].cancel();
	endRow(r);
	var v = Math.max(1, Math.min(127, Math.round(level * 127)));
	send([0x90 + chan, noteNums[r], v]);
	sounding[r] = noteNums[r];
	if (offMs > 0) tasks[r].schedule(offMs);
}

// --- the reader: one number per row from gen~ dingus.toDrumsIn ---
// c = (rises mod 1024) * 256 + velocity (0..127) * 2 + up
var MINMS = 5;          // offms 0: a hit whose gate was already down when read sounds this long
var lastCnt = [], lastUp = [], relTasks = [];
for (var r1 = 0; r1 < NR; r1++) {
	lastCnt.push(-1);
	lastUp.push(0);
	relTasks.push(new Task(endRow, this, r1));
}
function poll() {
	var a = arrayfromargs(arguments);
	for (var r = 0; r < NR && r < a.length; r++) {
		var c = Math.round(+a[r] || 0);
		var cnt = Math.floor(c / 256), vel = Math.floor((c % 256) / 2) / 127, up = c % 2;
		if (lastCnt[r] < 0) {
			lastCnt[r] = cnt;          // the first read: only learn where the counts are
			lastUp[r] = up;
			continue;
		}
		if (cnt !== lastCnt[r]) {
			relTasks[r].cancel();
			hit(r + 1, vel);
			if (offMs <= 0 && !up) relTasks[r].schedule(MINMS);
		} else if (lastUp[r] && !up && offMs <= 0) {
			endRow(r);
		}
		lastCnt[r] = cnt;
		lastUp[r] = up;
	}
}

function release(row) {
	var r = Math.round(row) - 1;
	if (r < 0 || r >= NR || offMs > 0) return;
	endRow(r);
}

function notes() {
	var a = arrayfromargs(arguments);
	for (var r = 0; r < NR && r < a.length; r++) note(r + 1, a[r]);
}

function note(row, n) {
	var r = Math.round(row) - 1;
	if (r < 0 || r >= NR) return;
	tasks[r].cancel();
	endRow(r);
	noteNums[r] = Math.max(0, Math.min(127, Math.round(n)));
}

function channel(c) {
	panic();
	chan = Math.max(0, Math.min(15, Math.round(c) - 1));
}

function offms(ms) {
	offMs = Math.max(0, +ms || 0);
}

function panic() {
	for (var r = 0; r < NR; r++) {
		tasks[r].cancel();
		endRow(r);
	}
	send([0xb0 + chan, 123, 0]);
}

function anything() {
	post('dingus.toDrums: unknown message ' + messagename + '\n');
}
