// ===========================================================
// dingus.gateRoll.js  (v8ui)
//
// Piano-roll style gate editor for the gate sequencer (uGATE).
// A gate starts on a step and spans one or more whole steps;
// LEN sets how much of its LAST step is filled (5..100 %).
//
// lanes:
//   GATE   click a step = 1-step gate, click-drag across steps = spanning gate
//          drag a gate's right end = resize (1/4 step snap, alt = free)
//          drag a gate's body = move it, option-drag = move a copy (original stays),
//          click a gate (no drag) = delete it
//   VEL    per gate: level of the gate / peak of the envelope
//   LEN    per gate: fill of the gate's last step
//   DELAY  per gate: start later by 0..1 step; the gate keeps its length and is only
//          trimmed where it would run into the next gate or the loop end
//   PROB   per gate: chance the gate plays (full = always)
//   SKIP   per STEP: chance the step is played, else it is jumped over (full = never skipped)
//   RATCH  per gate: ratchets 1..8, spread evenly over the whole gate
//   FADE   per gate: -50..50, the ratchet hits' velocities (< 0 rise to VEL, > 0 fall from it,
//          exponential; at +-50 the quietest hit is 1% of VEL; only with 2+ ratchets)
//   DUTY   per gate: on-time of each ratchet hit (only with 2+ ratchets)
// value lanes: click / drag; shift = fine
// RANGE strip (bottom, 10 px): play range / sub-loop. drag an end = set it, drag the middle = move it,
//          double-click = full range
// SEQUENCES: 32, each with its gates, skips, play range and step count. The shown sequence plays from
//          one engine bank; a newly chosen one is written to the other bank and takes over at the
//          phasor wrap (the engine swaps; 'bankis' confirms). Selections made before the confirmation
//          wait for it. All 32 are saved to <presets folder>/uGATEseq_<name>.json on every change;
//          the first time, the gates of the presets file's slots become sequences (slot n = sequence n).
//
// inlet 0:
//   steps n         number of steps (gates beyond are deleted / cut, new steps get skip 1)
//   buffer name     buffer~ to write the gate table into
//   gates ...       set everything (stored format), no output
//   clear           empty the current sequence (gates, skips, full range; the step count stays)
//   clearall        empty all 32 sequences
//   seq n           sequence 0..31 (at the phasor wrap while the engine runs)
//   seqstep d       the sequence d up / down (from a waiting one), 0..31 without wrapping
//   copyseq / pasteseq   copy the current sequence / replace the current sequence with the copy
//   seqname name    the instance name: reads (or migrates) the sequences file
//   swing n         the current sequence's swing, 50..75 % (every 2nd step later; 50 = straight)
//   bankis b        the engine's playing bank (from gen~ out5)
//   dsp 0|1         audio on / off (off: sequences switch at once)
//   bang            output the stored list
//   labelwidth n    width of the lane-label column in pixels
// inlet 1:
//   int             current step (playhead)
// outlet 0: stored list after each edit; 'needbuffer' at load (answer with: buffer <name>);
//           'range start end' (0-based steps); 'engine pendbank b' / 'engine swapnow k' (to gen~);
//           'stepsis n' and 'seqis n' (1..32) for the boxes
// pattr value: -5 sequence (older presets: the stored list below; after the migration it is ignored)
//
// stored list: -6 n rstart rend swing  skip_1 .. skip_n  then per gate: start span fill prob ratch vel duty
//   delay fade (-6 = format version; -4 = without swing; -3 = also without fade; -2 = also without the
//   range; no marker = old 7-field format, delay 0)
//
// buffer~ layout (frame = bank * 64 + step, 9 channels; meta at frame 128 + bank: steps, range start,
//   range end in channels 1-3):
//   1 played length in steps after delay/trim (0 = no gate starts here)
//   2 prob  3 ratchets  4 velocity  5 duty
//   6 reverse lookup: (start step + 1) of the gate whose played end falls in this step
//   7 reverse offset: fraction into that step where the mirrored gate starts
//   8 skip (chance the step is played)
//   9 delay (fraction of a step before the gate starts)
//   10 fade (-50..50)
// ===========================================================

inlets = 2;
outlets = 1;
autowatch = 1;

setinletassist(0, 'steps, buffer, gates, clear, bang, labelwidth');
setinletassist(1, 'current step index (playhead)');
setoutletassist(0, 'stored list');

mgraphics.init();
mgraphics.relative_coords = 0;
mgraphics.autofill = 0;

var MAXSTEPS = 64;
var NCH = 10;
var NFIELDS = 9;
var FORMAT = 6;      // stored lists: -6 with swing; -4 and older without (straight)
var NSEQ = 32;
var BANKF = 64;      // gate-table frames per bank
var METABASE = 128;  // frame METABASE + bank: steps, range start, range end
var PREFIX = 'uGATE';

// --- state -------------------------------------------------
var n = 16;
var skips = [];        // per step, 0..1 (1 = always played)
var gates = [];        // {s, span, f, p, r, v, d, dl}
var playhead = -1;
var sw = 50;            // swing of the current sequence, 50..75 % (50 = straight)
var seqs = [];         // the 32 sequences as stored lists (null = empty)
var cur = 0;           // the shown sequence, which plays from bank 'bank'
var bank = 0;
var pend = -1;         // a sequence written to the other bank, waiting for the engine's swap
var queued = -1;       // a selection made while a swap is not confirmed yet
var swapCount = 0;
var dspOn = 1;
var clip = null;
var seqName = '';
var seqsLoaded = false;
for (var si = 0; si < NSEQ; si++) seqs.push(null);
var labelW = 44;
var bufName = '';
var rStart = 0;        // play range, first step (0-based)
var rEnd = 15;         // play range, last step
var RANGEH = 10;       // height of the range strip

