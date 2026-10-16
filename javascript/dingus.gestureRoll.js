// ===========================================================
// dingus.gestureRoll.js  (v8ui)
//
// Piano roll for the gesture looper (dingus.gestureLoop.js; spec: this package,
// docs/gesture-looper.md). Shows the current sequence with all its MPE data:
//   x = time (steps; bar lines every barsteps), y = pitch in pads
//   each note = its pitch trace: starts on its pad's row and follows the bend (in pads, bendrange),
//   line thickness = pressure, colour = Y as lightness of the side's hue (left split ochre, right
//   moss green: dark to light), dot at the start = strike velocity (bone), tick at the end = lift velocity
//   (clay); notes outside the loop range warm grey, cut notes (no free channel) charcoal, sounding
//   selection = bone halo. No playhead in the roll (redrawing it during playback made the patch stutter):
//   outlet 1 drives a thin strip (dingus.gestureHead.js) with the position 0..1 along the time axis
//   lanes below for the selected notes (all notes, faint, when none is selected):
//   PRESS, Y, BEND (pads), VEL (strike bar at the start, lift bar at the end; drag a bar up/down, all
//   selected notes when it is selected), PROB (playback probability:
//   drag a bar up/down, all selected notes when it is selected; double-click = 100%; less likely notes
//   are drawn fainter in the roll)
//
// MOUSE  click a note = select it (shift = add/remove), click empty = clear, drag empty = select a box
//        drag a selected note's body = shift the selection in time (snap to the grid, cmd = free)
//        option-drag = move a copy of the selection (the copies are selected afterwards)
//        drag a note's start or end = trim it (snap, alt = free)
//        double-click a note = delete it
//        LOOP strip (top): drag an end, or the middle to move the range (loopsnap, alt = free)
//        bar-number row: drag sideways = scroll, drag up/down = zoom in/out, double-click = whole sequence
//
// [v8ui dingus.gestureRoll.js <dict>]   <dict> = the looper's Dict (key seq)
// inlet 0:
//   loadseq [dict]      re-read the sequence from the Dict (the looper sends its name; not 'refresh',
//                       which is a built-in v8ui message)
//   pos c a b           loop position (to the strip on outlet 1; no redraw)
//   state s             rec / play / dub (overdubbing) / stop
//   bendrange n         pads per full bend (default 48, like the LinnStrument setup)
//   barsteps n          steps per bar (default 4)
//   snap q              grid for moves and trims in steps (0 = free; default 0.25)
//   loopsnap m          loop bounds: 0 free, 1 step, 2 bar (default 2)
//   zones lo hi lo hi   per-note channels of the two sides (default 2 8 9 15)
//   note id 1|0|-1      a note sounds / ends / was cut (from the looper)
//   deleteselected / clearsel
// outlet 0: edits for the looper: move dt id..., copy dt id..., trim id start|end t, loop a b, delete id...
// outlet 1: to the strip: position 0..1, rec 0|1, off
// ===========================================================

autowatch = 1;
inlets = 1;
outlets = 2;

mgraphics.init();
mgraphics.relative_coords = 0;
mgraphics.autofill = 0;

var args = typeof jsarguments !== "undefined" ? jsarguments : [];
var dictName = args.length > 1 ? String(args[1]) : "";

var LABELW = 34;
var RANGEH = 14;
var HEADER = 16; // bar numbers; drag here to scroll / zoom
var LANEH = 38;
var LANES = ["PRESS", "Y", "BEND", "VEL", "PROB"];
var ENDGRAB = 6;

var seq = { length: 0, loopStart: 0, loopEnd: 0, notes: [] };
var geo = {}; // note id -> samples
var bendRange = 48;
var barSteps = 4;
var snapQ = 0.25;
var loopSnap = 2;
var zone = [[2, 8], [9, 15]];
var sel = {}; // selected ids
var playPos = -1;
var playState = "stop";
var drag = null;

// earth palette (like dingusPGRoll): per side a hue from dark (Y 0) to light (Y 127)
var SIDECOL = [
	[[0.32, 0.21, 0.08], [0.97, 0.86, 0.58]], // left: ochre (umber to sand)
	[[0.10, 0.20, 0.06], [0.78, 0.94, 0.55]], // right: moss green (dark olive to pale lime)
];
// lanes: one saturated colour per side (the light ends of the two hues look alike in thin lines)
var LANECOL = [
	[0.90, 0.66, 0.22], // left: ochre
	[0.48, 0.78, 0.28], // right: moss green
];
// lane backgrounds: a slight earth tint each (PRESS, Y, BEND, VEL, PROB)
var LANEBG = [
	[0.135, 0.105, 0.085], // clay
	[0.12, 0.12, 0.09], // sand-olive
	[0.085, 0.105, 0.125], // slate
	[0.125, 0.09, 0.105], // plum-brown
	[0.09, 0.115, 0.115], // grey-teal
];
var GREYCOL = [0.45, 0.42, 0.38]; // outside the loop range: won't play
var CUTCOL = [0.26, 0.24, 0.23]; // cut: no free channel (charcoal)
var BONE = [0.95, 0.92, 0.85];
var CLAY = [0.70, 0.45, 0.38];
var noteState = {}; // id -> 1 sounding, -1 cut (from the looper)

