# dingus

bpatchers for a modular studio in Max 9: sequencers, modulators, clocks, plug-in hosts, a mixer, ES-8 and controller I/O. A Max package: put the folder in `~/Documents/Max 9/Packages/` and restart Max.

Every file starts with `dingus.`. Add a bpatcher with `[bpatcher dingus.<name>.maxpat @args <instance name>]`.

## Presets and other JSON

Scripts keep their JSON files (pattrstorage presets, sequences, libraries) in one folder:

- `~/Dropbox/_maxPresets/` if it exists,
- else `~/Documents/Max 9/_maxPresets/`.

Max can't create folders: create one of them, and add it to Max's search path (Options > File Preferences) so pattrstorage's autorestore finds the files. File names: `<prefix>_<instance name>.json` (for example `uPG_lead.json`). `javascript/dingus.paths.js` finds the folder; v8 scripts load it with `require("dingus.paths.js")`.

## Contents

| bpatcher | what it does | presets file |
|---|---|---|
| `dingus.pitchGateSeq` | monophonic pitch/gate piano-roll sequencer: microtonal rows from a Scala tuning, per-note lanes (velocity, glide, ratchets, fade, duty), chance lanes, beats per step, play range | `uPG_<name>.json` |
| `dingus.pitchSeq` | step pitch sequencer for Scala tunings: pitch grid, per-step delays, tuning slider | `uPITCH_<name>.json` |
| `dingus.voltagesModulator` | stepped voltage modulator | `uVOLT_<name>.json` |
| `dingus.pluginStereo` | stereo plug-in host (`vst~`) with 3 parameter inputs (0..1) | (studio patch) |
| `dingus.plugin16in` | stereo plug-in host with 16 parameter inputs (0..1) | (studio patch) |
| `dingus.pluginSideChain` | stereo plug-in host with a stereo sidechain input (`mcs.vst~ 4 2`) and 3 parameter inputs | (studio patch) |
| `dingus.pluginGRM` | GRM Tools Atelier (VST3) with 16 parameter inputs (0..1) | (studio patch) |
| `dingus.pluginGRM32` | GRM Tools Atelier (VST3) with 32 parameter inputs (0..1) | (studio patch) |
| `dingus.gatesSeq` | gate sequencer: gates on steps, spanning steps, length of the last step, per-gate lanes | `uGATE_<name>.json` |

Scripts (`javascript/`):

| script | used by |
|---|---|
| `dingus.paths.js` | presets folder (CommonJS module) |
| `dingus.presetFile.js` | per-instance preset file for a pattrstorage |
| `dingus.envNext.js` | gate-off for a `function` envelope, only when it has a sustain point |
| `dingus.pgRoll.js` | the roll of `dingus.pitchGateSeq` (v8ui) |
| `dingus.gateRoll.js` | the roll of `dingus.gatesSeq` (v8ui) |
| `dingus.pitchGrid.js` | the pitch grid of `dingus.pitchSeq` (jsui) |
| `dingus.pitchTiming.js` | per-step pitch delays and deleted steps for `dingus.pitchSeq` (v8) |
| `dingus.tuningSlider.js` | key slider for Scala tunings in `dingus.pitchSeq`; Timo Hoogland's sslider.js (MIT) |

Abstractions (`patchers/abstractions/`):

| abstraction | used by |
|---|---|
| `dingus.sequencedata~` | `dingus.pitchSeq`, `dingus.voltagesModulator`: a fixed copy of Data Knot's `dk.sequencedata~` (Rodrigo Constanzo, BSD 3-Clause) |

## Dependencies

Install these alongside dingus:

| package | needed by | source |
|---|---|---|
| th.scala (Timo Hoogland, MIT) | `dingus.pitchGateSeq`, `dingus.pitchSeq` (tunings) | github.com/tmhglnd/th.scala |
| Data Knot (Rodrigo Constanzo, BSD 3-Clause) | `dingus.sequencedata~` (`isThisAValidBuffer.js`) | Max Package Manager, rodrigoconstanzo.com/data-knot |

## Credits

- `dingus.sequencedata~` is a modified copy of `dk.sequencedata~` from Data Knot, Copyright (c) 2025 Rodrigo Constanzo, BSD 3-Clause License.
- `dingus.tuningSlider.js` is `sslider.js` by Timo Hoogland (2021), MIT License.

## Layout

`patchers/` bpatchers and abstractions, `javascript/` scripts, `code/` gen~ code, `help/` help patches, `extras/` and `snippets/` (planned: a browser of all bpatchers), `tests/` node tests, `docs/` specs.
