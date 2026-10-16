# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [0.1.0] - 2026-10-17

First release. The bpatchers come from the earlier folder `mine/! bpatchers` and have new names.

### Added

- The Max package structure: `patchers/`, `patchers/abstractions/`, `javascript/`, `code/`, `help/`, `extras/`, `snippets/`, `tests/`, `docs/`, and `package-info.json`.
- Sequencers: `dingus.gestureLooper`, `dingus.pitchGateSeq`, `dingus.pitchSeq`, `dingus.gatesSeq`.
- Modulators: `dingus.voltagesModulator`, `dingus.lfoModulator`, `dingus.msegModulator`, `dingus.msegEnvelope`.
- Clocks: `dingus.masterClock`, `dingus.subClocker`.
- Plug-in hosts: `dingus.pluginStereo`, `dingus.plugin16in`, `dingus.pluginSideChain`, `dingus.pluginGRM`, `dingus.pluginGRM32`.
- Mixer and I/O: `dingus.mainMixer`, `dingus.mpe2cv`, `dingus.gwonzer`, `dingus.es8Main`, `dingus.es8Outs`, `dingus.es8UltraOuts`.
- Midi Fighter Twister banks: `dingus.fighterTwister` to `dingus.fighterTwister4`.
- Abstractions: `dingus.sequencedata~` (a corrected copy of `dk.sequencedata~` from Data Knot), `dingus.clockThePam`, `dingus.clockExternalMidiDevice`, `dingus.es8InputsCompensation`, `dingus.es8OutsCalibration`, `dingus.twisterLooper`, `dingus.twisterLooperBank2` to `dingus.twisterLooperBank5`, `dingus.updateKnobs`.
- `dingus.paths.js`: one rule for the presets folder (`~/Dropbox/_maxPresets/`, else `~/Documents/Max 9/_maxPresets/`).
- `dingus.studioPresets.js`: the presets file of the studio patch, with no folder path in the box.
- Help patch `help/dingus.gestureLooper.maxhelp`.
- Node tests for `dingus.paths.js`, `dingus.gestureLoop.js` and `dingus.gestureRoll.js`.
- The gesture looper specification `docs/gesture-looper.md`.
- README in Simplified Technical English, with dependencies and third-party notices.
- MIT License (`LICENSE`).

### Changed

- All file names start with `dingus.` and have no version numbers (for example `pitchGateSeqV1` is now `dingus.pitchGateSeq`).
- The scripts that ran in the legacy `js` object now run in `v8`: `dingus.presetFile.js`, `dingus.envNext.js`, `dingus.pitchTiming.js`, `dingus.studioPresets.js`.
- The gesture looper engine reads its sequences file 100 ms after it starts, because it finds the presets folder from its patcher.
- `dingus.fighterTwister4` uses its own looper, `dingus.twisterLooperBank4`. Before, it used the bank 2 looper.
- `dingus.pitchGateSeq`: the `beat` box divides each step into beats. The snap grid follows the beats. The snap menu is now an on/off toggle.

### Fixed

- `v8` read the `read <file>` notification from pattrstorage as a request to load a script. A `[routepass slotlist]` in front of the presets script now passes only the slot list.
- The abstraction name `clockExtermalMidiDevice` is now `dingus.clockExternalMidiDevice`.

[unreleased]: https://github.com/biomassa/dingus/compare/v0.1.0...HEAD
[0.1.0]: https://github.com/biomassa/dingus/releases/tag/v0.1.0