// --- data ---
function loadseq(nm) {
	if (nm) dictName = String(nm);
	if (!dictName) return;
	try {
		var d = new Dict(dictName);
		var o = JSON.parse(d.stringify());
		seq = o.seq || { length: 0, loopStart: 0, loopEnd: 0, notes: [] };
		if (o.select && o.select.length) {
			sel = {};
			[].concat(o.select).forEach(function (id) {
				sel[id] = 1;
			});
		}
		if (!seq.notes) seq.notes = [];
		// from the Dict form ({t, m} records) back to [t, ...message] / [message]
		seq.notes.forEach(function (n) {
			n.pre = (n.pre || []).map(function (r) {
				return r && r.m ? [].concat(r.m) : r;
			});
			n.ev = (n.ev || []).map(function (r) {
				return r && r.m ? [r.t].concat(r.m) : r;
			});
		});
	} catch (e) {
		seq = { length: 0, loopStart: 0, loopEnd: 0, notes: [] };
	}
	setSeq(seq);
}
function setSeq(s) {
	seq = s;
	geo = {};
	var ids = {};
	seq.notes.forEach(function (n) {
		geo[n.id] = samples(n);
		ids[n.id] = 1;
	});
	for (var id in sel) if (!ids[id]) delete sel[id];
	invalidate();
}
setSeq.local = 1;

// a note's values over time: [{t, bend (pads), press 0..127, y 0..127}], from its starting values and
// its events (t = time from the note's start)
function samples(n) {
	var st = { bend: 0, press: 0, y: 0 };
	function apply(m) {
		var h = m[0] & 0xf0;
		if (h === 0xe0) st.bend = ((m[1] + m[2] * 128 - 8192) / 8192) * bendRange;
		else if (h === 0xd0) st.press = m[1];
		else if (h === 0xa0 && m[1] === n.note) st.press = m[2];
		else if (h === 0xb0 && m[1] === 74) st.y = m[2];
	}
	(n.pre || []).forEach(apply);
	var r = [{ t: 0, bend: st.bend, press: st.press, y: st.y }];
	(n.ev || []).forEach(function (e) {
		if (e[0] > n.len) return;
		apply(e.slice(1));
		var last = r[r.length - 1];
		if (e[0] === last.t) {
			last.bend = st.bend;
			last.press = st.press;
			last.y = st.y;
		} else r.push({ t: e[0], bend: st.bend, press: st.press, y: st.y });
	});
	return r;
}
samples.local = 1;

function sideOf(ch) {
	for (var s = 0; s < 2; s++) if (ch >= zone[s][0] && ch <= zone[s][1]) return s;
	return 0;
}
sideOf.local = 1;

// --- view ---
function dims() {
	return mgraphics.size;
}
dims.local = 1;
function lanesH() {
	var h = dims()[1];
	return Math.min(LANES.length * LANEH, Math.max(0, h - RANGEH - HEADER - 80));
}
lanesH.local = 1;
function rollTop() {
	return RANGEH + HEADER;
}
rollTop.local = 1;
function rollBot() {
	return dims()[1] - lanesH();
}
rollBot.local = 1;
function tSpan() {
	var end = Math.max(seq.length || 0, seq.loopEnd || 0);
	seq.notes.forEach(function (n) {
		end = Math.max(end, n.start + n.len);
	});
	if (playState === "rec") end = Math.max(end, playPos);
	var lo = 0;
	seq.notes.forEach(function (n) {
		lo = Math.min(lo, n.start);
	});
	if (end - lo <= 0) end = lo + barSteps;
	return [lo, end];
}
tSpan.local = 1;
// horizontal view: zoom 1 = the whole sequence; above 1 a part of it starting at viewStart
var zoom = 1;
var viewStart = 0;
var MAXZOOM = 64;
function viewSpan() {
	var sp = tSpan();
	if (zoom <= 1) return sp;
	var wd = (sp[1] - sp[0]) / zoom;
	var a = Math.max(sp[0], Math.min(sp[1] - wd, viewStart));
	return [a, a + wd];
}
viewSpan.local = 1;
function xOf(t) {
	var sp = viewSpan();
	var w = dims()[0];
	return LABELW + ((t - sp[0]) / (sp[1] - sp[0])) * (w - LABELW - 4);
}
xOf.local = 1;
function tOf(x) {
	var sp = viewSpan();
	var w = dims()[0];
	return sp[0] + ((x - LABELW) / (w - LABELW - 4)) * (sp[1] - sp[0]);
}
tOf.local = 1;
function pSpan() {
	var lo = Infinity,
		hi = -Infinity;
	seq.notes.forEach(function (n) {
		(geo[n.id] || []).forEach(function (s) {
			lo = Math.min(lo, n.note + s.bend);
			hi = Math.max(hi, n.note + s.bend);
		});
	});
	if (lo === Infinity) {
		lo = 54;
		hi = 66;
	}
	lo = Math.floor(lo) - 1;
	hi = Math.ceil(hi) + 1;
	if (hi - lo < 12) {
		var c = (hi + lo) / 2;
		lo = Math.floor(c - 6);
		hi = lo + 12;
	}
	return [lo, hi];
}
pSpan.local = 1;
// centre of pad p's row (rows lo..hi-1)
function yOf(p) {
	var sp = pSpan();
	var top = rollTop();
	return top + (sp[1] - p - 0.5) * rowH();
}
yOf.local = 1;
function rowH() {
	var sp = pSpan();
	return (rollBot() - rollTop()) / (sp[1] - sp[0]);
}
rowH.local = 1;
function thick(press) {
	var mx = Math.max(3, Math.min(14, rowH() * 0.9));
	return 1.2 + (press / 127) * mx;
}
thick.local = 1;

