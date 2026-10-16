// ===========================================================
// dingus.gestureHead.js  (v8ui)
//
// Thin position strip for the gesture looper, above its roll (dingus.gestureRoll.js). The roll itself
// doesn't redraw during playback (a large redraw many times a second made the whole patch stutter);
// this small strip shows where the loop is instead.
//
// inlet 0:
//   float 0..1         position along the roll's time axis (from the roll's right outlet)
//   rec 0|1            recording: red, else orange
//   off                hide the marker (stopped)
// ===========================================================

autowatch = 1;
inlets = 1;
outlets = 0;

mgraphics.init();
mgraphics.relative_coords = 0;
mgraphics.autofill = 0;

var frac = -1;
var recording = 0;
var PLAYCOL = [0.98, 0.45, 0.10];
var RECCOL = [0.75, 0.22, 0.12];
var SAND = [0.75, 0.68, 0.50];

function msg_float(v) {
	var f = Math.max(0, Math.min(1, v));
	if (Math.abs(f - frac) < 0.0005) return;
	frac = f;
	mgraphics.redraw();
}
function msg_int(v) {
	msg_float(v);
}
function rec(v) {
	recording = v ? 1 : 0;
	mgraphics.redraw();
}
function off() {
	frac = -1;
	mgraphics.redraw();
}

function paint() {
	var g = mgraphics;
	var w = mgraphics.size[0],
		h = mgraphics.size[1];
	g.set_source_rgba(0.1, 0.1, 0.11, 1);
	g.rectangle(0, 0, w, h);
	g.fill();
	if (frac < 0) return;
	var x = frac * w;
	g.set_source_rgba(SAND[0], SAND[1], SAND[2], 0.35);
	g.rectangle(0, 0, x, h);
	g.fill();
	var c = recording ? RECCOL : PLAYCOL;
	g.set_source_rgba(c[0], c[1], c[2], 1);
	g.rectangle(Math.max(0, x - 2), 0, 4, h);
	g.fill();
}
