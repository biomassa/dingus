// ===========================================================
// dingus.voltBank.js  (v8)
//
// The 32 sequences of dingus.voltagesModulator and the tables of its gen~ engine.
// A sequence: step count, a voltage per step, rest and skip probabilities per step (1 = always plays),
// play range. The shown sequence plays from one engine bank; a newly chosen one is written to the other
// bank and takes over at the phasor wrap (the engine swaps; 'bankis' confirms). Choices made before the
// confirmation wait for it. All 32 are saved to <presets folder>/uVOLTseq_<name>.json on every change;
// the first time, the content of the presets file's slots becomes sequences (slot n = sequence n).
//
// Skip, the clean rule: only steps inside the range can play; their skip values are raised by the same
// amount so the highest one in the range is 1 (at least one step always plays).
//
// inlet 0:
//   vals ... / rest ... / skip ...   the lists from the multisliders (the current sequence)
//   range a b                        play range from the range slider: steps a .. b - 1 (step boundaries)
//   steps n                          step count (the bpatcher's stepsChange pads and re-sends the lists)
//   seq n / seqstep d                sequence 0..31 / d up or down (from a waiting one)
//   copyseq / pasteseq / clear / clearall
//   buffer name                      the engine's buffer~
//   seqname name                     the instance name: reads (or migrates) the sequences file
//   bankis b                         the engine's playing bank (gen~ out 3)
//   dsp 0|1                          audio on / off (off: sequences switch at once)
// outlet 0:
//   needbuffer                       at load
//   engine pendbank b / engine swapnow k
//   msv|msr|mss size n, msv|msr|mss setlist ...   the multisliders (values, rest, skip)
//   rsl size n+1, rsl set a b+1      the range slider (step boundaries)
//   grid columns n                   the step display (live.grid)
//   stepsis n, seqis n (1..32)       the boxes
//
// buffer~: frame = bank * 64 + step, channels: 1 value, 2 skip (as played:
//   0 outside the range), 3 rest; meta at frame 128 + bank: 1 steps, 2 range start, 3 range end
// ===========================================================

inlets = 1;
outlets = 1;
autowatch = 1;

const MAXSTEPS = 64;
const NSEQ = 32;
const BANKF = 64;
const METABASE = 128;
const PREFIX = 'uVOLT';

const paths = require('dingus.paths.js');

let seqs = [];
for (let i = 0; i < NSEQ; i++) seqs.push(null);
let cur = 0;
let bank = 0;
let pend = -1;
let queued = -1;
let swapCount = 0;
let dspOn = 1;
let clip = null;
let seqName = '';
let seqsLoaded = false;
let bufName = '';

// the current sequence
let n = 5;
let vals = [];
let rest = [];
let skip = [];
let rStart = 0;
let rEnd = 4;

function fillTo(a, k, v) {
	const out = a.slice(0, k);
	while (out.length < k) out.push(out.length ? (v === 'last' ? out[out.length - 1] : v) : (v === 'last' ? 0 : v));
	return out;
}

function clampRange() {
	rStart = Math.max(0, Math.min(n - 1, Math.round(rStart) || 0));
	rEnd = Math.max(rStart, Math.min(n - 1, Math.round(rEnd)));
}

function emptyState() {
	vals = fillTo([], n, 0);
	rest = fillTo([], n, 1);
	skip = fillTo([], n, 1);
	rStart = 0;
	rEnd = n - 1;
}

function snapshot() {
	return { n: n, vals: vals.slice(0, n), rest: rest.slice(0, n), skip: skip.slice(0, n), rs: rStart, re: rEnd };
}

function loadSeq(s) {
	if (!s) {
		emptyState();
		return;
	}
	n = Math.max(1, Math.min(MAXSTEPS, Math.round(s.n) || 1));
	vals = fillTo(s.vals || [], n, 'last');
	rest = fillTo(s.rest || [], n, 1);
	skip = fillTo(s.skip || [], n, 1);
	rStart = s.rs;
	rEnd = s.re;
	clampRange();
}

function withSeq(s, fn) {
	const save = snapshot();
	loadSeq(s);
	fn();
	loadSeq(save);
}