// earthy lane colours; numbers sit on small dark labels so they read on any bar
// the roll is one lane taller since FADE (424 px): the lanes keep their earlier pixel heights
var GATEW = 0.1246;
var LW = (1 - GATEW) / 8;
var LANES = [
	{ key: 'gate', name: 'GATE', w: GATEW, col: [0.85, 0.65, 0.30] },     // ochre
	{ key: 'v', name: 'VEL', w: LW, lo: 0, hi: 1, col: [0.80, 0.42, 0.26] },        // terracotta
	{ key: 'f', name: 'LEN', w: LW, lo: 0.05, hi: 1, col: [0.62, 0.66, 0.38] },     // olive
	{ key: 'dl', name: 'DELAY', w: LW, lo: 0, hi: 1, col: [0.72, 0.52, 0.36] },     // clay
	{ key: 'p', name: 'PROB', w: LW, lo: 0, hi: 1, col: [0.45, 0.62, 0.42] },       // moss
	{ key: 'skip', name: 'SKIP', w: LW, lo: 0, hi: 1, perStep: 1, col: [0.42, 0.60, 0.62] }, // slate
	{ key: 'r', name: 'RATCH', w: LW, lo: 1, hi: 8, int: 1, col: [0.62, 0.47, 0.58] },     // dusty plum
	{ key: 'fd', name: 'FADE', w: LW, lo: -50, hi: 50, int: 1, bi: 1, col: [0.66, 0.56, 0.44] }, // umber
	{ key: 'd', name: 'DUTY', w: LW, lo: 0.05, hi: 0.95, col: [0.80, 0.72, 0.52] }  // sand
];
var HEADER = 14;       // step-number strip at the top

var drag = null;       // mouse state
var hoverEnd = null;   // gate whose right end is under the mouse
var ENDGRAB = 7;       // px around a gate's end that grab it for resizing
var Q = 0.25;          // resize snap in steps
var MINLEN = 0.05;

// ask the patch for the buffer~ name at load and after every script reload
// (patch: outlet -> [route needbuffer] -> [buffer #0-gates( -> inlet)
var askTask = new Task(function () { if (!bufName) outlet(0, 'needbuffer'); });
askTask.schedule(50);

function fillSkips() {
	while (skips.length < MAXSTEPS) skips.push(1);
}
fillSkips.local = 1;
fillSkips();

// --- geometry ----------------------------------------------
// size of the drawing area (follows the presentation size in presentation mode)
function dims() {
	return mgraphics.size;
}
dims.local = 1;

function laneRects() {
	var h = dims()[1] - HEADER - RANGEH;
	var y = HEADER;
	var out = [];
	for (var i = 0; i < LANES.length; i++) {
		var lh = LANES[i].w * h;
		out.push({ top: y, h: lh, lane: LANES[i] });
		y += lh;
	}
	return out;
}
laneRects.local = 1;

function colW() {
	return (dims()[0] - labelW) / n;
}
colW.local = 1;

function xOf(pos) {
	return labelW + pos * colW();
}
xOf.local = 1;

function posOf(x) {
	return (x - labelW) / colW();
}
posOf.local = 1;

function stepOf(x) {
	return Math.max(0, Math.min(n - 1, Math.floor(posOf(x))));
}
stepOf.local = 1;

function laneAt(y) {
	var rs = laneRects();
	for (var i = 0; i < rs.length; i++) {
		if (y >= rs[i].top && y < rs[i].top + rs[i].h) return rs[i];
	}
	return y < HEADER ? rs[0] : rs[rs.length - 1];
}
laneAt.local = 1;

// --- gate table helpers ------------------------------------
function glen(g) {
	return g.span - 1 + g.f;
}
glen.local = 1;

// start of the next gate after g (or the loop end)
function nextStart(g) {
	var m = (g.s <= rEnd) ? Math.min(n, rEnd + 1) : n;   // gates in the play range end at its end
	for (var i = 0; i < gates.length; i++) {
		var o = gates[i];
		if (o !== g && o.s > g.s) m = Math.min(m, o.s);
	}
	return m;
}
nextStart.local = 1;

// played length: the gate keeps its length after the delay, trimmed at the next gate / loop end
function effLen(g) {
	return Math.max(MINLEN, Math.min(glen(g), nextStart(g) - (g.s + g.dl)));
}
effLen.local = 1;

function sortGates() {
	gates.sort(function (a, b) { return a.s - b.s; });
}
sortGates.local = 1;

// gate occupying step k (gates own whole steps)
function gateAtStep(k) {
	for (var i = 0; i < gates.length; i++) {
		var g = gates[i];
		if (k >= g.s && k < g.s + g.span) return g;
	}
	return null;
}
gateAtStep.local = 1;

// longest span a gate starting at s may have (next gate / loop end)
function maxSpan(s, self) {
	var m = n - s;
	for (var i = 0; i < gates.length; i++) {
		var g = gates[i];
		if (g === self) continue;
		if (g.s >= s) m = Math.min(m, g.s - s);
	}
	return m;
}
maxSpan.local = 1;

// can a gate occupy steps s .. s+span-1 ?
function fits(s, span, self) {
	if (s < 0 || s + span > n) return false;
	for (var i = 0; i < gates.length; i++) {
		var g = gates[i];
		if (g === self) continue;
		if (s < g.s + g.span && g.s < s + span) return false;
	}
	return true;
}
fits.local = 1;

