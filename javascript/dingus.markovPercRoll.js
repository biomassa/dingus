// ===========================================================
// dingus.markovPercRoll.js  (v8ui)
//
// Editor for the Markov percussion sequencer (uMP), engine code/dingus.markovPerc.gendsp (mc.gen~, one
// channel per row). Based on dingus.markovRoll.js.
// 8 rows, each its own Markov chain. A hit is a state of its row's chain: the chain stays on it for the
// hit's length (row steps), then follows one of the hit's links, chosen by weight. Where a hit sits only
// sets the order of the row's hits ('next hit' links); gaps take no time. A rest is a hit with VEL 0.
// TIME   the roll shows 'cycles' phasor cycles (1 by default). Each row slices a cycle into its own steps
//        (4 against 3 shows as such). A trigger-clocked row shows its steps at the same nominal width.
// ROW STRIP (left of each row):
//        M        mute (the chain keeps walking, nothing is sent)
//        S        the row's START: click = select it, drag from it to a hit of the row = a new link
//        P / T    the row's clock: P = the phasor, T = the trigger inlet; click = switch
//        steps    P: steps per phasor cycle (1..64); T: div, every div-th edge is a step (1..16) and
//                 the steps per cycle the row is drawn with; drag up / down
//        rs       restart every rs row steps (0 = never, shown as -); drag up / down,
//                 double-click = one cycle (= steps)
// ROLL   click an empty place = new hit there (start snapped down to the grid), drag right = longer
//        drag a hit's right end = resize (grid snap, alt = free)
//        drag a hit's body = move it (sideways = time, up / down = into another row: the same place in
//        the cycle; its own links start over), option-drag = move a copy
//        double-click a hit = delete it
// GROUP  shift-drag from empty space = a rectangle; the hits it touches are picked (white outlines).
//        drag one of them = they all move in time; double-click one = they are all deleted.
// LINKS  every new hit has one link to the next hit of its row (the last hit's goes to the first).
//        shift-drag from a hit to a hit of the same row = a new link (to itself too: drag out and back).
//        click a hit or a START: its links are drawn bright, each with a handle at the target showing its
//        chance in %. drag a handle up / down = its chance, 1..99 % (shift = fine); the other links share
//        the rest. double-click a handle = delete the link. A link's colour: blue = unlikely ... red = certain.
// FOLLOW shift-drag from a hit to a hit of ANOTHER row = a follow link (teal): when the hit plays, that row
//        jumps to the target at once and walks on from it. Several follow links into one row = one of them
//        (or none): their % handles (below the target) are each its own chance; together at most 100 %,
//        the rest = no push (the row goes on by itself). Pushed hits push no further.
// LANES (the selected hit, or the picked group): VEL, RATCH (1..8, spread over the hit's length),
//        ACC (accent: + accvel, decay x accdec in the engine), ATK (ms), DEC (ms), CURVE (-1..1, > 0 snappier)
//        click / drag anywhere in the lane; shift = fine
// CHANCE lanes: as in dingus.markovRoll.js (op, PROB, PTN, amount; the cell editor; at least 3 lanes);
//        the cells of the selected hit's row are shown, the selected hit's cells can be edited.
// GHOSTS where each row's walk plays its hits in the shown cycles (the most likely links); a red end =
//        cut by a restart.
// SEQUENCES: 32, each with its hits, rows, lanes and cycles. The shown sequence plays from one engine
//        bank; a newly chosen one is written to the other bank and takes over at the phasor wrap
//        ('bankis' confirms). All 32 are saved to <presets folder>/uMPseq_<name>.json on every change.
//
// inlet 0:
//   buffer name / chbuffer name   the engine's buffer~s (hits + rows / chance cells)
//   seqname name       the instance name: reads the sequences file
//   seq n / seqstep d  sequence 0..31 / d up or down;  copyseq / pasteseq / clear / clearall
//   bankis b           the engine's playing bank (gen~ out 4)   dsp 0|1   audio on / off
//   row r steps n / row r clock 0|1 / row r div n / row r restart n / row r mute 0|1   (r = 1..8)
//   cycles n           cycles shown (1..8)     beat n   grid lines (and snap) per row step
//   snap 0|1   ghosts 0|1   labelwidth n   undo / redo   addlane / removelane i   bang
// inlet 1:
//   list               the hit that plays in each row (8 numbers, -1 = none; gen~ out 3)
// outlet 0: stored list after each edit; 'needbuffer' at load; 'lanes n'; 'engine pend b' /
//   'engine swapnow k'; 'seqis n' (1..32)
//
// hit buffer~ (11 channels, 16408 frames): bank b, row r: base = b * 8192 + r * 1024
//   hit i 0..126 (127 = START): ch 1 length (row steps)  2 velocity  3 ratchets  4 accent  5 attack ms
//   6 decay ms  7 curve  8 first link  9 link count  10 first follow link  11 follow link count;
//   links at base + 128 + k: ch 1 target  2 cumulative chance  3 (follow links) target row
//   frames 16400 + r: the engine's push requests (not written here)
//   row settings at 16384 + b * 8 + r: ch 1 steps per cycle  2 clock  3 div  4 restart  5 mute  6 chance lanes
// chance buffer~ (5 channels, 65536 frames): frame = b * 32768 + lane * 1024 + r * 128 + hit: op prob ptnA ptnB amount
// ===========================================================

inlets = 2;
outlets = 1;
autowatch = 1;

setinletassist(0, 'buffer, chbuffer, seqname, seq, row, cycles, ...');
setinletassist(1, 'list: the hit that plays in each row');
setoutletassist(0, 'stored list / needbuffer / engine / seqis / lanes');

mgraphics.init();
mgraphics.relative_coords = 0;
mgraphics.autofill = 0;

var NR = 8;            // rows
var MAXSTEPS = 64;     // steps per cycle
var MAXDIV = 16;
var MAXCYC = 8;
var MAXHITS = 127;     // per row (127 = START)
var STARTIDX = 127;
var LINKBASE = 128, MAXLINKS = 896;
var ROWF = 1024, BANKF = 8192, METABASE = 16384;
var NCH = 11;
var MAXCH = 32, CHF = 5, CHBANK = 32768;
var EPS = 1e-6;
var NSEQ = 32;
var FORMAT = 23;       // stored lists start with -23 (older: -21 no follow links, -22 with a fill flag)
var PREFIX = 'uMP';

// --- state -------------------------------------------------
var hits = [];         // {row, st, len, v, r, acc, atk, dec, cv, ch: [cells], lk: [{t, w}]}
var rowCfg = [];       // {steps, clk, div, rs, mute}
var startLk = [];      // per row: [{t, w}]
var ncyc = 1;
var MINCH = 3;
var chN = MINCH;
var chBufName = '';
var bufName = '';
var menu = null;
var editor = null;
var playheads = [];
var seqs = [];
var cur = 0;
var bank = 0;
var pend = -1;
var queued = -1;
var swapCount = 0;
var dspOn = 1;
var clip = null;
var seqName = '';
var seqsLoaded = false;
for (var si = 0; si < NSEQ; si++) seqs.push(null);
var labelW = 150;
var beatN = 1;
var snapOn = 1;
var ghostsOn = 1;

var HEADER = 14;
var ROLLH = 456;       // 8 rows of 57
var LANEH = 30;
var CHH = 48, CHOP = 16, CHBOT = 15, ZONEW = 44;
var ADDH = 14;
var HW = 34, HH = 12;
var CHCOL = [0.52, 0.60, 0.46];
var HITCOL = [0.85, 0.65, 0.30];
var PLAYCOL = [1.0, 0.30, 0.70];
var GHOSTCOL = [0.70, 0.70, 0.72];
var MUTECOL = [0.80, 0.30, 0.25];

// lanes; 'sq' = squared scale (finer at the low end)
var LANES = [
	{ key: 'v', name: 'VEL', lo: 0, hi: 1, col: [0.80, 0.42, 0.26] },
	{ key: 'r', name: 'RATCH', lo: 1, hi: 8, int: 1, col: [0.62, 0.47, 0.58] },
	{ key: 'acc', name: 'ACC', lo: 0, hi: 1, int: 1, col: [0.90, 0.75, 0.30] },
	{ key: 'atk', name: 'ATK', lo: 0, hi: 200, sq: 1, unit: 'ms', col: [0.55, 0.60, 0.70] },
	{ key: 'dec', name: 'DEC', lo: 5, hi: 2000, sq: 1, unit: 'ms', col: [0.62, 0.66, 0.38] },
	{ key: 'cv', name: 'CURVE', lo: -1, hi: 1, bi: 1, col: [0.66, 0.56, 0.44] }
];

var GATESTEPS = [1 / 16, 1 / 8, 1 / 6, 1 / 4, 1 / 3, 1 / 2, 3 / 4, 1, 1.5, 2, 3, 4];
var GATENAMES = ['1/16', '1/8', '1/6', '1/4', '1/3', '1/2', '3/4', '1', '1.5', '2', '3', '4'];

// chance ops (index = the engine's op number)
var OPS = [];
(function () {
	for (var i = 0; i < 32; i++) OPS.push({ n: '' });
	OPS[0] = { n: '-' };
	OPS[1] = { n: 'MUTE' };
	OPS[2] = { n: 'UNMUTE' };
	OPS[9] = { n: 'VEL-', a: [1, 100, 30], u: 'pts' };
	OPS[10] = { n: 'VEL+', a: [1, 100, 30], u: 'pts' };
	OPS[11] = { n: 'VEL MAX' };
	OPS[15] = { n: 'RATCH', a: [2, 8, 2], u: 'x' };
	OPS[21] = { n: 'DELAY', a: [0, 7, 3], u: 'gate' };
	OPS[27] = { n: 'VEL?', a: [1, 100, 20], u: 'rnd' };
	OPS[30] = { n: 'ACC ON' };
	OPS[31] = { n: 'ACC OFF' };
})();
var MENUCOLS = [[0, 1, 2], [9, 10, 27, 11], [30, 31], [15], [21]];
var MENUHEAD = ['PLAY', 'VEL', 'ACCENT', 'RATCH', 'TIME'];
var MENUW = 72, MENUH = 20, MENUTOP = 16;
var EDW = 6 * 72 + 8, EDH = 22 + MENUTOP + 5 * 20 + 4 + 4 * 26 + 6;
var PTNS = [[0, 0]];
(function () { for (var b = 2; b <= 8; b++) for (var a = 1; a <= b; a++) PTNS.push([a, b]); })();

var drag = null;
var hoverEnd = null;
var ENDGRAB = 7;
var MINLEN = 0.05;
var sel = null;        // a hit, 'S<row>' (a row's START) or null
var group = [];

function defaultRows() {
	rowCfg = [];
	startLk = [];
	for (var r = 0; r < NR; r++) {
		rowCfg.push({ steps: 16, clk: 0, div: 1, rs: 16, mute: 0 });
		startLk.push([{ t: null, w: 100 }]);
	}
}
defaultRows.local = 1;
defaultRows();
for (var pi0 = 0; pi0 < NR; pi0++) playheads.push(-1);

var askTask = new Task(function () { if (!bufName) outlet(0, 'needbuffer'); });
askTask.schedule(50);

// --- geometry ----------------------------------------------
function dims() { return mgraphics.size; }
dims.local = 1;
function rollTop() { return HEADER; }
rollTop.local = 1;
function rollBottom() { return HEADER + ROLLH; }
rollBottom.local = 1;
function RH() { return ROLLH / NR; }
RH.local = 1;
function rowTop(r) { return rollTop() + r * RH(); }
rowTop.local = 1;
function rowAt(y) {
	if (y < rollTop() || y >= rollBottom()) return -1;
	return Math.max(0, Math.min(NR - 1, Math.floor((y - rollTop()) / RH())));
}
rowAt.local = 1;
// the hit bar inside its row band
function hitTop(r) { return rowTop(r) + 8; }
hitTop.local = 1;
function hitH() { return Math.max(6, RH() - 16); }
hitH.local = 1;
function hitY(r) { return hitTop(r) + hitH() / 2; }
hitY.local = 1;
function chTop() { return rollBottom() + LANES.length * LANEH; }
chTop.local = 1;
function addTop() { return chTop() + chN * CHH; }
addTop.local = 1;
function totalH() { return addTop() + ADDH; }
totalH.local = 1;

