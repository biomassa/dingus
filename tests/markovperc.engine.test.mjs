// Tests for the markovPerc engine (code/dingus.markovPerc.gendsp) outside Max: the gen~ code runs as
// JavaScript, one instance per row (mc_channel 1..8), all on the same hand-made tables.
// This checks the logic, not that gen~ compiles it.
// Run: node tests/markovperc.engine.test.mjs
import { readFileSync } from "node:fs";
import { fileURLToPath } from "node:url";
import assert from "node:assert/strict";

const d = JSON.parse(readFileSync(fileURLToPath(new URL("../code/dingus.markovPerc.gendsp", import.meta.url)), "utf8"));
const CODE = d.patcher.boxes.find((b) => b.box.maxclass === "codebox").box.code;
assert.ok(CODE.includes("markovPerc engine"));

const SR = 1000;

// rows: [{ steps, clock, div, restart, mute, hits: [{ len, v, rat, acc, atk, dec, curve, lk: [[target, weight]] }], start: [[hit, w]] }]
function tables(rows, bank = 0, gb = new Map(), cb = new Map()) {
	const put = (f, c, v) => gb.set(f + ":" + c, v);
	rows.forEach((rw, r) => {
		if (!rw) return;
		const base = bank * 8192 + r * 1024, mb = 16384 + bank * 8 + r;
		put(mb, 0, rw.steps ?? 4); put(mb, 1, rw.clock ?? 0); put(mb, 2, rw.div ?? 1);
		put(mb, 3, rw.restart ?? (rw.steps ?? 4)); put(mb, 4, rw.mute ?? 0); put(mb, 5, rw.lanes ?? 0);
		let lk = 0;
		const links = (i, arr) => {
			const sum = arr.reduce((a, x) => a + (x[1] ?? 1), 0);
			put(base + i, 7, lk); put(base + i, 8, arr.length);
			let c = 0;
			for (const [t, w = 1] of arr) { c += w / sum; put(base + 128 + lk, 0, t); put(base + 128 + lk, 1, c); lk++; }
		};
		rw.hits.forEach((h, i) => {
			put(base + i, 0, h.len ?? 1); put(base + i, 1, h.v ?? 1); put(base + i, 2, h.rat ?? 1); put(base + i, 3, h.acc ?? 0);
			put(base + i, 4, h.atk ?? 1); put(base + i, 5, h.dec ?? 20); put(base + i, 6, h.curve ?? 0);
			links(i, h.lk ?? [[(i + 1) % rw.hits.length]]);
		});
		links(127, rw.start ?? [[0]]);
		(rw.ch || []).forEach(([lane, hit, op, prob, pa, pb, amt]) => {
			const f = bank * 32768 + lane * 1024 + r * 128 + hit;
			[op, prob, pa, pb, amt].forEach((v, c) => cb.set(f + ":" + c, v));
		});
	});
	return { gb, cb };
}

function make(rows, params = {}) {
	const { gb, cb } = tables(rows);
	let src = CODE.replace(/\/\/.*$/gm, "");
	const hist = [...src.matchAll(/^History (\w+)\(([^)]*)\);/gm)].map((m) => [m[1], +m[2]]);
	const P = { play: 1, pend: -1, swapnow: 0, freeze: 0, mutate: 0, cscale: 1, ptnmode: 0, barcount: 0, trigms: 5, accvel: 0.3, accdec: 1.5, ...params };
	src = src.replace(/^(History|Param|Buffer) .*$/gm, "");
	const fn = new Function("S", "P", "mc_channel", "in1", "in2", "in3", "in4", "peek", "noise", "clamp", "wrap", "min", "max", "floor", "pow", "samplerate", "gb", "cb",
		`with(P){with(S){ ${src}; return [out1,out2,out3,out4,out5]; }}`);
	const peek = (b, f, c) => (b === "gb" ? gb : cb).get(f + ":" + c) ?? 0;
	const wrap = (x, a, b) => { const r = b - a; return a + ((x - a) % r + r) % r; };
	const S = [], noises = [];
	for (let r = 0; r < 8; r++) {
		S.push(Object.fromEntries(hist));
		let sv = 1 + r * 101;
		noises.push(() => { sv = (sv * 48271) % 2147483647; return sv / 2147483647 * 2 - 1; });
	}
	const clamp = (x, a, b) => Math.min(Math.max(x, a), b);
	// one sample of all 8 rows: [[trig, env, hit, bank, time], ...]
	const tick = (ph, tr = 0, rs = 0, fz = 0) => S.map((s, r) => fn(s, P, r + 1, ph, tr, rs, fz, peek, noises[r], clamp, wrap, Math.min, Math.max, Math.floor, Math.pow, SR, "gb", "cb"));
	return { P, tick, gb, cb, tables };
}