// FADE: velocity factor of ratchet hit k (as in dingus.pgRoll.js and the engine)
function fadeFactor(gt, k) {
	if (gt.r <= 1 || !gt.fd) return 1;
	var t = k / (gt.r - 1);
	var m = Math.pow(0.01, Math.abs(gt.fd) / 50);
	return gt.fd < 0 ? Math.pow(m, 1 - t) : Math.pow(m, t);
}
fadeFactor.local = 1;

function clampVal(lane, v) {
	v = Math.min(lane.hi, Math.max(lane.lo, v));
	return lane.int ? Math.round(v) : v;
}
clampVal.local = 1;

// cut / delete gates that no longer fit n steps
function fitToSteps() {
	var kept = [];
	for (var i = 0; i < gates.length; i++) {
		var g = gates[i];
		if (g.s >= n) continue;
		if (g.s + g.span > n) {
			g.span = n - g.s;
			g.f = 1;
		}
		kept.push(g);
	}
	gates = kept;
}
fitToSteps.local = 1;

// --- buffer~ -----------------------------------------------
function writeBuffer() {
	writeNotes(bank);
}
writeBuffer.local = 1;

// the gate table of the current state into bank bk, with its meta
function writeNotes(bk) {
	if (!bufName) return;
	var buf = new Buffer(bufName);
	if (buf.framecount() < METABASE + 2 || buf.channelcount() < NCH) {
		post('dingus.gateRoll: buffer~ ' + bufName + ' needs ' + (METABASE + 2) + ' samples and ' + NCH + ' channels\n');
		return;
	}
	var cols = [];
	var c, i;
	for (c = 0; c < NCH; c++) {
		cols.push([]);
		for (i = 0; i < MAXSTEPS; i++) cols[c].push(0);
	}
	for (i = 0; i < MAXSTEPS; i++) cols[7][i] = skips[i];
	for (i = 0; i < gates.length; i++) {
		var g = gates[i];
		if (g.s >= n) continue;
		var L = effLen(g);
		cols[0][g.s] = L;
		cols[1][g.s] = g.p;
		cols[2][g.s] = g.r;
		cols[3][g.s] = g.v;
		cols[4][g.s] = g.d;
		cols[8][g.s] = g.dl;
		cols[9][g.s] = g.fd || 0;
		var e = g.s + g.dl + L;
		var last = Math.ceil(e - 1e-9) - 1;
		if (last >= 0 && last < MAXSTEPS) {
			cols[5][last] = g.s + 1;
			cols[6][last] = Math.ceil(e - 1e-9) - e;
		}
	}
	for (c = 0; c < NCH; c++) buf.poke(c + 1, bk * BANKF, cols[c]);
	buf.poke(1, METABASE + bk, [n]);
	buf.poke(2, METABASE + bk, [rStart]);
	buf.poke(3, METABASE + bk, [rEnd]);
	buf.poke(4, METABASE + bk, [sw]);
}
writeNotes.local = 1;

// --- serialization -----------------------------------------
function flat() {
	var a = [-FORMAT, n, rStart, rEnd, sw];
	var i;
	for (i = 0; i < n; i++) a.push(skips[i]);
	for (i = 0; i < gates.length; i++) {
		var g = gates[i];
		a.push(g.s, g.span, g.f, g.p, g.r, g.v, g.d, g.dl, g.fd || 0);
	}
	return a;
}
flat.local = 1;

function unflat(a) {
	if (!a.length) return;
	var nf = 7;              // old format: no delay
	var ver = 0;
	if (a[0] < 0) {          // versioned format
		ver = -a[0];
		nf = ver >= 4 ? NFIELDS : 8;
		a = a.slice(1);
		if (!a.length) return;
	}
	n = Math.max(1, Math.min(MAXSTEPS, Math.round(a[0])));
	rStart = 0;
	rEnd = n - 1;
	if (ver >= 3) {          // play range
		rStart = Math.round(a[1]);
		rEnd = Math.round(a[2]);
		a = [a[0]].concat(a.slice(3));
	}
	sw = 50;
	if (ver >= 6) {          // swing
		sw = Math.max(50, Math.min(75, Math.round(a[1])));
		a = [a[0]].concat(a.slice(2));
	}
	clampRange();
	var i = 1, k;
	skips = [];
	for (k = 0; k < n && i < a.length; k++, i++) skips.push(Math.min(1, Math.max(0, a[i])));
	fillSkips();
	gates = [];
	for (; i + nf - 1 < a.length; i += nf) {
		gates.push({
			s: Math.round(a[i]), span: Math.max(1, Math.round(a[i + 1])), f: a[i + 2],
			p: a[i + 3], r: Math.round(a[i + 4]), v: a[i + 5], d: a[i + 6],
			dl: nf >= 8 ? Math.min(1, Math.max(0, a[i + 7])) : 0,
			fd: nf >= 9 ? Math.max(-50, Math.min(50, Math.round(a[i + 8]))) : 0
		});
	}
	sortGates();
	fitToSteps();
}
unflat.local = 1;

// keep the pattern across script reloads (autowatch): parked in a Max global
// under this instance's buffer~ name, picked up again when the name arrives
var keep = new Global("dingusGateRollState");

function park() {
	if (!bufName) return;
	keep[bufName] = flat();
	keep[bufName + ' seqs'] = { seqs: seqs.slice(), cur: cur, bank: bank, loaded: seqsLoaded, name: seqName };
}
park.local = 1;