function fitBox() {
	var want = totalH();
	try {
		var pr = box.getattr('presentation_rect');
		if (pr && Math.abs(pr[3] - want) > 0.5) box.setattr('presentation_rect', [pr[0], pr[1], pr[2], want]);
		var rr = box.getattr('patching_rect');
		if (rr && Math.abs(rr[3] - want) > 0.5) box.setattr('patching_rect', [rr[0], rr[1], rr[2], want]);
	} catch (e) {}
}
fitBox.local = 1;

function chAt(y) {
	if (y < chTop() || y >= addTop()) return -1;
	return Math.floor((y - chTop()) / CHH);
}
chAt.local = 1;

function laneRects() {
	var y = rollBottom(), out = [];
	for (var i = 0; i < LANES.length; i++) {
		out.push({ top: y, h: LANEH, lane: LANES[i] });
		y += LANEH;
	}
	return out;
}
laneRects.local = 1;

// row steps shown: 'cycles' cycles of the row's steps
function span(r) { return ncyc * rowCfg[r].steps; }
span.local = 1;
// pixels per row step
function colW(r) { return (dims()[0] - labelW) / span(r); }
colW.local = 1;
function xOf(r, t) { return labelW + t * colW(r); }
xOf.local = 1;
function posOf(r, x) { return Math.max(0, Math.min(span(r), (x - labelW) / colW(r))); }
posOf.local = 1;

// --- time grid ---------------------------------------------
function snapQ() { return snapOn ? 1 / beatN : 0; }
snapQ.local = 1;
function gridOn(option) { return snapQ() > 0 && !option; }
gridOn.local = 1;
function snapRound(p, option) {
	var q = snapQ();
	return gridOn(option) ? Math.round(Math.round(p / q) * q * 1e6) / 1e6 : p;
}
snapRound.local = 1;
function snapDown(p, option) {
	var q = snapQ();
	return gridOn(option) ? Math.round(Math.floor(p / q + EPS) * q * 1e6) / 1e6 : p;
}
snapDown.local = 1;
function minLen(option) { return gridOn(option) ? snapQ() : MINLEN; }
minLen.local = 1;

// --- hits --------------------------------------------------
function rowHits(r) {
	var out = [];
	for (var i = 0; i < hits.length; i++) if (hits[i].row === r) out.push(hits[i]);
	return out;
}
rowHits.local = 1;

// hits sorted by row, then time: a hit's index in its row = its engine index
function sortHits() {
	hits.sort(function (a, b) { return (a.row - b.row) || (a.st - b.st); });
}
sortHits.local = 1;

function rowIndex(h) {
	var k = 0;
	for (var i = 0; i < hits.length; i++) {
		if (hits[i] === h) return k;
		if (hits[i].row === h.row) k++;
	}
	return -1;
}
rowIndex.local = 1;

function covers(h, pos) { return pos >= h.st - EPS && pos < h.st + h.len - EPS; }
covers.local = 1;

function hitOn(r, pos) {
	for (var i = 0; i < hits.length; i++) if (hits[i].row === r && covers(hits[i], pos)) return hits[i];
	return null;
}
hitOn.local = 1;

// the row the lanes and chance cells show: the selection's
function focusRow() {
	if (sel && isStart(sel)) return startRow(sel);
	if (sel) return sel.row;
	if (group.length) return group[0].row;
	return -1;
}
focusRow.local = 1;

function nextHit(h) {
	var best = null, first = null;
	for (var i = 0; i < hits.length; i++) {
		var o = hits[i];
		if (o.row !== h.row) continue;
		if (o.st > h.st && (!best || o.st < best.st)) best = o;
		if (o !== h && (!first || o.st < first.st)) first = o;
	}
	return best || first;
}
nextHit.local = 1;

function prevEnd(r, pos, self) {
	var m = 0;
	for (var i = 0; i < hits.length; i++) {
		var o = hits[i];
		if (o === self || o.row !== r) continue;
		var e = o.st + o.len;
		if (e <= pos + EPS) m = Math.max(m, e);
	}
	return m;
}
prevEnd.local = 1;

function maxLen(r, st, self) {
	var m = span(r) - st;
	for (var i = 0; i < hits.length; i++) {
		var o = hits[i];
		if (o === self || o.row !== r) continue;
		if (o.st >= st - EPS) m = Math.min(m, o.st - st);
	}
	return m;
}
maxLen.local = 1;

function fits(r, st, len, self, ignore) {
	if (st < -EPS || st + len > span(r) + EPS) return false;
	for (var i = 0; i < hits.length; i++) {
		var o = hits[i];
		if (o === self || o.row !== r || (ignore && ignore.indexOf(o) >= 0)) continue;
		if (st < o.st + o.len - EPS && o.st < st + len - EPS) return false;
	}
	return true;
}
fits.local = 1;

// hits beyond a row's span go, the last one is cut; at most MAXHITS a row
function fitToSpan() {
	var kept = [], cnt = [];
	for (var r = 0; r < NR; r++) cnt.push(0);
	sortHits();
	for (var i = 0; i < hits.length; i++) {
		var h = hits[i], sp = span(h.row);
		if (h.st >= sp - EPS) continue;
		if (h.st + h.len > sp) h.len = sp - h.st;
		if (h.len < MINLEN || cnt[h.row] >= MAXHITS) continue;
		cnt[h.row]++;
		kept.push(h);
	}
	hits = kept;
}
fitToSpan.local = 1;

function newCell() { return { op: 0, p: 0, pa: 0, pb: 0, amt: 0 }; }
newCell.local = 1;

function fitCells(h) {
	if (!h.ch) h.ch = [];
	while (h.ch.length < chN) h.ch.push(newCell());
	if (h.ch.length > chN) h.ch.length = chN;
}
fitCells.local = 1;

function newHit(r, st, len) {
	var h = { row: r, st: st, len: len, v: 1, r: 1, acc: 0, atk: 1, dec: 150, cv: 0, ch: [], lk: [{ t: null, w: 100 }], fl: [] };
	fitCells(h);
	return h;
}
newHit.local = 1;

function copyHit(h) {
	var c = {};
	for (var key in h) c[key] = h[key];
	c.ch = h.ch.map(function (o) { return { op: o.op, p: o.p, pa: o.pa, pb: o.pb, amt: o.amt }; });
	c.lk = (h.lk || []).map(function (l) { return { t: l.t, w: l.w }; });
	c.fl = (h.fl || []).map(function (l) { return { t: l.t, w: l.w }; });
	return c;
}
copyHit.local = 1;

function clampVal(lane, v) {
	v = Math.min(lane.hi, Math.max(lane.lo, v));
	return lane.int ? Math.round(v) : v;
}
clampVal.local = 1;

function laneNorm(lane, v) {
	var f = (v - lane.lo) / (lane.hi - lane.lo);
	return lane.sq ? Math.sqrt(Math.max(0, f)) : f;
}
laneNorm.local = 1;

function laneFromNorm(lane, f) {
	f = Math.max(0, Math.min(1, f));
	return clampVal(lane, lane.lo + (lane.sq ? f * f : f) * (lane.hi - lane.lo));
}
laneFromNorm.local = 1;

// --- links -------------------------------------------------
function isStart(s) { return typeof s === 'string'; }
isStart.local = 1;
function startRow(s) { return +s.slice(1); }
startRow.local = 1;
function srcRow(s) { return isStart(s) ? startRow(s) : s.row; }
srcRow.local = 1;

function linksOf(s) {
	if (!s) return [];
	return isStart(s) ? startLk[startRow(s)] : s.lk;
}
linksOf.local = 1;

function linkTarget(s, l) {
	if (l.t) return l.t;
	if (isStart(s)) {
		var rh = rowHits(startRow(s));
		var f = null;
		for (var i = 0; i < rh.length; i++) if (!f || rh[i].st < f.st) f = rh[i];
		return f;
	}
	return nextHit(s) || s;
}
linkTarget.local = 1;

function linkChance(s, l) {
	var sum = 0, ls = linksOf(s);
	for (var i = 0; i < ls.length; i++) sum += ls[i].w;
	return sum > 0 ? l.w / sum : 0;
}
linkChance.local = 1;

function normLinks(ls) {
	var sum = 0, i;
	for (i = 0; i < ls.length; i++) sum += ls[i].w;
	if (sum <= 0) return;
	for (i = 0; i < ls.length; i++) ls[i].w = ls[i].w / sum * 100;
}
normLinks.local = 1;

// a new link from s to hit t (same row); null when s already has one there
function addLink(s, t) {
	if (!t || t.row !== srcRow(s)) return null;
	var ls = linksOf(s);
	for (var i = 0; i < ls.length; i++) if (linkTarget(s, ls[i]) === t) return null;
	var sum = 0;
	for (i = 0; i < ls.length; i++) sum += ls[i].w;
	var l = { t: t, w: ls.length ? sum / ls.length : 100 };
	ls.push(l);
	normLinks(ls);
	return l;
}
addLink.local = 1;

function setChance(s, l, pct) {
	var ls = linksOf(s), rest = 0, i;
	for (i = 0; i < ls.length; i++) if (ls[i] !== l) rest += ls[i].w;
	if (ls.length < 2 || rest <= 0) return false;
	pct = Math.max(1, Math.min(99, pct));
	if (Math.abs(pct - l.w) < 1e-9) return false;
	for (i = 0; i < ls.length; i++) if (ls[i] !== l) ls[i].w = ls[i].w / rest * (100 - pct);
	l.w = pct;
	return true;
}
setChance.local = 1;

// --- follow links (to other rows) ---
// the follow links of hit h into row r
function followGroup(h, r) {
	return (h.fl || []).filter(function (l) { return l.t.row === r; });
}
followGroup.local = 1;

function isFollow(s, l) {
	return !!(s && !isStart(s) && s.fl && s.fl.indexOf(l) >= 0);
}
isFollow.local = 1;

// a new follow link from hit s to hit t of another row: the group's chances are shared out equally
function addFollow(s, t) {
	if (!s || isStart(s) || !t || t.row === s.row) return null;
	if (!s.fl) s.fl = [];
	var gr = followGroup(s, t.row), sum = 0, i;
	for (i = 0; i < gr.length; i++) if (gr[i].t === t) return null;
	for (i = 0; i < gr.length; i++) sum += gr[i].w;
	if (!gr.length) sum = 100;
	var l = { t: t, w: sum / (gr.length + 1) };
	for (i = 0; i < gr.length; i++) gr[i].w = sum / (gr.length + 1);
	s.fl.push(l);
	return l;
}
addFollow.local = 1;

// follow link l gets its own chance pct (1..100); the others of its row give way if the group would pass 100
function setFollow(s, l, pct) {
	pct = Math.max(1, Math.min(100, pct));
	if (Math.abs(pct - l.w) < 1e-9) return false;
	var gr = followGroup(s, l.t.row), rest = 0, i;
	for (i = 0; i < gr.length; i++) if (gr[i] !== l) rest += gr[i].w;
	if (rest + pct > 100 && rest > 0) for (i = 0; i < gr.length; i++) if (gr[i] !== l) gr[i].w = gr[i].w / rest * (100 - pct);
	l.w = pct;
	return true;
}
setFollow.local = 1;

function fixFollow(h) {
	h.fl = (h.fl || []).filter(function (l) { return l.t && hits.indexOf(l.t) >= 0 && l.t.row !== h.row; });
	for (var r = 0; r < NR; r++) {
		var gr = followGroup(h, r), sum = 0, i;
		for (i = 0; i < gr.length; i++) sum += gr[i].w;
		if (sum > 100) for (i = 0; i < gr.length; i++) gr[i].w = gr[i].w / sum * 100;
	}
}
fixFollow.local = 1;

// links to hits that are gone (or in another row)
function cleanLinks() {
	function live(r) { return function (l) { return !l.t || (hits.indexOf(l.t) >= 0 && l.t.row === r); }; }
	for (var r = 0; r < NR; r++) {
		startLk[r] = startLk[r].filter(live(r));
		normLinks(startLk[r]);
	}
	for (var i = 0; i < hits.length; i++) {
		if (!hits[i].lk) hits[i].lk = [{ t: null, w: 100 }];
		hits[i].lk = hits[i].lk.filter(live(hits[i].row));
		normLinks(hits[i].lk);
		fixFollow(hits[i]);
	}
	if (sel && !isStart(sel) && hits.indexOf(sel) < 0) sel = null;
	group = group.filter(function (g) { return hits.indexOf(g) >= 0; });
}
cleanLinks.local = 1;

function hitsInRect(x0, y0, x1, y1) {
	var out = [];
	var ya = Math.min(y0, y1), yb = Math.max(y0, y1);
	for (var i = 0; i < hits.length; i++) {
		var h = hits[i], r = h.row;
		var a = posOf(r, Math.min(x0, x1)), b = posOf(r, Math.max(x0, x1));
		var ht = hitTop(r);
		if (h.st < b && h.st + h.len > a && ht < yb && ht + hitH() > ya) out.push(h);
	}
	return out;
}
hitsInRect.local = 1;

