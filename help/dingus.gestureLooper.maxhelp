{
    "patcher": {
        "fileversion": 1,
        "appversion": {
            "major": 9,
            "minor": 2,
            "revision": 0,
            "architecture": "x64",
            "modernui": 1
        },
        "classnamespace": "box",
        "rect": [ 134.0, 92.0, 1640.0, 1170.0 ],
        "integercoordinates": 1,
        "boxes": [
            {
                "box": {
                    "fontsize": 24.0,
                    "id": "title",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 10.0, 400.0, 33.0 ],
                    "text": "dingus.gestureLooper"
                }
            },
            {
                "box": {
                    "fontsize": 15.0,
                    "id": "desc",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 48.0, 1400.0, 40.0 ],
                    "text": "MPE gesture looper / sequencer. Sits between the LinnStrument (or any MPE source) and a note bpatcher: every live event passes through, and recorded sequences play back on free channels. 32 sequences, a piano roll with all MPE data, overdub, undo, per-note probability, a phasor clock."
                }
            },
            {
                "box": {
                    "fontsize": 15.0,
                    "id": "argc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 96.0, 1455.0, 23.0 ],
                    "text": "argument = instance name: sequences are saved to <presets folder>/gestureLooper_<name>.json (here gestureLooper_help.json). The presets folder is ~/Dropbox/_maxPresets, else ~/Documents/Max 9/_maxPresets."
                }
            },
            {
                "box": {
                    "fontsize": 14.0,
                    "id": "l0",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 150.0, 138.0, 22.0 ],
                    "text": "MIDI bytes in"
                }
            },
            {
                "box": {
                    "fontsize": 14.0,
                    "id": "l1",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 161.0, 150.0, 229.0, 22.0 ],
                    "text": "clock phasor (one cycle = one step)"
                }
            },
            {
                "box": {
                    "fontsize": 14.0,
                    "id": "l2",
                    "linecount": 3,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 302.0, 191.0, 138.0, 53.0 ],
                    "text": "step reset: playback restarts at the loop start"
                }
            },
            {
                "box": {
                    "fontsize": 14.0,
                    "id": "l3",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 442.0, 150.0, 138.0, 22.0 ],
                    "text": "rate~ reset"
                }
            },
            {
                "box": {
                    "fontsize": 14.0,
                    "id": "l4",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 583.0, 150.0, 187.0, 22.0 ],
                    "text": "clock play / pause (starts on)"
                }
            },
            {
                "box": {
                    "fontsize": 14.0,
                    "id": "l5",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 724.0, 150.0, 227.0, 22.0 ],
                    "text": "rate mod (signal, added to the rate)"
                }
            },
            {
                "box": {
                    "fontsize": 14.0,
                    "id": "l6",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 865.0, 150.0, 138.0, 22.0 ],
                    "text": "rec (again = stop)"
                }
            },
            {
                "box": {
                    "fontsize": 14.0,
                    "id": "l7",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1006.0, 150.0, 138.0, 22.0 ],
                    "text": "play"
                }
            },
            {
                "box": {
                    "fontsize": 14.0,
                    "id": "l8",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1147.0, 150.0, 138.0, 22.0 ],
                    "text": "stop"
                }
            },
            {
                "box": {
                    "fontsize": 14.0,
                    "id": "l9",
                    "linecount": 3,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1287.0, 150.0, 138.0, 53.0 ],
                    "text": "sequence 1-32 (while playing: at the next loop start)"
                }
            },
            {
                "box": {
                    "fontsize": 14.0,
                    "id": "l10",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1428.0, 150.0, 138.0, 22.0 ],
                    "text": "overdub on / off"
                }
            },
            {
                "box": {
                    "fontsize": 14.0,
                    "id": "l11",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1569.0, 150.0, 138.0, 22.0 ],
                    "text": "undo"
                }
            },
            {
                "box": {
                    "id": "midiin",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "patching_rect": [ 20.0, 280.0, 160.0, 22.0 ],
                    "text": "midiin \"LinnStrument MIDI\""
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "rate",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 161.0, 250.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "phasor",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 161.0, 280.0, 70.0, 22.0 ],
                    "text": "phasor~ 2"
                }
            },
            {
                "box": {
                    "id": "dac",
                    "maxclass": "ezdac~",
                    "numinlets": 2,
                    "numoutlets": 0,
                    "patching_rect": [ 241.0, 240.0, 45.0, 45.0 ]
                }
            },
            {
                "box": {
                    "id": "sreset",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 302.0, 280.0, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "rreset",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 442.0, 280.0, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "clk",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 583.0, 280.0, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "modv",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 724.0, 250.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "sig",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 724.0, 280.0, 50.0, 22.0 ],
                    "text": "sig~ 0."
                }
            },
            {
                "box": {
                    "id": "rec",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 865.0, 280.0, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "play",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1006.0, 280.0, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "stop",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1147.0, 280.0, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "seq",
                    "maxclass": "number",
                    "maximum": 32,
                    "minimum": 1,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1287.0, 280.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "dub",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1428.0, 280.0, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "undo",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1569.0, 280.0, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "args": [ "help" ],
                    "bgmode": 0,
                    "border": 0,
                    "clickthrough": 0,
                    "enablehscroll": 0,
                    "enablevscroll": 0,
                    "id": "gl",
                    "lockeddragscroll": 0,
                    "lockedsize": 0,
                    "maxclass": "bpatcher",
                    "name": "dingus.gestureLooper.maxpat",
                    "numinlets": 12,
                    "numoutlets": 1,
                    "offset": [ 0.0, 0.0 ],
                    "outlettype": [ "" ],
                    "patching_rect": [ 20.0, 340.0, 1569.0, 564.0 ],
                    "varname": "gestureLooper",
                    "viewvisibility": 1
                }
            },
            {
                "box": {
                    "id": "mout",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 930.0, 60.0, 22.0 ],
                    "text": "midiout"
                }
            },
            {
                "box": {
                    "fontsize": 15.0,
                    "id": "outc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 90.0, 930.0, 1000.0, 23.0 ],
                    "text": "MIDI bytes out: to a note bpatcher's MIDI inlet (for example linnSplit-b, whose own midiin became an inlet), or to a synth"
                }
            },
            {
                "box": {
                    "fontsize": 18.0,
                    "id": "h1",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 980.0, 300.0, 27.0 ],
                    "text": "roll (mouse)"
                }
            },
            {
                "box": {
                    "fontsize": 15.0,
                    "id": "roll",
                    "linecount": 7,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 1012.0, 630.0, 124.0 ],
                    "text": "click a note = select (shift = add / remove), drag empty space = box select, click empty = clear\ndrag a selected note = shift the selection in time (grid; cmd = free), option-drag = copy it\ndrag a note's start or end = trim (grid; alt = free); double-click a note = delete it\nLOOP strip on top: drag an end, or the middle to move the loop (loop snap; alt = free)\nbar-number row: drag sideways = scroll, up / down = zoom, double-click = whole sequence\nlanes PRESS, Y, BEND: the selected notes (all notes, faint, when none is selected)\nVEL: drag the strike (start) or lift (end) bar; PROB: playback probability, double-click = 100%"
                }
            },
            {
                "box": {
                    "fontsize": 18.0,
                    "id": "h2",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 800.0, 980.0, 300.0, 27.0 ],
                    "text": "drawing"
                }
            },
            {
                "box": {
                    "fontsize": 15.0,
                    "id": "draw",
                    "linecount": 5,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 800.0, 1012.0, 557.0, 90.0 ],
                    "text": "each note is its pitch trace: it starts on its pad's row and follows the bend\nthickness = pressure, lightness = Y; left split ochre, right split moss green\ndot at the start = strike velocity, tick at the end = lift velocity\ngrey = outside the loop, charcoal = cut (no free channel)\nthe thin strip above the roll shows the position (red while recording or overdubbing)"
                }
            },
            {
                "box": {
                    "fontsize": 18.0,
                    "id": "h3",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 800.0, 1160.0, 300.0, 27.0 ],
                    "text": "buttons"
                }
            },
            {
                "box": {
                    "fontsize": 15.0,
                    "id": "btns",
                    "linecount": 3,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 800.0, 1192.0, 760.0, 57.0 ],
                    "text": "rec / play / dub light up while active; stop; seq box with - and +; copy / paste a whole sequence; del sel = delete the selected notes; clear = the whole sequence; undo\nrate, steps/bar, snap, loop snap, bend (pads per full bend, as on the LinnStrument)"
                }
            },
            {
                "box": {
                    "fontsize": 18.0,
                    "id": "h4",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 1215.0, 300.0, 27.0 ],
                    "text": "recording"
                }
            },
            {
                "box": {
                    "fontsize": 15.0,
                    "id": "recn",
                    "linecount": 3,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 1247.0, 760.0, 57.0 ],
                    "text": "The length is as played. A note joins the sequence at its note-off. Live notes always pass through; looped notes go out on free channels of their side (left 2-8, right 9-15), and a live finger on a looped note's channel is moved to another one."
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "gl", 4 ],
                    "source": [ "clk", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "gl", 10 ],
                    "source": [ "dub", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mout", 0 ],
                    "source": [ "gl", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "gl", 0 ],
                    "source": [ "midiin", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "sig", 0 ],
                    "source": [ "modv", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "gl", 1 ],
                    "source": [ "phasor", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "gl", 7 ],
                    "source": [ "play", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "phasor", 0 ],
                    "source": [ "rate", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "gl", 6 ],
                    "source": [ "rec", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "gl", 3 ],
                    "source": [ "rreset", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "gl", 9 ],
                    "source": [ "seq", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "gl", 5 ],
                    "source": [ "sig", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "gl", 2 ],
                    "source": [ "sreset", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "gl", 8 ],
                    "source": [ "stop", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "gl", 11 ],
                    "source": [ "undo", 0 ]
                }
            }
        ],
        "parameters": {
            "gl::bars": [ "gl_barsteps", "gl_barsteps", 0 ],
            "gl::bend": [ "gl_bendrange", "gl_bendrange", 0 ],
            "gl::lsnap": [ "gl_loopsnap", "gl_loopsnap", 0 ],
            "gl::rate": [ "rate", "rate", 0 ],
            "gl::seqbox": [ "gl_seq", "gl_seq", 0 ],
            "gl::snapm": [ "gl_snap", "gl_snap", 0 ],
            "parameterbanks": {
                "0": {
                    "index": 0,
                    "name": "",
                    "parameters": [ "-", "-", "-", "-", "-", "-", "-", "-" ],
                    "buttons": [ "-", "-", "-", "-", "-", "-", "-", "-" ]
                }
            },
            "inherited_shortname": 1
        },
        "autosave": 0
    }
}