// ===========================================================
// dingus.pitchGrid.js
//
// Step-pitch editor for Scala tunings (th.scala / th.stof).
// - columns = sequencer steps, rows = scale degrees (value = th.stof index)
// - row height is proportional to the interval (cents) to the next degree
// - label column shows degree, period and cents of each row
// - stores its own data for pattr / autopattr / pattrstorage
//   (give the jsui a scripting name)
//
// inlet 0:
//   list ...        set step values and output
//   setlist ...     set step values, no output
//   setstate -2 n values(n) delays(n) offs(n)   set everything, no output
//   bang            output step values
//   steps n         resize to n steps (keeps values, new steps copy the last one)
//   setmin n        lowest displayed value
//   setmax n        highest displayed value
//   dictionary name read tuning from a th.scala dict
//   labelwidth n    width of the label column in pixels
// inlet 1:
//   int             current step (playhead highlight)
//   snap 0/1        snap delay dragging to 1/4 step (alt-drag = free)
// outlet 0: list of step values (same format as the old multislider)
// outlet 1: "delays d1 d2 ..." and "offs o1 o2 ..." for dingus.pitchTiming.js
//
// mouse: click / drag up-down = pitch, drag a note sideways = delay (0..0.95 step),
//        double-click a note = delete it (the output keeps the previous pitch),
//        click an empty step = bring it back at that pitch
// stored (pattr): -2 n values(n) delays(n) offs(n)   (old format: values only)
// ===========================================================

inlets = 2;
outlets = 2;
autowatch = 1;

setinletassist(0, 'list/setlist/bang, steps, setmin, setmax, dictionary');
setinletassist(1, 'current step index (playhead)');
setoutletassist(0, 'step values (list)');
setoutletassist(1, 'delays / offs for dingus.pitchTiming.js');

mgraphics.init();
mgraphics.relative_coords = 0;
mgraphics.autofill = 0;

// --- state -------------------------------------------------
var values = [];        // one value per step (th.stof index)
var dels = [];          // per step: pitch change delay, fraction of a step
var offs = [];          // per step: 1 = deleted (output holds the previous pitch)
var snapOn = 1;
var Q = 0.25;
var MAXDEL = 0.95;
var drag = null;
var lo = 29;            // lowest displayed value
var hi = 64;            // highest displayed value
var playhead = -1;
var labelW = 78;
var lastStep = -1;
var lastVal = 0;

// default tuning: 12-TET, until a dictionary arrives
var scl = {
	size: 12,
	center: 69,
	range: 1200,
	cents: [0, 100, 200, 300, 400, 500, 600, 700, 800, 900, 1000, 1100]
};

// row geometry, rebuilt by layout()
var rows = [];          // {v, top, h, d, p, c}

// --- tuning helpers ----------------------------------------
function degreeOf(v) {
	return ((v - scl.center) % scl.size + scl.size) % scl.size;
}
degreeOf.local = 1;

function periodOf(v) {
	return Math.floor((v - scl.center) / scl.size);
}
periodOf.local = 1;

function intervalAbove(d) {
	var next = (d + 1 < scl.size) ? scl.cents[d + 1] : scl.range;
	return Math.max(1, next - scl.cents[d]);
}
intervalAbove.local = 1;

// --- layout ------------------------------------------------
function dims() {
	return [box.rect[2] - box.rect[0], box.rect[3] - box.rect[1]];
}
dims.local = 1;

function layout() {
	var h = dims()[1];
	rows = [];
	if (hi < lo) return;
	var total = 0;
	var v;
	for (v = lo; v <= hi; v++) total += intervalAbove(degreeOf(v));
	// stack rows from the bottom (lo) to the top (hi)
	var y = h;
	for (v = lo; v <= hi; v++) {
		var d = degreeOf(v);
		var rh = intervalAbove(d) / total * h;
		y -= rh;
		rows.push({ v: v, top: y, h: rh, d: d, p: periodOf(v), c: scl.cents[d] });
	}
}
layout.local = 1;

function rowOfValue(v) {
	var i = Math.min(hi, Math.max(lo, v)) - lo;
	return rows[i];
}
rowOfValue.local = 1;