function handleRect(s, l) {
	var t = linkTarget(s, l);
	if (!t) return null;
	var hy = hitTop(t.row) - 1 - HH;
	if (hy < rollTop()) hy = hitTop(t.row) + hitH() + 1;
	return [xOf(t.row, t.st) + 1, hy, HW, HH];
}
handleRect.local = 1;

// a follow link's handle: at the target's start, below its bar
function followRect(l) {
	var t = l.t;
	return [xOf(t.row, t.st) + 1, hitTop(t.row) + hitH() + 1, HW + 6, HH];
}
followRect.local = 1;

function handleAt(x, y) {
	if (!sel) return null;
	var ls = linksOf(sel), i, rr;
	for (i = ls.length - 1; i >= 0; i--) {
		rr = handleRect(sel, ls[i]);
		if (rr && x >= rr[0] && x < rr[0] + rr[2] && y >= rr[1] && y < rr[1] + rr[3]) return ls[i];
	}
	var fl = isStart(sel) ? [] : (sel.fl || []);
	for (i = fl.length - 1; i >= 0; i--) {
		rr = followRect(fl[i]);
		if (x >= rr[0] && x < rr[0] + rr[2] && y >= rr[1] && y < rr[1] + rr[3]) return fl[i];
	}
	return null;
}
handleAt.local = 1;

// the row strip: [M] [S] [P/T] [steps] [rs]
var STRIP = { m: [4, 18], s: [24, 22], ck: [50, 18], st: [72, 36], rs: [112, 34] };
function stripRect(r, key) {
	var f = STRIP[key], h = 18;
	return [f[0], rowTop(r) + (RH() - h) / 2, f[1], h];
}
stripRect.local = 1;

function sourcePoint(s) {
	if (isStart(s)) {
		var sr = stripRect(startRow(s), 's');
		return [sr[0] + sr[2], sr[1] + sr[3] / 2];
	}
	return [xOf(s.row, s.st + s.len) - 1, hitY(s.row)];
}
sourcePoint.local = 1;

function linkCurve(g, sx, sy, tx, ty) {
	var dx = Math.max(18, Math.abs(tx - sx) / 2);
	var up = tx <= sx ? 14 : 0;
	g.move_to(sx, sy);
	g.curve_to(sx + dx, sy - up, tx - dx, ty - up, tx, ty);
	g.stroke();
}
linkCurve.local = 1;

var HEAT = [[0.20, 0.35, 0.95], [0.15, 0.75, 0.90], [0.35, 0.85, 0.40], [0.95, 0.88, 0.25], [0.98, 0.55, 0.15], [0.95, 0.20, 0.15]];
function heat(c) {
	var f = Math.max(0, Math.min(1, c)) * (HEAT.length - 1);
	var i = Math.min(HEAT.length - 2, Math.floor(f)), t = f - i;
	var a = HEAT[i], b = HEAT[i + 1];
	return [a[0] + (b[0] - a[0]) * t, a[1] + (b[1] - a[1]) * t, a[2] + (b[2] - a[2]) * t];
}
heat.local = 1;

// a link inside a row hangs below it like a slack rope, from the bottom of the source's end to the
// bottom of the target's start, over the rows and lanes below; the farther, the deeper
function hangCurve(g, sx, sy, tx, ty) {
	var d = Math.abs(tx - sx);
	var sag = 0.35 * Math.max(22, Math.min(260, 18 + d * 0.3));
	if (d < 4) {
		// to itself: a loop below the hit
		g.move_to(sx, sy);
		g.curve_to(sx + 22, sy + sag * 1.33, tx - 22, ty + sag * 1.33, tx, ty);
	} else {
		g.move_to(sx, sy);
		g.curve_to(sx + (tx - sx) * 0.15, sy + sag * 1.33, tx - (tx - sx) * 0.15, ty + sag * 1.33, tx, ty);
	}
	g.stroke();
	// the arrowhead at the target, pointing up into it
	g.move_to(tx, ty);
	g.line_to(tx - 4, ty + 7);
	g.line_to(tx + 4, ty + 7);
	g.close_path();
	g.fill();
}
hangCurve.local = 1;

function paintSourceLinks(g, s) {
	var ls = linksOf(s), p = sourcePoint(s);
	for (var k = 0; k < ls.length; k++) {
		var l = ls[k], t = linkTarget(s, l);
		if (!t) continue;
		var hc = heat(linkChance(s, l));
		g.set_source_rgba(hc[0], hc[1], hc[2], s === sel ? 1 : 0.55);
		g.set_line_width(s === sel ? 1 + linkChance(s, l) * 4 : 1);
		if (isStart(s)) linkCurve(g, p[0], p[1], xOf(t.row, t.st) + 1, hitY(t.row));
		else hangCurve(g, p[0], hitTop(s.row) + hitH(), xOf(t.row, t.st) + 2, hitTop(t.row) + hitH());
	}
}
paintSourceLinks.local = 1;

var FOLCOL = [0.25, 0.80, 0.78];   // follow links: teal

function paintFollow(g, h) {
	if (!h.fl || !h.fl.length) return;
	var on = h === sel;
	var sx = xOf(h.row, h.st + h.len) - 1, sy = hitY(h.row);
	for (var k = 0; k < h.fl.length; k++) {
		var l = h.fl[k], t = l.t;
		var tx = xOf(t.row, t.st) + 1, ty = hitY(t.row);
		g.set_source_rgba(FOLCOL[0], FOLCOL[1], FOLCOL[2], on ? 1 : 0.45);
		g.set_line_width(on ? 1 + l.w / 100 * 3 : 1);
		var dy = (ty - sy) / 2;
		g.move_to(sx, sy);
		g.curve_to(sx + 10, sy + dy, tx - 10, ty - dy, tx, ty);
		g.stroke();
	}
}
paintFollow.local = 1;

function paintHandles(g) {
	if (!isStart(sel) && sel.fl) {
		for (var q = 0; q < sel.fl.length; q++) {
			var fr = followRect(sel.fl[q]);
			g.set_source_rgba(0.06, 0.10, 0.10, 0.92);
			g.rectangle(fr[0], fr[1], fr[2], fr[3]);
			g.fill();
			g.set_source_rgba(FOLCOL[0], FOLCOL[1], FOLCOL[2], 1);
			g.set_line_width(1.5);
			g.rectangle(fr[0] + 0.5, fr[1] + 0.5, fr[2] - 1, fr[3] - 1);
			g.stroke();
			textIn(g, fr[0] + 3, fr[1] + 10, fr[2] - 4, '> ' + Math.round(sel.fl[q].w) + '%', 10, [0.90, 0.98, 0.96]);
		}
	}
	var ls = linksOf(sel);
	for (var k = 0; k < ls.length; k++) {
		var hr = handleRect(sel, ls[k]);
		if (!hr) continue;
		g.set_source_rgba(0.09, 0.08, 0.07, 0.92);
		g.rectangle(hr[0], hr[1], hr[2], hr[3]);
		g.fill();
		var bc = heat(linkChance(sel, ls[k]));
		g.set_source_rgba(bc[0], bc[1], bc[2], 1);
		g.set_line_width(1.5);
		g.rectangle(hr[0] + 0.5, hr[1] + 0.5, hr[2] - 1, hr[3] - 1);
		g.stroke();
		textIn(g, hr[0] + 3, hr[1] + 10, hr[2] - 4, Math.round(linkChance(sel, ls[k]) * 100) + '%', 10, [0.96, 0.93, 0.86]);
	}
}
paintHandles.local = 1;

function outline(g, h) {
	g.set_source_rgba(1, 1, 1, 0.9);
	g.set_line_width(1);
	g.rectangle(xOf(h.row, h.st) + 0.5, hitTop(h.row) - 0.5, Math.max(2, h.len * colW(h.row) - 1), hitH() + 1);
	g.stroke();
}
outline.local = 1;

function paintLinks(g) {
	var i, k;
	for (i = 0; i < hits.length; i++) if (hits[i] !== sel) paintSourceLinks(g, hits[i]);
	for (i = 0; i < hits.length; i++) if (hits[i] !== sel) paintFollow(g, hits[i]);
	if (sel && !isStart(sel)) paintFollow(g, sel);
	for (var r = 0; r < NR; r++) if (sel !== 'S' + r) paintSourceLinks(g, 'S' + r);
	if (sel) paintSourceLinks(g, sel);
	if (sel && !isStart(sel)) outline(g, sel);
	for (k = 0; k < group.length; k++) outline(g, group[k]);
	if (sel) paintHandles(g);
	if (drag && drag.mode === 'marquee') {
		g.set_source_rgba(1, 1, 1, 0.12);
		g.rectangle(Math.min(drag.x0, drag.x), Math.min(drag.y0, drag.y), Math.abs(drag.x - drag.x0), Math.abs(drag.y - drag.y0));
		g.fill();
		g.set_source_rgba(1, 1, 1, 0.8);
		g.set_line_width(1);
		g.rectangle(Math.min(drag.x0, drag.x) + 0.5, Math.min(drag.y0, drag.y) + 0.5, Math.abs(drag.x - drag.x0), Math.abs(drag.y - drag.y0));
		g.stroke();
	}
	if (drag && drag.mode === 'link' && drag.moved) {
		var p = sourcePoint(drag.from);
		g.set_source_rgba(1, 1, 1, 0.9);
		g.set_line_width(1.5);
		g.move_to(p[0], p[1]);
		g.line_to(drag.x, drag.y);
		g.stroke();
	}
}
paintLinks.local = 1;

// --- chance ops --------------------------------------------
function amtMax(o) { return o.a[1]; }
amtMax.local = 1;

function opAmount(c) {
	var o = OPS[c.op];
	if (!o || !o.a) return 0;
	return Math.max(o.a[0], Math.min(amtMax(o), c.amt));
}
opAmount.local = 1;

function opValue(c) {
	var o = OPS[c.op];
	var a = opAmount(c);
	return (o && o.u === 'gate') ? GATESTEPS[a] : a;
}
opValue.local = 1;

function cellAmountText(c) {
	var o = OPS[c.op];
	if (!o || !o.a) return '';
	var a = opAmount(c);
	if (o.u === 'gate') return GATENAMES[a] + ' st';
	if (o.u === 'x') return 'x' + a;
	if (o.u === 'rnd') return '+-' + a;
	return a + ' ' + o.u;
}
cellAmountText.local = 1;

function cellText(c) {
	var o = OPS[c.op];
	if (!o || !c.op) return '';
	if (!o.a) return o.n;
	if (o.u === 'pts') return o.n + ' ' + opAmount(c);
	if (o.u === 'x') return 'RATCH x' + opAmount(c);
	if (o.u === 'rnd') return 'VEL? +-' + opAmount(c);
	return o.n + ' ' + cellAmountText(c);
}
cellText.local = 1;

// --- buffer~ -----------------------------------------------
function hitBuffer() {
	if (!bufName) return null;
	var buf = new Buffer(bufName);
	if (buf.framecount() < METABASE + 24 || buf.channelcount() < NCH) {
		post('dingus.markovPercRoll: buffer~ ' + bufName + ' needs ' + (METABASE + 24) + ' samples and ' + NCH + ' channels\n');
		return null;
	}
	return buf;
}
hitBuffer.local = 1;

function writeBuffer() {
	writeHits(bank);
	writeChance(bank);
}
writeBuffer.local = 1;

