// dingus.envNext.js  (v8)
// Gate-off for a [function] envelope: outputs "next" only if the function
// has a sustain point. Without one, function treats "next" like "bang" and
// would play the envelope a second time.
// [v8 dingus.envNext.js <function scripting name>]   default name: function
// bang: check and maybe output "next"

inlets = 1;
outlets = 1;

function hasSustain() {
	var name = jsarguments.length > 1 ? String(jsarguments[1]) : "function";
	var fn = this.patcher.getnamed(name);
	if (!fn) return false;
	// value: domain rangemin rangemax, then per point: x y flags curve, then "curve"
	var v = fn.getvalueof();
	for (var i = 3; i + 2 < v.length; i += 4) {
		if (typeof v[i + 2] === "number" && (v[i + 2] & 2)) return true;
	}
	return false;
}
hasSustain.local = 1;

function bang() {
	if (hasSustain()) outlet(0, "next");
}