function valueAtY(y) {
	if (!rows.length) return lo;
	if (y <= rows[rows.length - 1].top) return hi;
	for (var i = 0; i < rows.length; i++) {
		if (y >= rows[i].top) return rows[i].v;
	}
	return lo;
}
valueAtY.local = 1;

function stepAtX(x) {
	var w = dims()[0];
	var n = values.length;
	if (n < 1) return -1;
	var colW = (w - labelW) / n;
	return Math.min(n - 1, Math.max(0, Math.floor((x - labelW) / colW)));
}
stepAtX.local = 1;

// --- drawing -----------------------------------------------
function paint() {
	var wh = dims();
	var w = wh[0], h = wh[1];
	var n = values.length;
	var gridW = w - labelW;
	var colW = n > 0 ? gridW / n : gridW;
	var i, r;

	with (mgraphics) {
		// background
		set_source_rgba(0, 0, 0, 1);
		rectangle(0, 0, w, h);
		fill();

		// period bands + row lines
		for (i = 0; i < rows.length; i++) {
			r = rows[i];
			if (((r.p % 2) + 2) % 2 === 0) set_source_rgba(0.10, 0.10, 0.11, 1);
			else set_source_rgba(0.15, 0.15, 0.17, 1);
			rectangle(labelW, r.top, gridW, r.h);
			fill();
			if (r.h >= 3) {
				set_source_rgba(0.22, 0.22, 0.24, 1);
				set_line_width(0.5);
				move_to(labelW, r.top);
				line_to(w, r.top);
				stroke();
			}
		}

		// playhead column
		if (playhead >= 0 && playhead < n) {
			set_source_rgba(0.30, 0.07, 0.07, 1);
			rectangle(labelW + playhead * colW, 0, colW, h);
			fill();
		}

		// period boundaries (bottom edge of each degree-0 row)
		for (i = 0; i < rows.length; i++) {
			r = rows[i];
			if (r.d === 0) {
				set_source_rgba(0.55, 0.55, 0.58, 1);
				set_line_width(1);
				move_to(0, r.top + r.h);
				line_to(w, r.top + r.h);
				stroke();
			}
		}

		// column separators
		set_source_rgba(0.25, 0.25, 0.27, 1);
		set_line_width(0.5);
		for (i = 1; i < n; i++) {
			move_to(labelW + i * colW, 0);
			line_to(labelW + i * colW, h);
			stroke();
		}

		// step cells
		syncLen();
		for (i = 0; i < n; i++) {
			var v = values[i];
			if (offs[i]) {
				// deleted: thin dashed hint at the bottom of the column
				set_source_rgba(0.45, 0.42, 0.38, 0.8);
				rectangle(labelW + i * colW + colW * 0.3, h - 3, colW * 0.4, 2);
				fill();
				continue;
			}
			var shift = (dels[i] || 0) * colW;
			var x0 = labelW + i * colW + 1 + shift;
			var cw = Math.max(2, colW - 2 - shift);
			if (v < lo || v > hi) {
				// out of the displayed range: triangle at the edge
				set_source_rgba(0.98, 0.45, 0.10, 1);
				var up = v > hi;
				var ty = up ? 0 : h;
				var dy = up ? 8 : -8;
				move_to(x0 + cw / 2 - 5, ty);
				line_to(x0 + cw / 2 + 5, ty);
				line_to(x0 + cw / 2, ty + dy);
				close_path();
				fill();
				continue;
			}
			r = rowOfValue(v);
			set_source_rgba(0.85, 0.65, 0.30, 1);   // ochre, as the notes of the other rolls
			rectangle(x0, r.top, cw, Math.max(2, r.h));
			fill();
		}

		// label column
		set_source_rgba(0.06, 0.06, 0.07, 1);
		rectangle(0, 0, labelW, h);
		fill();
		// labels: fixed readable size, placed where they fit without overlapping.
		// period starts (degree 0) get placed first, then the other rows.
		select_font_face("Arial");
		var fs = 9;
		set_font_size(fs);
		var placed = [];
		var pass, cy, y0, y1, ok, j;
		for (pass = 0; pass < 2; pass++) {
			for (i = 0; i < rows.length; i++) {
				r = rows[i];
				var periodRow = (r.d === 0);
				if ((pass === 0) !== periodRow) continue;
				cy = Math.min(h - fs / 2 - 1, Math.max(fs / 2 + 1, r.top + r.h / 2));
				y0 = cy - fs / 2 - 1;
				y1 = cy + fs / 2 + 1;
				ok = true;
				for (j = 0; j < placed.length; j++) {
					if (y0 < placed[j][1] && y1 > placed[j][0]) { ok = false; break; }
				}
				if (!ok) continue;
				placed.push([y0, y1]);
				var ty2 = cy + fs * 0.35;
				if (periodRow) set_source_rgba(1, 0.85, 0.4, 1);
				else set_source_rgba(0.75, 0.75, 0.78, 1);
				move_to(3, ty2);
				show_text(String(r.d));
				move_to(22, ty2);
				show_text("p" + r.p);
				var ct = (Math.round(r.c * 10) / 10) + "";
				var tw = text_measure(ct)[0];
				move_to(labelW - 4 - tw, ty2);
				show_text(ct);
			}
		}
		set_source_rgba(0.35, 0.35, 0.38, 1);
		set_line_width(1);
		move_to(labelW, 0);
		line_to(labelW, h);
		stroke();
	}
}
paint.local = 1;