// all rows into bank bk, with the row settings
function writeHits(bk) {
	var buf = hitBuffer();
	if (!buf) return;
	var full = false;
	for (var r = 0; r < NR; r++) {
		var cols = [], c, i, q;
		for (c = 0; c < NCH; c++) {
			cols.push([]);
			for (i = 0; i < ROWF; i++) cols[c].push(0);
		}
		var rh = rowHits(r), nl = 0;
		var putLinks = function (src, frame) {
			var ls = linksOf(src), sum = 0, acc = 0, live = [];
			for (q = 0; q < ls.length; q++) {
				var t = linkTarget(src, ls[q]);
				var ti = t ? rh.indexOf(t) : -1;
				if (ti < 0 || ti >= STARTIDX) continue;
				live.push([ti, ls[q].w]);
				sum += ls[q].w;
			}
			if (nl + live.length > MAXLINKS) { full = true; live = []; }
			cols[7][frame] = nl;
			cols[8][frame] = live.length;
			for (q = 0; q < live.length; q++) {
				acc += live[q][1];
				cols[0][LINKBASE + nl] = live[q][0];
				cols[1][LINKBASE + nl] = q === live.length - 1 ? 1 : acc / sum;
				nl++;
			}
		};
		for (i = 0; i < rh.length && i < STARTIDX; i++) {
			var h = rh[i];
			cols[0][i] = h.len;
			cols[1][i] = h.v;
			cols[2][i] = h.r;
			cols[3][i] = h.acc;
			cols[4][i] = h.atk;
			cols[5][i] = h.dec;
			cols[6][i] = h.cv;
			putLinks(h, i);
			// follow links, by target row: target hit, cumulative chance in its row's group, target row
			var fls = (h.fl || []).slice().sort(function (p, q) { return p.t.row - q.t.row; });
			if (nl + fls.length > MAXLINKS) { full = true; fls = []; }
			cols[9][i] = nl;
			cols[10][i] = fls.length;
			var gcum = 0, grow = -1;
			for (q = 0; q < fls.length; q++) {
				var fl = fls[q];
				if (fl.t.row !== grow) { grow = fl.t.row; gcum = 0; }
				gcum += fl.w / 100;
				cols[0][LINKBASE + nl] = rowHits(fl.t.row).indexOf(fl.t);
				cols[1][LINKBASE + nl] = Math.min(1, gcum);
				cols[2][LINKBASE + nl] = fl.t.row;
				nl++;
			}
		}
		putLinks('S' + r, STARTIDX);
		for (c = 0; c < NCH; c++) buf.poke(c + 1, bk * BANKF + r * ROWF, cols[c]);
		var rc = rowCfg[r];
		var meta = [rc.steps, rc.clk, rc.div, rc.rs, rc.mute, chN];
		for (c = 0; c < meta.length; c++) buf.poke(c + 1, METABASE + bk * 8 + r, [meta[c]]);
	}
	if (full) post('dingus.markovPercRoll: more than ' + MAXLINKS + ' links in a row, the extra ones do not play\n');
}
writeHits.local = 1;

function writeChance(b) {
	if (!chBufName || !chN) return;
	var buf = new Buffer(chBufName);
	if (buf.framecount() < 2 * CHBANK || buf.channelcount() < CHF) {
		post('dingus.markovPercRoll: buffer~ ' + chBufName + ' needs ' + (2 * CHBANK) + ' samples and ' + CHF + ' channels\n');
		return;
	}
	var frames = chN * 1024;
	var cols = [], c, i, l, r;
	for (c = 0; c < CHF; c++) {
		cols.push([]);
		for (i = 0; i < frames; i++) cols[c].push(0);
	}
	for (r = 0; r < NR; r++) {
		var rh = rowHits(r);
		for (i = 0; i < rh.length && i < STARTIDX; i++) {
			for (l = 0; l < chN; l++) {
				var cl = rh[i].ch[l], f = l * 1024 + r * 128 + i;
				cols[0][f] = cl.op;
				cols[1][f] = cl.p;
				cols[2][f] = cl.pa;
				cols[3][f] = cl.pb;
				cols[4][f] = opValue(cl);
			}
		}
	}
	for (c = 0; c < CHF; c++) buf.poke(c + 1, b * CHBANK, cols[c]);
}
writeChance.local = 1;

// --- serialization -----------------------------------------
// -23 cycles chancelanes  8 x (steps clk div rs mute)  8 x START links  hitcount  hits
//   hit: row st len v r acc atk dec cv, a cell (op prob ptnA ptnB amount) per chance lane, links
//   links: count, then (index of the target in its row or -1 = next / first, weight) pairs
function flatLinks(a, ls, r) {
	var rh = rowHits(r);
	a.push(ls.length);
	for (var i = 0; i < ls.length; i++) a.push(ls[i].t ? rh.indexOf(ls[i].t) : -1, ls[i].w);
}
flatLinks.local = 1;

function flat() {
	sortHits();
	var a = [-FORMAT, ncyc, chN], r, i;
	for (r = 0; r < NR; r++) {
		var rc = rowCfg[r];
		a.push(rc.steps, rc.clk, rc.div, rc.rs, rc.mute);
	}
	for (r = 0; r < NR; r++) flatLinks(a, startLk[r], r);
	a.push(hits.length);
	for (i = 0; i < hits.length; i++) {
		var h = hits[i];
		a.push(h.row, h.st, h.len, h.v, h.r, h.acc, h.atk, h.dec, h.cv);
		for (var l = 0; l < chN; l++) {
			var c = h.ch[l];
			a.push(c.op, c.p, c.pa, c.pb, c.amt);
		}
		flatLinks(a, h.lk || [], h.row);
		var fl = h.fl || [];
		a.push(fl.length);
		for (var q = 0; q < fl.length; q++) a.push(fl[q].t.row, rowHits(fl[q].t.row).indexOf(fl[q].t), fl[q].w);
	}
	return a;
}
flat.local = 1;

function unflat(a) {
	if (!a || a.length < 4 + NR * 5 || (a[0] !== -FORMAT && a[0] !== -22 && a[0] !== -21)) return;
	var hasFl = a[0] !== -21, oldFill = a[0] !== -FORMAT;
	var i = 1, k, r;
	ncyc = Math.max(1, Math.min(MAXCYC, Math.round(a[i++]) || 1));
	chN = Math.max(0, Math.min(MAXCH, Math.round(a[i++]) || 0));
	var chStored = chN;
	if (oldFill) i++;          // the old fill flag
	defaultRows();
	for (r = 0; r < NR; r++) {
		rowCfg[r] = {
			steps: Math.max(1, Math.min(MAXSTEPS, Math.round(a[i]) || 16)), clk: a[i + 1] ? 1 : 0,
			div: Math.max(1, Math.min(MAXDIV, Math.round(a[i + 2]) || 1)), rs: Math.max(0, +a[i + 3] || 0), mute: a[i + 4] ? 1 : 0
		};
		i += 5;
	}
	function readLinks() {
		var cnt = Math.round(a[i++]) || 0, out = [];
		for (var q = 0; q < cnt && i + 1 < a.length; q++, i += 2) out.push([Math.round(a[i]), a[i + 1]]);
		return out;
	}
	var rawStart = [];
	for (r = 0; r < NR; r++) rawStart.push(readLinks());
	var nc = Math.round(a[i++]) || 0, raw = [], rawF = [];
	editor = null;
	menu = null;
	sel = null;
	group = [];
	hits = [];
	for (k = 0; k < nc && i + 9 + chN * CHF - 1 < a.length; k++) {
		var h = {
			row: Math.max(0, Math.min(NR - 1, Math.round(a[i]))), st: a[i + 1], len: Math.max(MINLEN, a[i + 2]),
			v: a[i + 3], r: Math.max(1, Math.round(a[i + 4])), acc: a[i + 5] ? 1 : 0, atk: a[i + 6], dec: a[i + 7], cv: a[i + 8], ch: []
		};
		i += 9;
		for (var l = 0; l < chN; l++, i += CHF) {
			h.ch.push({ op: Math.round(a[i]), p: a[i + 1], pa: Math.round(a[i + 2]), pb: Math.round(a[i + 3]), amt: Math.round(a[i + 4]) });
		}
		raw.push(readLinks());
		var rf = [];
		if (hasFl) {
			var fc = Math.round(a[i++]) || 0;
			for (var q = 0; q < fc && i + 2 < a.length; q++, i += 3) rf.push([Math.round(a[i]), Math.round(a[i + 1]), a[i + 2]]);
		}
		rawF.push(rf);
		hits.push(h);
	}
	// link indices are per row, in the stored (sorted) order
	var byRow = [];
	for (r = 0; r < NR; r++) byRow.push(hits.filter(function (q) { return q.row === r; }));
	function toLinks(pairs, rr) {
		var out = [];
		for (var q = 0; q < pairs.length; q++) {
			var ti = pairs[q][0];
			if (ti >= 0 && !byRow[rr][ti]) continue;
			out.push({ t: ti >= 0 ? byRow[rr][ti] : null, w: Math.max(0.01, Math.min(100, +pairs[q][1] || 1)) });
		}
		return out;
	}
	for (r = 0; r < NR; r++) startLk[r] = toLinks(rawStart[r], r);
	for (k = 0; k < hits.length; k++) hits[k].lk = toLinks(raw[k], hits[k].row);
	for (k = 0; k < hits.length; k++) {
		hits[k].fl = [];
		for (var fq = 0; fq < rawF[k].length; fq++) {
			var fr = rawF[k][fq], ft = byRow[fr[0]] ? byRow[fr[0]][fr[1]] : null;
			if (ft) hits[k].fl.push({ t: ft, w: Math.max(1, Math.min(100, +fr[2] || 100)) });
		}
	}
	chN = Math.max(MINCH, chStored);
	for (k = 0; k < hits.length; k++) fitCells(hits[k]);
	fitToSpan();
	cleanLinks();
}
unflat.local = 1;

var keep = new Global('dingusMarkovPercRollState');

function park() {
	if (!bufName) return;
	keep[bufName] = flat();
	keep[bufName + ' seqs'] = { seqs: seqs.slice(), cur: cur, bank: bank, loaded: seqsLoaded, name: seqName };
	keep[bufName + ' view'] = [beatN, snapOn, ghostsOn];
}
park.local = 1;

function changed(out) {
	for (var fc = 0; fc < hits.length; fc++) fitCells(hits[fc]);
	sortHits();
	cleanLinks();
	seqs[cur] = flat();
	park();
	writeBuffer();
	outlet(0, 'lanes', chN);
	scheduleSave();
	fitBox();
	mgraphics.redraw();
	notifyclients();
	if (out) outlet(0, flat());
	if (out) undoCommit();
}
changed.local = 1;

// --- undo --------------------------------------------------
var UNDOMAX = 5;
var undoStack = [], redoStack = [], undoBase = null, undoing = false;
var undoId = Math.random();
var undoWho = new Global('dingusUndoFocus');

function undoSnap() { return JSON.stringify(flat()); }
undoSnap.local = 1;

function undoTouch() {
	undoWho.id = undoId;
	undoBase = undoSnap();
}
undoTouch.local = 1;

function undoCommit() {
	if (undoing) return;
	var now = undoSnap();
	if (undoBase !== null && now !== undoBase) {
		undoStack.push(undoBase);
		if (undoStack.length > UNDOMAX) undoStack.shift();
		redoStack = [];
		undoWho.id = undoId;
	}
	undoBase = now;
}
undoCommit.local = 1;

function undoReset() {
	undoStack = [];
	redoStack = [];
	undoBase = null;
}
undoReset.local = 1;

function undoApply(from, to) {
	if (!from.length || undoWho.id !== undoId) return;
	to.push(undoSnap());
	if (to.length > UNDOMAX) to.shift();
	var st = JSON.parse(from.pop());
	undoing = true;
	drag = null;
	menu = null;
	editor = null;
	unflat(st);
	changed(true);
	undoing = false;
	undoBase = undoSnap();
}
undoApply.local = 1;

function undo() { undoApply(undoStack, redoStack); }
function redo() { undoApply(redoStack, undoStack); }

// --- ghosts ------------------------------------------------
// each row's walk over the shown cycles: from START at every restart, the most likely links
// [{h, t, len, p, cut}] per row
function walkGhosts(r) {
	var out = [], sp = span(r), rs = rowCfg[r].rs, guard = 0;
	var per = rs > 0 ? rs : sp;
	for (var rk = 0; rk * per < sp - EPS && rk < 1000; rk++) {
		var t = rk * per, end = rs > 0 ? Math.min(sp, (rk + 1) * per) : sp, s = 'S' + r, p = 1;
		while (t < end - EPS && guard++ < 4000) {
			var ls = linksOf(s), best = null, bc = -1;
			for (var k = 0; k < ls.length; k++) {
				var c = linkChance(s, ls[k]);
				if (c > bc + EPS && linkTarget(s, ls[k])) { bc = c; best = ls[k]; }
			}
			if (!best) break;
			var h = linkTarget(s, best);
			p *= bc;
			var len = Math.max(h.len, 0.01);
			out.push({ h: h, t: t, len: Math.min(len, end - t), p: p, cut: t + len > end + EPS && end < sp - EPS });
			t += len;
			s = h;
		}
		if (rs <= 0) break;
	}
	return out;
}
walkGhosts.local = 1;

