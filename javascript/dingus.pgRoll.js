// ===========================================================
// dingus.pgRoll.js  (v8ui)
//
// Piano-roll editor for the pitch / gate sequencer (uPG).
// Monophonic: notes start anywhere and have any length; they never overlap.
// Steps are the grid (and the unit the engine steps through); up to 16 notes may start in one step.
// Pitch = tuning degree index (th.stof index), rows sized by cents like dingusPitchGrid.
//
// ROLL   click an empty place = new note there (start snapped down to the grid), drag right = longer
//        drag a note's right end = resize (grid snap, alt = free)
//        drag a note's body = move it (sideways = time, up/down = pitch), option-drag = move a copy
//        click inside a note's time off its row = set its pitch there
//        double-click a note = delete it
//        click a row label = switch that scale degree on/off (scale mask, all octaves)
// lanes, per note: VEL, GLIDE (0..1 step, slide into the note), RATCH (1..8),
//        FADE (-50..50, ratchet velocities: < 0 rise, > 0 fall, exponential; at +-50 the quietest hit
//        is 1% of VEL; only with 2+ ratchets), DUTY (only with 2+ ratchets)
//        click / drag; shift = fine
// CHANCE lanes (any number, up to 32; '+ CHANCE' strip adds one, the x on a lane label removes it):
//        one cell per note: op, PROB, PTN (A:B = on the A-th of every B repeats / bars), amount.
//        click a cell = op menu, double-click = clear it, drag up/down = PROB, alt-drag = amount (in the op's unit:
//        steps, step number, VEL points, step fractions, ratchets, scale degrees),
//        shift-click = next PTN, shift-alt-click = previous PTN. lanes act top to bottom.
// RANGE strip (top): play range in whole steps. drag an end / the middle; double-click = full range
// dragging a note above / below the roll scrolls the view (outlet 0: 'low n' for the low box);
//        notes outside the view show as an orange bar along the top / bottom edge
//
// inlet 0:
//   steps n            number of steps (notes beyond are deleted / cut)
//   buffer name        buffer~ for the note tables and the pitch table
//   chbuffer name      buffer~ for the chance cells
//   notes ...          set everything (stored format), no output
//   clear              delete all notes
//   clearall           notes, chance lanes, range (full) and scale mask (all on)
//   bang               output the stored list
//   snap 0|1           snap to the beat grid on / off (any value > 0 = on)
//   setmin n / setmax n   lowest / highest displayed degree index
//   beat n             beats per step: n grid lines inside each step; the snap grid is 1/n step
//   dictionary name    tuning from a th.scala dict
//   mask m0 m1 ...     scale mask, one 0/1 per tuning degree; mask all / mask none
//   labelwidth n       width of the label column
// inlet 1:
//   int                current step (playhead)
// outlet 0: stored list after each edit; 'needbuffer' at load; 'range start end'; 'lanes n'; 'low n' (scrolled)
//
// stored list: -4 n rstart rend  masklen mask...  chancelanes  notecount  notes
//   note: start length pitch vel glide ratch duty fade, then per chance lane: op prob ptnA ptnB amount
//
// note buffer~: frames 0..1023 = step * 16 + slot, 22 channels
//   forward table (notes starting in the step, by start):    ch 1..11
//   reverse table (notes whose mirrored start is in the step, played end in the step,
//                  clipped to the play range):                ch 12..22
//   per slot: 1 offset into the step  2 length (0 = no more notes in this step)
//             3 pitch, tuned MIDI float (as th.stof -> ftom)  4 ratchets  5 velocity  6 duty
//             7 glide (steps)  8 pitch degree index  9 fade (-50..50)  10 note index
//             11 room (steps to the next note or the end)
//   pitch table, frames 1024 + degree index (0..511): ch 1 tuned MIDI float,
//     ch 2 scale degrees at or below this index, ch 3 scale degrees below it; frame 1024 ch 4: scale degree count
//   scale list, frames 1536 + n: ch 1 degree index of the n-th scale degree
// chance buffer~: frame = lane * 1024 + note index, 5 channels: op prob ptnA ptnB amount
//   ops: see OPS (index = op number)
// ===========================================================

inlets = 2;
outlets = 1;
autowatch = 1;

setinletassist(0, 'steps, buffer, chbuffer, notes, clear, bang, snap, setmin, setmax, dictionary, mask');
setinletassist(1, 'current step index (playhead)');
setoutletassist(0, 'stored list / needbuffer / range');

mgraphics.init();
mgraphics.relative_coords = 0;
mgraphics.autofill = 0;

var MAXSTEPS = 64;
var SLOTS = 16;
var NCH = 22;
var TW = 11;         // channels per table
var NFIELDS = 8;
var FORMAT = 4;
var MAXNOTES = 1024; // = MAXSTEPS * SLOTS
var PTBASE = 1024;   // pitch table start frame
var PTN_N = 512;     // pitch table size (degree indices 0..511)
var LISTBASE = 1536; // list of the degrees in the scale mask, in order
var MAXCH = 32;      // chance lanes
var CHF = 5;         // fields per chance cell
var EPS = 1e-6;

// --- state -------------------------------------------------
var n = 5;
var notes = [];        // {st, len, pitch, v, gl, r, fd, d, ch: [{op, p, pa, pb, amt}, ...]}
var chN = 0;           // chance lanes
var chBufName = '';
var menu = null;       // open op menu: {nt, li, x, y}
var playhead = -1;
var labelW = 78;
var bufName = '';
var rStart = 0;
var rEnd = 4;
var lo = 29;
var hi = 53;
var mask = [];
var pendingMask = null;  // stored mask waiting for its tuning (preset recall: the tuning arrives later)
var beatN = 4;         // beats per step: grid lines inside each step, and the snap grid
var SCROLLMS = 80;     // auto-scroll: one row per tick while a dragged note is above / below the roll
var snapOn = 1;
var snapQ = 0.25;      // grid in steps (1 / beats per step), 0 = off

var HEADER = 14;
var ROLLH = 290;
var LANEH = 30;
var CHH = 32;
var ADDH = 14;
var RANGEH = 10;
var CHCOL = [0.52, 0.60, 0.46];     // sage

var LANES = [
	{ key: 'v', name: 'VEL', lo: 0, hi: 1, col: [0.80, 0.42, 0.26] },          // terracotta
	{ key: 'gl', name: 'GLIDE', lo: 0, hi: 1, col: [0.55, 0.60, 0.70] },       // dusk blue
	{ key: 'r', name: 'RATCH', lo: 1, hi: 8, int: 1, col: [0.62, 0.47, 0.58] }, // dusty plum
	{ key: 'fd', name: 'FADE', lo: -50, hi: 50, int: 1, bi: 1, col: [0.66, 0.56, 0.44] }, // umber
	{ key: 'd', name: 'DUTY', lo: 0.05, hi: 0.95, col: [0.80, 0.72, 0.52] }    // sand
];
var NOTECOL = [0.85, 0.65, 0.30];   // ochre

// gate amounts in steps
var GATESTEPS = [1 / 16, 1 / 8, 1 / 6, 1 / 4, 1 / 3, 1 / 2, 3 / 4, 1, 1.5, 2, 3, 4];
var GATENAMES = ['1/16', '1/8', '1/6', '1/4', '1/3', '1/2', '3/4', '1', '1.5', '2', '3', '4'];

