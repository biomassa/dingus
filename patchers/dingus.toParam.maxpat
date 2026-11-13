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
        "rect": [ 60.0, 80.0, 1700.0, 900.0 ],
        "openinpresentation": 1,
        "default_fontsize": 16.0,
        "gridsize": [ 10.0, 10.0 ],
        "integercoordinates": 1,
        "boxes": [
            {
                "box": {
                    "id": "c_1",
                    "maxclass": "comment",
                    "text": "dingus.toParam",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "fontsize": 20.0,
                    "patching_rect": [ 40.0, 10.0, 144.0, 24.0 ],
                    "fontface": 1
                }
            },
            {
                "box": {
                    "id": "c_2",
                    "maxclass": "comment",
                    "text": "up to 4 modulation signals -> 0..1 floats for the PARAM inlets of the dingus plug-in hosts (pluginStereo, plugin16in, ...), sent only when they change. The host picks the parameter.   USE [bpatcher dingus.toParam.maxpat]",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "fontsize": 16.0,
                    "patching_rect": [ 40.0, 42.0, 1500.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "c_3",
                    "maxclass": "comment",
                    "text": "INPUTS: one column per slot",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "fontsize": 16.0,
                    "patching_rect": [ 220.0, 100.0, 400.0, 24.0 ],
                    "fontface": 1
                }
            },
            {
                "box": {
                    "id": "c_4",
                    "maxclass": "comment",
                    "text": "each input is read every \"rate\" ms (snapshot~); a value goes out only when it has\nmoved by \"delta\", and the last small move once the input has been still for \"settle\" ms",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "fontsize": 16.0,
                    "patching_rect": [ 220.0, 126.0, 780.0, 48.0 ],
                    "linecount": 2,
                    "textcolor": [ 0.45, 0.45, 0.45, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "c_5",
                    "maxclass": "comment",
                    "text": "slot 1",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "fontsize": 16.0,
                    "patching_rect": [ 220.0, 200.0, 80.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "in_6",
                    "maxclass": "inlet",
                    "comment": "slot 1 (signal)",
                    "index": 0,
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 220.0, 226.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "id": "r_7",
                    "maxclass": "newobj",
                    "text": "r #0-rate",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "fontsize": 16.0,
                    "patching_rect": [ 310.0, 226.0, 99.0, 26.0 ]
                }
            },
            {
                "box": {
                    "id": "snapshot_8",
                    "maxclass": "newobj",
                    "text": "snapshot~ 10",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "fontsize": 16.0,
                    "patching_rect": [ 220.0, 296.0, 126.0, 26.0 ]
                }
            },
            {
                "box": {
                    "id": "m_9",
                    "maxclass": "message",
                    "text": "val 1 $1",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "fontsize": 16.0,
                    "patching_rect": [ 220.0, 356.0, 90.0, 26.0 ]
                }
            },
            {
                "box": {
                    "id": "c_10",
                    "maxclass": "comment",
                    "text": "slot 2",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "fontsize": 16.0,
                    "patching_rect": [ 420.0, 200.0, 80.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "in_11",
                    "maxclass": "inlet",
                    "comment": "slot 2 (signal)",
                    "index": 0,
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 420.0, 226.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "id": "r_12",
                    "maxclass": "newobj",
                    "text": "r #0-rate",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "fontsize": 16.0,
                    "patching_rect": [ 510.0, 226.0, 99.0, 26.0 ]
                }
            },
            {
                "box": {
                    "id": "snapshot_13",
                    "maxclass": "newobj",
                    "text": "snapshot~ 10",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "fontsize": 16.0,
                    "patching_rect": [ 420.0, 296.0, 126.0, 26.0 ]
                }
            },
            {
                "box": {
                    "id": "m_14",
                    "maxclass": "message",
                    "text": "val 2 $1",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "fontsize": 16.0,
                    "patching_rect": [ 420.0, 356.0, 90.0, 26.0 ]
                }
            },
            {
                "box": {
                    "id": "c_15",
                    "maxclass": "comment",
                    "text": "slot 3",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "fontsize": 16.0,
                    "patching_rect": [ 620.0, 200.0, 80.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "in_16",
                    "maxclass": "inlet",
                    "comment": "slot 3 (signal)",
                    "index": 0,
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 620.0, 226.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "id": "r_17",
                    "maxclass": "newobj",
                    "text": "r #0-rate",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "fontsize": 16.0,
                    "patching_rect": [ 710.0, 226.0, 99.0, 26.0 ]
                }
            },
            {
                "box": {
                    "id": "snapshot_18",
                    "maxclass": "newobj",
                    "text": "snapshot~ 10",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "fontsize": 16.0,
                    "patching_rect": [ 620.0, 296.0, 126.0, 26.0 ]
                }
            },
            {
                "box": {
                    "id": "m_19",
                    "maxclass": "message",
                    "text": "val 3 $1",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "fontsize": 16.0,
                    "patching_rect": [ 620.0, 356.0, 90.0, 26.0 ]
                }
            },
            {
                "box": {
                    "id": "c_20",
                    "maxclass": "comment",
                    "text": "slot 4",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "fontsize": 16.0,
                    "patching_rect": [ 820.0, 200.0, 80.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "in_21",
                    "maxclass": "inlet",
                    "comment": "slot 4 (signal)",
                    "index": 0,
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 820.0, 226.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "id": "r_22",
                    "maxclass": "newobj",
                    "text": "r #0-rate",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "fontsize": 16.0,
                    "patching_rect": [ 910.0, 226.0, 99.0, 26.0 ]
                }
            },
            {
                "box": {
                    "id": "snapshot_23",
                    "maxclass": "newobj",
                    "text": "snapshot~ 10",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "fontsize": 16.0,
                    "patching_rect": [ 820.0, 296.0, 126.0, 26.0 ]
                }
            },
            {
                "box": {
                    "id": "m_24",
                    "maxclass": "message",
                    "text": "val 4 $1",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "fontsize": 16.0,
                    "patching_rect": [ 820.0, 356.0, 90.0, 26.0 ]
                }
            },
            {
                "box": {
                    "id": "r_25",
                    "maxclass": "newobj",
                    "text": "r #0-toparam",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "fontsize": 16.0,
                    "patching_rect": [ 40.0, 356.0, 126.0, 26.0 ]
                }
            },
            {
                "box": {
                    "id": "c_26",
                    "maxclass": "comment",
                    "text": "settings",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "fontsize": 16.0,
                    "patching_rect": [ 40.0, 326.0, 100.0, 24.0 ],
                    "textcolor": [ 0.45, 0.45, 0.45, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "v8_27",
                    "maxclass": "newobj",
                    "text": "v8 dingus.toParam.js",
                    "numinlets": 1,
                    "numoutlets": 5,
                    "outlettype": [ "", "", "", "", "" ],
                    "fontsize": 16.0,
                    "patching_rect": [ 220.0, 460.0, 830.0, 26.0 ]
                }
            },
            {
                "box": {
                    "id": "c_28",
                    "maxclass": "comment",
                    "text": "CONVERTER: the input range lo..hi -> 0..1; sent on change, the final value when still;\noptionally each slot as a MIDI CC too",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "fontsize": 16.0,
                    "patching_rect": [ 40.0, 670.0, 760.0, 48.0 ],
                    "linecount": 2,
                    "textcolor": [ 0.45, 0.45, 0.45, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "out_29",
                    "maxclass": "outlet",
                    "comment": "slot 1: 0..1 (to a plug-in host's PARAM inlet)",
                    "index": 0,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 220.0, 540.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "id": "out_30",
                    "maxclass": "outlet",
                    "comment": "slot 2: 0..1 (to a plug-in host's PARAM inlet)",
                    "index": 0,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 420.0, 540.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "id": "out_31",
                    "maxclass": "outlet",
                    "comment": "slot 3: 0..1 (to a plug-in host's PARAM inlet)",
                    "index": 0,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 620.0, 540.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "id": "out_32",
                    "maxclass": "outlet",
                    "comment": "slot 4: 0..1 (to a plug-in host's PARAM inlet)",
                    "index": 0,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 820.0, 540.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "id": "iter_33",
                    "maxclass": "newobj",
                    "text": "iter",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "fontsize": 16.0,
                    "patching_rect": [ 1020.0, 500.0, 54.0, 26.0 ]
                }
            },
            {
                "box": {
                    "id": "out_34",
                    "maxclass": "outlet",
                    "comment": "CCs as raw MIDI bytes (to midiout; NEVER into vst~: a number there changes its preset)",
                    "index": 0,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1020.0, 540.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "id": "c_35",
                    "maxclass": "comment",
                    "text": "OUTPUTS: slot 1 .. 4, 0..1 -> the PARAM inlets of a plug-in host;\nrightmost: the CCs as raw MIDI bytes for [midiout] (never into vst~)",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "fontsize": 16.0,
                    "patching_rect": [ 220.0, 580.0, 760.0, 48.0 ],
                    "linecount": 2
                }
            },
            {
                "box": {
                    "id": "c_36",
                    "maxclass": "comment",
                    "text": "SETTINGS (the panel)",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "fontsize": 16.0,
                    "patching_rect": [ 1160.0, 100.0, 300.0, 24.0 ],
                    "fontface": 1
                }
            },
            {
                "box": {
                    "id": "c_37",
                    "maxclass": "comment",
                    "text": "per slot: lo..hi = the input range that maps to 0..1 (default 0..1); cc = the MIDI CC number\nfor hardware (-1 = off, the default). Defaults at load; a preset of the parent patch overrides them",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "fontsize": 16.0,
                    "patching_rect": [ 1160.0, 126.0, 820.0, 48.0 ],
                    "linecount": 2,
                    "textcolor": [ 0.45, 0.45, 0.45, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "loadbang_38",
                    "maxclass": "newobj",
                    "text": "loadbang",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "fontsize": 16.0,
                    "patching_rect": [ 1160.0, 230.0, 90.0, 26.0 ]
                }
            },
            {
                "box": {
                    "id": "c_39",
                    "maxclass": "comment",
                    "text": "slot 1",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "fontsize": 16.0,
                    "patching_rect": [ 1160.0, 204.0, 80.0, 24.0 ],
                    "textcolor": [ 0.45, 0.45, 0.45, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "m_40",
                    "maxclass": "message",
                    "text": "0. 1.",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "fontsize": 16.0,
                    "patching_rect": [ 1160.0, 280.0, 63.0, 26.0 ]
                }
            },
            {
                "box": {
                    "id": "m_41",
                    "maxclass": "message",
                    "text": "-1",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "fontsize": 16.0,
                    "patching_rect": [ 1310.0, 280.0, 40.0, 26.0 ]
                }
            },
            {
                "box": {
                    "id": "number_42",
                    "maxclass": "number",
                    "patching_rect": [ 1310.0, 380.0, 56.0, 26.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 162.0, 52.0, 50.0, 26.0 ],
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 1,
                    "varname": "cc1",
                    "minimum": -1,
                    "maximum": 127,
                    "triangle": 0,
                    "fontsize": 16.0,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_invisible": 1,
                            "parameter_longname": "cc1",
                            "parameter_modmode": 0,
                            "parameter_shortname": "cc1",
                            "parameter_type": 3
                        }
                    }
                }
            },
            {
                "box": {
                    "id": "m_43",
                    "maxclass": "message",
                    "text": "cc 1 $1",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "fontsize": 16.0,
                    "patching_rect": [ 1310.0, 430.0, 81.0, 26.0 ]
                }
            },
            {
                "box": {
                    "id": "s_44",
                    "maxclass": "newobj",
                    "text": "s #0-toparam",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "fontsize": 16.0,
                    "patching_rect": [ 1310.0, 530.0, 126.0, 26.0 ]
                }
            },
            {
                "box": {
                    "id": "unpack_45",
                    "maxclass": "newobj",
                    "text": "unpack 0. 1.",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "fontsize": 16.0,
                    "patching_rect": [ 1160.0, 330.0, 110.0, 26.0 ]
                }
            },
            {
                "box": {
                    "id": "flonum_46",
                    "maxclass": "flonum",
                    "patching_rect": [ 1160.0, 380.0, 50.0, 26.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 30.0, 52.0, 60.0, 26.0 ],
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 1,
                    "varname": "lo1",
                    "format": 6,
                    "triangle": 0,
                    "fontsize": 16.0,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_invisible": 1,
                            "parameter_longname": "lo1",
                            "parameter_modmode": 0,
                            "parameter_shortname": "lo1",
                            "parameter_type": 3
                        }
                    }
                }
            },
            {
                "box": {
                    "id": "flonum_47",
                    "maxclass": "flonum",
                    "patching_rect": [ 1220.0, 380.0, 50.0, 26.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 96.0, 52.0, 60.0, 26.0 ],
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 1,
                    "varname": "hi1",
                    "format": 6,
                    "triangle": 0,
                    "fontsize": 16.0,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_invisible": 1,
                            "parameter_longname": "hi1",
                            "parameter_modmode": 0,
                            "parameter_shortname": "hi1",
                            "parameter_type": 3
                        }
                    }
                }
            },
            {
                "box": {
                    "id": "pak_48",
                    "maxclass": "newobj",
                    "text": "pak 0. 1.",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "fontsize": 16.0,
                    "patching_rect": [ 1160.0, 430.0, 110.0, 26.0 ]
                }
            },
            {
                "box": {
                    "id": "prepend_49",
                    "maxclass": "newobj",
                    "text": "prepend range 1",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "fontsize": 16.0,
                    "patching_rect": [ 1160.0, 480.0, 140.0, 26.0 ]
                }
            },
            {
                "box": {
                    "id": "s_50",
                    "maxclass": "newobj",
                    "text": "s #0-toparam",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "fontsize": 16.0,
                    "patching_rect": [ 1160.0, 530.0, 126.0, 26.0 ]
                }
            },
            {
                "box": {
                    "id": "loadbang_51",
                    "maxclass": "newobj",
                    "text": "loadbang",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "fontsize": 16.0,
                    "patching_rect": [ 1460.0, 230.0, 90.0, 26.0 ]
                }
            },
            {
                "box": {
                    "id": "c_52",
                    "maxclass": "comment",
                    "text": "slot 2",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "fontsize": 16.0,
                    "patching_rect": [ 1460.0, 204.0, 80.0, 24.0 ],
                    "textcolor": [ 0.45, 0.45, 0.45, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "m_53",
                    "maxclass": "message",
                    "text": "0. 1.",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "fontsize": 16.0,
                    "patching_rect": [ 1460.0, 280.0, 63.0, 26.0 ]
                }
            },
            {
                "box": {
                    "id": "m_54",
                    "maxclass": "message",
                    "text": "-1",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "fontsize": 16.0,
                    "patching_rect": [ 1610.0, 280.0, 40.0, 26.0 ]
                }
            },
            {
                "box": {
                    "id": "number_55",
                    "maxclass": "number",
                    "patching_rect": [ 1610.0, 380.0, 56.0, 26.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 162.0, 80.0, 50.0, 26.0 ],
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 1,
                    "varname": "cc2",
                    "minimum": -1,
                    "maximum": 127,
                    "triangle": 0,
                    "fontsize": 16.0,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_invisible": 1,
                            "parameter_longname": "cc2",
                            "parameter_modmode": 0,
                            "parameter_shortname": "cc2",
                            "parameter_type": 3
                        }
                    }
                }
            },
            {
                "box": {
                    "id": "m_56",
                    "maxclass": "message",
                    "text": "cc 2 $1",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "fontsize": 16.0,
                    "patching_rect": [ 1610.0, 430.0, 81.0, 26.0 ]
                }
            },
            {
                "box": {
                    "id": "s_57",
                    "maxclass": "newobj",
                    "text": "s #0-toparam",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "fontsize": 16.0,
                    "patching_rect": [ 1610.0, 530.0, 126.0, 26.0 ]
                }
            },
            {
                "box": {
                    "id": "unpack_58",
                    "maxclass": "newobj",
                    "text": "unpack 0. 1.",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "fontsize": 16.0,
                    "patching_rect": [ 1460.0, 330.0, 110.0, 26.0 ]
                }
            },
            {
                "box": {
                    "id": "flonum_59",
                    "maxclass": "flonum",
                    "patching_rect": [ 1460.0, 380.0, 50.0, 26.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 30.0, 80.0, 60.0, 26.0 ],
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 1,
                    "varname": "lo2",
                    "format": 6,
                    "triangle": 0,
                    "fontsize": 16.0,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_invisible": 1,
                            "parameter_longname": "lo2",
                            "parameter_modmode": 0,
                            "parameter_shortname": "lo2",
                            "parameter_type": 3
                        }
                    }
                }
            },
            {
                "box": {
                    "id": "flonum_60",
                    "maxclass": "flonum",
                    "patching_rect": [ 1520.0, 380.0, 50.0, 26.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 96.0, 80.0, 60.0, 26.0 ],
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 1,
                    "varname": "hi2",
                    "format": 6,
                    "triangle": 0,
                    "fontsize": 16.0,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_invisible": 1,
                            "parameter_longname": "hi2",
                            "parameter_modmode": 0,
                            "parameter_shortname": "hi2",
                            "parameter_type": 3
                        }
                    }
                }
            },
            {
                "box": {
                    "id": "pak_61",
                    "maxclass": "newobj",
                    "text": "pak 0. 1.",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "fontsize": 16.0,
                    "patching_rect": [ 1460.0, 430.0, 110.0, 26.0 ]
                }
            },
            {
                "box": {
                    "id": "prepend_62",
                    "maxclass": "newobj",
                    "text": "prepend range 2",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "fontsize": 16.0,
                    "patching_rect": [ 1460.0, 480.0, 140.0, 26.0 ]
                }
            },
            {
                "box": {
                    "id": "s_63",
                    "maxclass": "newobj",
                    "text": "s #0-toparam",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "fontsize": 16.0,
                    "patching_rect": [ 1460.0, 530.0, 126.0, 26.0 ]
                }
            },
            {
                "box": {
                    "id": "loadbang_64",
                    "maxclass": "newobj",
                    "text": "loadbang",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "fontsize": 16.0,
                    "patching_rect": [ 1760.0, 230.0, 90.0, 26.0 ]
                }
            },
            {
                "box": {
                    "id": "c_65",
                    "maxclass": "comment",
                    "text": "slot 3",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "fontsize": 16.0,
                    "patching_rect": [ 1760.0, 204.0, 80.0, 24.0 ],
                    "textcolor": [ 0.45, 0.45, 0.45, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "m_66",
                    "maxclass": "message",
                    "text": "0. 1.",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "fontsize": 16.0,
                    "patching_rect": [ 1760.0, 280.0, 63.0, 26.0 ]
                }
            },
            {
                "box": {
                    "id": "m_67",
                    "maxclass": "message",
                    "text": "-1",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "fontsize": 16.0,
                    "patching_rect": [ 1910.0, 280.0, 40.0, 26.0 ]
                }
            },
            {
                "box": {
                    "id": "number_68",
                    "maxclass": "number",
                    "patching_rect": [ 1910.0, 380.0, 56.0, 26.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 162.0, 108.0, 50.0, 26.0 ],
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 1,
                    "varname": "cc3",
                    "minimum": -1,
                    "maximum": 127,
                    "triangle": 0,
                    "fontsize": 16.0,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_invisible": 1,
                            "parameter_longname": "cc3",
                            "parameter_modmode": 0,
                            "parameter_shortname": "cc3",
                            "parameter_type": 3
                        }
                    }
                }
            },
            {
                "box": {
                    "id": "m_69",
                    "maxclass": "message",
                    "text": "cc 3 $1",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "fontsize": 16.0,
                    "patching_rect": [ 1910.0, 430.0, 81.0, 26.0 ]
                }
            },
            {
                "box": {
                    "id": "s_70",
                    "maxclass": "newobj",
                    "text": "s #0-toparam",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "fontsize": 16.0,
                    "patching_rect": [ 1910.0, 530.0, 126.0, 26.0 ]
                }
            },
            {
                "box": {
                    "id": "unpack_71",
                    "maxclass": "newobj",
                    "text": "unpack 0. 1.",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "fontsize": 16.0,
                    "patching_rect": [ 1760.0, 330.0, 110.0, 26.0 ]
                }
            },
            {
                "box": {
                    "id": "flonum_72",
                    "maxclass": "flonum",
                    "patching_rect": [ 1760.0, 380.0, 50.0, 26.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 30.0, 108.0, 60.0, 26.0 ],
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 1,
                    "varname": "lo3",
                    "format": 6,
                    "triangle": 0,
                    "fontsize": 16.0,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_invisible": 1,
                            "parameter_longname": "lo3",
                            "parameter_modmode": 0,
                            "parameter_shortname": "lo3",
                            "parameter_type": 3
                        }
                    }
                }
            },
            {
                "box": {
                    "id": "flonum_73",
                    "maxclass": "flonum",
                    "patching_rect": [ 1820.0, 380.0, 50.0, 26.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 96.0, 108.0, 60.0, 26.0 ],
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 1,
                    "varname": "hi3",
                    "format": 6,
                    "triangle": 0,
                    "fontsize": 16.0,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_invisible": 1,
                            "parameter_longname": "hi3",
                            "parameter_modmode": 0,
                            "parameter_shortname": "hi3",
                            "parameter_type": 3
                        }
                    }
                }
            },
            {
                "box": {
                    "id": "pak_74",
                    "maxclass": "newobj",
                    "text": "pak 0. 1.",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "fontsize": 16.0,
                    "patching_rect": [ 1760.0, 430.0, 110.0, 26.0 ]
                }
            },
            {
                "box": {
                    "id": "prepend_75",
                    "maxclass": "newobj",
                    "text": "prepend range 3",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "fontsize": 16.0,
                    "patching_rect": [ 1760.0, 480.0, 140.0, 26.0 ]
                }
            },
            {
                "box": {
                    "id": "s_76",
                    "maxclass": "newobj",
                    "text": "s #0-toparam",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "fontsize": 16.0,
                    "patching_rect": [ 1760.0, 530.0, 126.0, 26.0 ]
                }
            },
            {
                "box": {
                    "id": "loadbang_77",
                    "maxclass": "newobj",
                    "text": "loadbang",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "fontsize": 16.0,
                    "patching_rect": [ 2060.0, 230.0, 90.0, 26.0 ]
                }
            },
            {
                "box": {
                    "id": "c_78",
                    "maxclass": "comment",
                    "text": "slot 4",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "fontsize": 16.0,
                    "patching_rect": [ 2060.0, 204.0, 80.0, 24.0 ],
                    "textcolor": [ 0.45, 0.45, 0.45, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "m_79",
                    "maxclass": "message",
                    "text": "0. 1.",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "fontsize": 16.0,
                    "patching_rect": [ 2060.0, 280.0, 63.0, 26.0 ]
                }
            },
            {
                "box": {
                    "id": "m_80",
                    "maxclass": "message",
                    "text": "-1",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "fontsize": 16.0,
                    "patching_rect": [ 2210.0, 280.0, 40.0, 26.0 ]
                }
            },
            {
                "box": {
                    "id": "number_81",
                    "maxclass": "number",
                    "patching_rect": [ 2210.0, 380.0, 56.0, 26.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 162.0, 136.0, 50.0, 26.0 ],
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 1,
                    "varname": "cc4",
                    "minimum": -1,
                    "maximum": 127,
                    "triangle": 0,
                    "fontsize": 16.0,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_invisible": 1,
                            "parameter_longname": "cc4",
                            "parameter_modmode": 0,
                            "parameter_shortname": "cc4",
                            "parameter_type": 3
                        }
                    }
                }
            },
            {
                "box": {
                    "id": "m_82",
                    "maxclass": "message",
                    "text": "cc 4 $1",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "fontsize": 16.0,
                    "patching_rect": [ 2210.0, 430.0, 81.0, 26.0 ]
                }
            },
            {
                "box": {
                    "id": "s_83",
                    "maxclass": "newobj",
                    "text": "s #0-toparam",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "fontsize": 16.0,
                    "patching_rect": [ 2210.0, 530.0, 126.0, 26.0 ]
                }
            },
            {
                "box": {
                    "id": "unpack_84",
                    "maxclass": "newobj",
                    "text": "unpack 0. 1.",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "fontsize": 16.0,
                    "patching_rect": [ 2060.0, 330.0, 110.0, 26.0 ]
                }
            },
            {
                "box": {
                    "id": "flonum_85",
                    "maxclass": "flonum",
                    "patching_rect": [ 2060.0, 380.0, 50.0, 26.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 30.0, 136.0, 60.0, 26.0 ],
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 1,
                    "varname": "lo4",
                    "format": 6,
                    "triangle": 0,
                    "fontsize": 16.0,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_invisible": 1,
                            "parameter_longname": "lo4",
                            "parameter_modmode": 0,
                            "parameter_shortname": "lo4",
                            "parameter_type": 3
                        }
                    }
                }
            },
            {
                "box": {
                    "id": "flonum_86",
                    "maxclass": "flonum",
                    "patching_rect": [ 2120.0, 380.0, 50.0, 26.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 96.0, 136.0, 60.0, 26.0 ],
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 1,
                    "varname": "hi4",
                    "format": 6,
                    "triangle": 0,
                    "fontsize": 16.0,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_invisible": 1,
                            "parameter_longname": "hi4",
                            "parameter_modmode": 0,
                            "parameter_shortname": "hi4",
                            "parameter_type": 3
                        }
                    }
                }
            },
            {
                "box": {
                    "id": "pak_87",
                    "maxclass": "newobj",
                    "text": "pak 0. 1.",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "fontsize": 16.0,
                    "patching_rect": [ 2060.0, 430.0, 110.0, 26.0 ]
                }
            },
            {
                "box": {
                    "id": "prepend_88",
                    "maxclass": "newobj",
                    "text": "prepend range 4",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "fontsize": 16.0,
                    "patching_rect": [ 2060.0, 480.0, 140.0, 26.0 ]
                }
            },
            {
                "box": {
                    "id": "s_89",
                    "maxclass": "newobj",
                    "text": "s #0-toparam",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "fontsize": 16.0,
                    "patching_rect": [ 2060.0, 530.0, 126.0, 26.0 ]
                }
            },
            {
                "box": {
                    "id": "c_90",
                    "maxclass": "comment",
                    "text": "global: rate = how often the inputs are read (ms); delta = the smallest move sent at once (0..1);\nsettle = the stillness before the last small move goes out (ms); ch = the CCs' MIDI channel",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "fontsize": 16.0,
                    "patching_rect": [ 1160.0, 630.0, 780.0, 48.0 ],
                    "linecount": 2,
                    "textcolor": [ 0.45, 0.45, 0.45, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "loadbang_91",
                    "maxclass": "newobj",
                    "text": "loadbang",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "fontsize": 16.0,
                    "patching_rect": [ 1160.0, 690.0, 90.0, 26.0 ]
                }
            },
            {
                "box": {
                    "id": "m_92",
                    "maxclass": "message",
                    "text": "10",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "fontsize": 16.0,
                    "patching_rect": [ 1160.0, 740.0, 40.0, 26.0 ]
                }
            },
            {
                "box": {
                    "id": "number_93",
                    "maxclass": "number",
                    "patching_rect": [ 1160.0, 790.0, 70.0, 26.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 44.0, 168.0, 50.0, 26.0 ],
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 1,
                    "varname": "rate",
                    "minimum": 1,
                    "maximum": 1000,
                    "fontsize": 16.0,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_invisible": 1,
                            "parameter_longname": "rate",
                            "parameter_modmode": 0,
                            "parameter_shortname": "rate",
                            "parameter_type": 3
                        }
                    }
                }
            },
            {
                "box": {
                    "id": "s_94",
                    "maxclass": "newobj",
                    "text": "s #0-rate",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "fontsize": 16.0,
                    "patching_rect": [ 1160.0, 900.0, 99.0, 26.0 ]
                }
            },
            {
                "box": {
                    "id": "c_95",
                    "maxclass": "comment",
                    "text": "-> the snapshot~s",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "fontsize": 16.0,
                    "patching_rect": [ 1160.0, 930.0, 150.0, 24.0 ],
                    "textcolor": [ 0.45, 0.45, 0.45, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "m_96",
                    "maxclass": "message",
                    "text": "0.004",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "fontsize": 16.0,
                    "patching_rect": [ 1320.0, 740.0, 63.0, 26.0 ]
                }
            },
            {
                "box": {
                    "id": "flonum_97",
                    "maxclass": "flonum",
                    "patching_rect": [ 1320.0, 790.0, 70.0, 26.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 150.0, 168.0, 64.0, 26.0 ],
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 1,
                    "varname": "delta",
                    "minimum": 0.0,
                    "maximum": 0.5,
                    "format": 6,
                    "fontsize": 16.0,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_invisible": 1,
                            "parameter_longname": "delta",
                            "parameter_modmode": 0,
                            "parameter_shortname": "delta",
                            "parameter_type": 3
                        }
                    }
                }
            },
            {
                "box": {
                    "id": "m_98",
                    "maxclass": "message",
                    "text": "delta $1",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "fontsize": 16.0,
                    "patching_rect": [ 1320.0, 840.0, 90.0, 26.0 ]
                }
            },
            {
                "box": {
                    "id": "s_99",
                    "maxclass": "newobj",
                    "text": "s #0-toparam",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "fontsize": 16.0,
                    "patching_rect": [ 1320.0, 900.0, 126.0, 26.0 ]
                }
            },
            {
                "box": {
                    "id": "m_100",
                    "maxclass": "message",
                    "text": "80",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "fontsize": 16.0,
                    "patching_rect": [ 1480.0, 740.0, 40.0, 26.0 ]
                }
            },
            {
                "box": {
                    "id": "number_101",
                    "maxclass": "number",
                    "patching_rect": [ 1480.0, 790.0, 70.0, 26.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 64.0, 196.0, 54.0, 26.0 ],
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 1,
                    "varname": "settle",
                    "minimum": 1,
                    "maximum": 2000,
                    "fontsize": 16.0,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_invisible": 1,
                            "parameter_longname": "settle",
                            "parameter_modmode": 0,
                            "parameter_shortname": "settle",
                            "parameter_type": 3
                        }
                    }
                }
            },
            {
                "box": {
                    "id": "m_102",
                    "maxclass": "message",
                    "text": "settle $1",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "fontsize": 16.0,
                    "patching_rect": [ 1480.0, 840.0, 99.0, 26.0 ]
                }
            },
            {
                "box": {
                    "id": "s_103",
                    "maxclass": "newobj",
                    "text": "s #0-toparam",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "fontsize": 16.0,
                    "patching_rect": [ 1480.0, 900.0, 126.0, 26.0 ]
                }
            },
            {
                "box": {
                    "id": "m_104",
                    "maxclass": "message",
                    "text": "1",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "fontsize": 16.0,
                    "patching_rect": [ 1640.0, 740.0, 40.0, 26.0 ]
                }
            },
            {
                "box": {
                    "id": "number_105",
                    "maxclass": "number",
                    "patching_rect": [ 1640.0, 790.0, 70.0, 26.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 250.0, 168.0, 44.0, 26.0 ],
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 1,
                    "varname": "channel",
                    "minimum": 1,
                    "maximum": 16,
                    "fontsize": 16.0,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_invisible": 1,
                            "parameter_longname": "channel",
                            "parameter_modmode": 0,
                            "parameter_shortname": "channel",
                            "parameter_type": 3
                        }
                    }
                }
            },
            {
                "box": {
                    "id": "m_106",
                    "maxclass": "message",
                    "text": "channel $1",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "fontsize": 16.0,
                    "patching_rect": [ 1640.0, 840.0, 108.0, 26.0 ]
                }
            },
            {
                "box": {
                    "id": "s_107",
                    "maxclass": "newobj",
                    "text": "s #0-toparam",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "fontsize": 16.0,
                    "patching_rect": [ 1640.0, 900.0, 126.0, 26.0 ]
                }
            },
            {
                "box": {
                    "id": "textbutton_108",
                    "maxclass": "textbutton",
                    "patching_rect": [ 1800.0, 790.0, 72.0, 26.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 130.0, 196.0, 80.0, 24.0 ],
                    "text": "resend",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "int" ],
                    "parameter_enable": 0,
                    "fontsize": 16.0
                }
            },
            {
                "box": {
                    "id": "m_109",
                    "maxclass": "message",
                    "text": "resend",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "fontsize": 16.0,
                    "patching_rect": [ 1800.0, 840.0, 72.0, 26.0 ]
                }
            },
            {
                "box": {
                    "id": "s_110",
                    "maxclass": "newobj",
                    "text": "s #0-toparam",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "fontsize": 16.0,
                    "patching_rect": [ 1800.0, 900.0, 126.0, 26.0 ]
                }
            },
            {
                "box": {
                    "id": "c_111",
                    "maxclass": "comment",
                    "text": "resend: every slot's value again\n(e.g. after loading a plug-in)",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "fontsize": 16.0,
                    "patching_rect": [ 1900.0, 790.0, 260.0, 48.0 ],
                    "linecount": 2,
                    "textcolor": [ 0.45, 0.45, 0.45, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "autopattr_112",
                    "maxclass": "newobj",
                    "text": "autopattr @autorestore 0",
                    "numinlets": 1,
                    "numoutlets": 4,
                    "outlettype": [ "", "", "", "" ],
                    "fontsize": 16.0,
                    "patching_rect": [ 1160.0, 990.0, 234.0, 26.0 ],
                    "varname": "u_toparam_autopattr"
                }
            },
            {
                "box": {
                    "id": "c_113",
                    "maxclass": "comment",
                    "text": "autopattr: the panel's values reach the parent patch's presets",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "fontsize": 16.0,
                    "patching_rect": [ 1160.0, 1020.0, 520.0, 24.0 ],
                    "textcolor": [ 0.45, 0.45, 0.45, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "c_114",
                    "maxclass": "comment",
                    "text": "panel labels:",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "fontsize": 16.0,
                    "patching_rect": [ 2400.0, 190.0, 130.0, 24.0 ],
                    "textcolor": [ 0.45, 0.45, 0.45, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "c_115",
                    "maxclass": "comment",
                    "text": "toParam",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "fontsize": 16.0,
                    "patching_rect": [ 2400.0, 220.0, 81.0, 24.0 ],
                    "fontface": 1,
                    "presentation": 1,
                    "presentation_rect": [ 4.0, 2.0, 100.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "c_116",
                    "maxclass": "comment",
                    "text": "lo",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "fontsize": 16.0,
                    "patching_rect": [ 2400.0, 250.0, 40.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 30.0, 28.0, 30.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "c_117",
                    "maxclass": "comment",
                    "text": "hi",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "fontsize": 16.0,
                    "patching_rect": [ 2400.0, 280.0, 40.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 96.0, 28.0, 30.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "c_118",
                    "maxclass": "comment",
                    "text": "cc",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "fontsize": 16.0,
                    "patching_rect": [ 2400.0, 310.0, 40.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 162.0, 28.0, 30.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "c_119",
                    "maxclass": "comment",
                    "text": "rate",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "fontsize": 16.0,
                    "patching_rect": [ 2400.0, 340.0, 54.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 4.0, 168.0, 40.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "c_120",
                    "maxclass": "comment",
                    "text": "delta",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "fontsize": 16.0,
                    "patching_rect": [ 2400.0, 370.0, 63.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 100.0, 168.0, 50.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "c_121",
                    "maxclass": "comment",
                    "text": "ch",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "fontsize": 16.0,
                    "patching_rect": [ 2400.0, 400.0, 40.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 222.0, 168.0, 26.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "c_122",
                    "maxclass": "comment",
                    "text": "settle",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "fontsize": 16.0,
                    "patching_rect": [ 2400.0, 430.0, 72.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 4.0, 196.0, 58.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "c_123",
                    "maxclass": "comment",
                    "text": "1",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "fontsize": 16.0,
                    "patching_rect": [ 2400.0, 460.0, 40.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 4.0, 52.0, 18.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "c_124",
                    "maxclass": "comment",
                    "text": "2",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "fontsize": 16.0,
                    "patching_rect": [ 2400.0, 490.0, 40.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 4.0, 80.0, 18.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "c_125",
                    "maxclass": "comment",
                    "text": "3",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "fontsize": 16.0,
                    "patching_rect": [ 2400.0, 520.0, 40.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 4.0, 108.0, 18.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "c_126",
                    "maxclass": "comment",
                    "text": "4",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "fontsize": 16.0,
                    "patching_rect": [ 2400.0, 550.0, 40.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 4.0, 136.0, 18.0, 24.0 ]
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "source": [ "in_6", 0 ],
                    "destination": [ "snapshot_8", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "r_7", 0 ],
                    "destination": [ "snapshot_8", 1 ]
                }
            },
            {
                "patchline": {
                    "source": [ "snapshot_8", 0 ],
                    "destination": [ "m_9", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "in_11", 0 ],
                    "destination": [ "snapshot_13", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "r_12", 0 ],
                    "destination": [ "snapshot_13", 1 ]
                }
            },
            {
                "patchline": {
                    "source": [ "snapshot_13", 0 ],
                    "destination": [ "m_14", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "in_16", 0 ],
                    "destination": [ "snapshot_18", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "r_17", 0 ],
                    "destination": [ "snapshot_18", 1 ]
                }
            },
            {
                "patchline": {
                    "source": [ "snapshot_18", 0 ],
                    "destination": [ "m_19", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "in_21", 0 ],
                    "destination": [ "snapshot_23", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "r_22", 0 ],
                    "destination": [ "snapshot_23", 1 ]
                }
            },
            {
                "patchline": {
                    "source": [ "snapshot_23", 0 ],
                    "destination": [ "m_24", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "m_9", 0 ],
                    "destination": [ "v8_27", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "m_14", 0 ],
                    "destination": [ "v8_27", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "m_19", 0 ],
                    "destination": [ "v8_27", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "m_24", 0 ],
                    "destination": [ "v8_27", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "r_25", 0 ],
                    "destination": [ "v8_27", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "v8_27", 0 ],
                    "destination": [ "out_29", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "v8_27", 1 ],
                    "destination": [ "out_30", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "v8_27", 2 ],
                    "destination": [ "out_31", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "v8_27", 3 ],
                    "destination": [ "out_32", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "v8_27", 4 ],
                    "destination": [ "iter_33", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "iter_33", 0 ],
                    "destination": [ "out_34", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "loadbang_38", 0 ],
                    "destination": [ "m_41", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "m_41", 0 ],
                    "destination": [ "number_42", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "number_42", 0 ],
                    "destination": [ "m_43", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "m_43", 0 ],
                    "destination": [ "s_44", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "loadbang_38", 0 ],
                    "destination": [ "m_40", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "m_40", 0 ],
                    "destination": [ "unpack_45", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "unpack_45", 0 ],
                    "destination": [ "flonum_46", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "unpack_45", 1 ],
                    "destination": [ "flonum_47", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "flonum_46", 0 ],
                    "destination": [ "pak_48", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "flonum_47", 0 ],
                    "destination": [ "pak_48", 1 ]
                }
            },
            {
                "patchline": {
                    "source": [ "pak_48", 0 ],
                    "destination": [ "prepend_49", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "prepend_49", 0 ],
                    "destination": [ "s_50", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "loadbang_51", 0 ],
                    "destination": [ "m_54", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "m_54", 0 ],
                    "destination": [ "number_55", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "number_55", 0 ],
                    "destination": [ "m_56", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "m_56", 0 ],
                    "destination": [ "s_57", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "loadbang_51", 0 ],
                    "destination": [ "m_53", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "m_53", 0 ],
                    "destination": [ "unpack_58", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "unpack_58", 0 ],
                    "destination": [ "flonum_59", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "unpack_58", 1 ],
                    "destination": [ "flonum_60", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "flonum_59", 0 ],
                    "destination": [ "pak_61", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "flonum_60", 0 ],
                    "destination": [ "pak_61", 1 ]
                }
            },
            {
                "patchline": {
                    "source": [ "pak_61", 0 ],
                    "destination": [ "prepend_62", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "prepend_62", 0 ],
                    "destination": [ "s_63", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "loadbang_64", 0 ],
                    "destination": [ "m_67", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "m_67", 0 ],
                    "destination": [ "number_68", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "number_68", 0 ],
                    "destination": [ "m_69", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "m_69", 0 ],
                    "destination": [ "s_70", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "loadbang_64", 0 ],
                    "destination": [ "m_66", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "m_66", 0 ],
                    "destination": [ "unpack_71", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "unpack_71", 0 ],
                    "destination": [ "flonum_72", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "unpack_71", 1 ],
                    "destination": [ "flonum_73", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "flonum_72", 0 ],
                    "destination": [ "pak_74", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "flonum_73", 0 ],
                    "destination": [ "pak_74", 1 ]
                }
            },
            {
                "patchline": {
                    "source": [ "pak_74", 0 ],
                    "destination": [ "prepend_75", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "prepend_75", 0 ],
                    "destination": [ "s_76", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "loadbang_77", 0 ],
                    "destination": [ "m_80", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "m_80", 0 ],
                    "destination": [ "number_81", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "number_81", 0 ],
                    "destination": [ "m_82", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "m_82", 0 ],
                    "destination": [ "s_83", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "loadbang_77", 0 ],
                    "destination": [ "m_79", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "m_79", 0 ],
                    "destination": [ "unpack_84", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "unpack_84", 0 ],
                    "destination": [ "flonum_85", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "unpack_84", 1 ],
                    "destination": [ "flonum_86", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "flonum_85", 0 ],
                    "destination": [ "pak_87", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "flonum_86", 0 ],
                    "destination": [ "pak_87", 1 ]
                }
            },
            {
                "patchline": {
                    "source": [ "pak_87", 0 ],
                    "destination": [ "prepend_88", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "prepend_88", 0 ],
                    "destination": [ "s_89", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "loadbang_91", 0 ],
                    "destination": [ "m_92", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "m_92", 0 ],
                    "destination": [ "number_93", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "number_93", 0 ],
                    "destination": [ "s_94", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "loadbang_91", 0 ],
                    "destination": [ "m_96", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "m_96", 0 ],
                    "destination": [ "flonum_97", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "flonum_97", 0 ],
                    "destination": [ "m_98", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "m_98", 0 ],
                    "destination": [ "s_99", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "loadbang_91", 0 ],
                    "destination": [ "m_100", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "m_100", 0 ],
                    "destination": [ "number_101", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "number_101", 0 ],
                    "destination": [ "m_102", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "m_102", 0 ],
                    "destination": [ "s_103", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "loadbang_91", 0 ],
                    "destination": [ "m_104", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "m_104", 0 ],
                    "destination": [ "number_105", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "number_105", 0 ],
                    "destination": [ "m_106", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "m_106", 0 ],
                    "destination": [ "s_107", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "textbutton_108", 0 ],
                    "destination": [ "m_109", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "m_109", 0 ],
                    "destination": [ "s_110", 0 ]
                }
            }
        ]
    }
}