function paintGhosts(g) {
	for (var r = 0; r < NR; r++) {
		var gs = walkGhosts(r), cw = colW(r);
		for (var i = 0; i < gs.length; i++) {
			var e = gs[i];
			var x = xOf(r, e.t) + 1, wd = Math.max(2, e.len * cw - 2);
			var ny = hitTop(r), nh = hitH();
			var a = 0.15 + 0.25 * e.p;
			g.set_source_rgba(GHOSTCOL[0], GHOSTCOL[1], GHOSTCOL[2], a * 0.25);
			g.rectangle(x, ny, wd, nh);
			g.fill();
			g.set_source_rgba(GHOSTCOL[0], GHOSTCOL[1], GHOSTCOL[2], a);
			g.set_line_width(1);
			g.rectangle(x + 0.5, ny + 0.5, wd - 1, nh - 1);
			g.stroke();
			if (e.cut) {
				g.set_source_rgba(0.95, 0.25, 0.20, 0.9);
				g.set_line_width(2);
				g.move_to(x + wd - 1, ny - 2);
				g.line_to(x + wd - 1, ny + nh + 2);
				g.stroke();
			}
		}
	}
}
paintGhosts.local = 1;

// --- drawing -----------------------------------------------
function paint() {
	var g = mgraphics;
	var wh = dims();
	var w = wh[0], h = wh[1];
	var lrs = laneRects();
	var top = rollTop(), bot = rollBottom();
	var cht = chTop(), adt = addTop();
	var laneBottom = totalH();
	var fr = focusRow();
	var i, k, r, x0, nw, lane, norm, bh, txt;

	g.set_source_rgba(0, 0, 0, 1);
	g.rectangle(0, 0, w, h);
	g.fill();
	g.select_font_face('Arial');

	// row bands, their step lines and restarts
	for (r = 0; r < NR; r++) {
		var ry = rowTop(r), rc = rowCfg[r], cw = colW(r);
		if (rc.mute) g.set_source_rgba(0.07, 0.05, 0.05, 1);
		else if (r === fr) g.set_source_rgba(0.16, 0.16, 0.18, 1);
		else if (r % 2) g.set_source_rgba(0.13, 0.13, 0.15, 1);
		else g.set_source_rgba(0.10, 0.10, 0.11, 1);
		g.rectangle(labelW, ry, w - labelW, RH());
		g.fill();
		var sp = span(r);
		if (beatN > 1 && cw / beatN >= 5) {
			g.set_source_rgba(0.17, 0.17, 0.19, 1);
			g.set_line_width(0.5);
			for (k = 0; k < sp * beatN; k++) {
				if (k % beatN === 0) continue;
				g.move_to(xOf(r, k / beatN), ry);
				g.line_to(xOf(r, k / beatN), ry + RH());
				g.stroke();
			}
		}
		if (cw >= 3) {
			g.set_source_rgba(0.26, 0.26, 0.28, 1);
			g.set_line_width(0.5);
			for (k = 1; k < sp; k++) {
				g.move_to(xOf(r, k), ry);
				g.line_to(xOf(r, k), ry + RH());
				g.stroke();
			}
		}
		if (rc.rs > 0) {
			g.set_source_rgba(0.45, 0.45, 0.48, 1);
			g.set_line_width(1);
			for (var rk = 1; rk * rc.rs < sp - EPS && rk < 1000; rk++) {
				g.move_to(xOf(r, rk * rc.rs), ry);
				g.line_to(xOf(r, rk * rc.rs), ry + RH());
				g.stroke();
			}
		}
		g.set_source_rgba(0.30, 0.30, 0.33, 1);
		g.set_line_width(1);
		g.move_to(labelW, ry);
		g.line_to(w, ry);
		g.stroke();
	}
	// cycle lines and numbers in the header
	g.set_font_size(10);
	for (k = 0; k <= ncyc; k++) {
		var cx = labelW + k * (w - labelW) / ncyc;
		g.set_source_rgba(0.55, 0.55, 0.58, 1);
		g.set_line_width(1);
		g.move_to(cx, 0);
		g.line_to(cx, bot);
		g.stroke();
		if (k < ncyc) {
			g.set_source_rgba(0.6, 0.6, 0.63, 1);
			g.move_to(cx + 3, top - 3);
			g.show_text('cycle ' + (k + 1));
		}
	}

	// lane and chance lane backgrounds
	for (i = 0; i < lrs.length; i++) {
		if (i % 2 === 0) g.set_source_rgba(0.10, 0.10, 0.11, 1);
		else g.set_source_rgba(0.13, 0.13, 0.15, 1);
		g.rectangle(labelW, lrs[i].top, w - labelW, lrs[i].h);
		g.fill();
	}
	for (i = 0; i < chN; i++) {
		if (i % 2 === 0) g.set_source_rgba(0.09, 0.10, 0.09, 1);
		else g.set_source_rgba(0.12, 0.13, 0.12, 1);
		g.rectangle(labelW, cht + i * CHH, w - labelW, CHH);
		g.fill();
	}
	g.set_source_rgba(0.07, 0.07, 0.07, 1);
	g.rectangle(labelW, adt, w - labelW, ADDH);
	g.fill();
	// the focus row's step lines through the lanes
	if (fr >= 0) {
		g.set_source_rgba(0.22, 0.22, 0.24, 1);
		g.set_line_width(0.5);
		for (k = 0; k <= span(fr); k++) {
			g.move_to(xOf(fr, k), bot);
			g.line_to(xOf(fr, k), laneBottom);
			g.stroke();
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

	if (ghostsOn) paintGhosts(g);

	// hits
	for (i = 0; i < hits.length; i++) {
		var hh = hits[i];
		r = hh.row;
		x0 = xOf(r, hh.st) + 1;
		nw = Math.max(2, hh.len * colW(r) - 2);
		var on = playheads[r] === rowIndex(hh);
		var nc = rowCfg[r].mute ? [0.55, 0.45, 0.40] : HITCOL;
		var ny = hitTop(r), nhh = hitH();
		if (on) g.set_source_rgba(PLAYCOL[0], PLAYCOL[1], PLAYCOL[2], 0.45);
		else g.set_source_rgba(nc[0], nc[1], nc[2], 0.25);
		g.rectangle(x0, ny, nw, nhh);
		g.fill();
		// ratchet hits: strokes as tall as the velocity, accent = brighter, full height
		var nr = Math.max(1, hh.r), hw = nw / nr;
		var hc = on ? PLAYCOL : nc;
		for (k = 0; k < nr; k++) {
			var vh = Math.max(2, nhh * (hh.acc ? 1 : 0.35 + 0.65 * hh.v));
			g.set_source_rgba(hc[0], hc[1], hc[2], hh.v <= 0 ? 0.15 : (hh.acc ? 1 : 0.4 + 0.5 * hh.v));
			g.rectangle(x0 + k * hw, ny + nhh - vh, Math.max(2, Math.min(hw - 1, 4 + hw * 0.25)), vh);
			g.fill();
		}
		var hot = hh === hoverEnd || (drag && drag.mode === 'end' && drag.h === hh);
		g.set_source_rgba(1, 1, 1, hot ? 1 : 0.45);
		g.rectangle(x0 + nw - (hot ? 4 : 2), ny, hot ? 4 : 2, nhh);
		g.fill();

		// lanes and chance cells: the focus row's hits
		if (r !== fr) continue;
		var act = hh === sel || group.indexOf(hh) >= 0;
		for (k = 0; k < lrs.length; k++) {
			var lr = lrs[k];
			lane = lr.lane;
			var val = hh[lane.key];
			norm = laneNorm(lane, val);
			g.set_source_rgba(lane.col[0], lane.col[1], lane.col[2], act ? 0.9 : 0.2);
			if (lane.bi) {
				var mid = lr.top + lr.h / 2;
				var by = lr.top + 2 + (1 - norm) * (lr.h - 4);
				g.rectangle(x0, Math.min(mid, by), nw, Math.max(1, Math.abs(by - mid)));
				g.fill();
				g.set_source_rgba(0.35, 0.35, 0.38, act ? 1 : 0.4);
				g.rectangle(x0, mid - 0.5, nw, 1);
				g.fill();
			} else {
				bh = Math.max(1, norm * (lr.h - 4));
				g.rectangle(x0, lr.top + lr.h - 2 - bh, nw, bh);
				g.fill();
			}
			if (act && nw >= 18 ) {
				if (lane.int) txt = lane.key === 'acc' ? (val ? 'on' : 'off') : String(val);
				else if (lane.unit) txt = String(Math.round(val));
				else txt = String(Math.round(val * 100));
				numLabel(g, x0 + 1, lr.top + 2, txt);
			}
		}
		for (k = 0; k < chN; k++) {
			var cl = hh.ch[k], cy = cht + k * CHH;
			if (!cl.op) {
				g.set_source_rgba(0.30, 0.32, 0.29, 1);
				g.rectangle(x0, cy + CHH - 3, nw, 1);
				g.fill();
				continue;
			}
			var zoned = nw >= ZONEW;
			var editing = editor && editor.h === hh && editor.li === k;
			var bt = zoned ? cy + CHOP : cy + 2, bb = zoned ? cy + CHH - CHBOT : cy + CHH - 2;
			bh = Math.max(1, cl.p * (bb - bt));
			if (hh !== sel) {
				g.set_source_rgba(CHCOL[0], CHCOL[1], CHCOL[2], 0.18);
				g.rectangle(x0, bb - bh, nw, bh);
				g.fill();
				continue;
			}
			g.set_source_rgba(CHCOL[0], CHCOL[1], CHCOL[2], editing ? 0.95 : 0.75);
			g.rectangle(x0, bb - bh, nw, bh);
			g.fill();
			if (zoned) {
				g.set_source_rgba(0.07, 0.07, 0.07, 0.55);
				g.rectangle(x0, cy + 1, nw, CHOP - 2);
				g.rectangle(x0, cy + CHH - CHBOT + 1, nw, CHBOT - 2);
				g.fill();
				textIn(g, x0 + 3, cy + 12, nw - 6, cellText(cl), 11, [0.96, 0.93, 0.86]);
				var oa = OPS[cl.op];
				textIn(g, x0 + 3, cy + CHH - 4, nw / 2 - 4, oa && oa.a ? cellAmountText(cl) : '', 10, [0.85, 0.80, 0.68]);
				textIn(g, x0 + nw / 2 + 2, cy + CHH - 4, nw / 2 - 5, cl.pb ? cl.pa + ':' + cl.pb : 'always', 10, [0.85, 0.80, 0.68]);
				if (nw >= 70) textIn(g, x0 + nw - 34, cy + CHOP + 12, 32, Math.round(cl.p * 100) + '%', 10, [0.96, 0.93, 0.86]);
			} else if (nw >= 14) {
				textIn(g, x0 + 2, cy + 12, nw - 3, cellText(cl), 10, [0.96, 0.93, 0.86]);
			}
		}
	}

	// the label column: row strips, lane names
	g.set_source_rgba(0.06, 0.06, 0.07, 1);
	g.rectangle(0, 0, labelW, h);
	g.fill();
	for (r = 0; r < NR; r++) paintStrip(g, r);
	paintLinks(g);
	g.set_font_size(10);
	for (i = 0; i < lrs.length; i++) {
		var lc = lrs[i].lane.col;
		g.set_source_rgba(lc[0], lc[1], lc[2], 1);
		g.rectangle(0, lrs[i].top + 1, 3, lrs[i].h - 2);
		g.fill();
		g.set_source_rgba(0.85, 0.83, 0.78, 1);
		g.move_to(6, lrs[i].top + 12);
		g.show_text(lrs[i].lane.name + (fr >= 0 ? '  row ' + (fr + 1) : ''));
	}
	for (i = 0; i < chN; i++) {
		var ly = cht + i * CHH;
		g.set_source_rgba(CHCOL[0], CHCOL[1], CHCOL[2], 1);
		g.rectangle(0, ly + 1, 3, CHH - 2);
		g.fill();
		g.set_source_rgba(0.85, 0.83, 0.78, 1);
		g.move_to(6, ly + 12);
		g.show_text('CHANCE ' + (i + 1));
		if (chN > MINCH) {
			g.set_source_rgba(0.70, 0.45, 0.38, 1);
			g.move_to(labelW - 11, ly + 26);
			g.show_text('x');
		}
	}
	g.set_font_size(9);
	g.set_source_rgba(chN < MAXCH ? 0.75 : 0.35, chN < MAXCH ? 0.80 : 0.35, chN < MAXCH ? 0.68 : 0.35, 1);
	g.move_to(6, adt + 11);
	g.show_text('+ CHANCE');
	var nx = queued >= 0 ? queued : pend;
	if (nx >= 0) {
		g.set_font_size(10);
		g.set_source_rgba(0.98, 0.45, 0.10, 1);
		g.move_to(6, top - 3);
		g.show_text('next: seq ' + (nx + 1));
	}
	g.set_source_rgba(0.35, 0.35, 0.38, 1);
	g.set_line_width(1);
	g.move_to(labelW, 0);
	g.line_to(labelW, h);
	g.stroke();
	g.move_to(0, bot);
	g.line_to(w, bot);
	g.stroke();

	if (menu) paintMenu(g, w, h);
	if (editor && (hits.indexOf(editor.h) < 0 || editor.li >= chN)) editor = null;
	if (editor) paintEditor(g, w, h);
}
paint.local = 1;

function box3(g, rr, col, txt, tcol, size) {
	g.set_source_rgba(col[0], col[1], col[2], 1);
	g.rectangle(rr[0], rr[1], rr[2], rr[3]);
	g.fill();
	if (txt) {
		g.set_font_size(size || 11);
		var tw = g.text_measure(txt)[0];
		g.set_source_rgba(tcol[0], tcol[1], tcol[2], 1);
		g.move_to(rr[0] + (rr[2] - tw) / 2, rr[1] + rr[3] / 2 + 4);
		g.show_text(txt);
	}
}
box3.local = 1;

function paintStrip(g, r) {
	var rc = rowCfg[r];
	var ry = rowTop(r);
	g.set_source_rgba(0.30, 0.30, 0.33, 1);
	g.set_line_width(1);
	g.move_to(0, ry);
	g.line_to(labelW, ry);
	g.stroke();
	g.set_font_size(9);
	g.set_source_rgba(0.55, 0.55, 0.58, 1);
	g.move_to(4, ry + 10);
	g.show_text(String(r + 1));
	var light = [0.94, 0.92, 0.86], dark = [0.08, 0.08, 0.08];
	box3(g, stripRect(r, 'm'), rc.mute ? MUTECOL : [0.18, 0.18, 0.20], 'M', rc.mute ? dark : [0.60, 0.58, 0.55]);
	var ss = sel === 'S' + r;
	box3(g, stripRect(r, 's'), ss ? [0.96, 0.93, 0.86] : [0.30, 0.30, 0.32], 'S', ss ? dark : light);
	box3(g, stripRect(r, 'ck'), rc.clk ? [0.45, 0.30, 0.55] : [0.22, 0.32, 0.40], rc.clk ? 'T' : 'P', light);
	box3(g, stripRect(r, 'st'), [0.16, 0.15, 0.14], rc.clk ? '/' + rc.div + ' ' + rc.steps : String(rc.steps), light, 11);
	box3(g, stripRect(r, 'rs'), [0.16, 0.15, 0.14], 'rs ' + (rc.rs > 0 ? fmtNum(rc.rs) : '-'), light, 11);
	// the row's playhead
	if (playheads[r] >= 0) {
		g.set_source_rgba(PLAYCOL[0], PLAYCOL[1], PLAYCOL[2], 1);
		g.rectangle(labelW - 3, ry + 2, 3, RH() - 4);
		g.fill();
	}
}
paintStrip.local = 1;

function fmtNum(v) { return String(Math.round(v * 100) / 100); }
fmtNum.local = 1;

// the op grid
function gridItemAt(gx, gy, x, y) {
	var c = Math.floor((x - gx - 2) / MENUW), k = Math.floor((y - gy - 2 - MENUTOP) / MENUH);
	if (c < 0 || c >= MENUCOLS.length || k < 0 || k >= MENUCOLS[c].length) return -1;
	return MENUCOLS[c][k];
}
gridItemAt.local = 1;

function paintGrid(g, gx, gy, curOp) {
	for (var c = 0; c < MENUCOLS.length; c++) {
		var x = gx + 2 + c * MENUW;
		g.set_font_size(10);
		g.set_source_rgba(0.62, 0.60, 0.55, 1);
		g.move_to(x + 4, gy + 13);
		g.show_text(MENUHEAD[c]);
		for (var k = 0; k < MENUCOLS[c].length; k++) {
			var op = MENUCOLS[c][k];
			var y = gy + 2 + MENUTOP + k * MENUH;
			if (op === curOp) {
				g.set_source_rgba(CHCOL[0], CHCOL[1], CHCOL[2], 0.6);
				g.rectangle(x, y, MENUW - 3, MENUH - 2);
				g.fill();
			}
			g.set_font_size(12);
			g.set_source_rgba(0.94, 0.92, 0.86, 1);
			g.move_to(x + 4, y + 14);
			g.show_text(op === 0 ? 'none' : OPS[op].n);
		}
	}
}
paintGrid.local = 1;

function menuRect(w, h) {
	var mw = MENUCOLS.length * MENUW + 6, mh = MENUTOP + 5 * MENUH + 6;
	var mx = Math.max(labelW, Math.min(w - mw, menu.x - mw / 2));
	var my = menu.y - mh - 4;
	if (my < 0) my = Math.min(h - mh, menu.y + CHH);
	return [mx, my, mw, mh];
}
menuRect.local = 1;

function menuItemAt(x, y) {
	var wh = dims();
	var rr = menuRect(wh[0], wh[1]);
	if (x < rr[0] || y < rr[1] || x >= rr[0] + rr[2] || y >= rr[1] + rr[3]) return -2;
	return gridItemAt(rr[0], rr[1], x, y);
}
menuItemAt.local = 1;

function paintMenu(g, w, h) {
	var rr = menuRect(w, h);
	g.set_source_rgba(0.05, 0.05, 0.05, 0.96);
	g.rectangle(rr[0], rr[1], rr[2], rr[3]);
	g.fill();
	g.set_source_rgba(0.55, 0.55, 0.50, 1);
	g.set_line_width(1);
	g.rectangle(rr[0] + 0.5, rr[1] + 0.5, rr[2] - 1, rr[3] - 1);
	g.stroke();
	paintGrid(g, rr[0], rr[1], menu.h.ch[menu.li].op);
}
paintMenu.local = 1;

// --- the cell editor ---------------------------------------
function edRect(w, h) {
	var ex = Math.max(labelW, Math.min(w - EDW, editor.x - EDW / 2));
	var ey = editor.y - EDH - 4;
	if (ey < 0) ey = Math.max(0, Math.min(h - EDH, editor.y + CHH + 4));
	return [ex, ey, EDW, EDH];
}
edRect.local = 1;

function edLayout(w, h) {
	var rr = edRect(w, h);
	var x = rr[0], y = rr[1];
	var gy = y + 22;
	var ry = gy + MENUTOP + 5 * MENUH + 8;
	return {
		r: rr,
		close: [x + EDW - 22, y + 3, 18, 16],
		grid: [x, gy],
		prob: [x + 80, ry, EDW - 150, 18],
		amtMinus: [x + 80, ry + 26, 22, 18], amtVal: [x + 106, ry + 26, EDW - 202, 18], amtPlus: [x + EDW - 92, ry + 26, 22, 18],
		ptnMinus: [x + 80, ry + 52, 22, 18], ptnVal: [x + 106, ry + 52, EDW - 202, 18], ptnPlus: [x + EDW - 92, ry + 52, 22, 18],
		clear: [x + 80, ry + 78, 70, 18],
		rows: [ry, ry + 26, ry + 52, ry + 78]
	};
}
edLayout.local = 1;

function inR(rr, x, y) { return x >= rr[0] && y >= rr[1] && x < rr[0] + rr[2] && y < rr[1] + rr[3]; }
inR.local = 1;

function edButton(g, rr, txt, on) {
	g.set_source_rgba(on ? 0.24 : 0.16, on ? 0.23 : 0.15, on ? 0.21 : 0.14, 1);
	g.rectangle(rr[0], rr[1], rr[2], rr[3]);
	g.fill();
	textIn(g, rr[0] + 5, rr[1] + 13, rr[2] - 6, txt, 12, on ? [0.94, 0.92, 0.86] : [0.45, 0.43, 0.40]);
}
edButton.local = 1;

function edSlider(g, rr, f, txt, on) {
	g.set_source_rgba(0.16, 0.15, 0.14, 1);
	g.rectangle(rr[0], rr[1], rr[2], rr[3]);
	g.fill();
	if (on) {
		g.set_source_rgba(CHCOL[0], CHCOL[1], CHCOL[2], 0.55);
		g.rectangle(rr[0], rr[1], Math.max(2, rr[2] * Math.max(0, Math.min(1, f))), rr[3]);
		g.fill();
	}
	textIn(g, rr[0] + 6, rr[1] + 13, rr[2] - 8, txt, 12, on ? [0.96, 0.93, 0.86] : [0.45, 0.43, 0.40]);
}
edSlider.local = 1;

function paintEditor(g, w, h) {
	var L = edLayout(w, h), rr = L.r;
	var cl = editor.h.ch[editor.li];
	var o = OPS[cl.op];
	g.set_source_rgba(0.05, 0.05, 0.05, 0.97);
	g.rectangle(rr[0], rr[1], rr[2], rr[3]);
	g.fill();
	g.set_source_rgba(CHCOL[0], CHCOL[1], CHCOL[2], 1);
	g.set_line_width(1);
	g.rectangle(rr[0] + 0.5, rr[1] + 0.5, rr[2] - 1, rr[3] - 1);
	g.stroke();
	textIn(g, rr[0] + 8, rr[1] + 15, EDW - 40, 'CHANCE ' + (editor.li + 1) + '  ·  row ' + (editor.h.row + 1) + ', hit ' + (rowIndex(editor.h) + 1), 12, [0.94, 0.92, 0.86]);
	edButton(g, L.close, 'x', true);
	paintGrid(g, L.grid[0], L.grid[1], cl.op);
	var labels = ['PROB', 'AMOUNT', 'PTN'];
	for (var i = 0; i < 3; i++) textIn(g, rr[0] + 10, L.rows[i] + 13, 66, labels[i], 11, [0.62, 0.60, 0.55]);
	var pr = L.prob;
	g.set_source_rgba(0.12, 0.12, 0.12, 1);
	g.rectangle(pr[0], pr[1], pr[2], pr[3]);
	g.fill();
	g.set_source_rgba(CHCOL[0], CHCOL[1], CHCOL[2], 0.9);
	g.rectangle(pr[0], pr[1], pr[2] * cl.p, pr[3]);
	g.fill();
	textIn(g, pr[0] + pr[2] + 8, pr[1] + 13, 60, Math.round(cl.p * 100) + ' %', 12, [0.94, 0.92, 0.86]);
	var hasA = !!(o && o.a);
	edButton(g, L.amtMinus, '-', hasA);
	edSlider(g, L.amtVal, hasA ? (opAmount(cl) - o.a[0]) / Math.max(1, amtMax(o) - o.a[0]) : 0, hasA ? cellAmountText(cl) : 'no amount', hasA);
	edButton(g, L.amtPlus, '+', hasA);
	edButton(g, L.ptnMinus, '-', true);
	edSlider(g, L.ptnVal, ptnIndex(cl) / (PTNS.length - 1), cl.pb ? cl.pa + ' of every ' + cl.pb : 'always', true);
	edButton(g, L.ptnPlus, '+', true);
	edButton(g, L.clear, 'clear', true);
}
paintEditor.local = 1;

function ptnIndex(c) {
	for (var q = 0; q < PTNS.length; q++) if (PTNS[q][0] === c.pa && PTNS[q][1] === c.pb) return q;
	return 0;
}
ptnIndex.local = 1;

function setOp(cl, it) {
	if (cl.op === it) return;
	cl.op = it;
	cl.amt = OPS[it].a ? OPS[it].a[2] : 0;
	if (it && cl.p <= 0) cl.p = 0.5;
}
setOp.local = 1;

function stepAmount(cl, d) {
	var o = OPS[cl.op];
	if (!o || !o.a) return false;
	var na = Math.max(o.a[0], Math.min(amtMax(o), opAmount(cl) + d));
	if (na === cl.amt) return false;
	cl.amt = na;
	return true;
}
stepAmount.local = 1;

function stepPtn(cl, d) {
	var pi = (ptnIndex(cl) + d + PTNS.length) % PTNS.length;
	cl.pa = PTNS[pi][0];
	cl.pb = PTNS[pi][1];
}
stepPtn.local = 1;

function edSet(mode, cl, f) {
	f = Math.max(0, Math.min(1, f));
	if (mode === 'edamt') {
		var o = OPS[cl.op];
		if (!o || !o.a) return;
		var na = Math.round(o.a[0] + f * (amtMax(o) - o.a[0]));
		if (na !== cl.amt) { cl.amt = na; changed(false); }
	} else {
		var qi = Math.round(f * (PTNS.length - 1));
		if (PTNS[qi][0] !== cl.pa || PTNS[qi][1] !== cl.pb) { cl.pa = PTNS[qi][0]; cl.pb = PTNS[qi][1]; changed(false); }
	}
}
edSet.local = 1;

var lastEdClick = { x: -1, y: -1, t: 0 };

function editorClick(x, y) {
	lastEdClick = { x: x, y: y, t: Date.now() };
	var wh = dims();
	var L = edLayout(wh[0], wh[1]);
	var cl = editor.h.ch[editor.li];
	if (!inR(L.r, x, y) || inR(L.close, x, y)) {
		editor = null;
		mgraphics.redraw();
		return true;
	}
	var it = gridItemAt(L.grid[0], L.grid[1], x, y);
	if (it >= 0 && y < L.rows[0] - 4) { setOp(cl, it); changed(true); return true; }
	if (inR(L.prob, x, y)) {
		cl.p = Math.max(0, Math.min(1, (x - L.prob[0]) / L.prob[2]));
		drag = { mode: 'edprob', cl: cl, x0: L.prob[0], w: L.prob[2] };
		changed(false);
		return true;
	}
	if (inR(L.amtVal, x, y)) {
		if (!OPS[cl.op] || !OPS[cl.op].a) return true;
		drag = { mode: 'edamt', cl: cl, x0: L.amtVal[0], w: L.amtVal[2] };
		edSet('edamt', cl, (x - L.amtVal[0]) / L.amtVal[2]);
		return true;
	}
	if (inR(L.ptnVal, x, y)) {
		drag = { mode: 'edptn', cl: cl, x0: L.ptnVal[0], w: L.ptnVal[2] };
		edSet('edptn', cl, (x - L.ptnVal[0]) / L.ptnVal[2]);
		return true;
	}
	if (inR(L.amtMinus, x, y)) { if (stepAmount(cl, -1)) changed(true); return true; }
	if (inR(L.amtPlus, x, y)) { if (stepAmount(cl, 1)) changed(true); return true; }
	if (inR(L.ptnMinus, x, y)) { stepPtn(cl, -1); changed(true); return true; }
	if (inR(L.ptnPlus, x, y)) { stepPtn(cl, 1); changed(true); return true; }
	if (inR(L.clear, x, y)) { editor.h.ch[editor.li] = newCell(); changed(true); return true; }
	return true;
}
editorClick.local = 1;

function textIn(g, x, y, w, txt, size, col) {
	if (!txt || w < 6) return;
	g.set_font_size(size);
	var t = String(txt);
	while (t.length > 1 && g.text_measure(t)[0] > w) t = t.slice(0, -1);
	if (t !== String(txt) && t.length > 1) t = t.slice(0, -1) + '.';
	g.set_source_rgba(col[0], col[1], col[2], 1);
	g.move_to(x, y);
	g.show_text(t);
}
textIn.local = 1;

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

function onresize() { mgraphics.redraw(); }
onresize.local = 1;

// --- messages ----------------------------------------------
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
	var vw = keep[bufName + ' view'];
	if (vw && vw.length === 3) { beatN = vw[0]; snapOn = vw[1]; ghostsOn = vw[2]; }
	if (!hits.length && st && st.length) unflat(st);
	writeBuffer();
	outlet(0, 'lanes', chN);
	fitBox();
	mgraphics.redraw();
}

function chbuffer(name) {
	chBufName = String(name);
	writeChance(bank);
}

// row r (1..8) key value
function row(r, key, v) {
	r = Math.round(r) - 1;
	if (r < 0 || r >= NR) return;
	setRow(r, String(key), v);
	changed(true);
}

function setRow(r, key, v) {
	var rc = rowCfg[r];
	if (key === 'steps') rc.steps = Math.max(1, Math.min(MAXSTEPS, Math.round(v) || 1));
	else if (key === 'clock') rc.clk = v ? 1 : 0;
	else if (key === 'div') rc.div = Math.max(1, Math.min(MAXDIV, Math.round(v) || 1));
	else if (key === 'restart') rc.rs = Math.max(0, Math.min(MAXSTEPS * MAXCYC, +v || 0));
	else if (key === 'mute') rc.mute = v ? 1 : 0;
	if (key === 'steps') fitToSpan();
}
setRow.local = 1;

function anything() {
	if (inlet === 1) return;
	post('dingus.markovPercRoll: unknown message ' + messagename + '\n');
}

function msg_int(v) {}
function msg_float(v) {}

function cycles(v) {
	ncyc = Math.max(1, Math.min(MAXCYC, Math.round(v) || 1));
	fitToSpan();
	changed(true);
}

function list() {
	var a = arrayfromargs(arguments);
	if (inlet !== 1) return;
	var ch = false;
	for (var r = 0; r < NR; r++) {
		var v = a[r] === undefined ? -1 : Math.floor(a[r]);
		if (v !== playheads[r]) { playheads[r] = v; ch = true; }
	}
	if (ch) mgraphics.redraw();
}

function snap(q) {
	snapOn = q > 0 ? 1 : 0;
	park();
	mgraphics.redraw();
}

function beat(v) {
	beatN = Math.max(1, Math.min(16, Math.round(v) || 1));
	park();
	mgraphics.redraw();
}

function ghosts(v) {
	ghostsOn = +v ? 1 : 0;
	park();
	mgraphics.redraw();
}

function labelwidth(v) {
	labelW = Math.max(150, v);
	mgraphics.redraw();
}

function clear() {
	emptyState();
	changed(true);
}

function clearall() {
	for (var i = 0; i < NSEQ; i++) seqs[i] = null;
	emptyState();
	changed(true);
}

// an empty sequence keeps the row settings and the cycles
function emptyState() {
	hits = [];
	for (var r = 0; r < NR; r++) startLk[r] = [{ t: null, w: 100 }];
	sel = null;
	group = [];
	chN = MINCH;
	menu = null;
	editor = null;
}
emptyState.local = 1;

function addlane() {
	if (chN >= MAXCH) return;
	chN++;
	for (var i = 0; i < hits.length; i++) fitCells(hits[i]);
	changed(true);
}

function removelane(i) {
	if (chN <= MINCH) return;
	i = Math.round(i);
	if (i < 0 || i >= chN) return;
	for (var k = 0; k < hits.length; k++) hits[k].ch.splice(i, 1);
	chN--;
	menu = null;
	editor = null;
	changed(true);
}

function bang() { outlet(0, flat()); }

// --- sequences ---------------------------------------------
function loadSeq(a) {
	undoReset();
	if (a && a.length) unflat(a);
	else emptyState();
	fitBox();
}
loadSeq.local = 1;

function withSeq(a, fn) {
	var save = flat();
	if (a && a.length) unflat(a);
	else emptyState();
	fn();
	unflat(save);
}
withSeq.local = 1;

function seq(v) {
	var k = Math.max(0, Math.min(NSEQ - 1, Math.round(v) || 0));
	outlet(0, 'seqis', k + 1);
	if (pend >= 0) {
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
		writeHits(ob);
		writeChance(ob);
	});
	if (!dspOn) {
		swapCount++;
		outlet(0, 'engine', 'pend', ob);
		outlet(0, 'engine', 'swapnow', swapCount);
		cur = k;
		bank = ob;
		loadSeq(seqs[cur]);
		afterSwitch();
		return;
	}
	pend = k;
	outlet(0, 'engine', 'pend', ob);
	park();
	mgraphics.redraw();
}

