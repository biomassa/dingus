// Tests for the engine of dingus.voltagesModulatorTrig outside Max: the gen~ code of the patch runs as
// JavaScript (History = state that stays, the rest per sample) on a hand-made table.
// This checks the logic, not that gen~ compiles it.
// Run: node tests/voltagestrig.engine.test.mjs
import { readFileSync } from "node:fs";
import { fileURLToPath } from "node:url";
import assert from "node:assert/strict";

function genCode() {
	if (process.env.VT_GEN) return readFileSync(process.env.VT_GEN, "utf8");
	const d = JSON.parse(readFileSync(fileURLToPath(new URL("../patchers/dingus.voltagesModulatorTrig.maxpat", import.meta.url)), "utf8"));
	let code = null;
	(function walk(p) { for (const b of p.boxes) { if (b.box.maxclass === "codebox") code = b.box.code; if (b.box.patcher) walk(b.box.patcher); } })(d.patcher);
	return code;
}
const CODE = genCode();
assert.ok(CODE && CODE.includes("trigger clock"), "the patch has the trigger engine");

// table: bank b, steps n, range lo..hi, values per step; skip and rest 1 (always)
function make(params = {}, banks = [{ n: 5, lo: 0, hi: 4, v: [0.1, 0.2, 0.3, 0.4, 0.5] }]) {
	const tab = new Map();
	banks.forEach((b, k) => {
		tab.set(`${128 + k}:0`, b.n); tab.set(`${128 + k}:1`, b.lo); tab.set(`${128 + k}:2`, b.hi);
		b.v.forEach((v, s) => { tab.set(`${k * 64 + s}:0`, v); tab.set(`${k * 64 + s}:1`, 1); tab.set(`${k * 64 + s}:2`, 1); });
	});
	let src = CODE.replace(/\/\/.*$/gm, "");
	const S = {};
	for (const m of src.matchAll(/^History (\w+)\(([^)]*)\);/gm)) S[m[1]] = +m[2];
	const P = { dir: 0, play: 1, run: 1, pendbank: -1, swapnow: 0, div: 1, ...params };
	src = src.replace(/^(History|Param|Buffer) .*$/gm, "");
	const fn = new Function("S", "P", "in1", "in2", "peek", "noise", "clamp", "min", "max", "floor", "samplerate", "vb",
		`with(P){with(S){ ${src}; return [out1,out2,out3,out4,out5]; }}`);
	const peek = (b, f, c) => tab.get(f + ":" + c) ?? 0;
	let sv = 1;
	const noise = () => { sv = (sv * 48271) % 2147483647; return sv / 2147483647 * 2 - 1; };
	const tick = (x, rs = 0) => fn(S, P, x, rs, peek, noise, (x, a, b) => Math.min(Math.max(x, a), b), Math.min, Math.max, Math.floor, 1000, "vb");
	return { S, P, tick };
}
// k gates of 'on' samples high, 'off' low (gate level lv); returns the step and value after each gate, and
// how many samples had out5 = 1
function gates(e, k, { on = 10, off = 10, lv = 0.3 } = {}) {
	const st = [];
	let pulses = 0;
	for (let g = 0; g < k; g++) {
		let r;
		for (let i = 0; i < on; i++) { r = e.tick(lv); pulses += r[4]; }
		for (let i = 0; i < off; i++) { r = e.tick(0); pulses += r[4]; }
		st.push(r[1]);
	}
	return { st, pulses };
}

{
	const e = make();
	const { st, pulses } = gates(e, 7);
	assert.deepEqual(st, [0, 1, 2, 3, 4, 0, 1], "one step per rising edge, round the loop");
	assert.equal(pulses, 7, "a one-sample pulse per step");
	assert.equal(+e.tick(0)[0].toFixed(2), 0.2, "the value of step 2 holds");
}
{
	const e = make();
	for (let i = 0; i < 200; i++) e.tick(0.8);
	assert.equal(e.tick(0.8)[1], 0, "a held gate is one step, however long");
}
{
	const e = make({ div: 3 });
	const { st, pulses } = gates(e, 7);
	assert.deepEqual(st, [0, 0, 0, 1, 1, 1, 2], "div 3: a step on edges 1, 4, 7");
	assert.equal(pulses, 3, "pulses only for the steps");
}
{
	const e = make({ div: 2 });
	gates(e, 3);                         // steps 0, 1 (edges 1 and 3)
	e.tick(0, 1);                        // step reset: the next edge is step 0 again
	assert.deepEqual(gates(e, 3).st, [0, 0, 1], "a reset restarts the step and the edge count");
}
{
	const e = make({ dir: 1 });
	assert.deepEqual(gates(e, 6).st, [4, 3, 2, 1, 0, 4], "backwards");
}
{
	// a waiting sequence (bank 1) takes over when the loop goes round: after 5 steps of bank 0
	const e = make({}, [{ n: 5, lo: 0, hi: 4, v: [0.1, 0.2, 0.3, 0.4, 0.5] }, { n: 3, lo: 0, hi: 2, v: [0.7, 0.8, 0.9] }]);
	gates(e, 2);
	e.P.pendbank = 1;
	const out = [];
	for (let g = 0; g < 6; g++) { gates(e, 1); const r = e.tick(0); out.push(r[2] + ":" + r[1]); }
	assert.deepEqual(out, ["0:2", "0:3", "0:4", "1:0", "1:1", "1:2"], "bank 1 from its first step at the wrap");
}
{
	// no triggers for 2 s: a waiting sequence takes over at once
	const e = make({}, [{ n: 5, lo: 0, hi: 4, v: [0.1, 0.2, 0.3, 0.4, 0.5] }, { n: 3, lo: 0, hi: 2, v: [0.7, 0.8, 0.9] }]);
	gates(e, 2);
	e.P.pendbank = 1;
	let r;
	for (let i = 0; i < 2100; i++) r = e.tick(0);
	assert.equal(r[2], 1, "swapped while the clock stands");
	assert.deepEqual(gates(e, 1).st, [0], "and it starts at its first step");
}
{
	const e = make({ play: 0 });
	assert.equal(gates(e, 3).pulses, 0, "paused: no steps");
}

console.log("voltagestrig.engine: all tests passed");
