// dingus.studioPresets.js  (v8)
// Preset file named after the patch, for the studio patch's pattrstorage, in the dingus presets
// folder (see dingus.paths.js: ~/Dropbox/_maxPresets/ here).
// [v8 dingus.studioPresets.js <fallback name>]
//   file:     <folder>/<patch file name without .maxpat>.json
//   readpresets: reads the patch's own file; if it doesn't exist yet,
//             reads <folder>/<fallback name>.json (e.g. the template's presets)
//   (an older first argument with a folder path is ignored: the folder comes from dingus.paths.js)
//   save:     writes the patch's own file (call it on every store);
//             the name is taken at save time, so Save As starts a new file
//   path:     outputs "path <file>" (for checking)
// connect the outlet to the pattrstorage, and the pattrstorage's outlet back to this inlet:
// before writing, it asks the pattrstorage for its slot list and never writes an empty store
// over the file (an empty or unlinked pattrstorage would otherwise wipe the presets).

inlets = 1;
outlets = 1;

const paths = require("dingus.paths.js");

function folder() {
	return paths.presetFolder(this.patcher);
}
folder.local = 1;

// the fallback name: the last argument that isn't a folder path
function fallbackName() {
	for (var i = jsarguments.length - 1; i >= 1; i--) {
		var a = String(jsarguments[i]);
		if (a.indexOf("/") < 0) return a;
	}
	return "";
}
fallbackName.local = 1;

// patch file name without extension, or "" if the patch was never saved
function patchName() {
	var p = this.patcher;
	while (p.parentpatcher) p = p.parentpatcher;
	var fp = p.filepath;
	if (!fp) return "";
	var base = fp.substring(fp.lastIndexOf("/") + 1);
	var dot = base.lastIndexOf(".");
	return dot > 0 ? base.substring(0, dot) : base;
}
patchName.local = 1;

function filePath() {
	var n = patchName();
	var f = folder();
	return n && f ? f + n + ".json" : "";
}
filePath.local = 1;

// true if the file exists: try opening it; fall back to a folder listing
function exists(p) {
	try {
		var f = new File(p, "read");
		var ok = f.isopen;
		f.close();
		if (ok) return true;
	} catch (e) {}
	try {
		var cut = p.lastIndexOf("/");
		var fo = new Folder(p.substring(0, cut));
		var name = p.substring(cut + 1);
		var found = false;
		while (!fo.end) {
			if (fo.filename === name) { found = true; break; }
			fo.next();
		}
		fo.close();
		return found;
	} catch (e2) {}
	return false;
}
exists.local = 1;

function readpresets() {
	var p = filePath();
	if (p && exists(p)) {
		outlet(0, "read", p);
		post("dingus.studioPresets: read " + p + "\n");
		return;
	}
	var fbn = fallbackName();
	var fb = fbn && folder() ? folder() + fbn + ".json" : "";
	if (fb && exists(fb)) {
		outlet(0, "read", fb);
		post("dingus.studioPresets: no presets for this patch yet, read " + fb + " (first store creates " + (p || "<save the patch first>") + ")\n");
		return;
	}
	post("dingus.studioPresets: nothing to read (looked for " + (p || "<unsaved patch>") + (fb ? " and " + fb : "") + ")\n");
}

var pendingSave = false;

function save() {
	if (!filePath()) {
		post("dingus.studioPresets: save the patch first, presets not written\n");
		return;
	}
	pendingSave = true;
	outlet(0, "getslotlist");   // answer arrives as "slotlist ..." from the pattrstorage
}

function anything() {
	if (messagename !== "slotlist" || !pendingSave) return;
	pendingSave = false;
	var p = filePath();
	if (arguments.length === 0) {
		post("dingus.studioPresets: no presets stored, " + p + " not written\n");
		return;
	}
	outlet(0, "write", p);
}

function path() {
	outlet(0, "path", filePath());
}
