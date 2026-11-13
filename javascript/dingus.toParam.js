// ===========================================================
// dingus.toParam.js  (v8)
//
// Modulation signals (voltagesModulator, envelopes, LFOs, any CV) -> 0..1 floats for the PARAM inlets of
// the dingus plug-in hosts (pluginStereo, plugin16in, pluginSideChain, pluginGRM, pluginGRM32). The host
// picks the plug-in parameter (its menu); this only turns a signal into values, sent when they change.
//
// The bpatcher dingus.toParam.maxpat reads each input every 'rate' ms ('val <slot> <v>'). A slot's input
// range lo..hi maps to 0..1 (default 0..1; 'range <slot> <lo> <hi>'). A value goes out only when it has
// moved by at least 'delta' from the last one sent; the last small move goes out once the input has been
// still for 'settle' ms, so a parameter never stays a little off.
//
// CC (hardware synths): a slot can also send its value as MIDI CC <n> (0..127, 'cc <slot> <n>'; -1 = off,
// the default) on 'channel', when the 7-bit value changes; out of outlet 4 as raw MIDI bytes.
//
// inlet 0: val <slot 1..4> <v> / range <slot> <lo> <hi> / cc <slot> <n> / channel <1..16> /
//          delta <0..1> (default 0.004) / settle <ms> (default 80) / resend
// outlets 0..3: the slots' values, 0..1 (to a host's PARAM inlet)
// outlet 4: the CCs as raw MIDI bytes (to [iter] -> [midiout]; never into vst~: a number there changes
//           its preset)
// ===========================================================

inlets = 1;
outlets = 5;
autowatch = 1;

var NS = 4;
var dlt = 0.004;
var settleMs = 80;
var chan = 0;
var slots = [];
var tasks = [];
for (var s0 = 0; s0 < NS; s0++) {
	slots.push({ lo: 0, hi: 1, sent: null, last: null, cc: -1, ccSent: -1 });
	tasks.push(new Task(settleSlot, this, s0));
}

function norm(sl, v) {
	var r = sl.hi - sl.lo;
	return Math.max(0, Math.min(1, r !== 0 ? (v - sl.lo) / r : 0));
}
norm.local = 1;

function emit(k) {
	var sl = slots[k];
	if (sl.last === null) return;
	outlet(k, sl.last);
	sl.sent = sl.last;
	if (sl.cc >= 0) {
		var c = Math.round(sl.last * 127);
		if (c !== sl.ccSent) {
			outlet(4, [0xb0 + chan, sl.cc, c]);
			sl.ccSent = c;
		}
	}
}
emit.local = 1;

// the input has been still: the last value goes out (if it differs from what was sent)
function settleSlot(k) {
	var sl = slots[k];
	if (sl.last !== null && sl.last !== sl.sent) emit(k);
}
settleSlot.local = 1;

function val(slot, v) {
	var k = Math.round(slot) - 1;
	if (k < 0 || k >= NS) return;
	var sl = slots[k];
	var x = norm(sl, +v);
	if (sl.last !== null && x === sl.last) return;     // nothing moved: no settle restart either
	sl.last = x;
	tasks[k].cancel();
	if (sl.sent === null || Math.abs(x - sl.sent) >= dlt) emit(k);
	if (sl.last !== sl.sent) tasks[k].schedule(settleMs);
}

function range(s, lo, hi) {
	var k = Math.round(s) - 1;
	if (k < 0 || k >= NS) return;
	slots[k].lo = +lo;
	slots[k].hi = +hi;
}

function cc(s, n) {
	var k = Math.round(s) - 1;
	if (k < 0 || k >= NS) return;
	n = Math.round(n);
	slots[k].cc = n >= 0 && n <= 127 ? n : -1;
	slots[k].ccSent = -1;
}

function channel(c) {
	chan = Math.max(0, Math.min(15, Math.round(c) - 1));
	for (var k = 0; k < NS; k++) slots[k].ccSent = -1;
}

function delta(d) { dlt = Math.max(0, Math.min(0.5, +d || 0)); }
function settle(ms) { settleMs = Math.max(1, +ms || 80); }

// every slot's current value again (e.g. after loading a plug-in)
function resend() {
	for (var k = 0; k < NS; k++) {
		slots[k].ccSent = -1;
		emit(k);
	}
}

function anything() {
	post('dingus.toParam: unknown message ' + messagename + '\n');
}