function clampRange() {
	rStart = Math.max(0, Math.min(n - 1, rStart));
	rEnd = Math.max(rStart, Math.min(n - 1, rEnd));
}
clampRange.local = 1;

function sendRange() {
	outlet(0, "range", rStart, rEnd);
}
sendRange.local = 1;

function changed(out) {
	sortGates();
	clampRange();
	seqs[cur] = flat();
	park();
	writeBuffer();
	sendRange();
	outlet(0, "stepsis", n);
	scheduleSave();
	mgraphics.redraw();
	notifyclients();
	if (out) outlet(0, flat());
}
changed.local = 1;

// --- drawing -----------------------------------------------
function paint() {
	var g = mgraphics;
	var wh = dims();
	var w = wh[0], h = wh[1];
	var cw = colW();
	var rs = laneRects();
	var i, j, k, r, gt, lane, norm, bh, txt;

	g.set_source_rgba(0, 0, 0, 1);
	g.rectangle(0, 0, w, h);
	g.fill();

	// lane backgrounds
	for (i = 0; i < rs.length; i++) {
		r = rs[i];
		if (i % 2 === 0) g.set_source_rgba(0.10, 0.10, 0.11, 1);
		else g.set_source_rgba(0.13, 0.13, 0.15, 1);
		g.rectangle(labelW, r.top, w - labelW, r.h);
		g.fill();
	}

	// playhead column
	if (playhead >= 0 && playhead < n) {
		g.set_source_rgba(0.30, 0.07, 0.07, 1);
		g.rectangle(xOf(playhead), HEADER, cw, h - HEADER);
		g.fill();
	}

	// column separators (every 4th brighter) + step numbers
	g.select_font_face('Arial');
	g.set_font_size(10);
	for (k = 0; k <= n; k++) {
		if (k % 4 === 0) g.set_source_rgba(0.40, 0.40, 0.43, 1);
		else g.set_source_rgba(0.22, 0.22, 0.24, 1);
		g.set_line_width(k % 4 === 0 ? 1 : 0.5);
		g.move_to(xOf(k), HEADER);
		g.line_to(xOf(k), h);
		g.stroke();
		if (k < n && (cw >= 16 || k % 4 === 0)) {
			if (k === playhead) g.set_source_rgba(1, 0.5, 0.4, 1);
			else g.set_source_rgba(0.6, 0.6, 0.63, 1);
			g.move_to(xOf(k) + 3, HEADER - 3);
			g.show_text(String(k + 1));
		}
	}

	// lane separators
	g.set_source_rgba(0.35, 0.35, 0.38, 1);
	g.set_line_width(1);
	for (i = 0; i < rs.length; i++) {
		g.move_to(0, rs[i].top);
		g.line_to(w, rs[i].top);
		g.stroke();
	}

	// per-step lanes (skip)
	for (i = 1; i < rs.length; i++) {
		r = rs[i];
		lane = r.lane;
		if (!lane.perStep) continue;
		for (k = 0; k < n; k++) {
			norm = skips[k];
			bh = Math.max(1, norm * (r.h - 4));
			g.set_source_rgba(lane.col[0], lane.col[1], lane.col[2], 0.9);
			g.rectangle(xOf(k) + 1, r.top + r.h - 2 - bh, Math.max(1, cw - 2), bh);
			g.fill();
			if (cw >= 22 && r.h >= 12 && norm < 1) numLabel(g, xOf(k) + 2, r.top + 2, String(Math.round(norm * 100)));
		}
	}

	// gates
	for (j = 0; j < gates.length; j++) {
		gt = gates[j];
		var x0 = xOf(gt.s) + 1;
		var spanW = Math.max(2, gt.span * cw - 2);
		var bx = xOf(gt.s + gt.dl) + 1;                 // played gate starts after the delay
		var gw = Math.max(2, effLen(gt) * cw - 2);
		var gc = LANES[0].col;
		var on = playhead >= gt.s && playhead < gt.s + gt.span;

		// gate lane: outline = steps owned, body = gate, bright = ratchet hits
		r = rs[0];
		var gy = r.top + 3, gh = r.h - 6;
		g.set_source_rgba(gc[0], gc[1], gc[2], 0.5);
		g.set_line_width(1);
		g.rectangle(x0 + 0.5, gy + 0.5, spanW - 1, gh - 1);
		g.stroke();
		g.set_source_rgba(gc[0], gc[1], gc[2], 0.25);
		g.rectangle(bx, gy, gw, gh);
		g.fill();
		var hits = Math.max(1, gt.r);
		var hw = gw / hits;
		var duty = hits > 1 ? gt.d : 1;
		if (on) g.set_source_rgba(Math.min(1, gc[0] + 0.15), Math.min(1, gc[1] + 0.2), Math.min(1, gc[2] + 0.25), 1);
		else g.set_source_rgba(gc[0], gc[1], gc[2], 1);
		for (k = 0; k < hits; k++) {
			// height = velocity of the hit (VEL x FADE)
			var hh = gh * (0.3 + 0.7 * gt.v * fadeFactor(gt, k));
			g.rectangle(bx + k * hw, gy + gh - hh, Math.max(1, hw * duty), hh);
			g.fill();
		}
		// end handles: filled end + outline end (bright when hovered / dragged)
		var hot = gt === hoverEnd || (drag && drag.mode === 'end' && drag.g === gt);
		g.set_source_rgba(1, 1, 1, hot ? 1 : 0.45);
		g.rectangle(bx + gw - (hot ? 4 : 2), gy, hot ? 4 : 2, gh);
		g.fill();
		if (hot && Math.abs((x0 + spanW) - (bx + gw)) > 3) {
			g.rectangle(x0 + spanW - 4, gy, 4, gh);
			g.fill();
		}

		// per-gate value lanes, drawn across the steps the gate owns
		for (i = 1; i < rs.length; i++) {
			r = rs[i];
			lane = r.lane;
			if (lane.perStep) continue;
			var val = gt[lane.key] || 0;
			norm = (val - lane.lo) / (lane.hi - lane.lo);
			var inactive = (lane.key === 'd' || lane.key === 'fd') && gt.r <= 1;
			if (inactive) g.set_source_rgba(0.40, 0.38, 0.36, 0.7);
			else g.set_source_rgba(lane.col[0], lane.col[1], lane.col[2], 0.9);
			if (lane.bi) {
				// bipolar: bar from the middle line
				var mid = r.top + r.h / 2;
				var by = r.top + 2 + (1 - norm) * (r.h - 4);
				g.rectangle(x0, Math.min(mid, by), spanW, Math.max(1, Math.abs(by - mid)));
				g.fill();
				g.set_source_rgba(0.35, 0.35, 0.38, 1);
				g.rectangle(x0, mid - 0.5, spanW, 1);
				g.fill();
			} else {
				bh = Math.max(1, norm * (r.h - 4));
				g.rectangle(x0, r.top + r.h - 2 - bh, spanW, bh);
				g.fill();
			}
			if (spanW >= 18 && r.h >= 12) {
				txt = lane.int ? String(val) : String(Math.round(val * 100));
				numLabel(g, x0 + 1, r.top + 2, txt);
			}
		}
	}

	// outside the play range: dimmed
	var laneBottom = h - RANGEH;
	g.set_source_rgba(0, 0, 0, 0.45);
	if (rStart > 0) { g.rectangle(labelW, HEADER, xOf(rStart) - labelW, laneBottom - HEADER); g.fill(); }
	if (rEnd < n - 1) { g.rectangle(xOf(rEnd + 1), HEADER, xOf(n) - xOf(rEnd + 1), laneBottom - HEADER); g.fill(); }

	// range strip
	g.set_source_rgba(0.07, 0.07, 0.07, 1);
	g.rectangle(labelW, laneBottom, w - labelW, RANGEH);
	g.fill();
	g.set_source_rgba(0.75, 0.68, 0.50, 0.9);
	g.rectangle(xOf(rStart) + 1, laneBottom + 2, xOf(rEnd + 1) - xOf(rStart) - 2, RANGEH - 4);
	g.fill();
	g.set_source_rgba(0.95, 0.92, 0.85, 1);
	g.rectangle(xOf(rStart) + 1, laneBottom + 1, 3, RANGEH - 2);
	g.fill();
	g.rectangle(xOf(rEnd + 1) - 4, laneBottom + 1, 3, RANGEH - 2);
	g.fill();

	// label column
	g.set_source_rgba(0.06, 0.06, 0.07, 1);
	g.rectangle(0, 0, labelW, h);
	g.fill();
	g.set_font_size(8);
	g.set_source_rgba(0.85, 0.83, 0.78, 1);
	g.move_to(6, h - 2);
	g.show_text("RANGE");
	// the shown sequence, and the one waiting for the phasor wrap
	var nx = queued >= 0 ? queued : pend;
	g.set_font_size(9);
	g.set_source_rgba(0.85, 0.83, 0.78, 1);
	g.move_to(3, HEADER - 3);
	g.show_text('S' + (cur + 1));
	if (nx >= 0) {
		g.set_source_rgba(0.98, 0.45, 0.10, 1);
		g.show_text('>' + (nx + 1));
	}
	g.set_font_size(10);
	g.set_font_size(10);
	for (i = 0; i < rs.length; i++) {
		r = rs[i];
		var lc = r.lane.col;
		g.set_source_rgba(lc[0], lc[1], lc[2], 1);
		g.rectangle(0, r.top + 1, 3, r.h - 2);
		g.fill();
		g.set_source_rgba(0.85, 0.83, 0.78, 1);
		g.move_to(6, r.top + Math.min(r.h, 13) - 2);
		g.show_text(r.lane.name);
	}
	g.set_source_rgba(0.35, 0.35, 0.38, 1);
	g.set_line_width(1);
	g.move_to(labelW, 0);
	g.line_to(labelW, h);
	g.stroke();
}
paint.local = 1;

