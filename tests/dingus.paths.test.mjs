// Tests for dingus.paths.js outside Max: a stand-in Folder lists a fake file system.
// Run: node tests/dingus.paths.test.mjs
import { readFileSync } from "node:fs";
import { fileURLToPath } from "node:url";
import vm from "node:vm";
import assert from "node:assert/strict";

const SRC = readFileSync(fileURLToPath(new URL("../javascript/dingus.paths.js", import.meta.url)), "utf8");

function load(folders) {
	const posts = [];
	class Folder {
		constructor(p) {
			this.list = folders.filter((f) => f.slice(0, f.lastIndexOf("/")) === p).map((f) => f.slice(f.lastIndexOf("/") + 1));
			this.i = 0;
		}
		get end() {
			return this.i >= this.list.length;
		}
		get filename() {
			return this.list[this.i];
		}
		next() {
			this.i++;
		}
		close() {}
	}
	const module = { exports: {} };
	const ctx = { module, exports: module.exports, Folder, post: (s) => posts.push(s) };
	vm.createContext(ctx);
	vm.runInContext(SRC, ctx);
	return { m: module.exports, posts };
}

const patcher = (fp, parent) => ({ filepath: fp, parentpatcher: parent });
const top = patcher("/Users/someone/Music/studio.maxpat", null);
const inner = patcher("", top); // embedded subpatcher: no file of its own

// Dropbox folder first
{
	const { m } = load(["/Users/someone/Dropbox/_maxPresets", "/Users/someone/Documents/Max 9/_maxPresets"]);
	assert.equal(m.presetFolder(inner), "/Users/someone/Dropbox/_maxPresets/");
}
// else the Max folder
{
	const { m } = load(["/Users/someone/Documents/Max 9/_maxPresets"]);
	assert.equal(m.presetFolder(top), "/Users/someone/Documents/Max 9/_maxPresets/");
}
// neither: "" and one Console line
{
	const { m, posts } = load([]);
	assert.equal(m.presetFolder(top), "");
	assert.equal(m.presetFolder(top), "");
	assert.equal(posts.length, 1);
}
// no saved patcher: no home folder
{
	const { m } = load(["/Users/someone/Dropbox/_maxPresets"]);
	assert.equal(m.presetFolder(patcher("", null)), "");
}
console.log("dingus.paths: all tests passed");