// the note's trace with a time offset (drag preview): [[x, y, press, yval]]
function trace(n, dt, cut) {
	var pts = [];
	var s = geo[n.id] || [];
	var t0 = cut ? cut[0] : 0,
		t1 = cut ? cut[1] : n.len;
	for (var i = 0; i < s.length; i++) {
		var a = s[i];
		if (i + 1 < s.length && s[i + 1].t <= t0) continue; // wholly before a trimmed start
		var ta = Math.max(t0, a.t);
		var tb = i + 1 < s.length ? Math.min(t1, s[i + 1].t) : t1;
		if (tb < ta) continue;
		// each value holds until the next event
		pts.push([xOf(n.start + dt + ta), yOf(n.note + a.bend), a.press, a.y]);
		pts.push([xOf(n.start + dt + tb), yOf(n.note + a.bend), a.press, a.y]);
		if (i + 1 >= s.length || s[i + 1].t >= t1) break;
	}
	return pts;
}
trace.local = 1;

// preview offsets while dragging
// a move shifts the selected notes while dragging; a copy leaves them and draws the copies apart
function dtOf(n) {
	return drag && drag.kind === "move" && !drag.copy && sel[n.id] ? drag.dt : 0;
}
dtOf.local = 1;
function cutOf(n) {
	if (!drag || drag.kind !== "trim" || drag.id !== n.id) return null;
	if (drag.which === "start") return [Math.max(0, Math.min(n.len, drag.t - n.start)), n.len];
	return [0, Math.max(0, drag.t - n.start)];
}
cutOf.local = 1;

// strike / lift velocity of a note (the dragged value while its VEL bar is dragged)
function velOf(n, which) {
	if (drag && drag.kind === "vel" && drag.which === which && drag.ids.indexOf(n.id) >= 0) return drag.v;
	return which === "lift" ? n.off : n.vel;
}
velOf.local = 1;
// bars of the VEL ("vel": strike at each note's start, lift at its end) or PROB lane ("prob": one at
// each start). Bars closer than BARGAP px (a chord) are spread side by side, lowest note first, so each
// can be seen and grabbed; drawing and grabbing use these positions.
var BARGAP = 5;
function barLayout(kind) {
	var bars = [];
	laneNotes().forEach(function (n) {
		var dt = dtOf(n);
		bars.push({ n: n, which: "strike", x: xOf(n.start + dt) });
		if (kind === "vel") bars.push({ n: n, which: "lift", x: xOf(n.start + dt + n.len) });
	});
	bars.sort(function (a, b) {
		return a.x - b.x || a.n.note - b.n.note;
	});
	for (var i = 0; i < bars.length; ) {
		var j = i + 1;
		while (j < bars.length && bars[j].x - bars[j - 1].x < BARGAP) j++;
		for (var k = i + 1; k < j; k++) bars[k].x = bars[i].x + (k - i) * BARGAP;
		i = j;
	}
	return bars;
}
barLayout.local = 1;
// the bar at x (nearest within half a gap, or 6 px for a lone bar), or null
function barAt(kind, x) {
	var best = null,
		bd = Infinity;
	var bars = barLayout(kind);
	bars.forEach(function (b, i) {
		var d = Math.abs(b.x - x);
		var near = (i > 0 && b.x - bars[i - 1].x <= BARGAP) || (i + 1 < bars.length && bars[i + 1].x - b.x <= BARGAP);
		if (d <= (near ? BARGAP / 2 : 6) && d < bd) {
			bd = d;
			best = b;
		}
	});
	return best;
}
barAt.local = 1;
function velAtY(y, which) {
	var lh = lanesH() / LANES.length;
	var v = Math.round(((laneTop("VEL") + lh - 2 - y) / (lh - 4)) * 127);
	return Math.max(which === "lift" ? 0 : 1, Math.min(127, v));
}
velAtY.local = 1;