// chance ops. a = [min, max, default] of the stored amount;
// u = unit: 'st' steps, 'to' step number, 'pts' VEL points (0..100), 'gate' index into GATESTEPS,
//     'x' ratchet count, 'deg' scale degrees (up to one period; default 0 = a full period)
var OPS = [
	{ n: '-' },
	{ n: 'MUTE' }, { n: 'UNMUTE' }, { n: 'SKIP' }, { n: 'UNSKIP' },
	{ n: 'JMP<', a: [1, 16, 1], u: 'st' }, { n: 'JMP?' }, { n: 'JMP>', a: [1, 16, 1], u: 'st' }, { n: 'JMP TO', a: [1, 64, 1], u: 'to' },
	{ n: 'VEL-', a: [1, 100, 30], u: 'pts' }, { n: 'VEL+', a: [1, 100, 30], u: 'pts' }, { n: 'VEL MAX' },
	{ n: 'GATE-', a: [0, 11, 3], u: 'gate' }, { n: 'GATE+', a: [0, 11, 3], u: 'gate' }, { n: 'TIE' },
	{ n: 'RATCH', a: [2, 8, 2], u: 'x' },
	{ n: 'P+', a: [1, 64, 1], u: 'deg' }, { n: 'P-', a: [1, 64, 1], u: 'deg' },
	{ n: 'P?+', a: [1, 64, 0], u: 'deg' }, { n: 'P?-', a: [1, 64, 0], u: 'deg' }, { n: 'P?', a: [1, 64, 0], u: 'deg' }
];
// op menu columns
var MENUCOLS = [[0, 1, 2, 3, 4], [5, 6, 7, 8], [9, 10, 11], [12, 13, 14, 15], [16, 17, 18, 19, 20]];
var MENUW = 58, MENUH = 16;
// PTN choices: [A, B]; [0, 0] = always
var PTNS = [[0, 0]];
(function () { for (var b = 2; b <= 8; b++) for (var a = 1; a <= b; a++) PTNS.push([a, b]); })();


var scl = { size: 12, center: 69, tune: 440, range: 1200, cents: [0, 100, 200, 300, 400, 500, 600, 700, 800, 900, 1000, 1100] };

var drag = null;
var hoverEnd = null;
var ENDGRAB = 7;
var MINLEN = 0.05;

var askTask = new Task(function () { if (!bufName) outlet(0, 'needbuffer'); });
askTask.schedule(50);

function fullMask() {
	mask = [];
	for (var i = 0; i < scl.size; i++) mask.push(1);
}
fullMask.local = 1;
fullMask();

// --- tuning ------------------------------------------------
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

function inScale(v) {
	return !!mask[degreeOf(v)];
}
inScale.local = 1;

// tuned pitch as a MIDI float, same as th.stof -> ftom (center value sounds at 'tune' Hz)
function midiOf(v) {
	var d = degreeOf(v);
	return 69 + 12 * Math.log(scl.tune / 440) / Math.LN2 + (periodOf(v) * scl.range + scl.cents[d] - scl.cents[0]) / 100;
}
midiOf.local = 1;

function snapPitch(v) {
	if (inScale(v)) return v;
	for (var k = 1; k < scl.size; k++) {
		if (inScale(v - k)) return v - k;
		if (inScale(v + k)) return v + k;
	}
	return v;
}
snapPitch.local = 1;

// --- time grid ---------------------------------------------
function gridOn(option) {
	return snapQ > 0 && !option;
}
gridOn.local = 1;

function snapRound(p, option) {
	return gridOn(option) ? Math.round(Math.round(p / snapQ) * snapQ * 1e6) / 1e6 : p;
}
snapRound.local = 1;

function snapDown(p, option) {
	return gridOn(option) ? Math.round(Math.floor(p / snapQ + EPS) * snapQ * 1e6) / 1e6 : p;
}
snapDown.local = 1;

function minLen(option) {
	return gridOn(option) ? snapQ : MINLEN;
}
minLen.local = 1;

// --- geometry ----------------------------------------------
function dims() {
	return mgraphics.size;
}
dims.local = 1;

// layout, top to bottom: RANGE strip, step numbers, roll, note lanes, chance lanes, '+ CHANCE'
function rollTop() { return RANGEH + HEADER; }
rollTop.local = 1;

function rollBottom() {
	return rollTop() + ROLLH;
}
rollBottom.local = 1;

function chTop() {
	return rollBottom() + LANES.length * LANEH;
}
chTop.local = 1;

function addTop() {
	return chTop() + chN * CHH;
}
addTop.local = 1;

function rangeTop() {
	return 0;
}
rangeTop.local = 1;

function totalH() {
	return addTop() + ADDH;
}
totalH.local = 1;

// the box grows / shrinks with the chance lanes (roll and lanes keep their size)
function fitBox() {
	var want = totalH();
	try {
		var pr = box.getattr('presentation_rect');
		if (pr && Math.abs(pr[3] - want) > 0.5) box.setattr('presentation_rect', [pr[0], pr[1], pr[2], want]);
		var r = box.getattr('patching_rect');
		if (r && Math.abs(r[3] - want) > 0.5) box.setattr('patching_rect', [r[0], r[1], r[2], want]);
	} catch (e) {}
}
fitBox.local = 1;

function chAt(y) {
	if (y < chTop() || y >= addTop()) return -1;
	return Math.floor((y - chTop()) / CHH);
}
chAt.local = 1;

function laneRects() {
	var y = rollBottom();
	var out = [];
	for (var i = 0; i < LANES.length; i++) {
		out.push({ top: y, h: LANEH, lane: LANES[i] });
		y += LANEH;
	}
	return out;
}
laneRects.local = 1;

function rows() {
	var top = rollTop(), bot = rollBottom();
	var h = Math.max(1, bot - top);
	var out = [];
	if (hi < lo) return out;
	var total = 0, v;
	for (v = lo; v <= hi; v++) total += intervalAbove(degreeOf(v));
	var y = bot;
	for (v = lo; v <= hi; v++) {
		var d = degreeOf(v);
		var rh = intervalAbove(d) / total * h;
		y -= rh;
		out.push({ v: v, top: y, h: rh, d: d, p: periodOf(v), c: scl.cents[d] });
	}
	return out;
}
rows.local = 1;

function rowOf(rws, v) {
	if (v < lo || v > hi) return null;
	return rws[v - lo];
}
rowOf.local = 1;

function pitchAtY(rws, y) {
	if (!rws.length) return lo;
	if (y <= rws[rws.length - 1].top) return hi;
	for (var i = 0; i < rws.length; i++) {
		if (y >= rws[i].top) return rws[i].v;
	}
	return lo;
}
pitchAtY.local = 1;

function colW() {
	return (dims()[0] - labelW) / n;
}
colW.local = 1;

function xOf(pos) {
	return labelW + pos * colW();
}
xOf.local = 1;

function posOf(x) {
	return Math.max(0, Math.min(n, (x - labelW) / colW()));
}
posOf.local = 1;

function stepOf(x) {
	return Math.max(0, Math.min(n - 1, Math.floor((x - labelW) / colW())));
}
stepOf.local = 1;

// --- note helpers ------------------------------------------
function sortNotes() {
	notes.sort(function (a, b) { return a.st - b.st; });
}
sortNotes.local = 1;

function noteAt(pos) {
	for (var i = 0; i < notes.length; i++) {
		var nt = notes[i];
		if (pos >= nt.st - EPS && pos < nt.st + nt.len - EPS) return nt;
	}
	return null;
}
noteAt.local = 1;

// the note played before nt; the first note's is the last one (the loop wraps)
function prevNote(nt) {
	var best = null, last = null;
	for (var i = 0; i < notes.length; i++) {
		var o = notes[i];
		if (o.st < nt.st && (!best || o.st > best.st)) best = o;
		if (o !== nt && (!last || o.st > last.st)) last = o;
	}
	return best || last;
}
prevNote.local = 1;

