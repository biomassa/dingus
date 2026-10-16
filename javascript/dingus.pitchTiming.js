// dingus.pitchTiming.js  (v8)
// Sits between dingus.sequencedata~ and the pitch output of uPITCH.
// - delays each step's pitch by (delay of that step) x (measured step time)
// - drops the pitch of deleted steps, so the output keeps the previous pitch
//
// inlet 0: pitch value from dk.sequencedata (outlet 0)
//          "delays d1 d2 ..." / "offs o1 o2 ..." from dingus.pitchGrid (outlet 1)
// inlet 1: current step index from dk.sequencedata (outlet 1)
// outlet 0: pitch value, delayed / held

inlets = 2;
outlets = 1;

setinletassist(0, 'pitch value, delays ..., offs ...');
setinletassist(1, 'current step index');
setoutletassist(0, 'pitch value (delayed / held)');

var dels = [];
var offs = [];
var idx = 0;
var lastIdxTime = 0;
var interval = 0;          // ms between steps, measured
var incoming = null;       // value waiting for its step index
var pendingVal = null;     // delayed value waiting to go out

var procTask = new Task(process);
var outTask = new Task(fire);

function now() {
	return new Date().getTime();
}
now.local = 1;

// step index (right inlet)
function msg_int(v) {
	if (inlet === 1) {
		var t = now();
		if (lastIdxTime > 0) {
			var d = t - lastIdxTime;
			if (d > 0 && d < 10000) interval = d;
		}
		lastIdxTime = t;
		idx = v;
		return;
	}
	value(v);
}

function msg_float(v) {
	if (inlet === 1) {
		msg_int(Math.round(v));
		return;
	}
	value(v);
}

function list() {
	var a = arrayfromargs(arguments);
	if (!a.length) return;
	if (inlet === 1) msg_int(Math.round(a[0]));
	else value(a[0]);
}

// the step index and the value may arrive in either order: handle the value a tick later
function value(v) {
	incoming = v;
	procTask.schedule(0);
}
value.local = 1;

function process() {
	if (incoming === null) return;
	var v = incoming;
	incoming = null;
	if (offs[idx]) return;                       // deleted step: hold the previous pitch
	if (pendingVal !== null) {                   // a late previous note goes out first
		outTask.cancel();
		fire();
	}
	var d = (dels[idx] || 0) * interval;
	if (d < 1) {
		outlet(0, v);
		return;
	}
	pendingVal = v;
	outTask.schedule(d);
}
process.local = 1;

function fire() {
	if (pendingVal === null) return;
	var v = pendingVal;
	pendingVal = null;
	outlet(0, v);
}
fire.local = 1;

function delays() {
	dels = arrayfromargs(arguments);
}

// "offs ..." (a function called offs would clash with the variable)
function anything() {
	if (messagename === "offs") offs = arrayfromargs(arguments);
}