// --- engine tables -------------------------------------------
function writeBank(bk) {
	if (!bufName) return;
	const buf = new Buffer(bufName);
	if (buf.framecount() < METABASE + 2 || buf.channelcount() < 3) {
		post('dingus.voltBank: buffer~ ' + bufName + ' needs ' + (METABASE + 2) + ' samples and 3 channels\n');
		return;
	}
	const v = [], sk = [], rs = [];
	let mx = 0;
	for (let i = rStart; i <= rEnd; i++) mx = Math.max(mx, skip[i] || 0);
	for (let i = 0; i < MAXSTEPS; i++) {
		const inside = i < n && i >= rStart && i <= rEnd;
		v.push(i < n ? vals[i] : 0);
		sk.push(inside ? Math.min(1, (skip[i] || 0) + (1 - mx)) : 0);
		rs.push(i < n ? rest[i] : 1);
	}
	buf.poke(1, bk * BANKF, v);
	buf.poke(2, bk * BANKF, sk);
	buf.poke(3, bk * BANKF, rs);
	buf.poke(1, METABASE + bk, [n]);
	buf.poke(2, METABASE + bk, [rStart]);
	buf.poke(3, METABASE + bk, [rEnd]);
}

// --- the controls -----------------------------------------------
function showControls() {
	outlet(0, 'msv', 'size', n);
	outlet(0, 'msv', 'setlist', ...vals);
	outlet(0, 'msr', 'size', n);
	outlet(0, 'msr', 'setlist', ...rest);
	outlet(0, 'mss', 'size', n);
	outlet(0, 'mss', 'setlist', ...skip);
	outlet(0, 'rsl', 'size', n + 1);
	outlet(0, 'rsl', 'set', rStart, rEnd + 1);
	outlet(0, 'grid', 'columns', n);
	outlet(0, 'stepsis', n);
	outlet(0, 'seqis', cur + 1);
}

function changed() {
	clampRange();
	seqs[cur] = snapshot();
	writeBank(bank);
	park();
	scheduleSave();
}

// --- edits from the controls -----------------------------------
function anything() {
	const a = arrayfromargs(arguments).map(Number);
	if (messagename === 'vals') {
		vals = fillTo(a, n, 'last');
	} else if (messagename === 'rest') {
		rest = fillTo(a, n, 1);
	} else if (messagename === 'skip') {
		skip = fillTo(a, n, 1);
	} else {
		post('dingus.voltBank: unknown message ' + messagename + '\n');
		return;
	}
	changed();
}

// the range slider marks step boundaries (0 .. steps, as sequencedata~ read it): a b = steps a .. b - 1
function range(a, b) {
	a = Math.round(a);
	b = Math.round(b);
	if (b <= a) return;
	rStart = a;
	rEnd = b - 1;
	changed();
}

function steps(v) {
	const full = rStart === 0 && rEnd >= n - 1;
	n = Math.max(1, Math.min(MAXSTEPS, Math.round(v) || 1));
	vals = fillTo(vals, n, 'last');
	rest = fillTo(rest, n, 1);
	skip = fillTo(skip, n, 1);
	if (full) rEnd = n - 1;
	changed();
}

function clear() {
	emptyState();
	changed();
	showControls();
}

function clearall() {
	for (let i = 0; i < NSEQ; i++) seqs[i] = null;
	clear();
}

function copyseq() {
	clip = snapshot();
}

function pasteseq() {
	if (!clip) return;
	loadSeq(clip);
	changed();
	showControls();
}

// --- switching ---------------------------------------------------
function seq(v) {
	const k = Math.max(0, Math.min(NSEQ - 1, Math.round(v) || 0));
	outlet(0, 'seqis', k + 1);
	if (pend >= 0) {
		queued = k === pend ? -1 : k;
		return;
	}
	queued = -1;
	if (k === cur) return;
	const ob = 1 - bank;
	withSeq(seqs[k], () => writeBank(ob));
	if (!dspOn) {
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
}

function seqstep(d) {
	const from = queued >= 0 ? queued : pend >= 0 ? pend : cur;
	const k = Math.max(0, Math.min(NSEQ - 1, from + (Math.round(d) || 0)));
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
			const q = queued;
			queued = -1;
			seq(q);
		}
	} else if (pend < 0 && b !== bank) {
		bank = b;
		changed();
	}
}

function dsp(on) {
	dspOn = on ? 1 : 0;
}

function afterSwitch() {
	park();
	showControls();
	scheduleSave();
}

// --- the sequences file ------------------------------------------
function folder() {
	return paths.presetFolder(this.patcher);
}

