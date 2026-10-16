// dingus.paths.js  (CommonJS module for v8 scripts)
//
// Where dingus scripts keep their JSON files (presets, sequences, libraries):
//   ~/Dropbox/_maxPresets/            if that folder exists
//   ~/Documents/Max 9/_maxPresets/    otherwise (create it yourself: Max can't create folders)
// Add the folder to Max's search path too, so pattrstorage's autorestore finds the files.
//
//   const paths = require("dingus.paths.js");
//   const folder = paths.presetFolder(this.patcher);   // "" when neither folder exists
//
// The home folder is taken from the patcher's file path (/Users/<name>/), so the patcher must be
// saved (a bpatcher always is). macOS only for now.

const CANDIDATES = ["Dropbox/_maxPresets/", "Documents/Max 9/_maxPresets/"];

let cached = null;
let warned = false;

function homeOf(patcher) {
	let p = patcher;
	// walk up to the first patcher that has a file (an embedded subpatcher has none)
	for (let i = 0; p && i < 32; i++) {
		let fp = "";
		try {
			fp = String(p.filepath || "");
		} catch (e) {}
		const m = /\/Users\/[^\/]+\//.exec(fp);
		if (m) return m[0];
		try {
			p = p.parentpatcher;
		} catch (e) {
			p = null;
		}
	}
	return "";
}

// true if folder `path` (with a trailing slash) exists: look for it in its parent's listing
function folderExists(path) {
	const trimmed = path.replace(/\/+$/, "");
	const cut = trimmed.lastIndexOf("/");
	if (cut <= 0) return false;
	const name = trimmed.slice(cut + 1);
	let found = false;
	try {
		const fo = new Folder(trimmed.slice(0, cut));
		fo.typelist = ["fold"];
		while (!fo.end) {
			if (fo.filename === name) {
				found = true;
				break;
			}
			fo.next();
		}
		fo.close();
	} catch (e) {}
	return found;
}

function presetFolder(patcher) {
	if (cached) return cached;
	const home = homeOf(patcher);
	if (home) {
		for (const c of CANDIDATES) {
			if (folderExists(home + c)) {
				cached = home + c;
				return cached;
			}
		}
	}
	if (!warned) {
		warned = true;
		post("dingus: no presets folder; create ~/Dropbox/_maxPresets or ~/Documents/Max 9/_maxPresets\n");
	}
	return "";
}

module.exports = { presetFolder: presetFolder, folderExists: folderExists, homeOf: homeOf };