// number on a small dark label (readable on any bar colour)
function numLabel(g, x, y, txt) {
	g.set_font_size(10);
	var tw = g.text_measure(txt)[0];
	g.set_source_rgba(0.09, 0.08, 0.07, 0.8);
	g.rectangle(x, y, tw + 5, 12);
	g.fill();
	g.set_source_rgba(0.96, 0.93, 0.86, 1);
	g.move_to(x + 2.5, y + 10);
	g.show_text(txt);
}
numLabel.local = 1;

function onresize() {
	mgraphics.redraw();
}
onresize.local = 1;

// --- messages ----------------------------------------------
function steps(v) {
	var full = (rStart === 0 && rEnd >= n - 1);
	n = Math.max(1, Math.min(MAXSTEPS, Math.round(v)));
	if (full) rEnd = n - 1;       // a full range stays full
	// steps beyond n get "always played" again for when they come back
	for (var k = n; k < MAXSTEPS; k++) skips[k] = 1;
	fitToSteps();
	if (playhead >= n) playhead = -1;
	changed(false);
}

function buffer(name) {
	bufName = String(name);
	var st = keep[bufName];
	var ks = keep[bufName + ' seqs'];
	if (ks && ks.seqs && ks.seqs.length === NSEQ) {
		seqs = ks.seqs.slice();
		cur = ks.cur;
		bank = ks.bank;
		seqsLoaded = ks.loaded;
		seqName = ks.name || '';
	}
	if (!gates.length && st && st.length) {
		// fresh after a script reload: bring the pattern back
		unflat(st);
		sortGates();
		mgraphics.redraw();
	}
	writeBuffer();
	sendRange();
}