function redraw() {
	mgraphics.redraw();
}
redraw.local = 1;

function onresize() {
	layout();
	redraw();
}
onresize.local = 1;

// --- data in / out -----------------------------------------
// keep delays / deleted flags as long as the value list
function syncLen() {
	while (dels.length < values.length) dels.push(0);
	while (offs.length < values.length) offs.push(0);
	if (dels.length > values.length) dels.length = values.length;
	if (offs.length > values.length) offs.length = values.length;
}
syncLen.local = 1;

function sendTiming() {
	syncLen();
	if (!values.length) return;
	outlet(1, "delays", dels);
	outlet(1, "offs", offs);
}
sendTiming.local = 1;

function output() {
	if (values.length) outlet(0, values);
	sendTiming();
}
output.local = 1;

function toInts(a) {
	var out = [];
	for (var i = 0; i < a.length; i++) out.push(Math.round(a[i]));
	return out;
}
toInts.local = 1;

function list() {
	var a = arrayfromargs(arguments);
	if (inlet === 1) {
		if (a.length) msg_int(a[0]);
		return;
	}
	values = toInts(a);
	syncLen();
	redraw();
	notifyclients();
	output();
}

// setstate -2 n values(n) delays(n) offs(n): everything at once, no output (sequence switches)
function setstate() {
	var a = arrayfromargs(arguments);
	if (a.length < 2 || a[0] >= 0) return;
	var n = Math.max(1, Math.round(a[1]));
	values = toInts(a.slice(2, 2 + n));
	dels = a.slice(2 + n, 2 + 2 * n);
	offs = toInts(a.slice(2 + 2 * n, 2 + 3 * n));
	syncLen();
	if (playhead >= values.length) playhead = -1;
	redraw();
	notifyclients();
}

function setlist() {
	values = toInts(arrayfromargs(arguments));
	syncLen();
	redraw();
	notifyclients();
	sendTiming();
}

function msg_int(v) {
	if (inlet === 1) {
		playhead = v;
		redraw();
		return;
	}
	// single int on the left inlet: one-step sequence
	list(v);
}

function msg_float(v) {
	msg_int(Math.round(v));
}

function bang() {
	output();
}

function steps(n) {
	n = Math.max(1, Math.round(n));
	var fill = values.length ? values[values.length - 1] : lo;
	while (values.length < n) values.push(fill);
	if (values.length > n) values.length = n;
	syncLen();
	if (playhead >= n) playhead = -1;
	redraw();
	notifyclients();
	sendTiming();
}

function snap(v) {
	snapOn = v ? 1 : 0;
}

function setmin(v) {
	lo = Math.round(v);
	layout();
	redraw();
}

function setmax(v) {
	hi = Math.round(v);
	layout();
	redraw();
}

function labelwidth(v) {
	labelW = Math.max(0, v);
	redraw();
}

