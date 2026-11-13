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
        "rect": [ 60.0, 80.0, 1900.0, 900.0 ],
        "openinpresentation": 1,
        "default_fontsize": 16.0,
        "gridsize": [ 10.0, 10.0 ],
        "integercoordinates": 1,
        "boxes": [
            {
                "box": {
                    "id": "c_1",
                    "maxclass": "comment",
                    "text": "dingus.toDrums",
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
                    "text": "8 trigger / gate rows (markovPerc, gatesSeq) -> drum notes for vst~ or a MIDI synth.   USE [bpatcher dingus.toDrums.maxpat]",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "fontsize": 16.0,
                    "patching_rect": [ 40.0, 42.0, 1100.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "c_3",
                    "maxclass": "comment",
                    "text": "INPUTS: one column per row",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "fontsize": 16.0,
                    "patching_rect": [ 220.0, 90.0, 400.0, 24.0 ],
                    "fontface": 1
                }
            },
            {
                "box": {
                    "id": "c_4",
                    "maxclass": "comment",
                    "text": "gen~ dingus.toDrumsIn catches each rise at the sample and holds its level (= the velocity): one number\nper row (rise count, velocity, up). Every 2 ms all 8 are read -> \"poll <c1> .. <c8>\", so no hit is missed,\neven a trigger shorter than a signal vector (Max reads signals once per vector)",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "fontsize": 16.0,
                    "patching_rect": [ 220.0, 116.0, 1000.0, 72.0 ],
                    "linecount": 3,
                    "textcolor": [ 0.45, 0.45, 0.45, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "loadbang_5",
                    "maxclass": "newobj",
                    "text": "loadbang",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "fontsize": 16.0,
                    "patching_rect": [ 40.0, 226.0, 90.0, 26.0 ]
                }
            },
            {
                "box": {
                    "id": "metro_6",
                    "maxclass": "newobj",
                    "text": "metro 2",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "fontsize": 16.0,
                    "patching_rect": [ 40.0, 276.0, 81.0, 26.0 ]
                }
            },
            {
                "box": {
                    "id": "c_7",
                    "maxclass": "comment",
                    "text": "read every\n2 ms",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "fontsize": 16.0,
                    "patching_rect": [ 130.0, 276.0, 100.0, 48.0 ],
                    "linecount": 2,
                    "textcolor": [ 0.45, 0.45, 0.45, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "t_8",
                    "maxclass": "newobj",
                    "text": "t b b",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "bang", "bang" ],
                    "fontsize": 16.0,
                    "patching_rect": [ 40.0, 336.0, 63.0, 26.0 ]
                }
            },
            {
                "box": {
                    "id": "s_9",
                    "maxclass": "newobj",
                    "text": "s #0-tick",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "fontsize": 16.0,
                    "patching_rect": [ 100.0, 496.0, 99.0, 26.0 ]
                }
            },
            {
                "box": {
                    "id": "c_10",
                    "maxclass": "comment",
                    "text": "rows 2-8 first,\nrow 1 last",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "fontsize": 16.0,
                    "patching_rect": [ 120.0, 326.0, 140.0, 48.0 ],
                    "linecount": 2,
                    "textcolor": [ 0.45, 0.45, 0.45, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "pack_11",
                    "maxclass": "newobj",
                    "text": "pack 0. 0. 0. 0. 0. 0. 0. 0.",
                    "numinlets": 8,
                    "numoutlets": 1,
                    "outlettype": [ "list" ],
                    "fontsize": 16.0,
                    "patching_rect": [ 220.0, 506.0, 1640.0, 26.0 ]
                }
            },
            {
                "box": {
                    "id": "c_12",
                    "maxclass": "comment",
                    "text": "row 1",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "fontsize": 16.0,
                    "patching_rect": [ 320.0, 200.0, 80.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "in_13",
                    "maxclass": "inlet",
                    "comment": "row 1 trigger / gate (signal; level = velocity)",
                    "index": 0,
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 320.0, 226.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "id": "gen_14",
                    "maxclass": "newobj",
                    "text": "gen~ dingus.toDrumsIn",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "fontsize": 16.0,
                    "patching_rect": [ 320.0, 286.0, 110.0, 26.0 ]
                }
            },
            {
                "box": {
                    "id": "snapshot_15",
                    "maxclass": "newobj",
                    "text": "snapshot~",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "fontsize": 16.0,
                    "patching_rect": [ 320.0, 446.0, 90.0, 26.0 ]
                }
            },
            {
                "box": {
                    "id": "c_16",
                    "maxclass": "comment",
                    "text": "row 2",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "fontsize": 16.0,
                    "patching_rect": [ 540.0, 200.0, 80.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "in_17",
                    "maxclass": "inlet",
                    "comment": "row 2 trigger / gate (signal; level = velocity)",
                    "index": 0,
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 540.0, 226.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "id": "gen_18",
                    "maxclass": "newobj",
                    "text": "gen~ dingus.toDrumsIn",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "fontsize": 16.0,
                    "patching_rect": [ 540.0, 286.0, 110.0, 26.0 ]
                }
            },
            {
                "box": {
                    "id": "snapshot_19",
                    "maxclass": "newobj",
                    "text": "snapshot~",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "fontsize": 16.0,
                    "patching_rect": [ 540.0, 446.0, 90.0, 26.0 ]
                }
            },
            {
                "box": {
                    "id": "r_20",
                    "maxclass": "newobj",
                    "text": "r #0-tick",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "fontsize": 16.0,
                    "patching_rect": [ 440.0, 396.0, 90.0, 26.0 ]
                }
            },
            {
                "box": {
                    "id": "c_21",
                    "maxclass": "comment",
                    "text": "row 3",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "fontsize": 16.0,
                    "patching_rect": [ 760.0, 200.0, 80.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "in_22",
                    "maxclass": "inlet",
                    "comment": "row 3 trigger / gate (signal; level = velocity)",
                    "index": 0,
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 760.0, 226.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "id": "gen_23",
                    "maxclass": "newobj",
                    "text": "gen~ dingus.toDrumsIn",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "fontsize": 16.0,
                    "patching_rect": [ 760.0, 286.0, 110.0, 26.0 ]
                }
            },
            {
                "box": {
                    "id": "snapshot_24",
                    "maxclass": "newobj",
                    "text": "snapshot~",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "fontsize": 16.0,
                    "patching_rect": [ 760.0, 446.0, 90.0, 26.0 ]
                }
            },
            {
                "box": {
                    "id": "r_25",
                    "maxclass": "newobj",
                    "text": "r #0-tick",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "fontsize": 16.0,
                    "patching_rect": [ 660.0, 396.0, 90.0, 26.0 ]
                }
            },
            {
                "box": {
                    "id": "c_26",
                    "maxclass": "comment",
                    "text": "row 4",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "fontsize": 16.0,
                    "patching_rect": [ 980.0, 200.0, 80.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "in_27",
                    "maxclass": "inlet",
                    "comment": "row 4 trigger / gate (signal; level = velocity)",
                    "index": 0,
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 980.0, 226.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "id": "gen_28",
                    "maxclass": "newobj",
                    "text": "gen~ dingus.toDrumsIn",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "fontsize": 16.0,
                    "patching_rect": [ 980.0, 286.0, 110.0, 26.0 ]
                }
            },
            {
                "box": {
                    "id": "snapshot_29",
                    "maxclass": "newobj",
                    "text": "snapshot~",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "fontsize": 16.0,
                    "patching_rect": [ 980.0, 446.0, 90.0, 26.0 ]
                }
            },
            {
                "box": {
                    "id": "r_30",
                    "maxclass": "newobj",
                    "text": "r #0-tick",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "fontsize": 16.0,
                    "patching_rect": [ 880.0, 396.0, 90.0, 26.0 ]
                }
            },
            {
                "box": {
                    "id": "c_31",
                    "maxclass": "comment",
                    "text": "row 5",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "fontsize": 16.0,
                    "patching_rect": [ 1200.0, 200.0, 80.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "in_32",
                    "maxclass": "inlet",
                    "comment": "row 5 trigger / gate (signal; level = velocity)",
                    "index": 0,
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1200.0, 226.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "id": "gen_33",
                    "maxclass": "newobj",
                    "text": "gen~ dingus.toDrumsIn",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "fontsize": 16.0,
                    "patching_rect": [ 1200.0, 286.0, 110.0, 26.0 ]
                }
            },
            {
                "box": {
                    "id": "snapshot_34",
                    "maxclass": "newobj",
                    "text": "snapshot~",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "fontsize": 16.0,
                    "patching_rect": [ 1200.0, 446.0, 90.0, 26.0 ]
                }
            },
            {
                "box": {
                    "id": "r_35",
                    "maxclass": "newobj",
                    "text": "r #0-tick",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "fontsize": 16.0,
                    "patching_rect": [ 1100.0, 396.0, 90.0, 26.0 ]
                }
            },
            {
                "box": {
                    "id": "c_36",
                    "maxclass": "comment",
                    "text": "row 6",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "fontsize": 16.0,
                    "patching_rect": [ 1420.0, 200.0, 80.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "in_37",
                    "maxclass": "inlet",
                    "comment": "row 6 trigger / gate (signal; level = velocity)",
                    "index": 0,
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1420.0, 226.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "id": "gen_38",
                    "maxclass": "newobj",
                    "text": "gen~ dingus.toDrumsIn",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "fontsize": 16.0,
                    "patching_rect": [ 1420.0, 286.0, 110.0, 26.0 ]
                }
            },
            {
                "box": {
                    "id": "snapshot_39",
                    "maxclass": "newobj",
                    "text": "snapshot~",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "fontsize": 16.0,
                    "patching_rect": [ 1420.0, 446.0, 90.0, 26.0 ]
                }
            },
            {
                "box": {
                    "id": "r_40",
                    "maxclass": "newobj",
                    "text": "r #0-tick",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "fontsize": 16.0,
                    "patching_rect": [ 1320.0, 396.0, 90.0, 26.0 ]
                }
            },
            {
                "box": {
                    "id": "c_41",
                    "maxclass": "comment",
                    "text": "row 7",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "fontsize": 16.0,
                    "patching_rect": [ 1640.0, 200.0, 80.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "in_42",
                    "maxclass": "inlet",
                    "comment": "row 7 trigger / gate (signal; level = velocity)",
                    "index": 0,
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1640.0, 226.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "id": "gen_43",
                    "maxclass": "newobj",
                    "text": "gen~ dingus.toDrumsIn",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "fontsize": 16.0,
                    "patching_rect": [ 1640.0, 286.0, 110.0, 26.0 ]
                }
            },
            {
                "box": {
                    "id": "snapshot_44",
                    "maxclass": "newobj",
                    "text": "snapshot~",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "fontsize": 16.0,
                    "patching_rect": [ 1640.0, 446.0, 90.0, 26.0 ]
                }
            },
            {
                "box": {
                    "id": "r_45",
                    "maxclass": "newobj",
                    "text": "r #0-tick",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "fontsize": 16.0,
                    "patching_rect": [ 1540.0, 396.0, 90.0, 26.0 ]
                }
            },
            {
                "box": {
                    "id": "c_46",
                    "maxclass": "comment",
                    "text": "row 8",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "fontsize": 16.0,
                    "patching_rect": [ 1860.0, 200.0, 80.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "in_47",
                    "maxclass": "inlet",
                    "comment": "row 8 trigger / gate (signal; level = velocity)",
                    "index": 0,
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1860.0, 226.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "id": "gen_48",
                    "maxclass": "newobj",
                    "text": "gen~ dingus.toDrumsIn",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "fontsize": 16.0,
                    "patching_rect": [ 1860.0, 286.0, 110.0, 26.0 ]
                }
            },
            {
                "box": {
                    "id": "snapshot_49",
                    "maxclass": "newobj",
                    "text": "snapshot~",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "fontsize": 16.0,
                    "patching_rect": [ 1860.0, 446.0, 90.0, 26.0 ]
                }
            },
            {
                "box": {
                    "id": "r_50",
                    "maxclass": "newobj",
                    "text": "r #0-tick",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "fontsize": 16.0,
                    "patching_rect": [ 1760.0, 396.0, 90.0, 26.0 ]
                }
            },
            {
                "box": {
                    "id": "prepend_51",
                    "maxclass": "newobj",
                    "text": "prepend poll",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "fontsize": 16.0,
                    "patching_rect": [ 220.0, 556.0, 126.0, 26.0 ]
                }
            },
            {
                "box": {
                    "id": "r_52",
                    "maxclass": "newobj",
                    "text": "r #0-todrums",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "fontsize": 16.0,
                    "patching_rect": [ 40.0, 556.0, 126.0, 26.0 ]
                }
            },
            {
                "box": {
                    "id": "c_53",
                    "maxclass": "comment",
                    "text": "settings",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "fontsize": 16.0,
                    "patching_rect": [ 40.0, 526.0, 100.0, 24.0 ],
                    "textcolor": [ 0.45, 0.45, 0.45, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "v8_54",
                    "maxclass": "newobj",
                    "text": "v8 dingus.toDrums.js",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "fontsize": 16.0,
                    "patching_rect": [ 940.0, 660.0, 240.0, 26.0 ]
                }
            },
            {
                "box": {
                    "id": "c_55",
                    "maxclass": "comment",
                    "text": "CONVERTER: note on at each hit; note off after \"off ms\"\n(or at the fall when off ms = 0)",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "fontsize": 16.0,
                    "patching_rect": [ 1200.0, 660.0, 520.0, 48.0 ],
                    "linecount": 2,
                    "textcolor": [ 0.45, 0.45, 0.45, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "iter_56",
                    "maxclass": "newobj",
                    "text": "iter",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "fontsize": 16.0,
                    "patching_rect": [ 1140.0, 720.0, 54.0, 26.0 ]
                }
            },
            {
                "box": {
                    "id": "out_57",
                    "maxclass": "outlet",
                    "comment": "to vst~ (midievent messages)",
                    "index": 0,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 940.0, 780.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "id": "out_58",
                    "maxclass": "outlet",
                    "comment": "raw MIDI bytes (to midiout; NEVER into vst~: a number there changes its preset)",
                    "index": 0,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1140.0, 780.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "id": "c_59",
                    "maxclass": "comment",
                    "text": "OUTPUTS:  left = to vst~ (midievent),  right = raw MIDI bytes for [midiout] (never into vst~)",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "fontsize": 16.0,
                    "patching_rect": [ 1200.0, 782.0, 800.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "c_60",
                    "maxclass": "comment",
                    "text": "SETTINGS (the panel)",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "fontsize": 16.0,
                    "patching_rect": [ 2020.0, 90.0, 300.0, 24.0 ],
                    "fontface": 1
                }
            },
            {
                "box": {
                    "id": "c_61",
                    "maxclass": "comment",
                    "text": "defaults at load; a preset of the parent patch overrides them",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "fontsize": 16.0,
                    "patching_rect": [ 2020.0, 116.0, 560.0, 24.0 ],
                    "textcolor": [ 0.45, 0.45, 0.45, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "loadbang_62",
                    "maxclass": "newobj",
                    "text": "loadbang",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "fontsize": 16.0,
                    "patching_rect": [ 2020.0, 160.0, 90.0, 26.0 ]
                }
            },
            {
                "box": {
                    "id": "m_63",
                    "maxclass": "message",
                    "text": "10",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "fontsize": 16.0,
                    "patching_rect": [ 2020.0, 210.0, 40.0, 26.0 ]
                }
            },
            {
                "box": {
                    "id": "m_64",
                    "maxclass": "message",
                    "text": "50",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "fontsize": 16.0,
                    "patching_rect": [ 2150.0, 210.0, 40.0, 26.0 ]
                }
            },
            {
                "box": {
                    "id": "m_65",
                    "maxclass": "message",
                    "text": "36 38 42 46 45 48 49 51",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "fontsize": 16.0,
                    "patching_rect": [ 2280.0, 210.0, 225.0, 26.0 ]
                }
            },
            {
                "box": {
                    "id": "c_66",
                    "maxclass": "comment",
                    "text": "GM: kick, snare, hats, toms, crash, ride",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "fontsize": 16.0,
                    "patching_rect": [ 2280.0, 184.0, 340.0, 24.0 ],
                    "textcolor": [ 0.45, 0.45, 0.45, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "unpack_67",
                    "maxclass": "newobj",
                    "text": "unpack 0 0 0 0 0 0 0 0",
                    "numinlets": 1,
                    "numoutlets": 8,
                    "outlettype": [ "", "", "", "", "", "", "", "" ],
                    "fontsize": 16.0,
                    "patching_rect": [ 2280.0, 260.0, 280.0, 26.0 ]
                }
            },
            {
                "box": {
                    "id": "number_68",
                    "maxclass": "number",
                    "patching_rect": [ 2020.0, 320.0, 50.0, 26.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 30.0, 30.0, 44.0, 26.0 ],
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
                    "id": "number_69",
                    "maxclass": "number",
                    "patching_rect": [ 2150.0, 320.0, 60.0, 26.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 138.0, 30.0, 50.0, 26.0 ],
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 1,
                    "varname": "offms",
                    "minimum": 0,
                    "maximum": 2000,
                    "fontsize": 16.0,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_invisible": 1,
                            "parameter_longname": "offms",
                            "parameter_modmode": 0,
                            "parameter_shortname": "offms",
                            "parameter_type": 3
                        }
                    }
                }
            },
            {
                "box": {
                    "id": "number_70",
                    "maxclass": "number",
                    "patching_rect": [ 2280.0, 320.0, 34.0, 26.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 4.0, 84.0, 31.0, 26.0 ],
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 1,
                    "varname": "note1",
                    "minimum": 0,
                    "maximum": 127,
                    "triangle": 0,
                    "fontsize": 16.0,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_invisible": 1,
                            "parameter_longname": "note1",
                            "parameter_modmode": 0,
                            "parameter_shortname": "note1",
                            "parameter_type": 3
                        }
                    }
                }
            },
            {
                "box": {
                    "id": "number_71",
                    "maxclass": "number",
                    "patching_rect": [ 2316.0, 320.0, 34.0, 26.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 37.0, 84.0, 31.0, 26.0 ],
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 1,
                    "varname": "note2",
                    "minimum": 0,
                    "maximum": 127,
                    "triangle": 0,
                    "fontsize": 16.0,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_invisible": 1,
                            "parameter_longname": "note2",
                            "parameter_modmode": 0,
                            "parameter_shortname": "note2",
                            "parameter_type": 3
                        }
                    }
                }
            },
            {
                "box": {
                    "id": "number_72",
                    "maxclass": "number",
                    "patching_rect": [ 2352.0, 320.0, 34.0, 26.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 70.0, 84.0, 31.0, 26.0 ],
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 1,
                    "varname": "note3",
                    "minimum": 0,
                    "maximum": 127,
                    "triangle": 0,
                    "fontsize": 16.0,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_invisible": 1,
                            "parameter_longname": "note3",
                            "parameter_modmode": 0,
                            "parameter_shortname": "note3",
                            "parameter_type": 3
                        }
                    }
                }
            },
            {
                "box": {
                    "id": "number_73",
                    "maxclass": "number",
                    "patching_rect": [ 2388.0, 320.0, 34.0, 26.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 103.0, 84.0, 31.0, 26.0 ],
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 1,
                    "varname": "note4",
                    "minimum": 0,
                    "maximum": 127,
                    "triangle": 0,
                    "fontsize": 16.0,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_invisible": 1,
                            "parameter_longname": "note4",
                            "parameter_modmode": 0,
                            "parameter_shortname": "note4",
                            "parameter_type": 3
                        }
                    }
                }
            },
            {
                "box": {
                    "id": "number_74",
                    "maxclass": "number",
                    "patching_rect": [ 2424.0, 320.0, 34.0, 26.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 136.0, 84.0, 31.0, 26.0 ],
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 1,
                    "varname": "note5",
                    "minimum": 0,
                    "maximum": 127,
                    "triangle": 0,
                    "fontsize": 16.0,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_invisible": 1,
                            "parameter_longname": "note5",
                            "parameter_modmode": 0,
                            "parameter_shortname": "note5",
                            "parameter_type": 3
                        }
                    }
                }
            },
            {
                "box": {
                    "id": "number_75",
                    "maxclass": "number",
                    "patching_rect": [ 2460.0, 320.0, 34.0, 26.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 169.0, 84.0, 31.0, 26.0 ],
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 1,
                    "varname": "note6",
                    "minimum": 0,
                    "maximum": 127,
                    "triangle": 0,
                    "fontsize": 16.0,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_invisible": 1,
                            "parameter_longname": "note6",
                            "parameter_modmode": 0,
                            "parameter_shortname": "note6",
                            "parameter_type": 3
                        }
                    }
                }
            },
            {
                "box": {
                    "id": "number_76",
                    "maxclass": "number",
                    "patching_rect": [ 2496.0, 320.0, 34.0, 26.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 202.0, 84.0, 31.0, 26.0 ],
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 1,
                    "varname": "note7",
                    "minimum": 0,
                    "maximum": 127,
                    "triangle": 0,
                    "fontsize": 16.0,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_invisible": 1,
                            "parameter_longname": "note7",
                            "parameter_modmode": 0,
                            "parameter_shortname": "note7",
                            "parameter_type": 3
                        }
                    }
                }
            },
            {
                "box": {
                    "id": "number_77",
                    "maxclass": "number",
                    "patching_rect": [ 2532.0, 320.0, 34.0, 26.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 235.0, 84.0, 31.0, 26.0 ],
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 1,
                    "varname": "note8",
                    "minimum": 0,
                    "maximum": 127,
                    "triangle": 0,
                    "fontsize": 16.0,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_invisible": 1,
                            "parameter_longname": "note8",
                            "parameter_modmode": 0,
                            "parameter_shortname": "note8",
                            "parameter_type": 3
                        }
                    }
                }
            },
            {
                "box": {
                    "id": "textbutton_78",
                    "maxclass": "textbutton",
                    "patching_rect": [ 2598.0, 320.0, 63.0, 26.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 4.0, 116.0, 60.0, 24.0 ],
                    "text": "panic",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "int" ],
                    "parameter_enable": 0,
                    "fontsize": 16.0
                }
            },
            {
                "box": {
                    "id": "m_79",
                    "maxclass": "message",
                    "text": "channel $1",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "fontsize": 16.0,
                    "patching_rect": [ 2020.0, 380.0, 108.0, 26.0 ]
                }
            },
            {
                "box": {
                    "id": "m_80",
                    "maxclass": "message",
                    "text": "offms $1",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "fontsize": 16.0,
                    "patching_rect": [ 2150.0, 380.0, 90.0, 26.0 ]
                }
            },
            {
                "box": {
                    "id": "pak_81",
                    "maxclass": "newobj",
                    "text": "pak 36 38 42 46 45 48 49 51",
                    "numinlets": 8,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "fontsize": 16.0,
                    "patching_rect": [ 2280.0, 380.0, 280.0, 26.0 ]
                }
            },
            {
                "box": {
                    "id": "m_82",
                    "maxclass": "message",
                    "text": "panic",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "fontsize": 16.0,
                    "patching_rect": [ 2598.0, 380.0, 63.0, 26.0 ]
                }
            },
            {
                "box": {
                    "id": "prepend_83",
                    "maxclass": "newobj",
                    "text": "prepend notes",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "fontsize": 16.0,
                    "patching_rect": [ 2280.0, 430.0, 135.0, 26.0 ]
                }
            },
            {
                "box": {
                    "id": "s_84",
                    "maxclass": "newobj",
                    "text": "s #0-todrums",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "fontsize": 16.0,
                    "patching_rect": [ 2020.0, 490.0, 126.0, 26.0 ]
                }
            },
            {
                "box": {
                    "id": "s_85",
                    "maxclass": "newobj",
                    "text": "s #0-todrums",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "fontsize": 16.0,
                    "patching_rect": [ 2150.0, 490.0, 126.0, 26.0 ]
                }
            },
            {
                "box": {
                    "id": "s_86",
                    "maxclass": "newobj",
                    "text": "s #0-todrums",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "fontsize": 16.0,
                    "patching_rect": [ 2280.0, 490.0, 126.0, 26.0 ]
                }
            },
            {
                "box": {
                    "id": "s_87",
                    "maxclass": "newobj",
                    "text": "s #0-todrums",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "fontsize": 16.0,
                    "patching_rect": [ 2598.0, 490.0, 126.0, 26.0 ]
                }
            },
            {
                "box": {
                    "id": "autopattr_88",
                    "maxclass": "newobj",
                    "text": "autopattr @autorestore 0",
                    "numinlets": 1,
                    "numoutlets": 4,
                    "outlettype": [ "", "", "", "" ],
                    "fontsize": 16.0,
                    "patching_rect": [ 2020.0, 560.0, 234.0, 26.0 ],
                    "varname": "u_todrums_autopattr"
                }
            },
            {
                "box": {
                    "id": "c_89",
                    "maxclass": "comment",
                    "text": "autopattr: the panel's values reach the parent patch's presets",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "fontsize": 16.0,
                    "patching_rect": [ 2020.0, 590.0, 520.0, 24.0 ],
                    "textcolor": [ 0.45, 0.45, 0.45, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "c_90",
                    "maxclass": "comment",
                    "text": "panel labels:",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "fontsize": 16.0,
                    "patching_rect": [ 2720.0, 160.0, 130.0, 24.0 ],
                    "textcolor": [ 0.45, 0.45, 0.45, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "c_91",
                    "maxclass": "comment",
                    "text": "toDrums",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "fontsize": 16.0,
                    "patching_rect": [ 2720.0, 190.0, 81.0, 24.0 ],
                    "fontface": 1,
                    "presentation": 1,
                    "presentation_rect": [ 4.0, 2.0, 100.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "c_92",
                    "maxclass": "comment",
                    "text": "ch",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "fontsize": 16.0,
                    "patching_rect": [ 2720.0, 220.0, 40.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 4.0, 30.0, 26.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "c_93",
                    "maxclass": "comment",
                    "text": "off ms",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "fontsize": 16.0,
                    "patching_rect": [ 2720.0, 250.0, 72.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 84.0, 30.0, 54.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "c_94",
                    "maxclass": "comment",
                    "text": "notes, rows 1-8",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "fontsize": 16.0,
                    "patching_rect": [ 2720.0, 280.0, 153.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 4.0, 60.0, 140.0, 24.0 ]
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "source": [ "loadbang_5", 0 ],
                    "destination": [ "metro_6", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "metro_6", 0 ],
                    "destination": [ "t_8", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "t_8", 1 ],
                    "destination": [ "s_9", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "in_13", 0 ],
                    "destination": [ "gen_14", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "gen_14", 0 ],
                    "destination": [ "snapshot_15", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "t_8", 0 ],
                    "destination": [ "snapshot_15", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "snapshot_15", 0 ],
                    "destination": [ "pack_11", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "in_17", 0 ],
                    "destination": [ "gen_18", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "gen_18", 0 ],
                    "destination": [ "snapshot_19", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "r_20", 0 ],
                    "destination": [ "snapshot_19", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "snapshot_19", 0 ],
                    "destination": [ "pack_11", 1 ]
                }
            },
            {
                "patchline": {
                    "source": [ "in_22", 0 ],
                    "destination": [ "gen_23", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "gen_23", 0 ],
                    "destination": [ "snapshot_24", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "r_25", 0 ],
                    "destination": [ "snapshot_24", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "snapshot_24", 0 ],
                    "destination": [ "pack_11", 2 ]
                }
            },
            {
                "patchline": {
                    "source": [ "in_27", 0 ],
                    "destination": [ "gen_28", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "gen_28", 0 ],
                    "destination": [ "snapshot_29", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "r_30", 0 ],
                    "destination": [ "snapshot_29", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "snapshot_29", 0 ],
                    "destination": [ "pack_11", 3 ]
                }
            },
            {
                "patchline": {
                    "source": [ "in_32", 0 ],
                    "destination": [ "gen_33", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "gen_33", 0 ],
                    "destination": [ "snapshot_34", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "r_35", 0 ],
                    "destination": [ "snapshot_34", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "snapshot_34", 0 ],
                    "destination": [ "pack_11", 4 ]
                }
            },
            {
                "patchline": {
                    "source": [ "in_37", 0 ],
                    "destination": [ "gen_38", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "gen_38", 0 ],
                    "destination": [ "snapshot_39", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "r_40", 0 ],
                    "destination": [ "snapshot_39", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "snapshot_39", 0 ],
                    "destination": [ "pack_11", 5 ]
                }
            },
            {
                "patchline": {
                    "source": [ "in_42", 0 ],
                    "destination": [ "gen_43", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "gen_43", 0 ],
                    "destination": [ "snapshot_44", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "r_45", 0 ],
                    "destination": [ "snapshot_44", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "snapshot_44", 0 ],
                    "destination": [ "pack_11", 6 ]
                }
            },
            {
                "patchline": {
                    "source": [ "in_47", 0 ],
                    "destination": [ "gen_48", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "gen_48", 0 ],
                    "destination": [ "snapshot_49", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "r_50", 0 ],
                    "destination": [ "snapshot_49", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "snapshot_49", 0 ],
                    "destination": [ "pack_11", 7 ]
                }
            },
            {
                "patchline": {
                    "source": [ "pack_11", 0 ],
                    "destination": [ "prepend_51", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "prepend_51", 0 ],
                    "destination": [ "v8_54", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "r_52", 0 ],
                    "destination": [ "v8_54", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "v8_54", 0 ],
                    "destination": [ "out_57", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "v8_54", 1 ],
                    "destination": [ "iter_56", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "iter_56", 0 ],
                    "destination": [ "out_58", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "loadbang_62", 0 ],
                    "destination": [ "m_63", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "loadbang_62", 0 ],
                    "destination": [ "m_64", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "loadbang_62", 0 ],
                    "destination": [ "m_65", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "m_63", 0 ],
                    "destination": [ "number_68", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "m_64", 0 ],
                    "destination": [ "number_69", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "m_65", 0 ],
                    "destination": [ "unpack_67", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "unpack_67", 0 ],
                    "destination": [ "number_70", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "number_70", 0 ],
                    "destination": [ "pak_81", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "unpack_67", 1 ],
                    "destination": [ "number_71", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "number_71", 0 ],
                    "destination": [ "pak_81", 1 ]
                }
            },
            {
                "patchline": {
                    "source": [ "unpack_67", 2 ],
                    "destination": [ "number_72", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "number_72", 0 ],
                    "destination": [ "pak_81", 2 ]
                }
            },
            {
                "patchline": {
                    "source": [ "unpack_67", 3 ],
                    "destination": [ "number_73", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "number_73", 0 ],
                    "destination": [ "pak_81", 3 ]
                }
            },
            {
                "patchline": {
                    "source": [ "unpack_67", 4 ],
                    "destination": [ "number_74", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "number_74", 0 ],
                    "destination": [ "pak_81", 4 ]
                }
            },
            {
                "patchline": {
                    "source": [ "unpack_67", 5 ],
                    "destination": [ "number_75", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "number_75", 0 ],
                    "destination": [ "pak_81", 5 ]
                }
            },
            {
                "patchline": {
                    "source": [ "unpack_67", 6 ],
                    "destination": [ "number_76", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "number_76", 0 ],
                    "destination": [ "pak_81", 6 ]
                }
            },
            {
                "patchline": {
                    "source": [ "unpack_67", 7 ],
                    "destination": [ "number_77", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "number_77", 0 ],
                    "destination": [ "pak_81", 7 ]
                }
            },
            {
                "patchline": {
                    "source": [ "number_68", 0 ],
                    "destination": [ "m_79", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "m_79", 0 ],
                    "destination": [ "s_84", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "number_69", 0 ],
                    "destination": [ "m_80", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "m_80", 0 ],
                    "destination": [ "s_85", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "pak_81", 0 ],
                    "destination": [ "prepend_83", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "prepend_83", 0 ],
                    "destination": [ "s_86", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "textbutton_78", 0 ],
                    "destination": [ "m_82", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "m_82", 0 ],
                    "destination": [ "s_87", 0 ]
                }
            }
        ]
    }
}
