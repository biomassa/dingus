# Gesture looper (draft spec, 2026-10-13)

A bpatcher that records polyphonic LinnStrument playing with all its MPE data, loops it in time with the
studio clock, shows it in a piano-roll v8ui, and lets you trim the loop and shift notes in time.
Max only (not for linnkit).

## Decided (user, 2026-10-13)

- **In line:** `[midiin "LinnStrument MIDI"]` → looper → note bpatcher. The looper passes every byte
  through at all times, stores notes while recording, and merges its playback into the same stream while
  playing. Playback goes through the note bpatcher's router, curves, shift and retune like live playing,
  so a later scale or curve change applies to the loop too. NRPN replies (lights polling) pass through
  (the router drops them) and are never recorded.
- **Note bpatchers:** their own `[midiin "LinnStrument MIDI"]` is replaced by an inlet (MIDI bytes in
  front of the router). They then always need a `midiin` (or the looper) outside. The lights' own
  `midiin` for NRPN replies stays. `linnSplit-b` first.
- **One looper for both splits:** records all channels; the router splits them.
- **Channels:** each played-back note gets a free channel of its side (left 2-8, right 9-15) that no live
  finger or other looped note is using; the looper sees the live channels itself. At most 7 notes per
  side, live and looped together; a looped note with no free channel is dropped.
- **Editing = time only:** notes move sideways (earlier/later) with all their MPE data; no transposing.
  Trimming: the loop range, and a note's start/end (its data is cut to the new length).
- **Looper/sequencer hybrid with several switchable sequences** (slots), each with its own events and
  length. Nothing exists until a recording starts. Inlets and buttons in the bpatcher: **rec, play,
  stop** (no overdub for now; may come later):
  - rec: records into the current sequence from now, replacing what it held (stops playback first).
  - stop: while recording = the recording ends and its length is set (stop minus rec, as played); while
    playing = playback stops (sounding notes get their note-off).
  - play: plays the current sequence from its beginning, at once, looping.
- **Clock:** the same phasor subsystem as the pitch/gate sequencers: clock phasor inlet → `rate~ @sync 1`
  (rate box + rate mod inlet) → engine; inlets for step reset, rate reset, play/pause.
- **Storage:** sequences in their own `.json` in the dingus presets folder (`~/Dropbox/_maxPresets/`,
  found by `dingus.paths.js`), written like `dingus.presetFile.js`.
- **Length as played** (not rounded). In the roll, the loop bounds can be set later, snapped to bar/beat
  marks or free, as the user wants.
- **Switching sequences while playing:** at the next loop start (for now).
- **Name:** `dingus.gestureLooper.maxpat` in the dingus package (`patchers/`), scripts in `javascript/`.
- **Live finger on a looped note's channel:** the looper re-maps the live note and its channel data to a
  free channel of its side (live data for a channel with no live note is held back while a looped note
  uses that channel and sent with the re-mapped note-on). With no free channel, the looped note on that
  channel is cut and the live note keeps it.
- **`linnSplit-b` is changed in place** (git keeps the old version). The only other patch with it,
  `linnLaptopOnly`, embeds its own old copy.
- **Bar marks:** a steps-per-bar box (default 4); a step is one cycle of the `rate~` output.

## Data

**All MPE data is recorded** (user, 2026-10-13): every channel-voice message on the per-note channels
(left 2-8, right 9-15), not only bend/pressure/Y: note-on with strike velocity, note-off with lift
velocity, pitch bend (14-bit), channel pressure, poly pressure, and every CC (Y = CC 74 on the
LinnStrument; others kept as they come). Messages on the main channels (1, 16), system and realtime
bytes, and NRPN exchanges (lights polling) are passed through but not recorded.

A note = channel (as played), pad note, strike velocity, lift velocity, start (steps, float), length
(steps), the values its channel had just before the note-on (the LinnStrument sends bend, Y and pressure
before the note-on), and its events as (time from note start, message). Events are recorded unquantized.
Size: a held finger sends a bend every 6-12 ms; 10 voices for 16 bars is still small.

## Engine (v8)

- Max runs all JavaScript at low priority (Max userguide, "JavaScript, Threading, and Priority"): MIDI
  into a v8 object is deferred. The note bpatchers already pass live MIDI through three v8 scripts
  (router, curves, retune), so the looper adds one more step on the same thread, no new kind of delay.
  Clock positions and MIDI bytes arrive in the order they were sent, so recorded timing keeps their
  order at about 1 ms resolution.
- Parsing: running status and realtime bytes in the middle of a message are handled; every message goes
  out with its status byte (playback is merged into the live stream).
- Position: `rate~` output → `snapshot~ 1` → v8 `pos <phase>`; v8 counts wraps (position in steps).
  Each `pos` plays the events between the last and the current position, across the loop end.