// end of the latest note that ends at or before pos (0 if none)
function prevEnd(pos, self) {
	var m = 0;
	for (var i = 0; i < notes.length; i++) {
		var o = notes[i];
		if (o === self) continue;
		var e = o.st + o.len;
		if (e <= pos + EPS) m = Math.max(m, e);
	}
	return m;
}
prevEnd.local = 1;

// room after st up to the next note / the end
function maxLen(st, self) {
	var m = n - st;
	for (var i = 0; i < notes.length; i++) {
		var o = notes[i];
		if (o === self) continue;
		if (o.st >= st - EPS) m = Math.min(m, o.st - st);
	}
	return m;
}
maxLen.local = 1;

function fits(st, len, self) {
	if (st < -EPS || st + len > n + EPS) return false;
	for (var i = 0; i < notes.length; i++) {
		var o = notes[i];
		if (o === self) continue;
		if (st < o.st + o.len - EPS && o.st < st + len - EPS) return false;
	}
	return true;
}
fits.local = 1;

function clampVal(lane, v) {
	v = Math.min(lane.hi, Math.max(lane.lo, v));
	return lane.int ? Math.round(v) : v;
}
clampVal.local = 1;

function fitToSteps() {
	var kept = [];
	for (var i = 0; i < notes.length; i++) {
		var nt = notes[i];
		if (nt.st >= n - EPS) continue;
		if (nt.st + nt.len > n) nt.len = n - nt.st;
		if (nt.len < MINLEN) continue;
		kept.push(nt);
	}
	notes = kept;
}
fitToSteps.local = 1;

// velocity factor of ratchet hit k (same as the engine): exponential, at +-50 the quietest hit is 1%
function fadeFactor(nt, k) {
	if (nt.r <= 1 || !nt.fd) return 1;
	var t = k / (nt.r - 1);
	var m = Math.pow(0.01, Math.abs(nt.fd) / 50);
	return nt.fd < 0 ? Math.pow(m, 1 - t) : Math.pow(m, t);
}
fadeFactor.local = 1;

function newCell() {
	return { op: 0, p: 0, pa: 0, pb: 0, amt: 0 };
}
newCell.local = 1;

function copyNote(nt) {
	var c = {};
	for (var key in nt) c[key] = nt[key];
	c.ch = [];
	for (var i = 0; i < nt.ch.length; i++) {
		var o = nt.ch[i];
		c.ch.push({ op: o.op, p: o.p, pa: o.pa, pb: o.pb, amt: o.amt });
	}
	return c;
}
copyNote.local = 1;

function fitCells(nt) {
	if (!nt.ch) nt.ch = [];
	while (nt.ch.length < chN) nt.ch.push(newCell());
	if (nt.ch.length > chN) nt.ch.length = chN;
}
fitCells.local = 1;

function newNote(st, len, pitch) {
	var nt = { st: st, len: len, pitch: pitch, v: 1, gl: 0, r: 1, fd: 0, d: 0.5, ch: [] };
	fitCells(nt);
	return nt;
}
newNote.local = 1;

// enabled scale degrees in one period (the reach of the pitch ops)
function periodDegrees() {
	var c = 0;
	for (var i = 0; i < mask.length; i++) if (mask[i]) c++;
	return Math.max(1, c);
}
periodDegrees.local = 1;

// highest amount of an op (degree ops reach one period of the scale mask)
// jumps stay inside the sequence: JMP TO up to the step count, JMP< / JMP> up to the range length - 1
function amtMax(o) {
	if (o.u === 'deg') return Math.min(o.a[1], periodDegrees());
	if (o.u === 'to') return Math.min(o.a[1], n);
	if (o.u === 'st') return Math.max(1, Math.min(o.a[1], rEnd - rStart));
	return o.a[1];
}
amtMax.local = 1;

// stored amount, clamped (degree ops: 0 = a full period)
function opAmount(c) {
	var o = OPS[c.op];
	if (!o || !o.a) return 0;
	var a = c.amt;
	if (o.u === 'deg' && !a) a = periodDegrees();
	return Math.max(o.a[0], Math.min(amtMax(o), a));
}
opAmount.local = 1;

// amount in the engine's units (gate ops: steps)
function opValue(c) {
	var o = OPS[c.op];
	var a = opAmount(c);
	return (o && o.u === 'gate') ? GATESTEPS[a] : a;
}
opValue.local = 1;

function cellText(c) {
	var o = OPS[c.op];
	if (!o || !c.op) return '';
	if (!o.a) return o.n;
	var a = opAmount(c);
	if (o.u === 'st') return o.n + ' ' + a + ' st';
	if (o.u === 'to') return 'JMP > ' + a;
	if (o.u === 'pts') return o.n + ' ' + a;
	if (o.u === 'gate') return o.n + ' ' + GATENAMES[a] + ' st';
	if (o.u === 'x') return 'RATCH x' + a;
	if (c.op === 16) return 'P +' + a + ' deg';
	if (c.op === 17) return 'P -' + a + ' deg';
	if (c.op === 18) return 'P? +1..' + a;
	if (c.op === 19) return 'P? -1..' + a;
	return 'P? +-' + a;
}
cellText.local = 1;

// --- buffer~ -----------------------------------------------
function writeBuffer() {
	if (!bufName) return;
	var buf = new Buffer(bufName);
	var frames = LISTBASE + PTN_N;
	if (buf.framecount() < frames || buf.channelcount() < NCH) {
		post('dingus.pgRoll: buffer~ ' + bufName + ' needs ' + frames + ' samples and ' + NCH + ' channels\n');
		return;
	}
	var cols = [];
	var c, i, k;
	for (c = 0; c < NCH; c++) {
		cols.push([]);
		for (i = 0; i < frames; i++) cols[c].push(0);
	}
	var fcount = [], rcount = [];
	for (k = 0; k < MAXSTEPS; k++) { fcount.push(0); rcount.push(0); }
	var full = false;

	function put(base, frame, off, len, nt, idx) {
		cols[base][frame] = off;
		cols[base + 1][frame] = len;
		cols[base + 2][frame] = midiOf(nt.pitch);
		cols[base + 3][frame] = nt.r;
		cols[base + 4][frame] = nt.v;
		cols[base + 5][frame] = nt.d;
		cols[base + 6][frame] = nt.gl;
		cols[base + 7][frame] = nt.pitch;
		cols[base + 8][frame] = nt.fd;
		cols[base + 9][frame] = idx;
		cols[base + 10][frame] = maxLen(nt.st, nt);
	}

	// forward: by start (notes are sorted)
	for (i = 0; i < notes.length; i++) {
		var nt = notes[i];
		k = Math.floor(nt.st + EPS);
		if (k >= n) continue;
		if (fcount[k] >= SLOTS) { full = true; continue; }
		put(0, k * SLOTS + fcount[k], Math.max(0, nt.st - k), nt.len, nt, i);
		fcount[k]++;
	}
	// reverse: a note [a, b) plays mirrored, starting when the backward playhead reaches b.
	// notes starting in the play range are clipped to its end; latest end first in each step
	var rev = [];
	for (i = 0; i < notes.length; i++) {
		var o = notes[i];
		if (o.st < rStart - EPS || o.st >= rEnd + 1 - EPS) continue;
		rev.push({ nt: o, b: Math.min(o.st + o.len, rEnd + 1), idx: i });
	}
	rev.sort(function (x, y) { return y.b - x.b; });
	for (i = 0; i < rev.length; i++) {
		var b = rev[i].b;
		var a = rev[i].nt.st;
		k = Math.ceil(b - EPS) - 1;
		if (k < 0 || k >= n) continue;
		if (rcount[k] >= SLOTS) { full = true; continue; }
		put(TW, k * SLOTS + rcount[k], k + 1 - b, b - a, rev[i].nt, rev[i].idx);
		rcount[k]++;
	}
	if (full) post('dingus.pgRoll: more than ' + SLOTS + ' notes in one step, the extra ones do not play\n');
	// pitch tables for the pitch ops: per degree index its MIDI pitch, how many scale degrees lie
	// at or below it and how many below it; then the scale degrees in order (no loops needed in gen~)
	var cnt = 0;
	for (i = 0; i < PTN_N; i++) {
		var on = inScale(i);
		cols[0][PTBASE + i] = midiOf(i);
		cols[2][PTBASE + i] = cnt;
		if (on) {
			cols[0][LISTBASE + cnt] = i;
			cnt++;
		}
		cols[1][PTBASE + i] = cnt;
	}
	cols[3][PTBASE] = cnt;
	for (c = 0; c < NCH; c++) buf.poke(c + 1, 0, cols[c]);
	writeChance();
}
writeBuffer.local = 1;