function anything() {
	if (messagename === 'gates') {
		unflat(arrayfromargs(arguments));
		changed(false);
	} else {
		post('dingus.gateRoll: unknown message ' + messagename + '\n');
	}
}

// clear: the current sequence (gates, skips, full range; the step count stays)
function clear() {
	emptyState();
	changed(true);
}

// clear all: all 32 sequences
function clearall() {
	for (var i = 0; i < NSEQ; i++) seqs[i] = null;
	emptyState();
	changed(true);
}

function emptyState() {
	gates = [];
	skips = [];
	fillSkips();
	rStart = 0;
	rEnd = n - 1;
}
emptyState.local = 1;

// --- sequences ---------------------------------------------
function loadSeq(a) {
	if (a && a.length) unflat(a);
	else emptyState();
}
loadSeq.local = 1;

// run fn with sequence a as the current state, then restore the current state
function withSeq(a, fn) {
	var save = flat();
	loadSeq(a);
	fn();
	unflat(save);
}
withSeq.local = 1;

function seq(v) {
	var k = Math.max(0, Math.min(NSEQ - 1, Math.round(v) || 0));
	outlet(0, 'seqis', k + 1);
	if (pend >= 0) {
		// a swap is under way: this choice waits for its confirmation
		queued = (k === pend) ? -1 : k;
		mgraphics.redraw();
		return;
	}
	queued = -1;
	if (k === cur) {
		mgraphics.redraw();
		return;
	}
	var ob = 1 - bank;
	withSeq(seqs[k], function () {
		writeNotes(ob);
	});
	if (!dspOn) {
		// no audio, no confirmation: switch here; the engine takes the bank when audio starts
		swapCount++;
		outlet(0, 'engine', 'pendbank', ob);
		outlet(0, 'engine', 'swapnow', swapCount);
		cur = k;
		bank = ob;
		loadSeq(seqs[cur]);
		afterSwitch();
		return;
	}
	pend = k;
	outlet(0, 'engine', 'pendbank', ob);
	park();
	mgraphics.redraw();
}

function seqstep(d) {
	var from = queued >= 0 ? queued : (pend >= 0 ? pend : cur);
	var k = Math.max(0, Math.min(NSEQ - 1, from + (Math.round(d) || 0)));
	if (k !== from) seq(k);
}

// the engine's playing bank (gen~ out5, through snapshot~ and change)
function bankis(b) {
	b = Math.round(b);
	if (pend >= 0 && b === 1 - bank) {
		cur = pend;
		bank = b;
		pend = -1;
		loadSeq(seqs[cur]);
		afterSwitch();
		if (queued >= 0) {
			var q = queued;
			queued = -1;
			seq(q);
		}
	} else if (pend < 0 && b !== bank) {
		// out of step (for example after a reload): the current sequence into the playing bank
		bank = b;
		changed(false);
	}
}

function dsp(on) {
	dspOn = on ? 1 : 0;
}

function afterSwitch() {
	park();
	sendRange();
	outlet(0, 'stepsis', n);
	outlet(0, 'swingis', sw);
	outlet(0, 'seqis', cur + 1);
	mgraphics.redraw();
	notifyclients();
	scheduleSave();
}
afterSwitch.local = 1;

function swing(v) {
	sw = Math.max(50, Math.min(75, Math.round(v) || 50));
	changed(true);
}

function copyseq() {
	clip = flat();
}

function pasteseq() {
	if (!clip) return;
	unflat(clip);
	changed(true);
}

// --- sequences file ----------------------------------------
var paths = require('dingus.paths.js');

function folder() {
	return paths.presetFolder(this.patcher);
}
folder.local = 1;

function seqPath() {
	var f = folder();
	return f && seqName ? f + PREFIX + 'seq_' + seqName + '.json' : '';
}
seqPath.local = 1;

function readJSON(p) {
	if (!p) return null;
	try {
		var f = new File(p, 'read');
		if (!f.isopen) return null;
		var txt = '';
		while (f.position < f.eof) txt += f.readstring(4096);
		f.close();
		return JSON.parse(txt);
	} catch (e) {
		return null;
	}
}
readJSON.local = 1;

var saveTask = new Task(saveSeqs, this);

function scheduleSave() {
	if (seqsLoaded && seqName) saveTask.schedule(300);
}
scheduleSave.local = 1;

function saveSeqs() {
	var p = seqPath();
	if (!p) return;
	seqs[cur] = flat();
	try {
		var txt = JSON.stringify({ format: 1, current: cur, seqs: seqs });
		var f = new File(p, 'write', 'TEXT');
		if (!f.isopen) throw new Error('not open');
		for (var i = 0; i < txt.length; i += 4096) f.writestring(txt.substring(i, i + 4096));
		f.eof = f.position;
		f.close();
	} catch (e) {
		post('dingus.gateRoll: can\'t write ' + p + '\n');
	}
}
saveSeqs.local = 1;

// any stored format into the current one
function normalized(a) {
	if (!a || !a.length) return null;
	var out = null;
	withSeq(a, function () {
		out = flat();
	});
	return out;
}
normalized.local = 1;