- Playback of a note: first its channel's values from before the note-on, then the note-on, then its
  events, all on the channel the looper picked for it (a free channel of its side; the played one if
  free).
- Note ends: fingers still held at stop end at the recording's length; a note crossing the loop end gets
  its note-off there; stop, a sequence switch, a step reset and a clock pause send note-offs for every
  looped note that is sounding.
- Output: live bytes plus playback, raw MIDI, to the note bpatcher's inlet.
- Files: written with `f.eof = f.position` after the write (a shorter rewrite must not keep the old tail).

## Roll (v8ui)

All dimensions of a note in one view (user agreed 2026-10-13):
- x = time (steps; step lines, stronger bar lines every steps-per-bar), y = pitch in pads.
- Each note is drawn as its pitch trace: it starts on its pad's row and follows the bend (in pads, from
  a bend-range setting, 48 by default like the LinnStrument setup), so slides and vibrato are visible as
  the line moves between rows.
- Line thickness = pressure over time; colour = Y over time (dark to bright along one hue per split:
  green left, blue right, like the panels).
- Strike velocity = size of the dot at the note's start; lift velocity = the tick at its end.
- Lanes under the roll for the selected notes: pressure, Y, bend (in pads), velocities; other CCs if a
  note has them.
- Playhead from `pos`; the loop range on top with draggable ends (snap to bar, step or free).
- Edits: click/drag selection (shift adds); drag a selection sideways = shift in time (snap to the grid,
  alt = free); drag a note's start or end = trim; delete. Grid snap menu like PGRoll.

## Built (2026-10-13) and findings in Max

- Files (dingus package since 2026-10-17): `patchers/dingus.gestureLooper.maxpat`, `javascript/dingus.gestureLoop.js`
  (engine), `javascript/dingus.gestureRoll.js` (roll), `javascript/dingus.gestureHead.js` (position strip); tests
  `tests/gesture-looper.test.mjs`, `gesture-roll.test.mjs`. `linnSplit-b`'s `midiin` became its MIDI inlet (index 0).
- `refresh` is a built-in v8ui message (redraw): a function of that name is never called. The roll's
  message is `loadseq`.
- A Dict can't hold arrays inside arrays: the engine publishes each message as `{t, m}`.
- Performance (Max's main thread, measured with `ps -M`): the roll repainting at 25-50 Hz cost about a
  quarter of a core even when drawn from a cached image (`MGraphics` + `Image`), and made every display in
  the studio patch stutter. Now: no playhead in the roll, no repaint during playback; a 1225 x 10 strip
  (`dingus.gestureHead.js`) shows the position. The clock is read with `snapshot~ 4` (events on a 4 ms
  grid); position updates at most every 40 ms. Playing: about 68% of a core in total (was 98%), smooth.
  Playback MIDI through `linnSplit-b` costs about 15-20% (router, curves, retune, curve-editor dots).
- Colours (earth palette): left split ochre, right split moss green, Y = lightness; outside the loop warm
  grey; cut notes charcoal; selection bone; strike dot bone, lift tick clay; strip orange (red while
  recording).
- View: the bar-number row (16 px) scrolls (drag sideways) and zooms (drag up/down, up to x64, around the
  grabbed point); double-click = whole sequence; a sand bar there shows the visible part; the label column
  says ALL or the zoom factor. No mouse wheel (no wheel event documented for v8ui).
- Playback probability per note (0-100 %, default 100), rolled on every pass; a losing note is silent with
  all its data. PROB lane: drag a bar (all selected notes when it is selected), double-click = 100 %; less
  likely notes are drawn fainter. Engine message `prob v id...`; stored with the note.
- Velocities editable in the VEL lane: drag a strike bar (note start, 1-127) or a lift bar (note end,
  0-127); all selected notes when the note is selected. Engine message `vel strike|lift v id...`.
- VEL and PROB bars at the same time (chords, or a lift where another note starts) are spread 5 px apart,
  lowest note first; drawing and grabbing use the same positions. Selecting notes in the roll limits the
  lanes to them.
- Editing: option-drag = copy (copies selected afterwards), cmd-drag = free move; delete = selected notes,
  clear = the whole sequence (no confirmation).

## Open points

1. Later: the inlet in `linnstrument-b`, `hybridSplit-b` (right side mono CV through `linn.cv`), `-es8`.
2. Later: overdub.

## Tests

Scripts: `javascript/dingus.gestureLoop.js` (engine, v8) and `dingus.gestureRoll.js` (v8ui). Node tests:
`node tests/gesture-looper.test.mjs`, `node tests/gesture-roll.test.mjs` (from the package folder). The engine
reads its file from a Task 100 ms after it starts (the presets folder is found from the patcher, which the global
code doesn't have yet); the test fires that task by hand.

Node tests for the engine (record, wrap, overdub, channel re-assignment, time shift and trim with the
curves) and for the roll's hit-testing, with stand-ins for Task/mgraphics as in the other tests.