function writeChance() {
	if (!chBufName || !chN) return;
	var buf = new Buffer(chBufName);
	var frames = chN * MAXNOTES;
	if (buf.framecount() < MAXCH * MAXNOTES || buf.channelcount() < CHF) {
		post('dingus.pgRoll: buffer~ ' + chBufName + ' needs ' + (MAXCH * MAXNOTES) + ' samples and ' + CHF + ' channels\n');
		return;
	}
	var cols = [], c, i, l;
	for (c = 0; c < CHF; c++) {
		cols.push([]);
		for (i = 0; i < frames; i++) cols[c].push(0);
	}
	for (i = 0; i < notes.length && i < MAXNOTES; i++) {
		var nt = notes[i];
		for (l = 0; l < chN; l++) {
			var cl = nt.ch[l];
			var f = l * MAXNOTES + i;
			cols[0][f] = cl.op;
			cols[1][f] = cl.p;
			cols[2][f] = cl.pa;
			cols[3][f] = cl.pb;
			cols[4][f] = opValue(cl);
		}
	}
	for (c = 0; c < CHF; c++) buf.poke(c + 1, 0, cols[c]);
}
writeChance.local = 1;

// --- serialization -----------------------------------------
function flat() {
	var a = [-FORMAT, n, rStart, rEnd, mask.length];
	var i;
	for (i = 0; i < mask.length; i++) a.push(mask[i]);
	a.push(chN, notes.length);
	for (i = 0; i < notes.length; i++) {
		var nt = notes[i];
		a.push(nt.st, nt.len, nt.pitch, nt.v, nt.gl, nt.r, nt.d, nt.fd);
		for (var l = 0; l < chN; l++) {
			var c = nt.ch[l];
			a.push(c.op, c.p, c.pa, c.pb, c.amt);
		}
	}
	return a;
}
flat.local = 1;

function unflat(a) {
	if (a.length < 6 || a[0] > -1 || a[0] < -4) return;
	var ver = -a[0];
	var i = 1, k;
	n = Math.max(1, Math.min(MAXSTEPS, Math.round(a[i++])));
	rStart = Math.round(a[i++]);
	rEnd = Math.round(a[i++]);
	clampRange();
	var ml = Math.round(a[i++]);
	var m = [];
	for (k = 0; k < ml && i < a.length; k++) m.push(a[i++] ? 1 : 0);
	if (m.length === scl.size) { mask = m; pendingMask = null; }
	else pendingMask = m;
	chN = 0;
	if (ver >= 4) chN = Math.max(0, Math.min(MAXCH, Math.round(a[i++]) || 0));
	var nc = Math.round(a[i++]) || 0;
	notes = [];
	if (ver === 4) {
		for (k = 0; k < nc && i + NFIELDS + chN * CHF - 1 < a.length; k++) {
			var nt = {
				st: a[i], len: Math.max(MINLEN, a[i + 1]), pitch: Math.round(a[i + 2]),
				v: a[i + 3], gl: a[i + 4], r: Math.round(a[i + 5]), d: a[i + 6], fd: Math.round(a[i + 7]), ch: []
			};
			i += NFIELDS;
			for (var l = 0; l < chN; l++, i += CHF) {
				nt.ch.push({ op: Math.round(a[i]), p: a[i + 1], pa: Math.round(a[i + 2]), pb: Math.round(a[i + 3]), amt: Math.round(a[i + 4]) });
			}
			notes.push(nt);
		}
	} else if (ver === 1) {
		// step-1 format: start span fill pitch vel delay glide ratch duty
		for (k = 0; k < nc && i + 8 < a.length; k++, i += 9) {
			notes.push({
				st: Math.round(a[i]) + a[i + 5], len: Math.max(MINLEN, Math.round(a[i + 1]) - 1 + a[i + 2] - a[i + 5]),
				pitch: Math.round(a[i + 3]), v: a[i + 4], gl: a[i + 6], r: Math.round(a[i + 7]), d: a[i + 8], fd: 0
			});
		}
	} else {
		var nf = ver === 2 ? 7 : NFIELDS;    // format 2: no fade
		for (k = 0; k < nc && i + nf - 1 < a.length; k++, i += nf) {
			notes.push({
				st: a[i], len: Math.max(MINLEN, a[i + 1]), pitch: Math.round(a[i + 2]),
				v: a[i + 3], gl: a[i + 4], r: Math.round(a[i + 5]), d: a[i + 6], fd: nf > 7 ? Math.round(a[i + 7]) : 0
			});
		}
	}
	for (k = 0; k < notes.length; k++) fitCells(notes[k]);
	sortNotes();
	fitToSteps();
}
unflat.local = 1;