// playback probability of a note (the dragged value while its PROB bar is dragged)
function probOf(n) {
	if (drag && drag.kind === "prob" && drag.ids.indexOf(n.id) >= 0) return drag.v;
	return n.prob === undefined ? 1 : n.prob;
}
probOf.local = 1;
// the notes shown in the lanes: the selected ones, or all when none is selected
function laneNotes() {
	var s = seq.notes.filter(function (n) {
		return sel[n.id];
	});
	return s.length ? s : seq.notes;
}
laneNotes.local = 1;
function laneTop(name) {
	return rollBot() + LANES.indexOf(name) * (lanesH() / LANES.length);
}
laneTop.local = 1;
function probAtY(y) {
	var lh = lanesH() / LANES.length;
	var v = (laneTop("PROB") + lh - 2 - y) / (lh - 4);
	return Math.round(Math.max(0, Math.min(1, v)) * 100) / 100;
}
probAtY.local = 1;

// --- hit testing ---
function distSeg(px, py, a, b) {
	var dx = b[0] - a[0],
		dy = b[1] - a[1];
	var l2 = dx * dx + dy * dy;
	var u = l2 ? Math.max(0, Math.min(1, ((px - a[0]) * dx + (py - a[1]) * dy) / l2)) : 0;
	var x = a[0] + u * dx - px,
		y = a[1] + u * dy - py;
	return Math.sqrt(x * x + y * y);
}
distSeg.local = 1;
// {n, part: "start"|"end"|"body"} or null; the topmost (last drawn) note wins
function hitNote(x, y) {
	for (var k = seq.notes.length - 1; k >= 0; k--) {
		var n = seq.notes[k];
		var pts = trace(n, 0, null);
		if (!pts.length) continue;
		var best = Infinity,
			reach = 4;
		for (var i = 0; i + 1 < pts.length; i++) {
			best = Math.min(best, distSeg(x, y, pts[i], pts[i + 1]));
			reach = Math.max(reach, thick(pts[i][2]) / 2 + 3);
		}
		if (pts.length === 1) best = Math.hypot(x - pts[0][0], y - pts[0][1]);
		if (best > reach) continue;
		var xs = pts[0][0],
			xe = pts[pts.length - 1][0];
		if (Math.abs(x - xe) <= ENDGRAB && xe - xs > ENDGRAB * 2) return { n: n, part: "end" };
		if (Math.abs(x - xs) <= ENDGRAB && xe - xs > ENDGRAB * 2) return { n: n, part: "start" };
		return { n: n, part: "body" };
	}
	return null;
}
hitNote.local = 1;

function snapTo(t, q) {
	return q > 0 ? Math.round(t / q) * q : t;
}
snapTo.local = 1;
function loopQ() {
	return loopSnap === 2 ? barSteps : loopSnap === 1 ? 1 : 0;
}
loopQ.local = 1;