// first time: the gates of the presets file's slots become sequences (slot n = sequence n,
// slots above 32 fill the first empty ones); without them, the current gates become sequence 1
function migrate() {
	var f = folder();
	var o = f ? readJSON(f + PREFIX + '_' + seqName + '.json') : null;
	var slots = o && o.pattrstorage && o.pattrstorage.slots ? o.pattrstorage.slots : null;
	var found = 0, rest = [];
	if (slots) {
		var ids = Object.keys(slots).map(Number).sort(function (x, y) { return x - y; });
		for (var i = 0; i < ids.length; i++) {
			var d = slots[ids[i]] && slots[ids[i]].data;
			var a = d ? normalized(d.gateroll) : null;
			if (!a) continue;
			if (ids[i] >= 1 && ids[i] <= NSEQ) seqs[ids[i] - 1] = a;
			else rest.push(a);
			found++;
		}
		for (var r = 0, k = 0; r < rest.length && k < NSEQ; k++) {
			if (!seqs[k]) seqs[k] = rest[r++];
		}
	}
	if (!found) seqs[0] = flat();
	cur = 0;
	post('dingus.gateRoll: ' + (found ? found + ' preset slots became sequences' : 'the current gates became sequence 1') + ', saved to ' + seqPath() + '\n');
}
migrate.local = 1;

function seqname(nm) {
	var name = String(nm);
	if (seqsLoaded && name === seqName) return;
	seqName = name;
	var o = readJSON(seqPath());
	var fresh = false;
	if (o && o.seqs) {
		for (var i = 0; i < NSEQ; i++) seqs[i] = (o.seqs[i] && o.seqs[i].length) ? o.seqs[i] : null;
		cur = Math.max(0, Math.min(NSEQ - 1, Math.round(o.current) || 0));
	} else {
		migrate();
		fresh = true;
	}
	seqsLoaded = true;
	pend = -1;
	queued = -1;
	loadSeq(seqs[cur]);
	writeBuffer();
	afterSwitch();
	if (fresh) saveSeqs();
}

function bang() {
	outlet(0, flat());
}

function labelwidth(v) {
	labelW = Math.max(0, v);
	mgraphics.redraw();
}

function msg_int(v) {
	if (inlet === 1 && v !== playhead) {
		playhead = v;
		mgraphics.redraw();
	}
}

function msg_float(v) {
	msg_int(Math.floor(v));
}

function list() {
	var a = arrayfromargs(arguments);
	if (inlet === 1 && a.length) msg_int(Math.floor(a[0]));
}

// --- mouse -------------------------------------------------
function laneValueAt(lane, r, y) {
	var norm = 1 - (y - r.top - 2) / (r.h - 4);
	return clampVal(lane, lane.lo + norm * (lane.hi - lane.lo));
}
laneValueAt.local = 1;

function setValueAtStep(lane, k, v) {
	if (lane.perStep) {
		if (skips[k] === v) return false;
		skips[k] = v;
		return true;
	}
	var gt = gateAtStep(k);
	if (!gt || gt[lane.key] === v) return false;
	gt[lane.key] = v;
	return true;
}
setValueAtStep.local = 1;

// gate whose end is within ENDGRAB px of x (gate lane only).
// Both the end of the filled part (LEN) and the end of the outline (steps owned) grab it;
// the closest one wins.
function endAt(x, y) {
	var r = laneRects()[0];
	if (y < r.top || y >= r.top + r.h) return null;
	var best = null, bestD = ENDGRAB + 1;
	for (var i = 0; i < gates.length; i++) {
		var gt = gates[i];
		var d = Math.min(Math.abs(x - xOf(gt.s + gt.dl + effLen(gt))), Math.abs(x - xOf(gt.s + gt.span)));
		if (d < bestD) { best = gt; bestD = d; }
	}
	return best;
}
endAt.local = 1;

function onidle(x, y, but, cmd, shift, capslock, option, ctrl) {
	var h = endAt(x, y);
	if (h !== hoverEnd) {
		hoverEnd = h;
		mgraphics.redraw();
	}
}
onidle.local = 1;

function onidleout() {
	if (hoverEnd) {
		hoverEnd = null;
		mgraphics.redraw();
	}
}
onidleout.local = 1;

function onclick(x, y, but, cmd, shift, capslock, option, ctrl) {
	drag = null;
	if (x < labelW) return;
	if (y >= dims()[1] - RANGEH) {
		// range strip: nearest end within 6 px, else move the window
		if (Math.abs(x - xOf(rStart)) <= 6) drag = { mode: 'rstart' };
		else if (Math.abs(x - xOf(rEnd + 1)) <= 6) drag = { mode: 'rend' };
		else if (posOf(x) >= rStart && posOf(x) < rEnd + 1) drag = { mode: 'rmove', grab: stepOf(x) - rStart };
		else if (posOf(x) < rStart) { rStart = stepOf(x); drag = { mode: 'rstart' }; changed(true); }
		else { rEnd = stepOf(x); drag = { mode: 'rend' }; changed(true); }
		return;
	}
	var r = laneAt(y);
	var k = stepOf(x);
	if (r.lane.key !== 'gate') {
		var v = laneValueAt(r.lane, r, y);
		drag = { mode: 'value', lane: r.lane, rect: r, lastK: k, lastV: v, y0: y, v0: v };
		if (setValueAtStep(r.lane, k, v)) changed(false);
		return;
	}
	var gt = endAt(x, y);
	if (gt) {
		drag = { mode: 'end', g: gt, moved: false };
		return;
	}
	gt = gateAtStep(k);
	if (gt) {
		drag = { mode: 'move', g: gt, grab: k - gt.s, moved: false, copy: !!option, cloned: false };
		return;
	}
	gt = { s: k, span: 1, f: 1, p: 1, r: 1, v: 1, d: 0.5, dl: 0, fd: 0 };
	gates.push(gt);
	drag = { mode: 'span', g: gt, k0: k, moved: true };
	changed(false);
}
onclick.local = 1;

