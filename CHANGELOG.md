# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [0.3.0] - 2026-10-18

### Added

- `dingus.gatesSeq`: a FADE lane for ratchets, as in `dingus.pitchGateSeq`. The value is -50 to 50 per gate. Below 0 the ratchet hits rise to VEL; above 0 they fall from VEL. The change is exponential. At +-50 the quietest hit is 1 % of VEL. FADE has an effect only with 2 or more ratchets. The GATE lane shows the hits at their faded heights.
- `dingus.gatesSeq` and `dingus.pitchGateSeq`: swing, 50 to 75 % (50 = straight, 66 = triplet feel, 75 = dotted). Every 2nd step comes later; each pair of steps keeps its length. Notes, gates, ratchets and delays follow the swing. An unpaired last step plays straight. Each sequence has its own swing, set in the `swing` box; it changes with the sequence at the phasor wrap.
- `dingus.pitchGateSeq`: a cell editor for the chance lanes. Click a cell (not on its op name) to open it. It has the op grid, sliders for PROB, amount and PTN, - and + buttons for single steps, and a clear button. Changes apply at once. A click outside the editor, or its x, closes it.

### Changed

- `dingus.gatesSeq`: the roll is one lane taller (424 px); the controls under it moved down. The stored gate list has a fade field (format -4; older lists load with fade 0). The buffer has 10 channels. The velocity outlet sends the velocity of the current ratchet hit.
- `dingus.pitchGateSeq`: the chance lanes are 48 px tall (were 32), with larger text. Cells 44 px and wider have zones: op name at the top (click = op menu), PROB bar in the middle, amount and PTN at the bottom; drag a zone up or down to change it. The modifier shortcuts stay.
- `dingus.pitchGateSeq`: the op menu has 6 labelled groups (PLAY, JUMP, VEL, LENGTH, RATCH, PITCH) and larger items.
- `dingus.pitchGateSeq`: every sequence has at least 3 chance lanes. Sequences with fewer get empty lanes. The roll is 622 px tall, so that 3 lanes and "+ CHANCE" are visible.
- `dingus.gatesSeq` and `dingus.pitchGateSeq`: the stored sequence lists have a swing field (format -6; older lists load with swing 50).

### Fixed

- `dingus.pitchGateSeq`: quick clicks in the cell editor (a double-click) no longer close it or clear the cell under it.

## [0.2.0] - 2026-10-17

### Added

- `dingus.pitchGateSeq`: 32 sequences. A sequence has its notes, lanes, chance lanes, play range and step count. The scale mask and the tuning are shared.
- `dingus.pitchGateSeq`: a `seq` box with − and + buttons, copy, paste and clear for the current sequence, and an inlet (at the far right) for the sequence number 1 to 32.
- `dingus.pitchGateSeq`: a sequence that you choose while the clock runs takes over at the phasor wrap, sample-exact. It starts at its first step, and the PTN counter starts again. When the clock stops for 0.1 s, or audio or play is off, the sequence changes at once.
- `dingus.pitchGateSeq`: all 32 sequences are in `uPGseq_<name>.json` in the presets folder. The first time, the notes of each slot in the presets file become a sequence (slot n = sequence n).
- `dingus.gatesSeq`: the same 32 sequences, with the same controls, inlet and switch at the phasor wrap. A sequence has its gates, skips, play range and step count. The file is `uGATEseq_<name>.json`. A `clear all` button with confirmation is added.
- `dingus.voltagesModulator`: the same 32 sequences, with the same controls and inlet. A sequence has its step count, voltages, rest and skip probabilities and play range. The file is `uVOLTseq_<name>.json`. The script `dingus.voltBank.js` keeps the sequences.
- `dingus.pitchSeq`: the same 32 sequences, with the same controls and inlet. A sequence has its step count, pitches, step delays, deleted steps, rest and skip probabilities and play range. The file is `uPITCHseq_<name>.json`. The script `dingus.pitchBank.js` keeps the sequences and writes the pitch table from the tuning.
- `dingus.pitchGrid.js`: a `setstate` message sets the pitches, delays and deleted steps without output.

### Changed

- `dingus.pitchGateSeq`: presets keep the sequence number and the scale mask, not the notes. The `steps` box and the `clear all` button are no longer in presets.
- `dingus.pitchGateSeq`: `clear all` empties all 32 sequences. It asks for confirmation first.
- `dingus.pitchGateSeq`: the gen~ engine has two banks of note and chance tables and a sixth outlet (the bank that plays). The buffers have their size in samples.
- `dingus.gatesSeq`: presets keep the sequence number, not the gates. The `steps` box is no longer in presets. The gen~ engine has two banks of gate tables and a fifth outlet (the bank that plays).
- `dingus.voltagesModulator`: a gen~ engine replaces `dingus.sequencedata~`. The switch to a new sequence is sample-exact. Skip: only steps in the play range can play, and their skip values are raised so the highest is 1. The first outlet still sends a message for each step.
- `dingus.voltagesModulator`: the isRunning inlet takes a toggle. 0 stops the sequence (the value holds). 1 starts it again from the first step.
- `dingus.voltagesModulator`: presets keep the sequence number, rate, direction and output, not the step content.
- `dingus.pitchSeq`: a gen~ engine replaces `dingus.sequencedata~` and `dingus.pitchTiming.js`. The step delays are sample-accurate. Skip uses the same clean rule as `dingus.voltagesModulator`. The first outlet is now the pitch signal (0 to 1.0494, through the output toggle); the second outlet still sends the frequency as a message.
- `dingus.pitchSeq`: the isRunning inlet takes a toggle. 0 stops the sequence (the pitch holds). 1 starts it again from the first step.
- `dingus.pitchSeq`: presets keep the sequence number and the settings (rate, direction, output, view, tuning), not the step content.
- `dingus.gatesSeq`: the roll is wider on the left, so it lines up with the envelope box under it.
- `dingus.voltagesModulator` and `dingus.pitchSeq`: the viewport has the earth colours of the other sequencers: voltages and pitches ochre, rest probability terracotta, skip probability sage, range sand. The other controls keep their colours.

### Fixed

- `dingus.voltagesModulator` and `dingus.pitchSeq`: the range slider marks step boundaries (0 to the step count), as `dingus.sequencedata~` read it. The sequence scripts read and set it that way: the scale is right again, and the end of the range is not one step too far.

### Removed

- `dingus.sequencedata~` and `dingus.pitchTiming.js`: no bpatcher uses them now.
- The dependencies on Data Knot and FluCoMa, and the Data Knot notice.

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

[unreleased]: https://github.com/biomassa/dingus/compare/v0.3.0...HEAD
[0.3.0]: https://github.com/biomassa/dingus/compare/v0.2.0...v0.3.0
[0.2.0]: https://github.com/biomassa/dingus/compare/v0.1.0...v0.2.0
[0.1.0]: https://github.com/biomassa/dingus/releases/tag/v0.1.0