var keep = new Global("dingusPGRollState");

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
	sortNotes();
	clampRange();
	park();
	writeBuffer();
	sendRange();
	outlet(0, "lanes", chN);
	fitBox();
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
	var rws = rows();
	var lrs = laneRects();
	var top = rollTop(), bot = rollBottom();
	var laneBottom = totalH();
	var gridTop = RANGEH + HEADER;
	var cht = chTop(), adt = addTop();
	var i, j, k, r, nt, lane, norm, bh, txt;

	g.set_source_rgba(0, 0, 0, 1);
	g.rectangle(0, 0, w, h);
	g.fill();

	// roll rows: octave bands, out-of-scale rows dark
	for (i = 0; i < rws.length; i++) {
		r = rws[i];
		var odd = ((r.p % 2) + 2) % 2;
		if (!mask[r.d]) g.set_source_rgba(0.035, 0.035, 0.04, 1);
		else if (odd) g.set_source_rgba(0.15, 0.15, 0.17, 1);
		else g.set_source_rgba(0.11, 0.11, 0.12, 1);
		g.rectangle(labelW, r.top, w - labelW, r.h);
		g.fill();
		if (r.h >= 3) {
			g.set_source_rgba(0.20, 0.20, 0.22, 1);
			g.set_line_width(0.5);
			g.move_to(labelW, r.top);
			g.line_to(w, r.top);
			g.stroke();
		}
	}
	for (i = 0; i < rws.length; i++) {
		r = rws[i];
		if (r.d === 0) {
			g.set_source_rgba(0.50, 0.50, 0.53, 1);
			g.set_line_width(1);
			g.move_to(labelW, r.top + r.h);
			g.line_to(w, r.top + r.h);
			g.stroke();
		}
	}

	// lane backgrounds
	for (i = 0; i < lrs.length; i++) {
		r = lrs[i];
		if (i % 2 === 0) g.set_source_rgba(0.10, 0.10, 0.11, 1);
		else g.set_source_rgba(0.13, 0.13, 0.15, 1);
		g.rectangle(labelW, r.top, w - labelW, r.h);
		g.fill();
	}

	// chance lane backgrounds
	for (i = 0; i < chN; i++) {
		if (i % 2 === 0) g.set_source_rgba(0.09, 0.10, 0.09, 1);
		else g.set_source_rgba(0.12, 0.13, 0.12, 1);
		g.rectangle(labelW, cht + i * CHH, w - labelW, CHH);
		g.fill();
	}
	g.set_source_rgba(0.07, 0.07, 0.07, 1);
	g.rectangle(labelW, adt, w - labelW, ADDH);
	g.fill();

	// playhead column
	if (playhead >= 0 && playhead < n) {
		g.set_source_rgba(0.30, 0.07, 0.07, 0.55);
		g.rectangle(xOf(playhead), gridTop, cw, laneBottom - gridTop);
		g.fill();
	}

	// snap grid inside the roll
	if (beatN > 1 && cw / beatN >= 6) {
		g.set_source_rgba(0.17, 0.17, 0.19, 1);
		g.set_line_width(0.5);
		var gs = beatN;
		for (k = 0; k < n * gs; k++) {
			if (k % gs === 0) continue;
			var gx = xOf(k / gs);
			g.move_to(gx, top);
			g.line_to(gx, bot);
			g.stroke();
		}
	}

	// step separators + numbers
	g.select_font_face('Arial');
	g.set_font_size(10);
	for (k = 0; k <= n; k++) {
		if (k % 4 === 0) g.set_source_rgba(0.40, 0.40, 0.43, 1);
		else g.set_source_rgba(0.26, 0.26, 0.28, 1);
		g.set_line_width(k % 4 === 0 ? 1 : 0.5);
		g.move_to(xOf(k), gridTop);
		g.line_to(xOf(k), laneBottom);
		g.stroke();
		if (k < n && (cw >= 16 || k % 4 === 0)) {
			if (k === playhead) g.set_source_rgba(1, 0.5, 0.4, 1);
			else g.set_source_rgba(0.6, 0.6, 0.63, 1);
			g.move_to(xOf(k) + 3, gridTop - 3);
			g.show_text(String(k + 1));
		}
	}

	g.set_source_rgba(0.35, 0.35, 0.38, 1);
	g.set_line_width(1);
	for (i = 0; i < lrs.length; i++) {
		g.move_to(0, lrs[i].top);
		g.line_to(w, lrs[i].top);
		g.stroke();
	}
	for (i = 0; i <= chN; i++) {
		g.move_to(0, cht + i * CHH);
		g.line_to(w, cht + i * CHH);
		g.stroke();
	}

	// notes
	for (j = 0; j < notes.length; j++) {
		nt = notes[j];
		var x0 = xOf(nt.st) + 1;
		var nw = Math.max(2, nt.len * cw - 2);
		var on = playhead >= 0 && playhead + 1 > nt.st && playhead < nt.st + nt.len;
		var nc = inScale(nt.pitch) ? NOTECOL : [0.60, 0.55, 0.50];
		r = rowOf(rws, nt.pitch);

		if (!r) {
			g.set_source_rgba(0.98, 0.45, 0.10, 1);
			var up = nt.pitch > hi;
			var ty = up ? top : bot;
			var dy = up ? 8 : -8;
			// bar along the edge over the note's time, triangle at its start
			g.rectangle(x0, up ? ty : ty - 3, nw, 3);
			g.fill();
			g.move_to(x0 + 1, ty);
			g.line_to(x0 + 11, ty);
			g.line_to(x0 + 6, ty + dy);
			g.close_path();
			g.fill();
		} else {
			var ny = r.top, nh = Math.max(3, r.h);
			if (nh > r.h) ny -= (nh - r.h) / 2;
			var cyn = ny + nh / 2;
			// glide: over the GLIDE part the body slides (ease in/out) from the previous pitch into this row
			var gw = 0, py = cyn;
			var pv = prevNote(nt);
			if (nt.gl > 0 && pv && pv.pitch !== nt.pitch) {
				var pr = rowOf(rws, pv.pitch);
				py = pr ? pr.top + pr.h / 2 : (pv.pitch > hi ? top : bot);
				gw = Math.min(nw, nt.gl * cw);
			}
			var hits = Math.max(1, nt.r);
			var hw = nw / hits;
			var duty = hits > 1 ? nt.d : 1;
			var bright = [Math.min(1, nc[0] + 0.15), Math.min(1, nc[1] + 0.2), Math.min(1, nc[2] + 0.25)];
			var hc = on ? bright : nc;
			// body background
			g.set_source_rgba(nc[0], nc[1], nc[2], 0.3);
			if (gw > 0) {
				ribbon(g, x0, gw, py, cyn, nh);
				g.fill();
			}
			g.rectangle(x0 + gw, ny, nw - gw, nh);
			g.fill();
			for (k = 0; k < hits; k++) {
				// opacity follows the velocity of each hit (VEL x FADE)
				var hv = nt.v * fadeFactor(nt, k);
				g.set_source_rgba(hc[0], hc[1], hc[2], 0.15 + 0.85 * hv);
				var hx0 = k * hw, hx1 = k * hw + Math.max(1, hw * duty);
				// part of the hit inside the glide: on the ribbon
				if (hx0 < gw) {
					ribbonPart(g, x0, gw, py, cyn, nh, hx0, Math.min(hx1, gw));
					g.fill();
				}
				if (hx1 > gw) {
					var sx = Math.max(hx0, gw);
					g.rectangle(x0 + sx, ny, hx1 - sx, nh);
					g.fill();
				}
			}
			var hot = nt === hoverEnd || (drag && drag.mode === 'end' && drag.nt === nt);
			g.set_source_rgba(1, 1, 1, hot ? 1 : 0.45);
			g.rectangle(x0 + nw - (hot ? 4 : 2), ny, hot ? 4 : 2, nh);
			g.fill();
		}

		for (i = 0; i < lrs.length; i++) {
			r = lrs[i];
			lane = r.lane;
			var val = nt[lane.key];
			norm = (val - lane.lo) / (lane.hi - lane.lo);
			var inactive = ((lane.key === 'd' || lane.key === 'fd') && nt.r <= 1) || (lane.key === 'gl' && !prevNote(nt));
			if (inactive) g.set_source_rgba(0.40, 0.38, 0.36, 0.7);
			else g.set_source_rgba(lane.col[0], lane.col[1], lane.col[2], 0.9);
			if (lane.bi) {
				// bipolar: bar from the middle line
				var mid = r.top + r.h / 2;
				var by = r.top + 2 + (1 - norm) * (r.h - 4);
				g.rectangle(x0, Math.min(mid, by), nw, Math.max(1, Math.abs(by - mid)));
				g.fill();
				g.set_source_rgba(0.35, 0.35, 0.38, 1);
				g.rectangle(x0, mid - 0.5, nw, 1);
				g.fill();
			} else {
				bh = Math.max(1, norm * (r.h - 4));
				g.rectangle(x0, r.top + r.h - 2 - bh, nw, bh);
				g.fill();
			}
			if (nw >= 18) {
				txt = lane.int ? String(val) : String(Math.round(val * 100));
				numLabel(g, x0 + 1, r.top + 2, txt);
			}
		}

		// chance cells: bar = PROB, text = op + amount, PTN below
		for (i = 0; i < chN; i++) {
			var cl = nt.ch[i];
			var cy = cht + i * CHH;
			if (!cl.op) {
				g.set_source_rgba(0.30, 0.32, 0.29, 1);
				g.rectangle(x0, cy + CHH - 3, nw, 1);
				g.fill();
				continue;
			}
			bh = Math.max(1, cl.p * (CHH - 4));
			g.set_source_rgba(CHCOL[0], CHCOL[1], CHCOL[2], 0.75);
			g.rectangle(x0, cy + CHH - 2 - bh, nw, bh);
			g.fill();
			if (nw >= 14) {
				numLabel(g, x0 + 1, cy + 2, cellText(cl));
				var sub = Math.round(cl.p * 100) + '%' + (cl.pb ? ' ' + cl.pa + ':' + cl.pb : '');
				if (nw >= 30) numLabel(g, x0 + 1, cy + 16, sub);
			}
		}
	}

	// outside the play range: dimmed
	g.set_source_rgba(0, 0, 0, 0.45);
	if (rStart > 0) { g.rectangle(labelW, gridTop, xOf(rStart) - labelW, laneBottom - gridTop); g.fill(); }
	if (rEnd < n - 1) { g.rectangle(xOf(rEnd + 1), gridTop, xOf(n) - xOf(rEnd + 1), laneBottom - gridTop); g.fill(); }
	var rt = rangeTop();

	// range strip
	g.set_source_rgba(0.07, 0.07, 0.07, 1);
	g.rectangle(labelW, rt, w - labelW, RANGEH);
	g.fill();
	g.set_source_rgba(0.75, 0.68, 0.50, 0.9);
	g.rectangle(xOf(rStart) + 1, rt + 2, xOf(rEnd + 1) - xOf(rStart) - 2, RANGEH - 4);
	g.fill();
	g.set_source_rgba(0.95, 0.92, 0.85, 1);
	g.rectangle(xOf(rStart) + 1, rt + 1, 3, RANGEH - 2);
	g.fill();
	g.rectangle(xOf(rEnd + 1) - 4, rt + 1, 3, RANGEH - 2);
	g.fill();

	// label column
	g.set_source_rgba(0.06, 0.06, 0.07, 1);
	g.rectangle(0, 0, labelW, h);
	g.fill();
	paintRowLabels(g, rws, top, bot);
	g.set_font_size(10);
	for (i = 0; i < lrs.length; i++) {
		r = lrs[i];
		var lc = r.lane.col;
		g.set_source_rgba(lc[0], lc[1], lc[2], 1);
		g.rectangle(0, r.top + 1, 3, r.h - 2);
		g.fill();
		g.set_source_rgba(0.85, 0.83, 0.78, 1);
		g.move_to(6, r.top + 12);
		g.show_text(r.lane.name);
	}
	for (i = 0; i < chN; i++) {
		var ly = cht + i * CHH;
		g.set_source_rgba(CHCOL[0], CHCOL[1], CHCOL[2], 1);
		g.rectangle(0, ly + 1, 3, CHH - 2);
		g.fill();
		g.set_source_rgba(0.85, 0.83, 0.78, 1);
		g.move_to(6, ly + 12);
		g.show_text('CHANCE ' + (i + 1));
		g.set_source_rgba(0.70, 0.45, 0.38, 1);
		g.move_to(labelW - 11, ly + 26);
		g.show_text('x');
	}
	g.set_font_size(9);
	g.set_source_rgba(chN < MAXCH ? 0.75 : 0.35, chN < MAXCH ? 0.80 : 0.35, chN < MAXCH ? 0.68 : 0.35, 1);
	g.move_to(6, adt + 11);
	g.show_text('+ CHANCE');
	g.set_font_size(8);
	g.set_source_rgba(0.85, 0.83, 0.78, 1);
	g.move_to(6, RANGEH - 2);
	g.show_text("RANGE");
	g.set_source_rgba(0.35, 0.35, 0.38, 1);
	g.set_line_width(1);
	g.move_to(labelW, 0);
	g.line_to(labelW, h);
	g.stroke();
	g.move_to(0, bot);
	g.line_to(w, bot);
	g.stroke();

	if (menu) paintMenu(g, w, h);
}
paint.local = 1;