function ondrag(x, y, but, cmd, shift, capslock, option, ctrl) {
	if (!drag) return;
	if (but === 0) {
		// mouse up
		if (drag.mode === 'move' && !drag.moved && !drag.copy) gates.splice(gates.indexOf(drag.g), 1);
		drag = null;
		changed(true);
		return;
	}
	var k = stepOf(x);
	var gt = drag.g;
	if (drag.mode === 'rstart' || drag.mode === 'rend' || drag.mode === 'rmove') {
		var b = Math.round(posOf(x));
		var ors = rStart, ore = rEnd;
		if (drag.mode === 'rstart') rStart = Math.max(0, Math.min(rEnd, b));
		else if (drag.mode === 'rend') rEnd = Math.max(rStart, Math.min(n - 1, b - 1));
		else {
			var wdt = rEnd - rStart;
			rStart = Math.max(0, Math.min(n - 1 - wdt, k - drag.grab));
			rEnd = rStart + wdt;
		}
		if (rStart !== ors || rEnd !== ore) changed(false);
		return;
	}
	if (drag.mode === 'value') {
		var lane = drag.lane;
		var v;
		if (shift && !lane.int) {
			// fine: vertical movement at 1/10 speed from the click point
			var r = drag.rect;
			v = clampVal(lane, drag.v0 - (y - drag.y0) / (r.h - 4) * (lane.hi - lane.lo) * 0.1);
			k = drag.lastK;
		} else {
			v = laneValueAt(lane, drag.rect, y);
		}
		var any = false;
		if (Math.abs(k - drag.lastK) > 1) {
			// fill skipped columns on fast drags
			var dir = k > drag.lastK ? 1 : -1;
			for (var q = drag.lastK + dir; q !== k; q += dir) {
				var t = (q - drag.lastK) / (k - drag.lastK);
				if (setValueAtStep(lane, q, clampVal(lane, drag.lastV + (v - drag.lastV) * t))) any = true;
			}
		}
		if (setValueAtStep(lane, k, v)) any = true;
		drag.lastK = k;
		drag.lastV = v;
		if (any) changed(false);
	} else if (drag.mode === 'end') {
		var raw = posOf(x) - gt.s - gt.dl;
		var L = option ? raw : Math.round(raw / Q) * Q;
		L = Math.max(option ? MINLEN : Q, Math.min(maxSpan(gt.s, gt), L));
		var sp = Math.max(1, Math.ceil(L - 1e-9));
		var fl = Math.max(MINLEN, L - (sp - 1));
		if (sp !== gt.span || Math.abs(fl - gt.f) > 1e-9) {
			gt.span = sp;
			gt.f = fl;
			drag.moved = true;
			changed(false);
		}
	} else if (drag.mode === 'span') {
		// the gate's end follows the pointer once it leaves the clicked step
		if (k === drag.k0 && !drag.moved) return;
		drag.moved = true;
		var span = Math.max(1, Math.min(maxSpan(gt.s, gt), k - gt.s + 1));
		if (span !== gt.span) {
			gt.span = span;
			changed(false);
		}
	} else if (drag.mode === 'move') {
		var s = Math.max(0, Math.min(n - gt.span, k - drag.grab));
		if (s === gt.s) return;
		if (drag.copy && !drag.cloned) {
			// option-drag: leave the original, drop a copy where the mouse goes
			if (!fits(s, gt.span, null)) return;
			var c = {};
			for (var key in gt) c[key] = gt[key];
			c.s = s;
			gates.push(c);
			drag.g = c;
			drag.cloned = true;
			drag.moved = true;
			drag.srcSkips = skips.slice(gt.s, gt.s + gt.span);   // SKIP is per step: carry it along
			drag.saved = null;
			copySkips(drag, s, c.span);
			changed(false);
			return;
		}
		drag.moved = true;
		if (!fits(s, gt.span, gt)) return;
		gt.s = s;
		if (drag.cloned) copySkips(drag, s, gt.span);
		changed(false);
	}
}
ondrag.local = 1;

// double-click on the range strip: full range
function ondblclick(x, y, but, cmd, shift, capslock, option, ctrl) {
	if (x < labelW || y < dims()[1] - RANGEH) return;
	drag = null;
	rStart = 0;
	rEnd = n - 1;
	changed(true);
}
ondblclick.local = 1;

// option-drag copy: put the original's SKIP values under the copy,
// giving back the steps the copy has left their own values
function copySkips(dr, s, span) {
	var i;
	if (dr.saved) {
		for (i = 0; i < dr.saved.vals.length; i++) skips[dr.saved.s + i] = dr.saved.vals[i];
	}
	dr.saved = { s: s, vals: skips.slice(s, s + span) };
	for (i = 0; i < span; i++) skips[s + i] = dr.srcSkips[i];
}
copySkips.local = 1;

// --- pattr -------------------------------------------------
// presets keep the sequence number (the sequences are in their own file)
function getvalueof() {
	return [-5, cur];
}

function setvalueof() {
	var a = arrayfromargs(arguments);
	if (!a.length) return;
	if (a[0] === -5) {
		seq(a[1]);
	} else if (!seqsLoaded) {
		// an older preset before the migration: its gates
		unflat(a);
		changed(false);
	}
}