// run with a phasor of N samples per cycle; per row: trigger onsets {t (steps of the row), hit, v}
function run(e, cycles, { N = 4000, hook, steps = [4, 4, 4, 4, 4, 4, 4, 4], tr } = {}) {
	const ev = [[], [], [], [], [], [], [], []], was = new Array(8).fill(0), out = [];
	for (let i = 0; i < N * cycles; i++) {
		if (hook) hook(i, e);
		const rs = e.tick((i % N) / N, tr ? tr(i) : 0);
		rs.forEach((o, r) => {
			if (o[0] > 0 && was[r] === 0) ev[r].push({ t: +(i / N * steps[r]).toFixed(3), i, n: o[2], v: +o[0].toFixed(2) });
			was[r] = o[0];
		});
		out.push(rs);
	}
	return { ev, out };
}
const hits = (ev) => ev.map((x) => x.n).join(" ");
const times = (ev) => ev.map((x) => x.t).join(" ");

// one row, 4 steps a cycle: A (1) -> B (1) -> C (2) -> A; restart every 4 steps (= each cycle)
{
	const e = make([{ steps: 4, hits: [{ len: 1 }, { len: 1 }, { len: 2 }] }]);
	const { ev } = run(e, 2);
	assert.equal(times(ev[0]), "0 1 2 4 5 6", "a hit per state, restart at the wrap");
	assert.equal(hits(ev[0]), "0 1 2 0 1 2");
	assert.equal(ev[1].length, 0, "empty rows stay silent");
}
// polyrhythm: 4 against 3 in a cycle
{
	const e = make([{ steps: 4, hits: [{ len: 1 }] }, { steps: 3, hits: [{ len: 1 }] }]);
	const { ev } = run(e, 2, { steps: [4, 3] });
	assert.equal(ev[0].length, 8, "row 1: 4 a cycle");
	assert.equal(ev[1].length, 6, "row 2: 3 a cycle");
	assert.deepEqual(ev[1].map((x) => x.i), [0, 1334, 2667, 4000, 5334, 6667], "evenly over the cycle");
}
// polymeter: a 3-hit loop restarted every 5 steps
{
	const e = make([{ steps: 4, restart: 5, hits: [{}, {}, {}] }]);
	const { ev } = run(e, 3);
	assert.equal(hits(ev[0]), "0 1 2 0 1 0 1 2 0 1 0 1", "restart every 5 steps, across the cycles");
}
// restart 0: the loop runs free
{
	const e = make([{ steps: 4, restart: 0, hits: [{}, {}, {}] }]);
	assert.equal(hits(run(e, 2).ev[0]), "0 1 2 0 1 2 0 1");
}
// ratchets, velocity, accent, rests
{
	const e = make([{ steps: 4, hits: [{ rat: 2, v: 0.5 }, { v: 0 }, { v: 0.5, acc: 1 }, { v: 0.8 }] }]);
	const { ev } = run(e, 1);
	assert.equal(times(ev[0]), "0 0.5 2 3", "2 ratchets on the first hit, the rest is silent");
	assert.deepEqual(ev[0].map((x) => x.v), [0.5, 0.5, 0.8, 0.8], "accent adds 0.3");
}
// the trigger: 'trigms' long, a low sample between hits that touch
{
	const e = make([{ steps: 4, hits: [{ rat: 4 }] }], { trigms: 50 });
	const { ev, out } = run(e, 1, { N: 400 });     // a step = 100 samples, a ratchet hit = 25 samples < 50 ms
	assert.equal(ev[0].length, 16, "every ratchet hit is a rising edge");
	const hi = out.slice(0, 100).filter((o) => o[0][0] > 0).length;
	assert.ok(hi >= 95, "it stays high between them, apart from the gaps (" + hi + ")");
	const e2 = make([{ steps: 4, hits: [{ len: 4 }] }], { trigms: 5 });
	const o2 = run(e2, 1).out;
	assert.equal(o2.slice(0, 50).filter((o) => o[0][0] > 0).length, 5, "5 ms");
}
// the envelope: attack to the velocity, decay to 0; accent decays longer
{
	const e = make([{ steps: 4, hits: [{ len: 4, v: 0.6, atk: 10, dec: 100 }] }, { steps: 4, hits: [{ len: 4, v: 0.6, acc: 1, atk: 10, dec: 100 }] }]);
	const { out } = run(e, 1);
	const env = (r, i) => out[i][r][1];
	assert.ok(Math.abs(env(0, 9) - 0.6) < 0.01, "peak after the attack");
	assert.ok(Math.abs(env(0, 60) - 0.3) < 0.02, "linear decay: half way");
	assert.equal(env(0, 112), 0, "over after attack + decay");
	assert.ok(env(1, 112) > 0 && env(1, 170) === 0, "accent: 1.5 x decay, from 0.9");
	assert.ok(Math.abs(env(1, 9) - 0.9) < 0.01);
}
{
	const e = make([{ steps: 4, hits: [{ len: 4, dec: 100, curve: 1 }] }]);
	const { out } = run(e, 1);
	assert.ok(out[51][0][1] < 0.1, "curve 1: much faster fall (" + out[51][0][1].toFixed(3) + ")");
}
// a muted row keeps walking (its hit changes) but sends nothing
{
	const e = make([{ steps: 4, mute: 1, hits: [{}, {}] }]);
	const { ev, out } = run(e, 1);
	assert.equal(ev[0].length, 0);
	assert.equal(out.reduce((a, o) => a + o[0][1], 0), 0, "no envelope");
	assert.deepEqual([out[500][0][2], out[1500][0][2]], [0, 1], "still walking");
}
// chance lane: mute hit 1 always
{
	const e = make([{ steps: 4, lanes: 1, hits: [{}, {}, {}, {}], ch: [[0, 1, 1, 1, 0, 0, 0]] }]);
	assert.equal(hits(run(e, 1).ev[0]), "0 2 3");
}
// trigger clock: div 2, an edge every 100 samples; the first step on the first edge
{
	const tr = (i) => (i >= 50 && i % 100 < 10 ? 1 : 0);   // edges at 100, 200, ...
	const e = make([{ clock: 1, div: 2, restart: 0, hits: [{}, { rat: 2 }, {}] }]);
	const { ev } = run(e, 1, { N: 1000, tr });
	assert.deepEqual(ev[0].slice(0, 5).map((x) => [x.i, x.n]), [[100, 0], [300, 1], [400, 1], [500, 2], [700, 0]],
		"a step every 2nd edge; the ratchet half way, by the speed of the step before");
}
{
	// trigger rows restart every 'restart' steps, too; a held level is one edge
	const tr = (i) => (i % 100 < 60 ? 1 : 0);
	const e = make([{ clock: 1, div: 1, restart: 2, hits: [{}, {}, {}] }]);
	assert.equal(hits(run(e, 1, { N: 1000, tr }).ev[0]), "0 1 0 1 0 1 0 1 0 1");
}
// the reset: rows start again (a trigger row on its next step)
{
	const tr = (i) => (i % 100 === 30 ? 1 : 0);
	const e = make([{ steps: 4, restart: 0, hits: [{}, {}, {}] }, { clock: 1, restart: 0, hits: [{}, {}, {}] }]);
	const ev = [[], []], was = [0, 0];
	for (let i = 0; i < 4000; i++) {
		const rs = e.tick((i % 4000) / 4000, tr(i), i === 2500 ? 1 : 0);
		[0, 1].forEach((r) => { if (rs[r][0] > 0 && was[r] === 0) ev[r].push({ i, n: rs[r][2] }); was[r] = rs[r][0]; });
	}
	assert.deepEqual(ev[0].filter((x) => x.i >= 2500).map((x) => [x.i, x.n]), [[2500, 0], [3500, 1]], "phasor row: at once");
	assert.deepEqual(ev[1].filter((x) => x.i >= 2500).map((x) => [x.i, x.n]).slice(0, 2), [[2530, 0], [2630, 1]], "trigger row: on its next edge");
}
// freeze: with branching links, the restart periods repeat while frozen
{
	const e = make([{ steps: 8, restart: 8, hits: [{ lk: [[1], [2]] }, { lk: [[0], [2]] }, { lk: [[0], [1]] }] }]);
	const per = [];
	const { ev } = run(e, 12, { steps: [8], hook: (i, e) => { e.P.freeze = i >= 4000 * 3 && i < 4000 * 8 ? 1 : 0; } });
	for (let c = 0; c < 12; c++) per.push(ev[0].filter((x) => x.t >= c * 8 && x.t < c * 8 + 8).map((x) => x.n).join(""));
	assert.ok(new Set(per.slice(3, 8)).size === 1, "frozen: " + per.join(" "));
	assert.ok(new Set(per.slice(0, 3).concat(per.slice(8))).size > 1, "free: they differ");
}
// rows differ in their random choices
{
	const row = { steps: 8, restart: 0, hits: [{ lk: [[1], [2]] }, { lk: [[0], [2]] }, { lk: [[0], [1]] }] };
	const { ev } = run(make([row, row]), 4, { steps: [8, 8] });
	assert.notEqual(hits(ev[0]), hits(ev[1]), "independent rows");
}
// a waiting bank takes over at the wrap; every row starts again from START
{
	const e = make([{ steps: 4, hits: [{}, {}] }]);
	tables([{ steps: 4, hits: [{ v: 0.5 }, { v: 0.5 }, { v: 0.5 }] }], 1, e.gb, e.cb);
	const { ev, out } = run(e, 2, { hook: (i, e) => { if (i === 1500) e.P.pend = 1; } });
	assert.equal(out[3999][0][3], 0, "bank 0 until the wrap");
	assert.equal(out[4000][0][3], 1, "bank 1 from the wrap");
	assert.deepEqual(ev[0].filter((x) => x.i >= 4000).map((x) => [x.n, x.v]), [[0, 0.5], [1, 0.5], [2, 0.5], [0, 0.5]]);
}
// pause: nothing plays
{
	const e = make([{ steps: 4, hits: [{}] }], { play: 0 });
	assert.equal(run(e, 1).ev[0].length, 0);
}

console.log("markovperc.engine: all tests passed");