function menuRect(w, h) {
	var mw = MENUCOLS.length * MENUW + 4, mh = 5 * MENUH + 4;
	var mx = Math.max(labelW, Math.min(w - mw, menu.x - mw / 2));
	var my = menu.y - mh - 4;
	if (my < 0) my = Math.min(h - mh, menu.y + 8);
	return [mx, my, mw, mh];
}
menuRect.local = 1;

function menuItemAt(x, y) {
	var wh = dims();
	var r = menuRect(wh[0], wh[1]);
	var c = Math.floor((x - r[0] - 2) / MENUW), k = Math.floor((y - r[1] - 2) / MENUH);
	if (x < r[0] || y < r[1] || x >= r[0] + r[2] || y >= r[1] + r[3]) return -2;   // outside
	if (c < 0 || c >= MENUCOLS.length || k < 0 || k >= MENUCOLS[c].length) return -1;
	return MENUCOLS[c][k];
}
menuItemAt.local = 1;

function paintMenu(g, w, h) {
	var r = menuRect(w, h);
	var cur = menu.nt.ch[menu.li].op;
	g.set_source_rgba(0.05, 0.05, 0.05, 0.95);
	g.rectangle(r[0], r[1], r[2], r[3]);
	g.fill();
	g.set_source_rgba(0.55, 0.55, 0.50, 1);
	g.set_line_width(1);
	g.rectangle(r[0] + 0.5, r[1] + 0.5, r[2] - 1, r[3] - 1);
	g.stroke();
	g.set_font_size(10);
	for (var c = 0; c < MENUCOLS.length; c++) {
		for (var k = 0; k < MENUCOLS[c].length; k++) {
			var op = MENUCOLS[c][k];
			var x = r[0] + 2 + c * MENUW, y = r[1] + 2 + k * MENUH;
			if (op === cur) {
				g.set_source_rgba(CHCOL[0], CHCOL[1], CHCOL[2], 0.6);
				g.rectangle(x, y, MENUW - 2, MENUH - 1);
				g.fill();
			}
			g.set_source_rgba(0.92, 0.90, 0.84, 1);
			g.move_to(x + 4, y + 12);
			g.show_text(op === 0 ? 'none' : OPS[op].n);
		}
	}
}
paintMenu.local = 1;

// glide ribbon: centre line eases from y0 to y1 over width gw, thickness nh
function easeY(y0, y1, t) {
	return y0 + (y1 - y0) * t * t * (3 - 2 * t);
}
easeY.local = 1;

function ribbon(g, x0, gw, y0, y1, nh) {
	ribbonPart(g, x0, gw, y0, y1, nh, 0, gw);
}
ribbon.local = 1;

// the piece of the ribbon between a and b (pixels from x0)
function ribbonPart(g, x0, gw, y0, y1, nh, a, b) {
	var N = Math.max(2, Math.ceil((b - a) / 2));
	var i, x, t;
	for (i = 0; i <= N; i++) {
		x = a + (b - a) * i / N;
		t = x / gw;
		if (i === 0) g.move_to(x0 + x, easeY(y0, y1, t) - nh / 2);
		else g.line_to(x0 + x, easeY(y0, y1, t) - nh / 2);
	}
	for (i = N; i >= 0; i--) {
		x = a + (b - a) * i / N;
		t = x / gw;
		g.line_to(x0 + x, easeY(y0, y1, t) + nh / 2);
	}
	g.close_path();
}
ribbonPart.local = 1;