function seqstep(d) {
	var from = queued >= 0 ? queued : (pend >= 0 ? pend : cur);
	var k = Math.max(0, Math.min(NSEQ - 1, from + (Math.round(d) || 0)));
	if (k !== from) seq(k);
}

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
		bank = b;
		changed(false);
	}
}

function dsp(on) { dspOn = on ? 1 : 0; }

function afterSwitch() {
	park();
	outlet(0, 'lanes', chN);
	outlet(0, 'seqis', cur + 1);
	mgraphics.redraw();
	notifyclients();
	scheduleSave();
}
afterSwitch.local = 1;

function copyseq() { clip = flat(); }

function pasteseq() {
	if (!clip) return;
	unflat(clip);
	changed(true);
}

// --- sequences file ----------------------------------------
var paths = require('dingus.paths.js');

function folder() { return paths.presetFolder(this.patcher); }
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
		post('dingus.markovPercRoll: can\'t write ' + p + '\n');
	}
}
saveSeqs.local = 1;

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
		seqs[0] = flat();
		cur = 0;
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

// --- mouse -------------------------------------------------
function laneAt(y) {
	var lrs = laneRects();
	for (var i = 0; i < lrs.length; i++) if (y >= lrs[i].top && y < lrs[i].top + lrs[i].h) return lrs[i];
	return null;
}
laneAt.local = 1;