function seqPath() {
	const f = folder();
	return f && seqName ? f + PREFIX + 'seq_' + seqName + '.json' : '';
}

function readJSON(p) {
	if (!p) return null;
	try {
		const f = new File(p, 'read');
		if (!f.isopen) return null;
		let txt = '';
		while (f.position < f.eof) txt += f.readstring(4096);
		f.close();
		return JSON.parse(txt);
	} catch (e) {
		return null;
	}
}

const saveTask = new Task(saveSeqs, this);

function scheduleSave() {
	if (seqsLoaded && seqName) saveTask.schedule(300);
}

function saveSeqs() {
	const p = seqPath();
	if (!p) return;
	seqs[cur] = snapshot();
	try {
		const txt = JSON.stringify({ format: 1, current: cur, seqs: seqs });
		const f = new File(p, 'write', 'TEXT');
		if (!f.isopen) throw new Error('not open');
		for (let i = 0; i < txt.length; i += 4096) f.writestring(txt.substring(i, i + 4096));
		f.eof = f.position;
		f.close();
	} catch (e) {
		post("dingus.voltBank: can't write " + p + '\n');
	}
}

// a presets-file slot into a sequence
function fromSlot(d) {
	if (!d || !d.number) return null;
	const k = Math.max(1, Math.min(MAXSTEPS, Math.round([].concat(d.number)[0]) || 1));
	const r = [].concat(d.rslider || [0, k]);
	return {
		n: k,
		vals: [].concat(d.multislider || []),
		rest: [].concat(d['multislider[1]'] || []),
		skip: [].concat(d['multislider[2]'] || []),
		rs: Math.round(r[0]) || 0,
		re: r.length > 1 && Math.round(r[1]) > Math.round(r[0]) ? Math.round(r[1]) - 1 : k - 1,
	};
}

function migrate() {
	const f = folder();
	const o = f ? readJSON(f + PREFIX + '_' + seqName + '.json') : null;
	const slots = o && o.pattrstorage && o.pattrstorage.slots ? o.pattrstorage.slots : null;
	let found = 0;
	const left = [];
	if (slots) {
		const ids = Object.keys(slots).map(Number).sort((x, y) => x - y);
		for (const id of ids) {
			const s = fromSlot(slots[id] && slots[id].data);
			if (!s) continue;
			withSeq(s, () => (s.clean = snapshot()));
			if (id >= 1 && id <= NSEQ) seqs[id - 1] = s.clean;
			else left.push(s.clean);
			found++;
		}
		for (let r = 0, k = 0; r < left.length && k < NSEQ; k++) if (!seqs[k]) seqs[k] = left[r++];
	}
	if (!found) seqs[0] = snapshot();
	cur = 0;
	post('dingus.voltBank: ' + (found ? found + ' preset slots became sequences' : 'the current values became sequence 1') + ', saved to ' + seqPath() + '\n');
}

function seqname(nm) {
	const name = String(nm);
	if (seqsLoaded && name === seqName) return;
	seqName = name;
	const o = readJSON(seqPath());
	let fresh = false;
	if (o && o.seqs) {
		for (let i = 0; i < NSEQ; i++) seqs[i] = o.seqs[i] || null;
		cur = Math.max(0, Math.min(NSEQ - 1, Math.round(o.current) || 0));
	} else {
		migrate();
		fresh = true;
	}
	seqsLoaded = true;
	pend = -1;
	queued = -1;
	loadSeq(seqs[cur]);
	writeBank(bank);
	showControls();
	if (fresh) saveSeqs();
}

// keep the state across a script reload (autowatch), under the buffer~ name
const keep = new Global('dingusVoltBankState');

function park() {
	if (bufName) keep[bufName] = { seqs: seqs.slice(), cur, bank, loaded: seqsLoaded, name: seqName };
}

function buffer(name) {
	bufName = String(name);
	const k = keep[bufName];
	if (!seqsLoaded && k && k.seqs && k.seqs.length === NSEQ) {
		seqs = k.seqs.slice();
		cur = k.cur;
		bank = k.bank;
		seqsLoaded = k.loaded;
		seqName = k.name || '';
		loadSeq(seqs[cur]);
		showControls();
	}
	writeBank(bank);
}

const askTask = new Task(() => {
	if (!bufName) outlet(0, 'needbuffer');
}, this);
askTask.schedule(50);