function paintRowLabels(g, rws, top, bot) {
	var fs = 9;
	g.set_font_size(fs);
	var placed = [];
	var pass, i, r, cy, y0, y1, ok, j;
	for (pass = 0; pass < 2; pass++) {
		for (i = 0; i < rws.length; i++) {
			r = rws[i];
			var periodRow = (r.d === 0);
			if ((pass === 0) !== periodRow) continue;
			cy = Math.min(bot - fs / 2 - 1, Math.max(top + fs / 2 + 1, r.top + r.h / 2));
			y0 = cy - fs / 2 - 1;
			y1 = cy + fs / 2 + 1;
			ok = true;
			for (j = 0; j < placed.length; j++) {
				if (y0 < placed[j][1] && y1 > placed[j][0]) { ok = false; break; }
			}
			if (!ok) continue;
			placed.push([y0, y1]);
			var ty = cy + fs * 0.35;
			var on = !!mask[r.d];
			if (!on) g.set_source_rgba(0.38, 0.37, 0.36, 1);
			else if (periodRow) g.set_source_rgba(1, 0.85, 0.4, 1);
			else g.set_source_rgba(0.75, 0.75, 0.78, 1);
			g.move_to(3, ty);
			g.show_text(String(r.d));
			g.move_to(22, ty);
			g.show_text("p" + r.p);
			var ct = (Math.round(r.c * 10) / 10) + "";
			var tw = g.text_measure(ct)[0];
			g.move_to(labelW - 4 - tw, ty);
			g.show_text(ct);
		}
	}
}
paintRowLabels.local = 1;

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
	if (full) rEnd = n - 1;
	fitToSteps();
	if (playhead >= n) playhead = -1;
	changed(false);
}

function chbuffer(name) {
	chBufName = String(name);
	writeChance();
}

function buffer(name) {
	bufName = String(name);
	var st = keep[bufName];
	if (!notes.length && st && st.length) {
		unflat(st);
		var vw = keep[bufName + ' view'];
		if (vw && vw.length === 3) { lo = vw[0]; hi = vw[1]; beatN = vw[2]; setSnapQ(); }
		mgraphics.redraw();
	}
	writeBuffer();
	sendRange();
	outlet(0, "lanes", chN);
	fitBox();
}

function anything() {
	var a = arrayfromargs(arguments);
	if (messagename === 'notes') {
		unflat(a);
		changed(false);
	} else if (messagename === 'mask') {
		// mask all / mask none / mask m0 m1 ...
		var m = [];
		for (var i = 0; i < scl.size; i++) {
			if (a[0] === 'all') m.push(1);
			else if (a[0] === 'none') m.push(0);
			else m.push(a[i] === undefined ? 1 : (a[i] ? 1 : 0));
		}
		mask = m;
		changed(true);
	} else {
		post('dingus.pgRoll: unknown message ' + messagename + '\n');
	}
}

function snap(q) {
	snapOn = q > 0 ? 1 : 0;
	setSnapQ();
	mgraphics.redraw();
}

function setSnapQ() {
	snapQ = snapOn ? 1 / beatN : 0;
}
setSnapQ.local = 1;


function clear() {
	notes = [];
	changed(true);
}

// clear all: notes, chance lanes, full range, every scale degree on (tuning and settings stay)
function clearall() {
	notes = [];
	chN = 0;
	rStart = 0;
	rEnd = n - 1;
	fullMask();
	pendingMask = null;
	menu = null;
	changed(true);
}

function addlane() {
	if (chN >= MAXCH) return;
	chN++;
	for (var i = 0; i < notes.length; i++) fitCells(notes[i]);
	changed(true);
}

function removelane(i) {
	i = Math.round(i);
	if (i < 0 || i >= chN) return;
	for (var k = 0; k < notes.length; k++) notes[k].ch.splice(i, 1);
	chN--;
	menu = null;
	changed(true);
}

function bang() {
	outlet(0, flat());
}

function labelwidth(v) {
	labelW = Math.max(0, v);
	mgraphics.redraw();
}

function setmin(v) {
	lo = Math.round(v);
	parkView();
	mgraphics.redraw();
}

function setmax(v) {
	hi = Math.round(v);
	parkView();
	mgraphics.redraw();
}

function beat(v) {
	beatN = Math.max(1, Math.min(16, Math.round(v) || 1));
	setSnapQ();
	parkView();
	mgraphics.redraw();
}

// view settings survive a script reload (autowatch) like the notes do
function parkView() {
	if (bufName) keep[bufName + ' view'] = [lo, hi, beatN];
}
parkView.local = 1;

// --- auto-scroll while a note is dragged above / below the roll ---
var scrollTask = new Task(scrollTick);
scrollTask.interval = SCROLLMS;

// highest (up) / lowest scale pitch inside the view
function edgePitch(up) {
	var v;
	if (up) { for (v = hi; v >= lo; v--) if (inScale(v)) return v; return hi; }
	for (v = lo; v <= hi; v++) if (inScale(v)) return v;
	return lo;
}
edgePitch.local = 1;

function scrollTick() {
	if (!drag || drag.mode !== 'move' || inRoll(drag.y)) {
		scrollTask.cancel();
		return;
	}
	var d = drag.y < rollTop() ? 1 : -1;
	if ((d > 0 && hi >= PTN_N - 1) || (d < 0 && lo <= 0)) return;
	lo += d;
	hi += d;
	parkView();
	outlet(0, 'low', lo);
	moveDrag(drag.x, drag.y);
	mgraphics.redraw();
}
scrollTick.local = 1;