function laneValueAt(lane, lr, y) {
	return laneFromNorm(lane, 1 - (y - lr.top - 2) / (lr.h - 4));
}
laneValueAt.local = 1;

function setValue(h, lane, v) {
	if (!h || h[lane.key] === v) return false;
	h[lane.key] = v;
	return true;
}
setValue.local = 1;

function laneTargets() {
	if (group.length > 1) return group.slice();
	return (sel && !isStart(sel)) ? [sel] : [];
}
laneTargets.local = 1;

function inRoll(y) { return y >= rollTop() && y < rollBottom(); }
inRoll.local = 1;

// the hit bar under (x, y)
function hitCovering(r, pos) {
	for (var i = 0; i < hits.length; i++) if (hits[i].row === r && covers(hits[i], pos)) return hits[i];
	return null;
}
hitCovering.local = 1;

function hitAt(x, y) {
	var r = rowAt(y);
	if (r < 0 || x < labelW) return null;
	return hitOn(r, posOf(r, x));
}
hitAt.local = 1;

function endAt(x, y) {
	var r = rowAt(y);
	if (r < 0) return null;
	var best = null, bestD = ENDGRAB + 1;
	for (var i = 0; i < hits.length; i++) {
		var h = hits[i];
		if (h.row !== r) continue;
		var d = Math.abs(x - xOf(r, h.st + h.len));
		if (d < bestD) { best = h; bestD = d; }
	}
	return best;
}
endAt.local = 1;

function selAt(x) {
	if (!sel || isStart(sel)) return null;
	return covers(sel, posOf(sel.row, x)) ? sel : null;
}
selAt.local = 1;