// --- mouse ---
function onclick(x, y, but, cmd, shift, capslock, option, ctrl) {
	drag = null;
	if (y < RANGEH) {
		var xa = xOf(seq.loopStart),
			xb = xOf(seq.loopEnd);
		var which = Math.abs(x - xa) <= ENDGRAB ? "a" : Math.abs(x - xb) <= ENDGRAB ? "b" : x > xa && x < xb ? "mid" : null;
		if (which && seq.length) drag = { kind: "loop", which: which, x0: x, a: seq.loopStart, b: seq.loopEnd, alt: option };
		return;
	}
	if (y < RANGEH + HEADER) {
		// bar-number row: drag sideways = scroll, up/down = zoom around the grabbed point
		drag = { kind: "view", x0: x, y0: y, start0: viewSpan()[0], zoom0: zoom };
		return;
	}
	if (y >= rollBot()) {
		// VEL lane: drag a strike (start) or lift (end) bar up/down (all selected notes when it is selected)
		var lh = lanesH() / LANES.length;
		if (y >= laneTop("VEL") && y < laneTop("VEL") + lh) {
			var vb = barAt("vel", x);
			if (vb) {
				var vids = sel[vb.n.id] ? Object.keys(sel).map(Number) : [vb.n.id];
				drag = { kind: "vel", which: vb.which, ids: vids, v: velAtY(y, vb.which) };
				invalidate();
			}
			return;
		}
		// PROB lane: drag a note's bar up/down (all selected notes when it is selected)
		if (y >= laneTop("PROB") && y < laneTop("PROB") + lh) {
			var pb = barAt("prob", x);
			var pn = pb ? pb.n : null;
			if (pn) {
				var ids = sel[pn.id] ? Object.keys(sel).map(Number) : [pn.id];
				drag = { kind: "prob", ids: ids, v: probAtY(y) };
				invalidate();
			}
		}
		return;
	}
	var h = hitNote(x, y);
	if (h) {
		var id = h.n.id;
		if (shift) {
			if (sel[id]) delete sel[id];
			else sel[id] = 1;
		} else if (!sel[id]) {
			sel = {};
			sel[id] = 1;
		}
		// option = move a copy, cmd = free (no snap)
		if (h.part === "body" && sel[id]) drag = { kind: "move", x0: x, dt: 0, copy: !!option, free: !!cmd };
		else if (h.part !== "body") drag = { kind: "trim", id: id, which: h.part, t: h.part === "start" ? h.n.start : h.n.start + h.n.len, alt: option };
	} else {
		if (!shift) sel = {};
		drag = { kind: "box", x0: x, y0: y, x1: x, y1: y };
	}
	invalidate();
}
function ondrag(x, y, but, cmd, shift, capslock, option, ctrl) {
	if (!drag) return;
	var alt = option || drag.alt;
	if (drag.kind === "move") drag.dt = cmd || drag.free ? tOf(x) - tOf(drag.x0) : snapTo(tOf(x) - tOf(drag.x0), snapQ);
	else if (drag.kind === "trim") drag.t = alt ? tOf(x) : snapTo(tOf(x), snapQ);
	else if (drag.kind === "loop") {
		var q = alt ? 0 : loopQ();
		var d = tOf(x) - tOf(drag.x0);
		if (drag.which === "a") drag.na = Math.min(snapTo(drag.a + d, q), drag.b - 0.01);
		else if (drag.which === "b") drag.nb = Math.max(snapTo(drag.b + d, q), drag.a + 0.01);
		else {
			var a = snapTo(drag.a + d, q);
			drag.na = a;
			drag.nb = a + (drag.b - drag.a);
		}
	} else if (drag.kind === "box") {
		drag.x1 = x;
		drag.y1 = y;
	} else if (drag.kind === "prob") {
		drag.v = probAtY(y);
	} else if (drag.kind === "vel") {
		drag.v = velAtY(y, drag.which);
	} else if (drag.kind === "view") {
		var sp = tSpan(),
			aw = dims()[0] - LABELW - 4,
			full = sp[1] - sp[0];
		var nz = Math.max(1, Math.min(MAXZOOM, drag.zoom0 * Math.pow(2, (drag.y0 - y) / 40)));
		// the time under the grab point stays under the pointer: sideways = scroll
		var tA = drag.start0 + ((drag.x0 - LABELW) / aw) * (full / drag.zoom0);
		zoom = nz;
		viewStart = tA - ((x - LABELW) / aw) * (full / nz);
		if (!but) drag = null;
		invalidate();
		return;
	}
	if (!but) commit();
	invalidate();
}
function commit() {
	var d = drag;
	drag = null;
	if (d.kind === "move" && d.dt) {
		var ids = Object.keys(sel).map(Number);
		if (ids.length) outlet(0, [d.copy ? "copy" : "move", d.dt].concat(ids));
	} else if (d.kind === "trim") {
		var n = noteById(d.id);
		if (n && d.t !== (d.which === "start" ? n.start : n.start + n.len)) outlet(0, "trim", d.id, d.which, d.t);
	} else if (d.kind === "loop" && (d.na !== undefined || d.nb !== undefined)) {
		var a = d.na !== undefined ? d.na : d.a,
			b = d.nb !== undefined ? d.nb : d.b;
		if (b > a) outlet(0, "loop", a, b);
	} else if (d.kind === "prob") {
		outlet(0, ["prob", d.v].concat(d.ids));
	} else if (d.kind === "vel") {
		outlet(0, ["vel", d.which, d.v].concat(d.ids));
	} else if (d.kind === "box") {
		var x0 = Math.min(d.x0, d.x1),
			x1 = Math.max(d.x0, d.x1),
			y0 = Math.min(d.y0, d.y1),
			y1 = Math.max(d.y0, d.y1);
		if (x1 - x0 < 2 && y1 - y0 < 2) return;
		seq.notes.forEach(function (n) {
			var pts = trace(n, 0, null);
			for (var i = 0; i < pts.length; i++)
				if (pts[i][0] >= x0 && pts[i][0] <= x1 && pts[i][1] >= y0 && pts[i][1] <= y1) {
					sel[n.id] = 1;
					break;
				}
		});
	}
}
commit.local = 1;
function ondblclick(x, y, but, cmd, shift, capslock, option, ctrl) {
	drag = null;
	if (y >= RANGEH && y < RANGEH + HEADER) {
		zoom = 1; // the whole sequence
		invalidate();
		return;
	}
	if (y >= rollBot()) {
		// PROB lane: double-click a bar = back to 100%
		var lh = lanesH() / LANES.length;
		if (y >= laneTop("PROB") && y < laneTop("PROB") + lh) {
			var pb = barAt("prob", x);
			if (pb) outlet(0, "prob", 1, pb.n.id);
		}
		return;
	}
	if (y < RANGEH) return;
	var h = hitNote(x, y);
	if (!h) return;
	delete sel[h.n.id];
	outlet(0, "delete", h.n.id);
}
function noteById(id) {
	for (var i = 0; i < seq.notes.length; i++) if (seq.notes[i].id === id) return seq.notes[i];
	return null;
}
noteById.local = 1;