function dictionary(name) {
	var dct = new Dict(name);
	var size_ = dct.get("size");
	var cents = dct.get("cents");
	if (!size_ || !cents) return;
	var oldSize = scl.size;
	scl.size = size_;
	scl.cents = (typeof cents === "object") ? cents.slice(0, size_) : [cents];
	scl.range = dct.get("range") || 1200;
	scl.tune = dct.get("tune") || 440;
	scl.center = dct.get("center");
	if (scl.center === null || scl.center === undefined) scl.center = 69;
	if (pendingMask && pendingMask.length === size_) {
		mask = pendingMask;
		pendingMask = null;
	} else if (size_ !== oldSize || mask.length !== size_) fullMask();
	changed(false);
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

function laneAt(y) {
	var lrs = laneRects();
	for (var i = 0; i < lrs.length; i++) {
		if (y >= lrs[i].top && y < lrs[i].top + lrs[i].h) return lrs[i];
	}
	return null;
}
laneAt.local = 1;

function setValue(nt, lane, v) {
	if (!nt || nt[lane.key] === v) return false;
	nt[lane.key] = v;
	return true;
}
setValue.local = 1;

function inRoll(y) {
	return y >= rollTop() && y < rollBottom();
}
inRoll.local = 1;

function endAt(x, y) {
	if (!inRoll(y)) return null;
	var rws = rows();
	var best = null, bestD = ENDGRAB + 1;
	for (var i = 0; i < notes.length; i++) {
		var nt = notes[i];
		var r = rowOf(rws, nt.pitch);
		if (!r) continue;
		var pad = Math.max(0, (6 - r.h) / 2);
		if (y < r.top - pad || y > r.top + r.h + pad) continue;
		var d = Math.abs(x - xOf(nt.st + nt.len));
		if (d < bestD) { best = nt; bestD = d; }
	}
	return best;
}
endAt.local = 1;

function onidle(x, y, but, cmd, shift, capslock, option, ctrl) {
	var e = endAt(x, y);
	if (e !== hoverEnd) {
		hoverEnd = e;
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
	var h = dims()[1];
	if (menu) {
		var it = menuItemAt(x, y);
		if (it >= 0) {
			var cl = menu.nt.ch[menu.li];
			if (cl.op !== it) {
				cl.op = it;
				cl.amt = OPS[it].a ? OPS[it].a[2] : 0;   // default amount of the new op
				if (it && cl.p <= 0) cl.p = 0.5;
			}
			menu = null;
			changed(true);
			return;
		}
		menu = null;
		mgraphics.redraw();
		if (it === -1) return;
	}
	var li = chAt(y);
	if (x < labelW) {
		if (li >= 0) {
			if (x >= labelW - 16 && y >= chTop() + li * CHH + CHH / 2) removelane(li);
			return;
		}
		if (y >= addTop() && y < totalH()) { addlane(); return; }
		if (inRoll(y)) {
			var d = degreeOf(pitchAtY(rows(), y));
			mask[d] = mask[d] ? 0 : 1;
			changed(true);
		}
		return;
	}
	if (y >= addTop() && y < totalH()) { addlane(); return; }
	if (li >= 0) {
		var cn = noteAt(posOf(x));
		if (!cn) return;
		var cc = cn.ch[li];
		if (shift) {
			// PTN: next (shift) / previous (shift-alt)
			var pi = 0;
			for (var q = 0; q < PTNS.length; q++) if (PTNS[q][0] === cc.pa && PTNS[q][1] === cc.pb) pi = q;
			pi = (pi + (option ? PTNS.length - 1 : 1)) % PTNS.length;
			cc.pa = PTNS[pi][0];
			cc.pb = PTNS[pi][1];
			changed(true);
			return;
		}
		drag = { mode: 'cell', nt: cn, li: li, x0: x, y0: y, p0: cc.p, a0: opAmount(cc), amtMode: !!option, moved: false };
		return;
	}
	if (y < RANGEH) {
		var sp = posOf(x);
		if (Math.abs(x - xOf(rStart)) <= 6) drag = { mode: 'rstart' };
		else if (Math.abs(x - xOf(rEnd + 1)) <= 6) drag = { mode: 'rend' };
		else if (sp >= rStart && sp < rEnd + 1) drag = { mode: 'rmove', grab: stepOf(x) - rStart };
		else if (sp < rStart) { rStart = stepOf(x); drag = { mode: 'rstart' }; changed(true); }
		else { rEnd = stepOf(x); drag = { mode: 'rend' }; changed(true); }
		return;
	}
	var pos = posOf(x);
	var lr = laneAt(y);
	if (lr) {
		var v = laneValueAt(lr.lane, lr, y);
		drag = { mode: 'value', lane: lr.lane, rect: lr, lastPos: pos, lastV: v, y0: y, v0: v, nt0: noteAt(pos) };
		if (setValue(noteAt(pos), lr.lane, v)) changed(false);
		return;
	}
	if (!inRoll(y)) return;
	var p = snapPitch(pitchAtY(rows(), y));
	var nt = endAt(x, y);
	if (nt) {
		drag = { mode: 'end', nt: nt };
		return;
	}
	nt = noteAt(pos);
	if (nt) {
		if (nt.pitch !== p) {
			nt.pitch = p;
			changed(false);
		}
		drag = { mode: 'move', nt: nt, grab: pos - nt.st, copy: !!option, cloned: false };
		return;
	}
	// new note: start snapped down to the grid, but not into the note before
	var st = Math.max(snapDown(pos, option), prevEnd(pos, null));
	var room = maxLen(st, null);
	if (room < MINLEN) return;
	nt = newNote(st, Math.min(minLen(option), room), p);
	notes.push(nt);
	drag = { mode: 'end', nt: nt };
	changed(false);
}
onclick.local = 1;

function ondrag(x, y, but, cmd, shift, capslock, option, ctrl) {
	if (!drag) return;
	if (but === 0) {
		if (drag.mode === 'cell' && !drag.moved) {
			// click without a drag: op menu
			menu = { nt: drag.nt, li: drag.li, x: x, y: chTop() + drag.li * CHH };
		}
		scrollTask.cancel();
		drag = null;
		changed(true);
		return;
	}
	if (drag.mode === 'cell') {
		var dy = drag.y0 - y;
		if (!drag.moved && Math.abs(dy) < 3) return;
		drag.moved = true;
		var ce = drag.nt.ch[drag.li];
		if (drag.amtMode) {
			var od = OPS[ce.op];
			if (!od || !od.a) return;
			var na = Math.round(drag.a0 + dy / 6);
			na = Math.max(od.a[0], Math.min(amtMax(od), na));
			if (na !== ce.amt) { ce.amt = na; changed(false); }
		} else {
			var np = Math.max(0, Math.min(1, drag.p0 + dy / 100));
			if (np !== ce.p) { ce.p = np; changed(false); }
		}
		return;
	}
	var pos = posOf(x);
	var k = stepOf(x);
	var nt = drag.nt;
	if (drag.mode === 'rstart' || drag.mode === 'rend' || drag.mode === 'rmove') {
		var b = Math.round(pos);
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
			var r = drag.rect;
			v = clampVal(lane, drag.v0 - (y - drag.y0) / (r.h - 4) * (lane.hi - lane.lo) * 0.1);
			if (setValue(drag.nt0, lane, v)) changed(false);
			return;
		}
		v = laneValueAt(lane, drag.rect, y);
		var any = false;
		// every note between the last and the current mouse position, values interpolated
		var a0 = Math.min(drag.lastPos, pos), a1 = Math.max(drag.lastPos, pos);
		for (var i = 0; i < notes.length; i++) {
			var o = notes[i];
			if (o.st + o.len <= a0 || o.st > a1) continue;
			var mid = Math.min(Math.max(o.st, a0), a1);
			var t = (a1 > a0) ? (mid - drag.lastPos) / (pos - drag.lastPos) : 1;
			if (setValue(o, lane, clampVal(lane, drag.lastV + (v - drag.lastV) * t))) any = true;
		}
		drag.lastPos = pos;
		drag.lastV = v;
		if (any) changed(false);
	} else if (drag.mode === 'end') {
		var room = maxLen(nt.st, nt);
		var L = snapRound(pos, option) - nt.st;
		L = Math.max(Math.min(minLen(option), room), Math.min(room, L));
		if (Math.abs(L - nt.len) > 1e-9) {
			nt.len = L;
			changed(false);
		}
	} else if (drag.mode === 'move') {
		moveDrag(x, y);
		if (!inRoll(y) && !scrollTask.running) scrollTask.repeat();
	}
}
ondrag.local = 1;

// move (or option: copy) the dragged note to the mouse; above / below the roll = the view's top / bottom scale row
function moveDrag(x, y) {
	var nt = drag.nt;
	drag.x = x;
	drag.y = y;
	// option is the copy key here, so moves always follow the grid (snap off = free)
	var st = snapRound(posOf(x) - drag.grab, false);
	st = Math.max(0, Math.min(n - nt.len, st));
	var p = inRoll(y) ? snapPitch(pitchAtY(rows(), y)) : edgePitch(y < rollTop());
	if (drag.copy && !drag.cloned) {
		if (Math.abs(st - nt.st) < EPS && p === nt.pitch) return;
		if (!fits(st, nt.len, null)) return;
		var c = copyNote(nt);
		c.st = st;
		c.pitch = p;
		notes.push(c);
		drag.nt = c;
		drag.cloned = true;
		changed(false);
		return;
	}
	var moved = false;
	if (Math.abs(st - nt.st) > EPS && fits(st, nt.len, nt)) { nt.st = st; moved = true; }
	if (p !== nt.pitch) { nt.pitch = p; moved = true; }
	if (moved) changed(false);
}
moveDrag.local = 1;

function ondblclick(x, y, but, cmd, shift, capslock, option, ctrl) {
	drag = null;
	menu = null;
	if (x < labelW) return;
	var li = chAt(y);
	if (li >= 0) {
		// double-click a chance cell: clear it
		var cn = noteAt(posOf(x));
		if (cn) {
			cn.ch[li] = newCell();
			changed(true);
		} else mgraphics.redraw();
		return;
	}
	if (y < RANGEH) {
		rStart = 0;
		rEnd = n - 1;
		changed(true);
		return;
	}
	if (!inRoll(y)) return;
	var nt = noteAt(posOf(x));
	if (nt) {
		notes.splice(notes.indexOf(nt), 1);
		changed(true);
	}
}
ondblclick.local = 1;

// --- pattr -------------------------------------------------
function getvalueof() {
	return flat();
}

function setvalueof() {
	unflat(arrayfromargs(arguments));
	changed(false);
}
