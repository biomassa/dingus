// dingus.presetFile.js  (v8)
// Per-instance preset file for a pattrstorage inside a bpatcher, in the dingus presets folder
// (see dingus.paths.js: ~/Dropbox/_maxPresets/ here).
// [v8 dingus.presetFile.js <prefix> #1]  ->  <folder>/<prefix>_<#1>.json
// [v8 dingus.presetFile.js <name>]       ->  <folder>/<name>.json
//   readpresets : outputs "read <path>" if the file exists (no dialog for new instances)
//                 ("load" never reaches a js function, hence the name)
//   save : outputs "write <path>" (only if the pattrstorage holds presets)
//   lastslot n : outputs "recall n" if this instance has a preset file (last-state restore)
//   path : outputs "path <path>" (for checking)

inlets = 1;
outlets = 1;

const paths = require("dingus.paths.js");

function filePath() {
	const folder = paths.presetFolder(this.patcher);
	if (!folder) return "";
	const prefix = jsarguments.length > 1 ? String(jsarguments[1]) : "presets";
	// [... NAME] -> NAME.json ; [... NAME #1] -> NAME_<#1>.json
	if (jsarguments.length < 3) return folder + prefix + ".json";
	return folder + prefix + "_" + String(jsarguments[2]) + ".json";
}
filePath.local = 1;

// true if the file exists: try opening it; fall back to a folder listing
function exists(p) {
	if (!p) return false;
	try {
		const f = new File(p, "read");
		const ok = f.isopen;
		f.close();
		if (ok) return true;
	} catch (e) {}
	try {
		const cut = p.lastIndexOf("/");
		const fo = new Folder(p.substring(0, cut));
		const name = p.substring(cut + 1);
		let found = false;
		while (!fo.end) {
			if (fo.filename === name) {
				found = true;
				break;
			}
			fo.next();
		}
		fo.close();
		return found;
	} catch (e2) {}
	return false;
}
exists.local = 1;

function readpresets() {
	const p = filePath();
	if (exists(p)) outlet(0, "read", p);
}

// save: asks the pattrstorage for its slot list first (connect the pattrstorage's outlet
// back to this inlet) and never writes an empty store over the file
let pendingSave = false;

function save() {
	pendingSave = true;
	outlet(0, "getslotlist");
}

function anything() {
	if (messagename !== "slotlist" || !pendingSave) return;
	pendingSave = false;
	const p = filePath();
	if (!p) return;
	if (arguments.length === 0) {
		post("dingus.presetFile: no presets stored, " + p + " not written\n");
		return;
	}
	outlet(0, "write", p);
}

// recall slot n if this instance has a preset file
// (a missing slot is simply ignored by pattrstorage)
function lastslot(n) {
	if (exists(filePath())) outlet(0, "recall", n);
}

function path() {
	outlet(0, "path", filePath());
}