// --- messages ---
// position: no redraw here (a large redraw many times a second made the whole patch stutter);
// the strip (dingus.gestureHead.js) on outlet 1 shows it: 0..1 along this roll's time axis
// (while recording, the position within the current bar)
function pos(c, a, b) {
	playPos = c;
	var f;
	if (playState === "rec") f = (((c % barSteps) + barSteps) % barSteps) / barSteps;
	else {
		var sp = viewSpan();
		f = (c - sp[0]) / (sp[1] - sp[0]);
		if (f < 0 || f > 1) return outlet(1, "off"); // outside the zoomed view
	}
	outlet(1, f);
}
function state(s) {
	playState = String(s);
	if (playState === "stop") playPos = -1;
	if (playState !== "play" && playState !== "dub") noteState = {};
	outlet(1, "rec", playState === "rec" || playState === "dub" ? 1 : 0); // red strip while recording / overdubbing
	if (playState === "stop") outlet(1, "off");
	invalidate();
}
function bendrange(n) {
	bendRange = Math.max(1, n);
	setSeq(seq);
}
function barsteps(n) {
	barSteps = Math.max(1, Math.round(n));
	invalidate();
}
function snap(q) {
	snapQ = Math.max(0, q);
}
function loopsnap(m) {
	loopSnap = Math.max(0, Math.min(2, Math.round(m)));
}
function zones(a, b, c, d) {
	zone = [[a, b], [c, d]];
	invalidate();
}
// no redraw of its own (see pos); cut notes show at the next redraw (stop, edit, ...)
function note(id, st) {
	if (st === 0) delete noteState[id];
	else noteState[id] = st;
	if (st === -1) dirty = true;
}
function deleteselected() {
	var ids = Object.keys(sel).map(Number);
	sel = {};
	if (ids.length) outlet(0, ["delete"].concat(ids));
}
function clearsel() {
	sel = {};
	invalidate();
}
function onresize() {
	invalidate();
}

// --- drawing ---
function mix(a, b, k) {
	return [a[0] + (b[0] - a[0]) * k, a[1] + (b[1] - a[1]) * k, a[2] + (b[2] - a[2]) * k];
}
mix.local = 1;
function inLoop(n) {
	return !seq.length || (n.start >= seq.loopStart && n.start < seq.loopEnd);
}
inLoop.local = 1;
// colour of a note at a Y value: its side's hue, light = high Y; state colours override
function colOf(n, yv, a) {
	var c;
	if (noteState[n.id] === -1) c = CUTCOL;
	else if (!inLoop(n)) c = GREYCOL;
	else {
		var s = SIDECOL[sideOf(n.ch)];
		c = mix(s[0], s[1], 0.15 + 0.85 * (yv / 127));
	}
	return [c[0], c[1], c[2], a];
}
colOf.local = 1;

// --- drawing: the roll is drawn into a cached image, redrawn only when something changes
// (invalidate); any other repaint just draws that image ---
var cache = null;
var cacheW = 0,
	cacheH = 0;
var dirty = true;
function invalidate() {
	dirty = true;
	mgraphics.redraw();
}
invalidate.local = 1;

function paint() {
	var w = dims()[0],
		h = dims()[1];
	var g = mgraphics;
	if (typeof MGraphics === "undefined" || typeof Image === "undefined") {
		paintStatic(g, w, h); // no offscreen drawing (tests)
	} else {
		if (!cache || dirty || cacheW !== w || cacheH !== h) {
			var mg = new MGraphics(w, h);
			mg.relative_coords = 0;
			mg.autofill = 0;
			paintStatic(mg, w, h);
			cache = new Image(mg);
			cacheW = w;
			cacheH = h;
		}
		g.image_surface_draw(cache);
	}
	dirty = false;
}

