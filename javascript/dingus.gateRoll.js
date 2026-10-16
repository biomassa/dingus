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
//   DUTY   per gate: on-time of each ratchet hit (only with 2+ ratchets)
// value lanes: click / drag; shift = fine
// RANGE strip (bottom, 10 px): play range / sub-loop. drag an end = set it, drag the middle = move it,
//          double-click = full range
//
// inlet 0:
//   steps n         number of steps (gates beyond are deleted / cut, new steps get skip 1)
//   buffer name     buffer~ to write the gate table into
//   gates ...       set everything (stored format), no output
//   clear           delete all gates, reset skips
//   bang            output the stored list
//   labelwidth n    width of the lane-label column in pixels
// inlet 1:
//   int             current step (playhead)
// outlet 0: stored list after each edit; 'needbuffer' at load (answer with: buffer <name>);
//           'range start end' (0-based steps) for the gen~ engine
//
// stored list: -3 n rstart rend  skip_1 .. skip_n  then per gate: start span fill prob ratch vel duty delay
//   (-3 = format version; -2 = same without the range; no marker = old 7-field format, delay 0)
//
// buffer~ layout (frame = step, 9 channels):
//   1 played length in steps after delay/trim (0 = no gate starts here)
//   2 prob  3 ratchets  4 velocity  5 duty
//   6 reverse lookup: (start step + 1) of the gate whose played end falls in this step
//   7 reverse offset: fraction into that step where the mirrored gate starts
//   8 skip (chance the step is played)
//   9 delay (fraction of a step before the gate starts)
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
var NCH = 9;
var NFIELDS = 8;
var FORMAT = 3;

// --- state -------------------------------------------------
var n = 16;
var skips = [];        // per step, 0..1 (1 = always played)
var gates = [];        // {s, span, f, p, r, v, d, dl}
var playhead = -1;
var labelW = 44;
var bufName = '';
var rStart = 0;        // play range, first step (0-based)
var rEnd = 15;         // play range, last step
var RANGEH = 10;       // height of the range strip

// earthy lane colours; numbers sit on small dark labels so they read on any bar
var LW = 0.86 / 7;
var LANES = [
	{ key: 'gate', name: 'GATE', w: 0.14, col: [0.85, 0.65, 0.30] },     // ochre
	{ key: 'v', name: 'VEL', w: LW, lo: 0, hi: 1, col: [0.80, 0.42, 0.26] },        // terracotta
	{ key: 'f', name: 'LEN', w: LW, lo: 0.05, hi: 1, col: [0.62, 0.66, 0.38] },     // olive
	{ key: 'dl', name: 'DELAY', w: LW, lo: 0, hi: 1, col: [0.72, 0.52, 0.36] },     // clay
	{ key: 'p', name: 'PROB', w: LW, lo: 0, hi: 1, col: [0.45, 0.62, 0.42] },       // moss
	{ key: 'skip', name: 'SKIP', w: LW, lo: 0, hi: 1, perStep: 1, col: [0.42, 0.60, 0.62] }, // slate
	{ key: 'r', name: 'RATCH', w: LW, lo: 1, hi: 8, int: 1, col: [0.62, 0.47, 0.58] },     // dusty plum
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
	if (!bufName) return;
	var buf = new Buffer(bufName);
	if (buf.framecount() < MAXSTEPS || buf.channelcount() < NCH) {
		post('dingus.gateRoll: buffer~ ' + bufName + ' needs ' + MAXSTEPS + ' samples and ' + NCH + ' channels\n');
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
		var e = g.s + g.dl + L;
		var last = Math.ceil(e - 1e-9) - 1;
		if (last >= 0 && last < MAXSTEPS) {
			cols[5][last] = g.s + 1;
			cols[6][last] = Math.ceil(e - 1e-9) - e;
		}
	}
	for (c = 0; c < NCH; c++) buf.poke(c + 1, 0, cols[c]);
}
writeBuffer.local = 1;

// --- serialization -----------------------------------------
function flat() {
	var a = [-FORMAT, n, rStart, rEnd];
	var i;
	for (i = 0; i < n; i++) a.push(skips[i]);
	for (i = 0; i < gates.length; i++) {
		var g = gates[i];
		a.push(g.s, g.span, g.f, g.p, g.r, g.v, g.d, g.dl);
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
		nf = NFIELDS;
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
			dl: nf >= 8 ? Math.min(1, Math.max(0, a[i + 7])) : 0
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
	if (bufName) keep[bufName] = flat();
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
	park();
	writeBuffer();
	sendRange();
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
		var hh = gh * (0.3 + 0.7 * gt.v);
		if (on) g.set_source_rgba(Math.min(1, gc[0] + 0.15), Math.min(1, gc[1] + 0.2), Math.min(1, gc[2] + 0.25), 1);
		else g.set_source_rgba(gc[0], gc[1], gc[2], 1);
		for (k = 0; k < hits; k++) {
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
			var val = gt[lane.key];
			norm = (val - lane.lo) / (lane.hi - lane.lo);
			var inactive = lane.key === 'd' && gt.r <= 1;
			bh = Math.max(1, norm * (r.h - 4));
			if (inactive) g.set_source_rgba(0.40, 0.38, 0.36, 0.7);
			else g.set_source_rgba(lane.col[0], lane.col[1], lane.col[2], 0.9);
			g.rectangle(x0, r.top + r.h - 2 - bh, spanW, bh);
			g.fill();
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

function clear() {
	gates = [];
	skips = [];
	fillSkips();
	changed(true);
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
	gt = { s: k, span: 1, f: 1, p: 1, r: 1, v: 1, d: 0.5, dl: 0 };
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
function getvalueof() {
	return flat();
}

function setvalueof() {
	unflat(arrayfromargs(arguments));
	changed(false);
}