function onidle(x, y) {
	var e = x >= labelW ? endAt(x, y) : null;
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

function stripClick(r, x, y) {
	var rc = rowCfg[r];
	if (inR(stripRect(r, 'm'), x, y)) { rc.mute = rc.mute ? 0 : 1; changed(true); return; }
	if (inR(stripRect(r, 's'), x, y)) {
		sel = 'S' + r;
		group = [];
		drag = { mode: 'link', from: sel, x0: x, y0: y, x: x, y: y, moved: false };
		mgraphics.redraw();
		return;
	}
	if (inR(stripRect(r, 'ck'), x, y)) { rc.clk = rc.clk ? 0 : 1; changed(true); return; }
	if (inR(stripRect(r, 'st'), x, y)) {
		// T rows: the left half is div, the right half the drawn steps
		var dv = rc.clk && x < stripRect(r, 'st')[0] + stripRect(r, 'st')[2] / 2;
		drag = { mode: 'strip', r: r, key: dv ? 'div' : 'steps', y0: y, v0: dv ? rc.div : rc.steps };
		return;
	}
	if (inR(stripRect(r, 'rs'), x, y)) { drag = { mode: 'strip', r: r, key: 'restart', y0: y, v0: rc.rs }; return; }
}
stripClick.local = 1;

function onclick(x, y, but, cmd, shift, capslock, option, ctrl) {
	undoTouch();
	drag = null;
	if (editor && editorClick(x, y)) return;
	if (menu) {
		var it = menuItemAt(x, y);
		if (it >= 0) {
			setOp(menu.h.ch[menu.li], it);
			menu = null;
			changed(true);
			return;
		}
		menu = null;
		mgraphics.redraw();
		if (it === -1) return;
	}
	var hl = handleAt(x, y);
	if (hl) {
		drag = { mode: 'weight', lk: hl, y0: y, w0: Math.round(hl.w) };
		return;
	}
	var li = chAt(y);
	if (x < labelW) {
		if (li >= 0) {
			if (x >= labelW - 16 && y >= chTop() + li * CHH + CHH / 2) removelane(li);
			return;
		}
		if (y >= addTop() && y < totalH()) { addlane(); return; }
		var sr = rowAt(y);
		if (sr >= 0) stripClick(sr, x, y);
		return;
	}
	if (y >= addTop() && y < totalH()) { addlane(); return; }
	if (li >= 0) {
		var cn = selAt(x);
		if (!cn) return;
		var cc = cn.ch[li];
		if (shift) {
			stepPtn(cc, option ? -1 : 1);
			changed(true);
			return;
		}
		var cx0 = xOf(cn.row, cn.st) + 1, cw0 = Math.max(2, cn.len * colW(cn.row) - 2);
		var cy0 = chTop() + li * CHH;
		var zone = 'prob';
		if (cw0 >= ZONEW) {
			if (y < cy0 + CHOP) zone = 'op';
			else if (y >= cy0 + CHH - CHBOT) zone = (x < cx0 + cw0 / 2) ? 'amt' : 'ptn';
		}
		if (option) zone = 'amt';
		drag = { mode: 'cell', h: cn, li: li, x0: x, y0: y, p0: cc.p, a0: opAmount(cc), q0: ptnIndex(cc), zone: zone, wide: cw0 >= ZONEW, moved: false };
		return;
	}
	var lr = laneAt(y);
	if (lr) {
		var ltg = laneTargets();
		if (!ltg.length) return;
		var v = laneValueAt(lr.lane, lr, y);
		drag = { mode: 'value', lane: lr.lane, rect: lr, y0: y, n0: laneNorm(lr.lane, v), tg: ltg };
		var lany = false;
		for (var lq = 0; lq < ltg.length; lq++) if (setValue(ltg[lq], lr.lane, v)) lany = true;
		if (lany) changed(false);
		return;
	}
	var r = rowAt(y);
	if (r < 0) return;
	var pos = posOf(r, x);
	if (shift) {
		var sn = hitOn(r, pos);
		if (sn) {
			sel = sn;
			drag = { mode: 'link', from: sn, x0: x, y0: y, x: x, y: y, moved: false };
		} else {
			group = [];
			drag = { mode: 'marquee', x0: x, y0: y, x: x, y: y };
		}
		mgraphics.redraw();
		return;
	}
	var h = endAt(x, y);
	if (h) {
		sel = h;
		group = [];
		drag = { mode: 'end', h: h };
		mgraphics.redraw();
		return;
	}
	h = hitOn(r, pos);
	if (h) {
		sel = h;
		if (group.length > 1 && group.indexOf(h) >= 0) {
			drag = { mode: 'gmove', h: h, grab: pos - h.st, ast: h.st, st0: group.map(function (q) { return q.st; }) };
			mgraphics.redraw();
			return;
		}
		group = [];
		mgraphics.redraw();
		drag = { mode: 'move', h: h, grabC: (pos - h.st) / rowCfg[r].steps, copy: !!option, cloned: false };
		return;
	}
	group = [];
	var st = Math.max(snapDown(pos, option), prevEnd(r, pos, null));
	var room = maxLen(r, st, null);
	if (room < MINLEN) return;
	h = newHit(r, st, Math.min(Math.max(minLen(option), 1), room));
	hits.push(h);
	sel = h;
	drag = { mode: 'end', h: h };
	changed(false);
}
onclick.local = 1;

function ondrag(x, y, but, cmd, shift, capslock, option, ctrl) {
	if (!drag) return;
	var r, pos, h;
	if (drag.mode === 'link') {
		if (Math.abs(x - drag.x0) + Math.abs(y - drag.y0) >= 8) drag.moved = true;
		if (but === 0) {
			// the drop: anywhere on a hit
			var dr = rowAt(y);
			var tn = (drag.moved && x >= labelW && dr >= 0) ? hitCovering(dr, posOf(dr, x)) : null;
			var made = !tn ? null : (tn.row === srcRow(drag.from) ? addLink(drag.from, tn) : addFollow(drag.from, tn));
			drag = null;
			if (made) changed(true);
			else mgraphics.redraw();
			return;
		}
		drag.x = x;
		drag.y = y;
		mgraphics.redraw();
		return;
	}
	if (drag.mode === 'marquee') {
		if (but === 0) {
			drag = null;
			mgraphics.redraw();
			return;
		}
		drag.x = Math.max(labelW, x);
		drag.y = Math.max(rollTop(), Math.min(rollBottom(), y));
		group = hitsInRect(drag.x0, drag.y0, drag.x, drag.y);
		mgraphics.redraw();
		return;
	}
	if (drag.mode === 'weight') {
		if (but === 0) {
			drag = null;
			changed(true);
			return;
		}
		var lw = Math.round(drag.w0 + (drag.y0 - y) / (shift ? 8 : 2));
		if (isFollow(sel, drag.lk) ? setFollow(sel, drag.lk, lw) : setChance(sel, drag.lk, lw)) changed(false);
		return;
	}
	if (drag.mode === 'strip') {
		if (but === 0) {
			drag = null;
			changed(true);
			return;
		}
		var step = drag.key === 'restart' ? 0.25 : 1;
		var nv = drag.v0 + Math.round((drag.y0 - y) / (shift ? 12 : 4)) * step;
		var rc = rowCfg[drag.r];
		var old = drag.key === 'steps' ? rc.steps : drag.key === 'div' ? rc.div : rc.rs;
		setRow(drag.r, drag.key, nv);
		var now = drag.key === 'steps' ? rc.steps : drag.key === 'div' ? rc.div : rc.rs;
		if (now !== old) changed(false);
		return;
	}
	if (but === 0) {
		if (drag.mode === 'cell' && !drag.moved) {
			var cy1 = chTop() + drag.li * CHH;
			if (drag.wide && drag.zone === 'op') menu = { h: drag.h, li: drag.li, x: x, y: cy1 };
			else editor = { h: drag.h, li: drag.li, x: x, y: cy1 };
		}
		drag = null;
		changed(true);
		return;
	}
	if (drag.mode === 'edamt' || drag.mode === 'edptn') {
		edSet(drag.mode, drag.cl, (x - drag.x0) / drag.w);
		return;
	}
	if (drag.mode === 'edprob') {
		var npv = Math.max(0, Math.min(1, (x - drag.x0) / drag.w));
		if (npv !== drag.cl.p) { drag.cl.p = npv; changed(false); }
		return;
	}
	if (drag.mode === 'cell') {
		var dy = drag.y0 - y;
		if (!drag.moved && Math.abs(dy) < 3) return;
		drag.moved = true;
		var ce = drag.h.ch[drag.li];
		if (drag.zone === 'amt') {
			var od = OPS[ce.op];
			if (!od || !od.a) return;
			var na = Math.max(od.a[0], Math.min(amtMax(od), Math.round(drag.a0 + dy / 6)));
			if (na !== ce.amt) { ce.amt = na; changed(false); }
		} else if (drag.zone === 'ptn') {
			var qi = Math.max(0, Math.min(PTNS.length - 1, drag.q0 + Math.round(dy / 10)));
			if (PTNS[qi][0] !== ce.pa || PTNS[qi][1] !== ce.pb) { ce.pa = PTNS[qi][0]; ce.pb = PTNS[qi][1]; changed(false); }
		} else {
			var np = Math.max(0, Math.min(1, drag.p0 + dy / 100));
			if (np !== ce.p) { ce.p = np; changed(false); }
		}
		return;
	}
	if (drag.mode === 'value') {
		var lane = drag.lane, v;
		if (shift && !lane.int) v = laneFromNorm(lane, drag.n0 - (y - drag.y0) / (drag.rect.h - 4) * 0.1);
		else v = laneValueAt(lane, drag.rect, y);
		var any = false;
		for (var i = 0; i < drag.tg.length; i++) if (setValue(drag.tg[i], lane, v)) any = true;
		if (any) changed(false);
		return;
	}
	h = drag.h;
	if (drag.mode === 'end') {
		r = h.row;
		pos = posOf(r, x);
		var room = maxLen(r, h.st, h);
		var L = snapRound(pos, option) - h.st;
		L = Math.max(Math.min(minLen(option), room), Math.min(room, L));
		if (Math.abs(L - h.len) > 1e-9) {
			h.len = L;
			changed(false);
		}
	} else if (drag.mode === 'move') {
		moveDrag(x, y);
	} else if (drag.mode === 'gmove') {
		groupMove(x);
	}
}
ondrag.local = 1;

// move (option: copy) the dragged hit in time, in its row
function moveDrag(x, y) {
	var h = drag.h;
	var r = rowAt(y);
	if (r < 0) r = h.row;
	// into another row: the same place in the cycle, the same length in time
	var len = r === h.row ? h.len : Math.max(MINLEN, h.len / rowCfg[h.row].steps * rowCfg[r].steps);
	var st = Math.max(0, Math.min(span(r) - len, snapRound(posOf(r, x) - drag.grabC * rowCfg[r].steps, false)));
	if (drag.copy && !drag.cloned) {
		if ((r === h.row && Math.abs(st - h.st) < EPS) || !fits(r, st, len, null)) return;
		var c = copyHit(h);
		hits.push(c);
		drag.h = c;
		drag.cloned = true;
		sel = c;
		placeHit(c, r, st, len);
		changed(false);
		return;
	}
	if ((r !== h.row || Math.abs(st - h.st) > EPS) && fits(r, st, len, h)) {
		placeHit(h, r, st, len);
		changed(false);
	}
}
moveDrag.local = 1;

// a hit to row r at st: in a new row its own links start over (a link to the next hit); the links
// that no longer fit (to or from its old row, follow links inside its new row) go in cleanLinks
function placeHit(h, r, st, len) {
	if (r !== h.row) {
		h.row = r;
		h.lk = [{ t: null, w: 100 }];
	}
	h.st = st;
	h.len = len;
}
placeHit.local = 1;

// the group moves by the same row-step amount... in cycles: every hit keeps its place relative to the cycle
function groupMove(x) {
	var a = drag.h;
	var st = Math.max(0, Math.min(span(a.row) - a.len, snapRound(posOf(a.row, x) - drag.grab, false)));
	var dc = (st - drag.ast) / rowCfg[a.row].steps;          // the move in cycles
	var to = [], i;
	for (i = 0; i < group.length; i++) {
		var gh = group[i];
		var ns = Math.round((drag.st0[i] + dc * rowCfg[gh.row].steps) * 1e6) / 1e6;
		if (!fits(gh.row, ns, gh.len, gh, group)) return;
		to.push(ns);
	}
	var moved = false;
	for (i = 0; i < group.length; i++) {
		if (Math.abs(group[i].st - to[i]) > EPS) moved = true;
		group[i].st = to[i];
	}
	if (moved) changed(false);
}
groupMove.local = 1;

function ondblclick(x, y, but, cmd, shift, capslock, option, ctrl) {
	drag = null;
	if (editor) {
		var wh = dims();
		if (inR(edLayout(wh[0], wh[1]).r, x, y)) {
			if (!(lastEdClick.x === x && lastEdClick.y === y && Date.now() - lastEdClick.t < 40)) editorClick(x, y);
			drag = null;
			return;
		}
	}
	if (menu) {
		var wm = dims();
		if (inR(menuRect(wm[0], wm[1]), x, y)) return;
	}
	menu = null;
	editor = null;
	var hd = handleAt(x, y);
	if (hd) {
		var hls = isFollow(sel, hd) ? sel.fl : linksOf(sel);
		hls.splice(hls.indexOf(hd), 1);
		changed(true);
		return;
	}
	if (x < labelW) {
		var sr = rowAt(y);
		// double-click rs: one cycle
		if (sr >= 0 && inR(stripRect(sr, 'rs'), x, y)) {
			rowCfg[sr].rs = rowCfg[sr].steps;
			changed(true);
		}
		return;
	}
	var li = chAt(y);
	if (li >= 0) {
		var cn = selAt(x);
		if (cn) {
			cn.ch[li] = newCell();
			changed(true);
		} else mgraphics.redraw();
		return;
	}
	var h = hitAt(x, y);
	if (h && group.length > 1 && group.indexOf(h) >= 0) {
		hits = hits.filter(function (q) { return group.indexOf(q) < 0; });
		group = [];
		changed(true);
		return;
	}
	if (h) {
		hits.splice(hits.indexOf(h), 1);
		changed(true);
	}
}
ondblclick.local = 1;

// --- pattr -------------------------------------------------
// presets keep the sequence number (the sequences are in their own file)
function getvalueof() {
	return [-7, cur];
}

function setvalueof() {
	var a = arrayfromargs(arguments);
	if (a.length >= 2 && a[0] === -7) seq(a[1]);
}
