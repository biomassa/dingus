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
        "rect": [ 34.0, 92.0, 1900.0, 1170.0 ],
        "openinpresentation": 1,
        "integercoordinates": 1,
        "boxes": [
            {
                "box": {
                    "id": "obj-1",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 4,
                    "outlettype": [ "", "", "", "" ],
                    "patching_rect": [ 167.0, 215.0, 56.0, 22.0 ],
                    "restore": {
                        "gl_barsteps": [ 4 ],
                        "gl_bendrange": [ 48 ],
                        "gl_btn_clear": [ -1 ],
                        "gl_btn_delete": [ -1 ],
                        "gl_btn_play": [ -1 ],
                        "gl_btn_rec": [ -1 ],
                        "gl_btn_stop": [ -1 ],
                        "gl_loopsnap": [ 2 ],
                        "gl_seq": [ 1 ],
                        "gl_snap": [ 3 ],
                        "rate": [ 1.0 ]
                    },
                    "restore_extra": {
                        "gl_barsteps": {
                            "id": "bars"
                        },
                        "gl_bendrange": {
                            "id": "bend"
                        },
                        "gl_btn_clear": {
                            "id": "btn-clear"
                        },
                        "gl_btn_delete": {
                            "id": "btn-del"
                        },
                        "gl_btn_play": {
                            "id": "btn-play"
                        },
                        "gl_btn_rec": {
                            "id": "btn-rec"
                        },
                        "gl_btn_stop": {
                            "id": "btn-stop"
                        },
                        "gl_loopsnap": {
                            "id": "lsnap"
                        },
                        "gl_seq": {
                            "id": "seqbox"
                        },
                        "gl_snap": {
                            "id": "snapm"
                        },
                        "rate": {
                            "id": "rate"
                        }
                    },
                    "text": "autopattr",
                    "varname": "u802006979"
                }
            },
            {
                "box": {
                    "comment": "MIDI bytes in (from [midiin \"LinnStrument MIDI\"])",
                    "id": "in-midi",
                    "index": 0,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 20.0, 20.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "comment": "clock phasor",
                    "id": "in-clock",
                    "index": 0,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 700.0, 20.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "comment": "step reset (bang)",
                    "id": "in-reset",
                    "index": 0,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 760.0, 20.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "comment": "rate~ reset (bang)",
                    "id": "in-rreset",
                    "index": 0,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 820.0, 20.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "comment": "clock play (1) / pause (0)",
                    "id": "in-run",
                    "index": 0,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 880.0, 20.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "comment": "rate mod (signal, added)",
                    "id": "in-rmod",
                    "index": 0,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 940.0, 20.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "comment": "rec (bang)",
                    "id": "in-rec",
                    "index": 0,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1000.0, 20.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "comment": "play (bang)",
                    "id": "in-play",
                    "index": 0,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1060.0, 20.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "comment": "stop (bang)",
                    "id": "in-stop",
                    "index": 0,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1120.0, 20.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "comment": "sequence 1-32",
                    "id": "in-seq",
                    "index": 0,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1180.0, 20.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "comment": "MIDI bytes out (to the note bpatcher's MIDI inlet)",
                    "id": "out-midi",
                    "index": 0,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 760.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "fontsize": 18.0,
                    "id": "hdr",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 70.0, 200.0, 27.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 0.0, 0.0, 160.0, 27.0 ],
                    "text": "gesture looper"
                }
            },
            {
                "box": {
                    "id": "use",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 250.0, 70.0, 536.0, 20.0 ],
                    "text": "USE [bpatcher dingus.gestureLooper.maxpat @args NAME]; file: _maxPresets/gestureLooper_NAME.json"
                }
            },
            {
                "box": {
                    "id": "mcp",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 250.0, 100.0, 140.0, 22.0 ],
                    "saved_object_attributes": {
                        "alias": "",
                        "group": ""
                    },
                    "text": "maxmcp gestureLooper"
                }
            },
            {
                "box": {
                    "filename": "dingus.gestureLoop.js",
                    "id": "eng",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 20.0, 480.0, 230.0, 22.0 ],
                    "saved_object_attributes": {
                        "embed": 0,
                        "parameter_enable": 0
                    },
                    "text": "v8 dingus.gestureLoop.js #1 #0_gl",
                    "textfile": {
                        "filename": "dingusGestureLoop.js",
                        "flags": 0,
                        "embed": 0,
                        "autowatch": 1
                    },
                    "varname": "gl_engine"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "format": 6,
                    "id": "rate",
                    "maxclass": "flonum",
                    "minimum": 0.0625,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 1300.0, 140.0, 60.0, 26.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 989.0, 1.0, 60.0, 26.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_invisible": 1,
                            "parameter_longname": "rate",
                            "parameter_modmode": 0,
                            "parameter_shortname": "rate",
                            "parameter_type": 3
                        }
                    },
                    "varname": "rate"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "rate-c",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1365.0, 140.0, 40.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 949.0, 2.0, 38.0, 24.0 ],
                    "text": "rate"
                }
            },
            {
                "box": {
                    "id": "ratedef",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1300.0, 110.0, 80.0, 22.0 ],
                    "text": "loadmess 1."
                }
            },
            {
                "box": {
                    "id": "ratesig",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 1300.0, 180.0, 50.0, 22.0 ],
                    "text": "sig~ 1"
                }
            },
            {
                "box": {
                    "id": "rateadd",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 1300.0, 215.0, 40.0, 22.0 ],
                    "text": "+~"
                }
            },
            {
                "box": {
                    "id": "ratetilde",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 700.0, 260.0, 90.0, 22.0 ],
                    "text": "rate~ @sync 1",
                    "varname": "glrate"
                }
            },
            {
                "box": {
                    "id": "snap",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "patching_rect": [ 700.0, 300.0, 80.0, 22.0 ],
                    "text": "snapshot~ 4"
                }
            },
            {
                "box": {
                    "id": "rrt",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 820.0, 180.0, 30.0, 22.0 ],
                    "text": "t b"
                }
            },
            {
                "box": {
                    "id": "rrm",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 820.0, 215.0, 45.0, 22.0 ],
                    "text": "reset"
                }
            },
            {
                "box": {
                    "id": "sreset",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "reset" ],
                    "patching_rect": [ 760.0, 340.0, 50.0, 22.0 ],
                    "text": "t reset"
                }
            },
            {
                "box": {
                    "id": "prun",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 880.0, 340.0, 90.0, 22.0 ],
                    "text": "prepend clock"
                }
            },
            {
                "box": {
                    "id": "trec",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "rec" ],
                    "patching_rect": [ 1000.0, 380.0, 45.0, 22.0 ],
                    "text": "t rec"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "btn-rec",
                    "maxclass": "textbutton",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1000.0, 300.0, 50.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 165.0, 2.0, 54.0, 24.0 ],
                    "text": "rec",
                    "textoncolor": [ 1.0, 0.18, 0.15, 1.0 ],
                    "varname": "gl_btn_rec",
                    "mode": 1,
                    "bgoncolor": [ 0.55, 0.17, 0.12, 1.0 ],
                    "texton": "rec"
                }
            },
            {
                "box": {
                    "id": "tplay",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "play" ],
                    "patching_rect": [ 1060.0, 380.0, 45.0, 22.0 ],
                    "text": "t play"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "btn-play",
                    "maxclass": "textbutton",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1060.0, 300.0, 50.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 223.0, 2.0, 54.0, 24.0 ],
                    "text": "play",
                    "textoncolor": [ 0.3, 1.0, 0.3, 1.0 ],
                    "varname": "gl_btn_play",
                    "mode": 1,
                    "bgoncolor": [ 0.32, 0.42, 0.18, 1.0 ],
                    "texton": "play"
                }
            },
            {
                "box": {
                    "id": "tstop",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "stop" ],
                    "patching_rect": [ 1120.0, 380.0, 45.0, 22.0 ],
                    "text": "t stop"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "btn-stop",
                    "maxclass": "textbutton",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1120.0, 300.0, 50.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 281.0, 2.0, 54.0, 24.0 ],
                    "text": "stop",
                    "textoncolor": [ 0.85, 0.85, 0.9, 1.0 ],
                    "varname": "gl_btn_stop"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "seqbox",
                    "maxclass": "number",
                    "maximum": 32,
                    "minimum": 1,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 1180.0, 300.0, 50.0, 26.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 439.0, 1.0, 44.0, 26.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "gl_seq",
                            "parameter_mmax": 10.0,
                            "parameter_mmin": 1.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "gl_seq",
                            "parameter_type": 0
                        }
                    },
                    "varname": "gl_seq"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "seq-c",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1235.0, 300.0, 40.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 403.0, 2.0, 34.0, 24.0 ],
                    "text": "seq"
                }
            },
            {
                "box": {
                    "id": "pseq",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1180.0, 355.0, 80.0, 22.0 ],
                    "text": "prepend seq"
                }
            },
            {
                "box": {
                    "id": "rt",
                    "maxclass": "newobj",
                    "numinlets": 7,
                    "numoutlets": 7,
                    "outlettype": [ "", "", "", "", "", "", "" ],
                    "patching_rect": [ 20.0, 560.0, 270.0, 22.0 ],
                    "text": "route state seq pos refresh error note"
                }
            },
            {
                "box": {
                    "id": "seqfb",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "int", "int" ],
                    "patching_rect": [ 100.0, 600.0, 70.0, 22.0 ],
                    "text": "unpack 0 0"
                }
            },
            {
                "box": {
                    "id": "seqset",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 100.0, 630.0, 75.0, 22.0 ],
                    "text": "prepend set"
                }
            },
            {
                "box": {
                    "id": "pstate",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 300.0, 600.0, 90.0, 22.0 ],
                    "text": "prepend state"
                }
            },
            {
                "box": {
                    "id": "ppos",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 400.0, 600.0, 80.0, 22.0 ],
                    "text": "prepend pos"
                }
            },
            {
                "box": {
                    "id": "pref",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 490.0, 600.0, 100.0, 22.0 ],
                    "text": "prepend loadseq"
                }
            },
            {
                "box": {
                    "id": "perr",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 600.0, 600.0, 120.0, 22.0 ],
                    "text": "print gestureLooper"
                }
            },
            {
                "box": {
                    "embed": 0,
                    "filename": "dingus.gestureRoll.js",
                    "id": "roll",
                    "maxclass": "v8ui",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 300.0, 660.0, 1565.0, 520.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 0.0, 39.0, 1565.0, 520.0 ],
                    "textfile": {
                        "filename": "dingusGestureRoll.js",
                        "flags": 0,
                        "embed": 0,
                        "autowatch": 1
                    },
                    "varname": "gl_roll"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "bars",
                    "maxclass": "number",
                    "maximum": 32,
                    "minimum": 1,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 1300.0, 420.0, 50.0, 26.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1145.0, 1.0, 40.0, 26.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "gl_barsteps",
                            "parameter_mmax": 32.0,
                            "parameter_mmin": 1.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "gl_barsteps",
                            "parameter_type": 0
                        }
                    },
                    "varname": "gl_barsteps"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "bars-c",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1355.0, 420.0, 80.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1061.0, 2.0, 82.0, 24.0 ],
                    "text": "steps/bar"
                }
            },
            {
                "box": {
                    "id": "barsdef",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1300.0, 390.0, 70.0, 22.0 ],
                    "text": "loadmess 4"
                }
            },
            {
                "box": {
                    "id": "pbars",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1300.0, 460.0, 105.0, 22.0 ],
                    "text": "prepend barsteps"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "snapm",
                    "items": [ "free", ",", "1", ",", "1/2", ",", "1/4", ",", "1/8", ",", "1/16" ],
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 1450.0, 420.0, 70.0, 26.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1243.0, 1.0, 60.0, 26.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "free", "1", "1/2", "1/4", "1/8", "1/16" ],
                            "parameter_longname": "gl_snap",
                            "parameter_mmax": 5,
                            "parameter_modmode": 0,
                            "parameter_shortname": "gl_snap",
                            "parameter_type": 2
                        }
                    },
                    "varname": "gl_snap"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "snap-c",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1525.0, 420.0, 45.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1197.0, 2.0, 44.0, 24.0 ],
                    "text": "snap"
                }
            },
            {
                "box": {
                    "id": "snapdef",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1450.0, 390.0, 70.0, 22.0 ],
                    "text": "loadmess 3"
                }
            },
            {
                "box": {
                    "id": "snapl",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 1450.0, 460.0, 230.0, 22.0 ],
                    "text": "zl lookup 0. 1. 0.5 0.25 0.125 0.0625"
                }
            },
            {
                "box": {
                    "id": "psnap",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1450.0, 490.0, 85.0, 22.0 ],
                    "text": "prepend snap"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "lsnap",
                    "items": [ "free", ",", "step", ",", "bar" ],
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 1700.0, 420.0, 70.0, 26.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1399.0, 1.0, 64.0, 26.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "free", "step", "bar" ],
                            "parameter_longname": "gl_loopsnap",
                            "parameter_mmax": 2,
                            "parameter_modmode": 0,
                            "parameter_shortname": "gl_loopsnap",
                            "parameter_type": 2
                        }
                    },
                    "varname": "gl_loopsnap"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "lsnap-c",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1775.0, 420.0, 80.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1315.0, 2.0, 82.0, 24.0 ],
                    "text": "loop snap"
                }
            },
            {
                "box": {
                    "id": "lsdef",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1700.0, 390.0, 70.0, 22.0 ],
                    "text": "loadmess 2"
                }
            },
            {
                "box": {
                    "id": "plsnap",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1700.0, 460.0, 105.0, 22.0 ],
                    "text": "prepend loopsnap"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "bend",
                    "maxclass": "number",
                    "maximum": 96,
                    "minimum": 1,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 1850.0, 420.0, 50.0, 26.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1521.0, 1.0, 44.0, 26.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "gl_bendrange",
                            "parameter_mmax": 96.0,
                            "parameter_mmin": 1.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "gl_bendrange",
                            "parameter_type": 0
                        }
                    },
                    "varname": "gl_bendrange"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "bend-c",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1905.0, 420.0, 90.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1475.0, 2.0, 44.0, 24.0 ],
                    "text": "bend"
                }
            },
            {
                "box": {
                    "id": "benddef",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1850.0, 390.0, 80.0, 22.0 ],
                    "text": "loadmess 48"
                }
            },
            {
                "box": {
                    "id": "pbend",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1850.0, 460.0, 115.0, 22.0 ],
                    "text": "prepend bendrange"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "btn-del",
                    "maxclass": "textbutton",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1450.0, 300.0, 110.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 737.0, 2.0, 64.0, 24.0 ],
                    "text": "del sel",
                    "varname": "gl_btn_delete"
                }
            },
            {
                "box": {
                    "id": "tdel",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "deleteselected" ],
                    "patching_rect": [ 1450.0, 340.0, 105.0, 22.0 ],
                    "text": "t deleteselected"
                }
            },
            {
                "box": {
                    "id": "hint",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 300.0, 1100.0, 1150.0, 33.0 ],
                    "text": "click note = select (shift adds), drag empty = box, drag note = shift in time (cmd = free), option-drag = copy, drag note start/end = trim (alt = free), double-click = del sel; LOOP strip: drag ends or middle (alt = free); bar-number row: drag sideways = scroll, up/down = zoom, double-click = all; PROB lane: drag a bar = playback probability (selected notes together), double-click = 100%; VEL lane: drag a strike (start) or lift (end) bar; dub = overdub on/off (adds notes while playing), undo = the last change; copy / paste = a whole sequence (paste replaces the current one)"
                }
            },
            {
                "box": {
                    "id": "pnote",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 730.0, 600.0, 80.0, 22.0 ],
                    "text": "prepend note"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "btn-clear",
                    "maxclass": "textbutton",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1580.0, 300.0, 60.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 807.0, 2.0, 64.0, 24.0 ],
                    "text": "clear",
                    "textoncolor": [ 1.0, 0.45, 0.35, 1.0 ],
                    "varname": "gl_btn_clear"
                }
            },
            {
                "box": {
                    "id": "tclear",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "clearseq" ],
                    "patching_rect": [ 1580.0, 340.0, 75.0, 22.0 ],
                    "text": "t clearseq"
                }
            },
            {
                "box": {
                    "embed": 0,
                    "filename": "dingus.gestureHead.js",
                    "id": "head",
                    "maxclass": "v8ui",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "parameter_enable": 0,
                    "patching_rect": [ 300.0, 640.0, 1225.0, 10.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 34.0, 28.0, 1527.0, 10.0 ],
                    "textfile": {
                        "filename": "dingusGestureHead.js",
                        "flags": 0,
                        "embed": 0,
                        "autowatch": 1
                    },
                    "varname": "gl_head"
                }
            },
            {
                "box": {
                    "id": "seqm1",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "patching_rect": [ 1180.0, 325.0, 30.0, 22.0 ],
                    "text": "- 1"
                }
            },
            {
                "box": {
                    "id": "seqp1",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "patching_rect": [ 180.0, 615.0, 32.0, 22.0 ],
                    "text": "+ 1"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "btn-dub",
                    "maxclass": "textbutton",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1700.0, 300.0, 60.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 339.0, 2.0, 54.0, 24.0 ],
                    "text": "dub",
                    "textoncolor": [ 1.0, 0.62, 0.1, 1.0 ],
                    "varname": "gl_btn_dub",
                    "mode": 1,
                    "bgoncolor": [ 0.62, 0.33, 0.14, 1.0 ],
                    "texton": "dub"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "btn-undo",
                    "maxclass": "textbutton",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1800.0, 300.0, 60.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 877.0, 2.0, 60.0, 24.0 ],
                    "text": "undo",
                    "textoncolor": [ 0.85, 0.83, 0.78, 1.0 ],
                    "varname": "gl_btn_undo"
                }
            },
            {
                "box": {
                    "id": "tundo",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "undo" ],
                    "patching_rect": [ 1800.0, 340.0, 70.0, 22.0 ],
                    "text": "t undo"
                }
            },
            {
                "box": {
                    "comment": "overdub on (1) / off (0)",
                    "id": "in-dub",
                    "index": 0,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1240.0, 20.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "comment": "undo (bang)",
                    "id": "in-undo",
                    "index": 0,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1300.0, 20.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "id": "pdub",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1240.0, 380.0, 75.0, 22.0 ],
                    "text": "prepend dub"
                }
            },
            {
                "box": {
                    "id": "selplay",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "bang", "" ],
                    "patching_rect": [ 1060, 340, 40, 22.0 ],
                    "text": "sel 1"
                }
            },
            {
                "box": {
                    "id": "lamprec",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 300, 700, 90, 22.0 ],
                    "text": "sel rec"
                }
            },
            {
                "box": {
                    "id": "lampoffrec",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 400, 730, 30, 22.0 ],
                    "text": "t b"
                }
            },
            {
                "box": {
                    "id": "onrec",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 300, 760, 50.0, 22.0 ],
                    "text": "set 1"
                }
            },
            {
                "box": {
                    "id": "offrec",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 360, 760, 50.0, 22.0 ],
                    "text": "set 0"
                }
            },
            {
                "box": {
                    "id": "lampplay",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "" ],
                    "patching_rect": [ 470, 700, 90, 22.0 ],
                    "text": "sel play dub"
                }
            },
            {
                "box": {
                    "id": "lampoffplay",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 570, 730, 30, 22.0 ],
                    "text": "t b"
                }
            },
            {
                "box": {
                    "id": "onplay",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 470, 760, 50.0, 22.0 ],
                    "text": "set 1"
                }
            },
            {
                "box": {
                    "id": "offplay",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 530, 760, 50.0, 22.0 ],
                    "text": "set 0"
                }
            },
            {
                "box": {
                    "id": "lampdub",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 640, 700, 90, 22.0 ],
                    "text": "sel dub"
                }
            },
            {
                "box": {
                    "id": "lampoffdub",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 740, 730, 30, 22.0 ],
                    "text": "t b"
                }
            },
            {
                "box": {
                    "id": "ondub",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 640, 760, 50.0, 22.0 ],
                    "text": "set 1"
                }
            },
            {
                "box": {
                    "id": "offdub",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 700, 760, 50.0, 22.0 ],
                    "text": "set 0"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "btn-copy",
                    "maxclass": "textbutton",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1900.0, 300.0, 60.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 543.0, 2.0, 54.0, 24.0 ],
                    "text": "copy",
                    "textoncolor": [ 0.85, 0.83, 0.78, 1.0 ],
                    "varname": "gl_btn_copy"
                }
            },
            {
                "box": {
                    "id": "tcopy",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "copyseq" ],
                    "patching_rect": [ 1900.0, 340, 75, 22.0 ],
                    "text": "t copyseq"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "btn-paste",
                    "maxclass": "textbutton",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 2000.0, 300.0, 60.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 601.0, 2.0, 58.0, 24.0 ],
                    "text": "paste",
                    "textoncolor": [ 0.85, 0.83, 0.78, 1.0 ],
                    "varname": "gl_btn_paste"
                }
            },
            {
                "box": {
                    "id": "tpaste",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "pasteseq" ],
                    "patching_rect": [ 2000.0, 340, 75, 22.0 ],
                    "text": "t pasteseq"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "btn-minus",
                    "maxclass": "textbutton",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 2100.0, 300.0, 40.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 487.0, 2.0, 24.0, 24.0 ],
                    "text": "-",
                    "textoncolor": [ 0.85, 0.83, 0.78, 1.0 ],
                    "varname": "gl_btn_minus"
                }
            },
            {
                "box": {
                    "id": "mminus",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 2100.0, 340.0, 70.0, 22.0 ],
                    "text": "seqstep -1"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "btn-plus",
                    "maxclass": "textbutton",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 2160.0, 300.0, 40.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 513.0, 2.0, 24.0, 24.0 ],
                    "text": "+",
                    "textoncolor": [ 0.85, 0.83, 0.78, 1.0 ],
                    "varname": "gl_btn_plus"
                }
            },
            {
                "box": {
                    "id": "mplus",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 2160.0, 340.0, 70.0, 22.0 ],
                    "text": "seqstep 1"
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "pbars", 0 ],
                    "source": [ "bars", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "bars", 0 ],
                    "source": [ "barsdef", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pbend", 0 ],
                    "source": [ "bend", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "bend", 0 ],
                    "source": [ "benddef", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "tclear", 0 ],
                    "source": [ "btn-clear", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "tdel", 0 ],
                    "source": [ "btn-del", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "trec", 0 ],
                    "source": [ "btn-rec", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "tstop", 0 ],
                    "source": [ "btn-stop", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "out-midi", 0 ],
                    "source": [ "eng", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "rt", 0 ],
                    "source": [ "eng", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ratetilde", 0 ],
                    "source": [ "in-clock", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "eng", 0 ],
                    "source": [ "in-midi", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "tplay", 0 ],
                    "source": [ "in-play", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "trec", 0 ],
                    "source": [ "in-rec", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "sreset", 0 ],
                    "source": [ "in-reset", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "rateadd", 1 ],
                    "source": [ "in-rmod", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "rrt", 0 ],
                    "source": [ "in-rreset", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "prun", 0 ],
                    "source": [ "in-run", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "seqbox", 0 ],
                    "source": [ "in-seq", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "tstop", 0 ],
                    "source": [ "in-stop", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "lsnap", 0 ],
                    "source": [ "lsdef", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "plsnap", 0 ],
                    "source": [ "lsnap", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "roll", 0 ],
                    "source": [ "pbars", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "roll", 0 ],
                    "source": [ "pbend", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "roll", 0 ],
                    "source": [ "plsnap", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "roll", 0 ],
                    "source": [ "pnote", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "roll", 0 ],
                    "source": [ "ppos", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "roll", 0 ],
                    "source": [ "pref", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "eng", 0 ],
                    "source": [ "prun", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "eng", 0 ],
                    "source": [ "pseq", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "roll", 0 ],
                    "source": [ "psnap", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "roll", 0 ],
                    "source": [ "pstate", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ratesig", 0 ],
                    "source": [ "rate", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ratetilde", 1 ],
                    "source": [ "rateadd", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "rate", 0 ],
                    "source": [ "ratedef", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "rateadd", 0 ],
                    "source": [ "ratesig", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "snap", 0 ],
                    "source": [ "ratetilde", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "eng", 0 ],
                    "source": [ "roll", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "head", 0 ],
                    "source": [ "roll", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ratetilde", 0 ],
                    "source": [ "rrm", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "rrm", 0 ],
                    "source": [ "rrt", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "perr", 0 ],
                    "source": [ "rt", 4 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pnote", 0 ],
                    "source": [ "rt", 5 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ppos", 0 ],
                    "source": [ "rt", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pref", 0 ],
                    "source": [ "rt", 3 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pstate", 0 ],
                    "order": 0,
                    "source": [ "rt", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "seqfb", 0 ],
                    "source": [ "rt", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "seqm1", 0 ],
                    "source": [ "seqbox", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "seqp1", 0 ],
                    "source": [ "seqfb", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pseq", 0 ],
                    "source": [ "seqm1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "seqset", 0 ],
                    "source": [ "seqp1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "seqbox", 0 ],
                    "source": [ "seqset", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "eng", 1 ],
                    "source": [ "snap", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "snapm", 0 ],
                    "source": [ "snapdef", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "psnap", 0 ],
                    "source": [ "snapl", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "snapl", 0 ],
                    "source": [ "snapm", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "eng", 0 ],
                    "source": [ "sreset", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "eng", 0 ],
                    "source": [ "tclear", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "roll", 0 ],
                    "source": [ "tdel", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "eng", 0 ],
                    "source": [ "tplay", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "eng", 0 ],
                    "source": [ "trec", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "eng", 0 ],
                    "source": [ "tstop", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "tundo", 0 ],
                    "source": [ "btn-undo", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "eng", 0 ],
                    "source": [ "tundo", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pdub", 0 ],
                    "source": [ "in-dub", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "eng", 0 ],
                    "source": [ "pdub", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "tundo", 0 ],
                    "source": [ "in-undo", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "btn-rec", 0 ],
                    "source": [ "obj-1", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "btn-play", 0 ],
                    "source": [ "obj-1", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "btn-stop", 0 ],
                    "source": [ "obj-1", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "btn-del", 0 ],
                    "source": [ "obj-1", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "btn-clear", 0 ],
                    "source": [ "obj-1", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "btn-dub", 0 ],
                    "source": [ "obj-1", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "btn-undo", 0 ],
                    "source": [ "obj-1", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "selplay", 0 ],
                    "source": [ "btn-play", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "tplay", 0 ],
                    "source": [ "selplay", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "tstop", 0 ],
                    "source": [ "selplay", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pdub", 0 ],
                    "source": [ "btn-dub", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "lamprec", 0 ],
                    "source": [ "rt", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "onrec", 0 ],
                    "source": [ "lamprec", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "lampoffrec", 0 ],
                    "source": [ "lamprec", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "offrec", 0 ],
                    "source": [ "lampoffrec", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "btn-rec", 0 ],
                    "source": [ "onrec", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "btn-rec", 0 ],
                    "source": [ "offrec", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "lampplay", 0 ],
                    "source": [ "rt", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "onplay", 0 ],
                    "source": [ "lampplay", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "onplay", 0 ],
                    "source": [ "lampplay", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "lampoffplay", 0 ],
                    "source": [ "lampplay", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "offplay", 0 ],
                    "source": [ "lampoffplay", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "btn-play", 0 ],
                    "source": [ "onplay", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "btn-play", 0 ],
                    "source": [ "offplay", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "lampdub", 0 ],
                    "source": [ "rt", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ondub", 0 ],
                    "source": [ "lampdub", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "lampoffdub", 0 ],
                    "source": [ "lampdub", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "offdub", 0 ],
                    "source": [ "lampoffdub", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "btn-dub", 0 ],
                    "source": [ "ondub", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "btn-dub", 0 ],
                    "source": [ "offdub", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "tcopy", 0 ],
                    "source": [ "btn-copy", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "eng", 0 ],
                    "source": [ "tcopy", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "tpaste", 0 ],
                    "source": [ "btn-paste", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "eng", 0 ],
                    "source": [ "tpaste", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "btn-copy", 0 ],
                    "source": [ "obj-1", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "btn-paste", 0 ],
                    "source": [ "obj-1", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mminus", 0 ],
                    "source": [ "btn-minus", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "eng", 0 ],
                    "source": [ "mminus", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mplus", 0 ],
                    "source": [ "btn-plus", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "eng", 0 ],
                    "source": [ "mplus", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "btn-minus", 0 ],
                    "source": [ "obj-1", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "btn-plus", 0 ],
                    "source": [ "obj-1", 1 ]
                }
            }
        ],
        "parameters": {
            "bars": [ "gl_barsteps", "gl_barsteps", 0 ],
            "bend": [ "gl_bendrange", "gl_bendrange", 0 ],
            "lsnap": [ "gl_loopsnap", "gl_loopsnap", 0 ],
            "rate": [ "rate", "rate", 0 ],
            "seqbox": [ "gl_seq", "gl_seq", 0 ],
            "snapm": [ "gl_snap", "gl_snap", 0 ],
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