function paintStatic(g, w, h) {
	var top = rollTop(),
		bot = rollBot();
	var sp = viewSpan(),
		full = tSpan(),
		ps = pSpan();
	var i, x;

	g.set_source_rgba(0.06, 0.06, 0.07, 1);
	g.rectangle(0, 0, w, h);
	g.fill();

	// rows: one per pad note, every 12th from 60 a bit lighter
	for (var p = ps[0]; p < ps[1]; p++) {
		var y0 = yOf(p) - rowH() / 2,
			y1 = y0 + rowH();
		g.set_source_rgba(0.1, 0.1, 0.11, 1);
		if (p % 2) g.set_source_rgba(0.12, 0.12, 0.135, 1);
		if ((((p - 60) % 12) + 12) % 12 === 0) g.set_source_rgba(0.17, 0.17, 0.19, 1);
		g.rectangle(LABELW, y0, w - LABELW, y1 - y0);
		g.fill();
		if (y1 - y0 >= 9) {
			g.set_source_rgba(0.5, 0.5, 0.55, 1);
			g.select_font_face("Arial");
			g.set_font_size(Math.min(10, y1 - y0 - 1));
			g.move_to(3, y1 - 2);
			g.show_text(String(p));
		}
	}

	// loop range shading, step and bar lines
	if (seq.length) {
		g.set_source_rgba(1, 1, 1, 0.035);
		g.rectangle(xOf(seq.loopStart), top, xOf(seq.loopEnd) - xOf(seq.loopStart), bot - top);
		g.fill();
	}
	for (var st = Math.ceil(sp[0]); st <= sp[1]; st++) {
		x = xOf(st);
		var bar = (((st % barSteps) + barSteps) % barSteps) === 0;
		g.set_source_rgba(1, 1, 1, bar ? 0.22 : 0.07);
		g.set_line_width(bar ? 1 : 0.5);
		g.move_to(x, RANGEH);
		g.line_to(x, h);
		g.stroke();
		if (bar) {
			g.set_source_rgba(0.75, 0.75, 0.8, 1);
			g.select_font_face("Arial");
			g.set_font_size(9);
			g.move_to(x + 2, RANGEH + HEADER - 2);
			g.show_text(String(st / barSteps + 1));
		}
	}

	// zoomed: the visible part of the whole sequence, as a sand bar in the bar-number row
	if (zoom > 1) {
		var aw = w - LABELW - 4;
		g.set_source_rgba(0.75, 0.68, 0.5, 0.3);
		g.rectangle(LABELW + ((sp[0] - full[0]) / (full[1] - full[0])) * aw, RANGEH + 2, aw / zoom, HEADER - 4);
		g.fill();
	}

	// LOOP strip
	g.set_source_rgba(0.14, 0.14, 0.16, 1);
	g.rectangle(LABELW, 0, w - LABELW, RANGEH);
	g.fill();
	var la = drag && drag.kind === "loop" && drag.na !== undefined ? drag.na : seq.loopStart;
	var lb = drag && drag.kind === "loop" && drag.nb !== undefined ? drag.nb : seq.loopEnd;
	if (seq.length) {
		g.set_source_rgba(0.75, 0.68, 0.5, 0.9); // sand, like PGRoll's RANGE
		g.rectangle(xOf(la), 2, xOf(lb) - xOf(la), RANGEH - 4);
		g.fill();
	}
	g.set_source_rgba(0.6, 0.6, 0.65, 1);
	g.select_font_face("Arial");
	g.set_font_size(9);
	g.move_to(3, RANGEH - 4);
	g.show_text("LOOP");

	// notes: selection halo, then traces (thickness = pressure, colour = Y), strike dot, lift tick
	g.set_line_cap("round");
	seq.notes.forEach(function (n) {
		var pts = trace(n, dtOf(n), cutOf(n));
		if (!pts.length) return;
		if (sel[n.id]) {
			g.set_source_rgba(BONE[0], BONE[1], BONE[2], 0.5);
			for (i = 0; i + 1 < pts.length; i++) {
				g.set_line_width(thick(pts[i][2]) + 4);
				g.move_to(pts[i][0], pts[i][1]);
				g.line_to(pts[i + 1][0], pts[i + 1][1]);
				g.stroke();
			}
		}
		var na = 0.3 + 0.7 * probOf(n); // less likely notes are fainter
		for (i = 0; i + 1 < pts.length; i++) {
			var c = colOf(n, pts[i][3], na);
			g.set_source_rgba(c[0], c[1], c[2], c[3]);
			g.set_line_width(thick(pts[i][2]));
			g.move_to(pts[i][0], pts[i][1]);
			g.line_to(pts[i + 1][0], pts[i + 1][1]);
			g.stroke();
		}
		var dim = noteState[n.id] === -1 || !inLoop(n) ? 0.5 : 1;
		g.set_source_rgba(BONE[0], BONE[1], BONE[2], dim);
		g.arc(pts[0][0], pts[0][1], 1.5 + (velOf(n, "strike") / 127) * 4, 0, Math.PI * 2);
		g.fill();
		var pe = pts[pts.length - 1];
		var th = 2 + (velOf(n, "lift") / 127) * 9;
		g.set_source_rgba(CLAY[0], CLAY[1], CLAY[2], dim);
		g.set_line_width(1.5);
		g.move_to(pe[0], pe[1] - th);
		g.line_to(pe[0], pe[1] + th);
		g.stroke();
	});

	// copy preview: the copies in bone, thin
	if (drag && drag.kind === "move" && drag.copy && drag.dt) {
		g.set_source_rgba(BONE[0], BONE[1], BONE[2], 0.7);
		g.set_line_width(1.5);
		seq.notes.forEach(function (n) {
			if (!sel[n.id]) return;
			var cp = trace(n, drag.dt, null);
			for (var k = 0; k + 1 < cp.length; k++) {
				g.move_to(cp[k][0], cp[k][1]);
				g.line_to(cp[k + 1][0], cp[k + 1][1]);
			}
			g.stroke();
		});
	}

	// box selection
	if (drag && drag.kind === "box") {
		g.set_source_rgba(1, 1, 1, 0.12);
		g.rectangle(Math.min(drag.x0, drag.x1), Math.min(drag.y0, drag.y1), Math.abs(drag.x1 - drag.x0), Math.abs(drag.y1 - drag.y0));
		g.fill();
	}

	paintLanes(g, w, bot);
	paintLabels(g, w, h);
}
paintStatic.local = 1;

