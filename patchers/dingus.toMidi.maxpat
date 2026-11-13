{
    "patcher": {
        "fileversion": 1,
        "appversion": {
            "major": 9,
            "minor": 2,
            "revision": 1,
            "architecture": "x64",
            "modernui": 1
        },
        "classnamespace": "box",
        "rect": [ 134.0, 164.0, 1900.0, 1000.0 ],
        "openinpresentation": 1,
        "default_fontsize": 16.0,
        "gridsize": [ 10.0, 10.0 ],
        "integercoordinates": 1,
        "boxes": [
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 20.0,
                    "id": "c_1",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 40.0, 10.0, 138.0, 29.0 ],
                    "text": "dingus.toMidi"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "c_2",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 40.0, 42.0, 1500.0, 24.0 ],
                    "text": "a pitch + gate pair (markovSeq, pitchGateSeq, pitchSeq) -> notes for vst~ or a MIDI synth, with microtonal pitch as MPE bends (retune) or for synths that load the scale.   USE [bpatcher dingus.toMidi.maxpat]"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 16.0,
                    "id": "c_3",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 40.0, 100.0, 72.0, 24.0 ],
                    "text": "INPUTS"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "c_4",
                    "linecount": 3,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 40.0, 126.0, 900.0, 60.0 ],
                    "text": "gen~ dingus.toMidiIn counts the gate's rises and falls at the sample and holds the velocity and pitch\nof each rise; every 2 ms they are read -> \"poll <rises> <falls> <vel> <pitch> <pitch now>\", so no note is\nmissed, even a trigger shorter than a signal vector (Max reads signals once per vector)",
                    "textcolor": [ 0.45, 0.45, 0.45, 1.0 ]
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "c_5",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 300.0, 210.0, 54.0, 24.0 ],
                    "text": "gate"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "c_6",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 620.0, 210.0, 63.0, 24.0 ],
                    "text": "pitch"
                }
            },
            {
                "box": {
                    "comment": "gate (signal; level = velocity)",
                    "id": "in_7",
                    "index": 0,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 300.0, 236.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "comment": "pitch (signal; dingus pitch CV 0..1.0494 = MIDI 0..127, or MIDI with \"in midi\")",
                    "id": "in_8",
                    "index": 0,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 620.0, 236.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "gen_9",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 4,
                    "outlettype": [ "signal", "signal", "signal", "signal" ],
                    "patching_rect": [ 300.0, 306.0, 300.0, 26.0 ],
                    "text": "gen~ dingus.toMidiIn"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "loadbang_10",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 40.0, 366.0, 90.0, 26.0 ],
                    "text": "loadbang"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "metro_11",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 40.0, 416.0, 81.0, 26.0 ],
                    "text": "metro 2"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "c_12",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 130.0, 416.0, 140.0, 24.0 ],
                    "text": "read every 2 ms",
                    "textcolor": [ 0.45, 0.45, 0.45, 1.0 ]
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "t_13",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 5,
                    "outlettype": [ "bang", "bang", "bang", "bang", "bang" ],
                    "patching_rect": [ 40.0, 496.0, 180.0, 26.0 ],
                    "text": "t b b b b b"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "snapshot_14",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "patching_rect": [ 300.0, 556.0, 90.0, 26.0 ],
                    "text": "snapshot~"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "snapshot_15",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "patching_rect": [ 400.0, 556.0, 90.0, 26.0 ],
                    "text": "snapshot~"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "snapshot_16",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "patching_rect": [ 500.0, 556.0, 90.0, 26.0 ],
                    "text": "snapshot~"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "snapshot_17",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "patching_rect": [ 600.0, 556.0, 90.0, 26.0 ],
                    "text": "snapshot~"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "snapshot_18",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "patching_rect": [ 740.0, 556.0, 90.0, 26.0 ],
                    "text": "snapshot~"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "pack_19",
                    "maxclass": "newobj",
                    "numinlets": 5,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 300.0, 616.0, 520.0, 26.0 ],
                    "text": "pack 0. 0. 0. 0. 0."
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "prepend_20",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 300.0, 666.0, 126.0, 26.0 ],
                    "text": "prepend poll"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "r_21",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 840.0, 666.0, 117.0, 26.0 ],
                    "text": "r #0-tomidi"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "c_22",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 840.0, 636.0, 100.0, 24.0 ],
                    "text": "settings",
                    "textcolor": [ 0.45, 0.45, 0.45, 1.0 ]
                }
            },
            {
                "box": {
                    "filename": "dingus.toMidi.js",
                    "fontsize": 16.0,
                    "id": "v8_23",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 300.0, 750.0, 220.0, 26.0 ],
                    "saved_object_attributes": {
                        "embed": 0,
                        "parameter_enable": 0
                    },
                    "text": "v8 dingus.toMidi.js",
                    "textfile": {
                        "filename": "dingus.toMidi.js",
                        "flags": 0,
                        "embed": 0,
                        "autowatch": 1
                    }
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "c_24",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 540.0, 750.0, 500.0, 42.0 ],
                    "text": "CONVERTER: retune / scale / detune,\nMPE channels or one channel",
                    "textcolor": [ 0.45, 0.45, 0.45, 1.0 ]
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "iter_25",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 480.0, 810.0, 54.0, 26.0 ],
                    "text": "iter"
                }
            },
            {
                "box": {
                    "comment": "to vst~ (midievent messages)",
                    "id": "out_26",
                    "index": 0,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 300.0, 870.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "comment": "raw MIDI bytes (to midiout; NEVER into vst~: a number there changes its preset)",
                    "id": "out_27",
                    "index": 0,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 480.0, 870.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "c_28",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 540.0, 862.0, 500.0, 42.0 ],
                    "text": "OUTPUTS:  left = to vst~ (midievent),\nright = raw MIDI bytes for [midiout] (never into vst~)"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 16.0,
                    "id": "c_29",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1100.0, 100.0, 300.0, 24.0 ],
                    "text": "SETTINGS (the panel)"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "c_30",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1100.0, 126.0, 760.0, 42.0 ],
                    "text": "defaults at load: retune, MPE on channels 2-16, bend range 48, glide on, pitch in as CV;\na preset of the parent patch overrides them",
                    "textcolor": [ 0.45, 0.45, 0.45, 1.0 ]
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "loadbang_31",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 1100.0, 190.0, 90.0, 26.0 ],
                    "text": "loadbang"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "umenu_32",
                    "items": [ "retune", ",", "scale", ",", "detune" ],
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 1100.0, 300.0, 100.0, 26.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 56.0, 30.0, 100.0, 26.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "retune", "scale", "detune" ],
                            "parameter_longname": "mode",
                            "parameter_mmax": 2,
                            "parameter_modmode": 0,
                            "parameter_shortname": "mode",
                            "parameter_type": 2
                        }
                    },
                    "varname": "mode"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "m_33",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1100.0, 240.0, 40.0, 26.0 ],
                    "text": "0"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "prepend_34",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1100.0, 360.0, 126.0, 26.0 ],
                    "text": "prepend mode"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "s_35",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1100.0, 420.0, 117.0, 26.0 ],
                    "text": "s #0-tomidi"
                }
            },
            {
                "box": {
                    "id": "toggle_36",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 1230.0, 300.0, 24.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 206.0, 31.0, 24.0, 24.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "off", "on" ],
                            "parameter_longname": "mpe",
                            "parameter_mmax": 1,
                            "parameter_modmode": 0,
                            "parameter_shortname": "mpe",
                            "parameter_type": 2
                        }
                    },
                    "varname": "mpe"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "m_37",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1230.0, 240.0, 40.0, 26.0 ],
                    "text": "1"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "m_38",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1230.0, 360.0, 72.0, 26.0 ],
                    "text": "mpe $1"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "s_39",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1230.0, 420.0, 117.0, 26.0 ],
                    "text": "s #0-tomidi"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "number_40",
                    "maxclass": "number",
                    "maximum": 16,
                    "minimum": 1,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 1360.0, 300.0, 50.0, 26.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 194.0, 60.0, 44.0, 26.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_invisible": 1,
                            "parameter_longname": "channel",
                            "parameter_mmax": 16.0,
                            "parameter_mmin": 1.0,
                            "parameter_modmode": 0,
                            "parameter_shortname": "channel",
                            "parameter_type": 3
                        }
                    },
                    "varname": "channel"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "m_41",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1360.0, 240.0, 40.0, 26.0 ],
                    "text": "1"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "m_42",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1360.0, 360.0, 108.0, 26.0 ],
                    "text": "channel $1"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "s_43",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1360.0, 420.0, 117.0, 26.0 ],
                    "text": "s #0-tomidi"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "number_44",
                    "maxclass": "number",
                    "maximum": 16,
                    "minimum": 1,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 1490.0, 300.0, 44.0, 26.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 70.0, 60.0, 40.0, 26.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_invisible": 1,
                            "parameter_longname": "mpefirst",
                            "parameter_mmax": 16.0,
                            "parameter_mmin": 1.0,
                            "parameter_modmode": 0,
                            "parameter_shortname": "mpefirst",
                            "parameter_type": 3
                        }
                    },
                    "triangle": 0,
                    "varname": "mpefirst"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "number_45",
                    "maxclass": "number",
                    "maximum": 16,
                    "minimum": 1,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 1540.0, 300.0, 44.0, 26.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 114.0, 60.0, 40.0, 26.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_invisible": 1,
                            "parameter_longname": "mpelast",
                            "parameter_mmax": 16.0,
                            "parameter_mmin": 1.0,
                            "parameter_modmode": 0,
                            "parameter_shortname": "mpelast",
                            "parameter_type": 3
                        }
                    },
                    "triangle": 0,
                    "varname": "mpelast"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "m_46",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1490.0, 240.0, 40.0, 26.0 ],
                    "text": "2"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "m_47",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1540.0, 240.0, 40.0, 26.0 ],
                    "text": "16"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "pak_48",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1490.0, 360.0, 94.0, 26.0 ],
                    "text": "pak 2 16"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "prepend_49",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1490.0, 420.0, 162.0, 26.0 ],
                    "text": "prepend channels"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "s_50",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1490.0, 470.0, 117.0, 26.0 ],
                    "text": "s #0-tomidi"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "number_51",
                    "maxclass": "number",
                    "maximum": 96,
                    "minimum": 1,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 1690.0, 300.0, 56.0, 26.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 50.0, 90.0, 50.0, 26.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_invisible": 1,
                            "parameter_longname": "synthbend",
                            "parameter_mmax": 96.0,
                            "parameter_mmin": 1.0,
                            "parameter_modmode": 0,
                            "parameter_shortname": "synthbend",
                            "parameter_type": 3
                        }
                    },
                    "varname": "synthbend"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "m_52",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1690.0, 240.0, 40.0, 26.0 ],
                    "text": "48"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "m_53",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1690.0, 360.0, 126.0, 26.0 ],
                    "text": "synthbend $1"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "s_54",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1690.0, 420.0, 117.0, 26.0 ],
                    "text": "s #0-tomidi"
                }
            },
            {
                "box": {
                    "id": "toggle_55",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 1830.0, 300.0, 24.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 156.0, 92.0, 24.0, 24.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "off", "on" ],
                            "parameter_longname": "glide",
                            "parameter_mmax": 1,
                            "parameter_modmode": 0,
                            "parameter_shortname": "glide",
                            "parameter_type": 2
                        }
                    },
                    "varname": "glide"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "m_56",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1830.0, 240.0, 40.0, 26.0 ],
                    "text": "1"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "m_57",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1830.0, 360.0, 90.0, 26.0 ],
                    "text": "glide $1"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "s_58",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1830.0, 420.0, 117.0, 26.0 ],
                    "text": "s #0-tomidi"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "umenu_59",
                    "items": [ "cv", ",", "midi" ],
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 1960.0, 300.0, 70.0, 26.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 210.0, 90.0, 47.0, 26.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "cv", "midi" ],
                            "parameter_longname": "pitchin",
                            "parameter_mmax": 1,
                            "parameter_modmode": 0,
                            "parameter_shortname": "pitchin",
                            "parameter_type": 2
                        }
                    },
                    "varname": "pitchin"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "m_60",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1960.0, 240.0, 40.0, 26.0 ],
                    "text": "0"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "prepend_61",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1960.0, 360.0, 153.0, 26.0 ],
                    "text": "prepend pitchin"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "s_62",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1960.0, 420.0, 117.0, 26.0 ],
                    "text": "s #0-tomidi"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "c_63",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1100.0, 540.0, 860.0, 24.0 ],
                    "text": "TUNING: the same scales as the sequencers; pick the one the sequencer uses (for scale mode)",
                    "textcolor": [ 0.45, 0.45, 0.45, 1.0 ]
                }
            },
            {
                "box": {
                    "autopopulate": 1,
                    "fontsize": 16.0,
                    "id": "umenu_64",
                    "items": [ "09-22.scl", ",", "12-edo.scl", ",", "12edo.scl", ",", "22edo.scl", ",", "31-edo.scl", ",", "31edo-linnstrument.scl", ",", "31edo.scl", ",", "53edo.scl", ",", "ji_11.scl", ",", "ji_13.scl", ",", "ji_17.scl", ",", "ji_7.scl", ",", "ji_7a.scl", ",", "ji_8coh.scl", ",", "ji_9.scl", ",", "ji_9coh.scl", ",", "partch-grm.scl", ",", "partch_43.scl" ],
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1100.0, 580.0, 220.0, 26.0 ],
                    "pattrmode": 1,
                    "prefix": "~/Dropbox/musicstuff/Max 9/Library/th.scala/scl/",
                    "prefix_mode": 2,
                    "presentation": 1,
                    "presentation_rect": [ 58.0, 162.0, 199.0, 26.0 ],
                    "varname": "tuningmenu"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "m_65",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1100.0, 700.0, 81.0, 26.0 ],
                    "text": "load $1"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "thscala_66",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 1100.0, 760.0, 360.0, 26.0 ],
                    "text": "th.scala #0_tomidi @tune 440 @center 69"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "s_67",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1100.0, 820.0, 117.0, 26.0 ],
                    "text": "s #0-tomidi"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "textbutton_68",
                    "maxclass": "textbutton",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1700.0, 580.0, 63.0, 26.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 169.0, 2.0, 60.0, 24.0 ],
                    "text": "panic"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "m_69",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1700.0, 640.0, 63.0, 26.0 ],
                    "text": "panic"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "s_70",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1700.0, 700.0, 117.0, 26.0 ],
                    "text": "s #0-tomidi"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "c_71",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1780.0, 580.0, 320.0, 24.0 ],
                    "text": "panic: all notes off, bends centred",
                    "textcolor": [ 0.45, 0.45, 0.45, 1.0 ]
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "autopattr_72",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 4,
                    "outlettype": [ "", "", "", "" ],
                    "patching_rect": [ 1100.0, 880.0, 234.0, 26.0 ],
                    "restore": {
                        "channel": [ 1 ],
                        "glide": [ 1 ],
                        "mode": [ 0 ],
                        "mpe": [ 1 ],
                        "mpefirst": [ 2 ],
                        "mpelast": [ 16 ],
                        "pitchin": [ 0 ],
                        "synthbend": [ 48 ],
                        "tuningmenu": [ "09-22.scl" ]
                    },
                    "restore_extra": {
                        "channel": {
                            "id": "number_40"
                        },
                        "glide": {
                            "id": "toggle_55"
                        },
                        "mode": {
                            "id": "umenu_32"
                        },
                        "mpe": {
                            "id": "toggle_36"
                        },
                        "mpefirst": {
                            "id": "number_44"
                        },
                        "mpelast": {
                            "id": "number_45"
                        },
                        "pitchin": {
                            "id": "umenu_59"
                        },
                        "synthbend": {
                            "id": "number_51"
                        },
                        "tuningmenu": {
                            "id": "umenu_64"
                        }
                    },
                    "text": "autopattr @autorestore 0",
                    "varname": "u_tomidi_autopattr"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "c_73",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1100.0, 910.0, 520.0, 24.0 ],
                    "text": "autopattr: the panel's values reach the parent patch's presets",
                    "textcolor": [ 0.45, 0.45, 0.45, 1.0 ]
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "c_74",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 2140.0, 190.0, 130.0, 24.0 ],
                    "text": "panel labels:",
                    "textcolor": [ 0.45, 0.45, 0.45, 1.0 ]
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 16.0,
                    "id": "c_75",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 2140.0, 220.0, 72.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 4.0, 2.0, 100.0, 24.0 ],
                    "text": "toMidi"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "c_76",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 2140.0, 250.0, 54.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 4.0, 30.0, 50.0, 24.0 ],
                    "text": "mode"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "c_77",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 2140.0, 280.0, 45.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 164.0, 30.0, 43.0, 24.0 ],
                    "text": "MPE"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "c_78",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 2140.0, 310.0, 40.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 166.0, 60.0, 26.0, 24.0 ],
                    "text": "ch"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "c_79",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 2140.0, 340.0, 72.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 4.0, 60.0, 65.0, 24.0 ],
                    "text": "MPE ch"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "c_80",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 2140.0, 370.0, 54.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 4.0, 90.0, 46.0, 24.0 ],
                    "text": "bend"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "c_81",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 2140.0, 400.0, 63.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 108.0, 90.0, 46.0, 24.0 ],
                    "text": "glide"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "c_82",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 2140.0, 430.0, 40.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 188.0, 90.0, 22.0, 24.0 ],
                    "text": "in"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "c_83",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 2140.0, 460.0, 72.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ -2.0, 162.0, 60.0, 24.0 ],
                    "text": "tuning"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "c_84",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 2140.0, 520.0, 280.0, 42.0 ],
                    "presentation": 1,
                    "presentation_linecount": 2,
                    "presentation_rect": [ 4.0, 118.0, 249.0, 42.0 ],
                    "text": "relevant when nonMPE / scale / Scala-aware synths:",
                    "textcolor": [ 0.45, 0.45, 0.45, 1.0 ]
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "snapshot_14", 0 ],
                    "source": [ "gen_9", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "snapshot_15", 0 ],
                    "source": [ "gen_9", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "snapshot_16", 0 ],
                    "source": [ "gen_9", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "snapshot_17", 0 ],
                    "source": [ "gen_9", 3 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "gen_9", 0 ],
                    "source": [ "in_7", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "gen_9", 1 ],
                    "order": 1,
                    "source": [ "in_8", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "snapshot_18", 0 ],
                    "order": 0,
                    "source": [ "in_8", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "out_27", 0 ],
                    "source": [ "iter_25", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "metro_11", 0 ],
                    "source": [ "loadbang_10", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "m_33", 0 ],
                    "order": 7,
                    "source": [ "loadbang_31", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "m_37", 0 ],
                    "order": 6,
                    "source": [ "loadbang_31", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "m_41", 0 ],
                    "order": 5,
                    "source": [ "loadbang_31", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "m_46", 0 ],
                    "order": 4,
                    "source": [ "loadbang_31", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "m_47", 0 ],
                    "order": 3,
                    "source": [ "loadbang_31", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "m_52", 0 ],
                    "order": 2,
                    "source": [ "loadbang_31", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "m_56", 0 ],
                    "order": 1,
                    "source": [ "loadbang_31", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "m_60", 0 ],
                    "order": 0,
                    "source": [ "loadbang_31", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "umenu_32", 0 ],
                    "source": [ "m_33", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "toggle_36", 0 ],
                    "source": [ "m_37", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "s_39", 0 ],
                    "source": [ "m_38", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "number_40", 0 ],
                    "source": [ "m_41", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "s_43", 0 ],
                    "source": [ "m_42", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "number_44", 0 ],
                    "source": [ "m_46", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "number_45", 0 ],
                    "source": [ "m_47", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "number_51", 0 ],
                    "source": [ "m_52", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "s_54", 0 ],
                    "source": [ "m_53", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "toggle_55", 0 ],
                    "source": [ "m_56", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "s_58", 0 ],
                    "source": [ "m_57", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "umenu_59", 0 ],
                    "source": [ "m_60", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "thscala_66", 0 ],
                    "source": [ "m_65", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "s_70", 0 ],
                    "source": [ "m_69", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "t_13", 0 ],
                    "source": [ "metro_11", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "m_42", 0 ],
                    "source": [ "number_40", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pak_48", 0 ],
                    "source": [ "number_44", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pak_48", 1 ],
                    "source": [ "number_45", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "m_53", 0 ],
                    "source": [ "number_51", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "prepend_20", 0 ],
                    "source": [ "pack_19", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "prepend_49", 0 ],
                    "source": [ "pak_48", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v8_23", 0 ],
                    "source": [ "prepend_20", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "s_35", 0 ],
                    "source": [ "prepend_34", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "s_50", 0 ],
                    "source": [ "prepend_49", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "s_62", 0 ],
                    "source": [ "prepend_61", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "v8_23", 0 ],
                    "source": [ "r_21", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pack_19", 0 ],
                    "source": [ "snapshot_14", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pack_19", 1 ],
                    "source": [ "snapshot_15", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pack_19", 2 ],
                    "source": [ "snapshot_16", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pack_19", 3 ],
                    "source": [ "snapshot_17", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pack_19", 4 ],
                    "source": [ "snapshot_18", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "snapshot_14", 0 ],
                    "source": [ "t_13", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "snapshot_15", 0 ],
                    "source": [ "t_13", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "snapshot_16", 0 ],
                    "source": [ "t_13", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "snapshot_17", 0 ],
                    "source": [ "t_13", 3 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "snapshot_18", 0 ],
                    "source": [ "t_13", 4 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "m_69", 0 ],
                    "source": [ "textbutton_68", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "s_67", 0 ],
                    "source": [ "thscala_66", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "m_38", 0 ],
                    "source": [ "toggle_36", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "m_57", 0 ],
                    "source": [ "toggle_55", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "prepend_34", 0 ],
                    "source": [ "umenu_32", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "prepend_61", 0 ],
                    "source": [ "umenu_59", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "m_65", 0 ],
                    "source": [ "umenu_64", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "iter_25", 0 ],
                    "source": [ "v8_23", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "out_26", 0 ],
                    "source": [ "v8_23", 0 ]
                }
            }
        ],
        "parameters": {
            "number_40": [ "channel", "channel", 0 ],
            "number_44": [ "mpefirst", "mpefirst", 0 ],
            "number_45": [ "mpelast", "mpelast", 0 ],
            "number_51": [ "synthbend", "synthbend", 0 ],
            "toggle_36": [ "mpe", "mpe", 0 ],
            "toggle_55": [ "glide", "glide", 0 ],
            "umenu_32": [ "mode", "mode", 0 ],
            "umenu_59": [ "pitchin", "pitchin", 0 ],
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