function dictionary(name) {
	var dct = new Dict(name);
	var size_ = dct.get("size");
	var cents = dct.get("cents");
	if (!size_ || !cents) return;
	scl.size = size_;
	scl.cents = (typeof cents === "object") ? cents.slice(0, size_) : [cents];
	scl.range = dct.get("range") || 1200;
	scl.center = dct.get("center");
	if (scl.center === null || scl.center === undefined) scl.center = 69;
	layout();
	redraw();
}

// --- mouse -------------------------------------------------
function edit(x, y, isDrag) {
	if (!values.length) return;
	if (!isDrag && x < labelW) return;
	var s = stepAtX(x);
	var v = valueAtY(y);
	if (s < 0) return;
	if (isDrag && lastStep >= 0 && Math.abs(s - lastStep) > 1) {
		// fill skipped columns on fast drags
		var dir = s > lastStep ? 1 : -1;
		for (var k = lastStep + dir; k !== s; k += dir) {
			var t = (k - lastStep) / (s - lastStep);
			values[k] = Math.round(lastVal + (v - lastVal) * t);
		}
	}
	var changed = values[s] !== v || (isDrag && s !== lastStep);
	values[s] = v;
	lastStep = s;
	lastVal = v;
	if (changed) {
		redraw();
		notifyclients();
		output();
	}
}
edit.local = 1;

function colWidth() {
	return (dims()[0] - labelW) / Math.max(1, values.length);
}
colWidth.local = 1;

function onclick(x, y, but, cmd, shift, capslock, option, ctrl) {
	lastStep = -1;
	drag = null;
	if (!values.length || x < labelW) return;
	var s = stepAtX(x);
	if (offs[s]) {
		// empty step: bring the note back at the clicked pitch
		offs[s] = 0;
		edit(x, y, false);
		redraw();
		notifyclients();
		sendTiming();
		drag = { mode: "pitch" };
		return;
	}
	if (valueAtY(y) === values[s]) {
		// on the note: sideways = delay, up/down = pitch (decided once the mouse moves)
		drag = { mode: "undecided", s: s, x0: x, y0: y, d0: dels[s] || 0 };
		return;
	}
	edit(x, y, false);
	drag = { mode: "pitch" };
}
onclick.local = 1;

function ondrag(x, y, but, cmd, shift, capslock, option, ctrl) {
	if (but === 0) {
		lastStep = -1;
		drag = null;
		return;
	}
	if (!drag) return;
	if (drag.mode === "undecided") {
		var dx = x - drag.x0, dy = y - drag.y0;
		if (Math.abs(dx) < 4 && Math.abs(dy) < 4) return;
		drag.mode = Math.abs(dx) >= Math.abs(dy) ? "delay" : "pitch";
		if (drag.mode === "pitch") lastStep = -1;
	}
	if (drag.mode === "delay") {
		var d = drag.d0 + (x - drag.x0) / colWidth();
		if (snapOn && !option) d = Math.round(d / Q) * Q;
		d = Math.max(0, Math.min(MAXDEL, d));
		if (d !== dels[drag.s]) {
			dels[drag.s] = d;
			redraw();
			notifyclients();
			sendTiming();
		}
		return;
	}
	edit(x, y, true);
}
ondrag.local = 1;

function ondblclick(x, y, but, cmd, shift, capslock, option, ctrl) {
	drag = null;
	if (!values.length || x < labelW) return;
	var s = stepAtX(x);
	offs[s] = 1;
	dels[s] = 0;
	redraw();
	notifyclients();
	sendTiming();
}
ondblclick.local = 1;

// --- pattr -------------------------------------------------
function getvalueof() {
	if (!values.length) return [lo];
	syncLen();
	return [-2, values.length].concat(values, dels, offs);
}

function setvalueof() {
	var a = arrayfromargs(arguments);
	if (a.length && a[0] < 0) {
		var n = Math.max(1, Math.round(a[1]));
		values = toInts(a.slice(2, 2 + n));
		dels = a.slice(2 + n, 2 + 2 * n);
		offs = toInts(a.slice(2 + 2 * n, 2 + 3 * n));
	} else {
		values = toInts(a);    // old format: values only
		dels = [];
		offs = [];
	}
	syncLen();
	redraw();
	output();
}

layout();