// the label column and the right margin, drawn last: zoomed notes and curves run past the view's edges
function paintLabels(g, w, h) {
	g.set_source_rgba(0.08, 0.08, 0.09, 1);
	g.rectangle(0, 0, LABELW, h);
	g.fill();
	g.rectangle(w - 4, 0, 4, h);
	g.fill();
	g.select_font_face("Arial");
	g.set_source_rgba(0.6, 0.6, 0.65, 1);
	g.set_font_size(9);
	g.move_to(3, RANGEH - 4);
	g.show_text("LOOP");
	g.move_to(3, RANGEH + HEADER - 4);
	g.show_text(zoom > 1 ? "x" + (Math.round(zoom * 10) / 10) : "ALL");
	var ps = pSpan(),
		rh = rowH();
	if (rh >= 9) {
		g.set_source_rgba(0.5, 0.5, 0.55, 1);
		g.set_font_size(Math.min(10, rh - 1));
		for (var p = ps[0]; p < ps[1]; p++) {
			g.move_to(3, yOf(p) + rh / 2 - 2);
			g.show_text(String(p));
		}
	}
	var lh = lanesH() / LANES.length;
	if (lh >= 8) {
		// the lanes' label cells in their lane's tint
		for (var lj = 0; lj < LANES.length; lj++) {
			var bg = LANEBG[lj] || [0.09, 0.09, 0.1];
			g.set_source_rgba(bg[0], bg[1], bg[2], 1);
			g.rectangle(0, rollBot() + lj * lh, LABELW, lh);
			g.fill();
			g.rectangle(w - 4, rollBot() + lj * lh, 4, lh);
			g.fill();
		}
		g.set_source_rgba(0.6, 0.6, 0.65, 1);
		g.set_font_size(9);
		for (var li = 0; li < LANES.length; li++) {
			g.move_to(3, rollBot() + li * lh + 11);
			g.show_text(LANES[li]);
		}
	}
}
paintLabels.local = 1;

function paintLanes(g, w, top) {
	var lh = lanesH() / LANES.length;
	if (lh < 8) return;
	var notes = seq.notes.filter(function (n) {
		return sel[n.id];
	});
	var faint = !notes.length;
	if (faint) notes = seq.notes;
	var bmax = 1;
	notes.forEach(function (n) {
		(geo[n.id] || []).forEach(function (s) {
			bmax = Math.max(bmax, Math.abs(s.bend));
		});
	});
	for (var li = 0; li < LANES.length; li++) {
		var y0 = top + li * lh;
		var bg = LANEBG[li] || [0.09, 0.09, 0.1];
		g.set_source_rgba(bg[0], bg[1], bg[2], 1);
		g.rectangle(0, y0, w, lh);
		g.fill();
		g.set_source_rgba(0.6, 0.6, 0.65, 1);
		g.select_font_face("Arial");
		g.set_font_size(9);
		g.move_to(3, y0 + 11);
		g.show_text(LANES[li]);
		if (LANES[li] === "BEND") {
			g.set_source_rgba(1, 1, 1, 0.12);
			g.set_line_width(0.5);
			g.move_to(LABELW, y0 + lh / 2);
			g.line_to(w, y0 + lh / 2);
			g.stroke();
		}
		notes.forEach(function (n) {
			var lc = LANECOL[sideOf(n.ch)];
			var c = [lc[0], lc[1], lc[2], faint ? 0.6 : 1];
			g.set_source_rgba(c[0], c[1], c[2], c[3]);
			var dt = dtOf(n);
			if (LANES[li] === "PROB" || LANES[li] === "VEL") return; // bars: below
			var s = geo[n.id] || [];
			g.set_line_width(1.2);
			for (var i = 0; i < s.length; i++) {
				var v = LANES[li] === "PRESS" ? s[i].press / 127 : LANES[li] === "Y" ? s[i].y / 127 : 0.5 + s[i].bend / bmax / 2;
				var yy = y0 + lh - 2 - v * (lh - 4);
				var xa = xOf(n.start + dt + s[i].t);
				var xb = xOf(n.start + dt + (i + 1 < s.length ? s[i + 1].t : n.len));
				if (i === 0) g.move_to(xa, yy);
				else g.line_to(xa, yy);
				g.line_to(xb, yy);
			}
			g.stroke();
		});
		// VEL / PROB: bars from the shared layout (chords spread side by side)
		if (LANES[li] === "VEL" || LANES[li] === "PROB") {
			barLayout(LANES[li] === "VEL" ? "vel" : "prob").forEach(function (b) {
				var lc = LANECOL[sideOf(b.n.ch)];
				var al = faint ? 0.6 : 1;
				var v = LANES[li] === "PROB" ? probOf(b.n) : velOf(b.n, b.which) / 127;
				g.set_source_rgba(lc[0], lc[1], lc[2], b.which === "lift" ? al * 0.5 : al);
				g.rectangle(b.x - 1.5, y0 + lh - 2 - v * (lh - 4), 3, Math.max(1, v * (lh - 4)));
				g.fill();
			});
		}
	}
}
paintLanes.local = 1;

// when the script (re)starts, ask the looper for the current sequence (after an edit, autowatch
// reloads this script empty and Max sends no loadbang)
var askTask = new Task(function () {
	outlet(0, "dump");
}, this);
askTask.schedule(150);
