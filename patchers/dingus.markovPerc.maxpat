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
        "rect": [ 34.0, 92.0, 1500.0, 900.0 ],
        "openinpresentation": 1,
        "default_fontsize": 8.0,
        "integercoordinates": 1,
        "parameters": {
            "obj-12": [ "snap", "snap", 0 ],
            "ptm": [ "ptnmode", "ptnmode", 0 ],
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
        "autosave": 0,
        "boxes": [
            {
                "box": {
                    "id": "mcp",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 550.0, 13.0, 100.0, 17.0 ],
                    "saved_object_attributes": {
                        "alias": "",
                        "group": ""
                    },
                    "text": "maxmcp uMP"
                }
            },
            {
                "box": {
                    "fontsize": 18.0,
                    "id": "hdr",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 10.0, 80.0, 27.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 2.0, 0.0, 60.0, 27.0 ],
                    "text": "uMP"
                }
            },
            {
                "box": {
                    "id": "use",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 100.0, 14.0, 420.0, 15.0 ],
                    "text": "USE [bpatcher dingus.markovPerc.maxpat @args NAME]"
                }
            },
            {
                "box": {
                    "embed": 0,
                    "filename": "dingus.markovPercRoll.js",
                    "id": "roll",
                    "maxclass": "v8ui",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1300.0, 900.0, 1300.0, 808.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 190.0, 32.0, 1300.0, 808.0 ],
                    "textfile": {
                        "filename": "dingus.markovPercRoll.js",
                        "flags": 0,
                        "embed": 0,
                        "autowatch": 1
                    },
                    "varname": "mproll"
                }
            },
            {
                "box": {
                    "id": "lb",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 400.0, 160.0, 60.0, 17.0 ],
                    "text": "loadbang"
                }
            },
            {
                "box": {
                    "id": "bufdel",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 580.0, 170.0, 65.0, 17.0 ],
                    "text": "delay 500"
                }
            },
            {
                "box": {
                    "id": "bufm",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 400.0, 200.0, 242.0, 17.0 ],
                    "text": "buffer #0-mp, chbuffer #0-mpch, seqname #1"
                }
            },
            {
                "box": {
                    "id": "bufgen",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 600.0, 200.0, 150.0, 17.0 ],
                    "text": "gb #0-mp, cb #0-mpch"
                }
            },
            {
                "box": {
                    "id": "un_cmt",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1900.0, 874.0, 420.0, 24.0 ],
                    "text": "Ctrl+Z = undo, Ctrl+Shift+Z = redo (the roll that was used last acts). key code 6 = the Z key; 4096 = control, 512 = shift"
                }
            },
            {
                "box": {
                    "id": "un_key",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 4,
                    "outlettype": [ "int", "int", "int", "int" ],
                    "patching_rect": [ 1900.0, 900.0, 60.0, 17.0 ],
                    "text": "key"
                }
            },
            {
                "box": {
                    "id": "un_expr",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1900.0, 930.0, 470.0, 17.0 ],
                    "text": "expr ($i1 == 6) * (($i2 & 4096) != 0) * (1 + (($i2 & 512) != 0))"
                }
            },
            {
                "box": {
                    "id": "un_sel",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 3,
                    "outlettype": [ "bang", "bang", "" ],
                    "patching_rect": [ 1900.0, 960.0, 60.0, 17.0 ],
                    "text": "sel 1 2"
                }
            },
            {
                "box": {
                    "id": "un_undo",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1900.0, 990.0, 40.0, 17.0 ],
                    "text": "undo"
                }
            },
            {
                "box": {
                    "id": "un_redo",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1950.0, 990.0, 40.0, 17.0 ],
                    "text": "redo"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "help_btn",
                    "maxclass": "textbutton",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 40.0, 1400.0, 24.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 158.0, 228.0, 26.0, 22.0 ],
                    "text": "?",
                    "texton": "?",
                    "varname": "helpbtn"
                }
            },
            {
                "box": {
                    "id": "help_t",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 40.0, 1430.0, 30.0, 17.0 ],
                    "text": "t b"
                }
            },
            {
                "box": {
                    "id": "help_open",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 40.0, 1455.0, 40.0, 17.0 ],
                    "text": "open"
                }
            },
            {
                "box": {
                    "id": "help_pc",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 40.0, 1480.0, 55.0, 17.0 ],
                    "text": "pcontrol"
                }
            },
            {
                "box": {
                    "id": "help_p",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
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
                        "rect": [ 120.0, 120.0, 940.0, 416.0 ],
                        "toolbarvisible": 0,
                        "enablehscroll": 0,
                        "enablevscroll": 0,
                        "integercoordinates": 1,
                        "boxes": [
                            {
                                "box": {
                                    "id": "help_c0",
                                    "maxclass": "comment",
                                    "text": "ROWS (left strip)\nM = mute (the row keeps walking)\nS = the row's START: click, drag to a hit = link\nP / T = clock: phasor / trigger inlet\nsteps: drag = steps per cycle\n   (T: left half = div, right half = steps drawn)\nrs: drag = restart every rs steps (- = never)\n   double-click = one cycle\n\nHITS\nclick = new hit, drag right = length\na hit's length = the time until its row moves on\n   (where it sits = only the order; gaps take no time)\ndrag the end = length (alt = free)\ndrag = move (up / down = into another row),\n   option-drag = copy\ndouble-click = delete\nshift-drag empty space = pick a group",
                                    "fontsize": 16.0,
                                    "linecount": 18,
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 20.0, 20.0, 440.0, 376.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "help_c1",
                                    "maxclass": "comment",
                                    "text": "LINKS\nshift-drag hit to hit (same row) = link\nshift-drag to a hit in ANOTHER row = follow link\n   (teal): that row jumps there at once when this\n   hit plays; several into one row = one of them,\n   each its own %, the rest = no push\nclick a hit or S: its links get % handles\ndrag a handle = chance, double-click = delete\ngrey ghosts = where each row's walk plays\n   (red end = cut by a restart)\n\nLANES (the selected hit)\nVEL  RATCH  ACC (accent)  ATK  DEC  CURVE\nCHANCE: click a cell = editor, op band = menu\n\nOUT: 8 trigger outlets (rows 1-8, level = velocity),\nthen 8 envelope outlets\nCtrl+Z / Ctrl+Shift+Z = undo / redo",
                                    "fontsize": 16.0,
                                    "linecount": 18,
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 480.0, 20.0, 440.0, 376.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "help_in",
                                    "maxclass": "inlet",
                                    "comment": "",
                                    "index": 1,
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 900.0, 436.0, 30.0, 30.0 ]
                                }
                            }
                        ],
                        "lines": []
                    },
                    "patching_rect": [ 40.0, 1505.0, 45.0, 17.0 ],
                    "text": "p help"
                }
            },
            {
                "box": {
                    "annotation": "clock phasor",
                    "comment": "clock phasor",
                    "hint": "clock phasor",
                    "id": "g_in-clock",
                    "index": 0,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 700.0, 20.0, 30.0, 22.0 ]
                }
            },
            {
                "box": {
                    "annotation": "step reset (bang)",
                    "comment": "restart now (bang)",
                    "hint": "step reset (bang)",
                    "id": "g_in-reset",
                    "index": 0,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 820.0, 20.0, 30.0, 22.0 ]
                }
            },
            {
                "box": {
                    "annotation": "rate~ reset (bang)",
                    "comment": "rate~ reset (bang)",
                    "hint": "rate~ reset (bang)",
                    "id": "g_in-rreset",
                    "index": 0,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 880.0, 20.0, 30.0, 22.0 ]
                }
            },
            {
                "box": {
                    "annotation": "play (1) / pause (0)",
                    "comment": "play (1) / pause (0)",
                    "hint": "play (1) / pause (0)",
                    "id": "g_in-play",
                    "index": 0,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 940.0, 20.0, 30.0, 22.0 ]
                }
            },
            {
                "box": {
                    "comment": "freeze: 1 = on, 0 = off",
                    "id": "g_in-lmod",
                    "index": 0,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1000.0, 20.0, 30.0, 22.0 ]
                }
            },
            {
                "box": {
                    "annotation": "rate mod (signal, added)",
                    "comment": "rate mod (signal, added)",
                    "hint": "rate mod (signal, added)",
                    "id": "g_in-rmod",
                    "index": 0,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1060.0, 20.0, 30.0, 22.0 ]
                }
            },
            {
                "box": {
                    "comment": "chance scale 0..2 (x all probabilities)",
                    "id": "in-cscale",
                    "index": 0,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1120.0, 20.0, 30.0, 22.0 ]
                }
            },
            {
                "box": {
                    "comment": "bar: bang per bar (for PTN in bar mode); reset = count from 0",
                    "id": "in-bar",
                    "index": 0,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1180.0, 20.0, 30.0, 22.0 ]
                }
            },
            {
                "box": {
                    "comment": "sequence 1-32 (takes over at the phasor wrap)",
                    "id": "sq_in",
                    "index": 0,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1240.0, 20.0, 30.0, 22.0 ]
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "format": 6,
                    "id": "g_rate",
                    "maxclass": "flonum",
                    "minimum": 0.0625,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 1330.0, 200.0, 60.0, 26.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 2.0, 32.0, 54.0, 26.0 ],
                    "varname": "rate",
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
                    "fontsize": 16.0,
                    "id": "g_c-rate",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1395.0, 200.0, 50.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 58.0, 33.0, 50.0, 24.0 ],
                    "text": "rate"
                }
            },
            {
                "box": {
                    "id": "g_ratesig",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 1330.0, 240.0, 54.0, 17.0 ],
                    "text": "sig~ 1"
                }
            },
            {
                "box": {
                    "id": "g_rateadd",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 1330.0, 275.0, 30.0, 17.0 ],
                    "text": "+~"
                }
            },
            {
                "box": {
                    "id": "g_ratereset_t",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 1530.0, 200.0, 33.0, 17.0 ],
                    "text": "t b"
                }
            },
            {
                "box": {
                    "id": "g_ratereset",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1530.0, 235.0, 40.0, 17.0 ],
                    "text": "reset"
                }
            },
            {
                "box": {
                    "id": "g_ratetilde",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 1250.0, 310.0, 86.0, 17.0 ],
                    "text": "rate~ @sync 1",
                    "varname": "pgrate"
                }
            },
            {
                "box": {
                    "activelinecolor": [ 1.0, 0.709803921568627, 0.196078431372549, 0.65 ],
                    "id": "g_scope-rate",
                    "maxclass": "live.scope~",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 1360.0, 310.0, 95.0, 40.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 2.0, 60.0, 182.0, 46.0 ],
                    "range": [ -0.1, 1.1 ],
                    "varname": "sc_d"
                }
            },
            {
                "box": {
                    "activebgcolor": [ 0.156862745098039, 0.156862745098039, 0.156862745098039, 0.0 ],
                    "activelinecolor": [ 0.3607843137254902, 1.0, 0.19607843137254902, 1.0 ],
                    "id": "ck_ticks",
                    "maxclass": "live.scope~",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 1480.0, 325.0, 95.0, 40.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 2.0, 60.0, 182.0, 46.0 ],
                    "range": [ -0.1, 1.1 ],
                    "varname": "sc_e"
                }
            },
            {
                "box": {
                    "id": "g_stepreset_t",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 1400.0, 350.0, 33.0, 17.0 ],
                    "text": "t b"
                }
            },
            {
                "box": {
                    "id": "g_click",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 1400.0, 380.0, 54.0, 17.0 ],
                    "text": "click~"
                }
            },
            {
                "box": {
                    "id": "g_playmsg",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1650.0, 380.0, 55.0, 17.0 ],
                    "text": "play $1"
                }
            },
            {
                "box": {
                    "id": "mk_freeze",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 1600.0, 820.0, 24.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 2.0, 170.0, 20.0, 20.0 ],
                    "varname": "freeze",
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "off", "on" ],
                            "parameter_longname": "freeze",
                            "parameter_mmax": 1,
                            "parameter_modmode": 0,
                            "parameter_shortname": "freeze",
                            "parameter_type": 2
                        }
                    }
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "mk_fc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1500.0, 820.0, 53.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 24.0, 167.0, 56.0, 24.0 ],
                    "text": "freeze"
                }
            },
            {
                "box": {
                    "id": "mk_freezem",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1700.0, 820.0, 90.0, 17.0 ],
                    "text": "freeze $1"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "mk_mc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1500.0, 820.0, 76.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 82.0, 167.0, 76.0, 24.0 ],
                    "text": "mutate %"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "mk_mutate",
                    "maxclass": "number",
                    "maximum": 100,
                    "minimum": 0,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 1600.0, 860.0, 50.0, 26.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 146.0, 166.0, 38.0, 26.0 ],
                    "varname": "mutate",
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_invisible": 1,
                            "parameter_longname": "mutate",
                            "parameter_modmode": 0,
                            "parameter_shortname": "mutate",
                            "parameter_type": 3
                        }
                    }
                }
            },
            {
                "box": {
                    "id": "mk_mutdiv",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "patching_rect": [ 1660.0, 860.0, 50.0, 17.0 ],
                    "text": "/ 100."
                }
            },
            {
                "box": {
                    "id": "mk_mutatem",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1700.0, 890.0, 90.0, 17.0 ],
                    "text": "mutate $1"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.1607843137254902, 0.1803921568627451, 0.3333333333333333, 1.0 ],
                    "id": "ptm",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 700.0, 950.0, 24.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 2.0, 200.0, 20.0, 20.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "off", "on" ],
                            "parameter_longname": "ptnmode",
                            "parameter_mmax": 1,
                            "parameter_modmode": 0,
                            "parameter_shortname": "ptnmode",
                            "parameter_type": 2
                        }
                    },
                    "uncheckedcolor": [ 0.21176470588235294, 0.20392156862745098, 0.22745098039215686, 1.0 ],
                    "varname": "ptnmode"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "ptmc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 730.0, 950.0, 144.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 24.0, 197.0, 157.0, 24.0 ],
                    "text": "PTN counts bars"
                }
            },
            {
                "box": {
                    "id": "ptmm",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 700.0, 980.0, 80.0, 17.0 ],
                    "text": "ptnmode $1"
                }
            },
            {
                "box": {
                    "id": "csm",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1150.0, 60.0, 70.0, 17.0 ],
                    "text": "cscale $1"
                }
            },
            {
                "box": {
                    "id": "barrt",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 1200.0, 60.0, 75.0, 17.0 ],
                    "text": "route reset"
                }
            },
            {
                "box": {
                    "id": "barct",
                    "maxclass": "newobj",
                    "numinlets": 5,
                    "numoutlets": 4,
                    "outlettype": [ "int", "", "", "int" ],
                    "patching_rect": [ 1200.0, 90.0, 60.0, 17.0 ],
                    "text": "counter"
                }
            },
            {
                "box": {
                    "id": "barzero",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1280.0, 90.0, 30.0, 17.0 ],
                    "text": "0"
                }
            },
            {
                "box": {
                    "id": "barm",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1200.0, 120.0, 80.0, 17.0 ],
                    "text": "barcount $1"
                }
            },
            {
                "box": {
                    "id": "apat",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 4,
                    "outlettype": [ "", "", "", "" ],
                    "patching_rect": [ 1700.0, 700.0, 150.0, 17.0 ],
                    "text": "autopattr @autorestore 0",
                    "varname": "u_mp_autopattr"
                }
            },
            {
                "box": {
                    "id": "ppre",
                    "maxclass": "preset",
                    "numinlets": 1,
                    "numoutlets": 5,
                    "outlettype": [ "preset", "int", "preset", "int", "" ],
                    "patching_rect": [ 1700.0, 730.0, 150.0, 20.0 ],
                    "pattrstorage": "#1_uMP",
                    "presentation": 1,
                    "presentation_rect": [ 2.0, 292.0, 182.0, 52.0 ]
                }
            },
            {
                "box": {
                    "id": "plogic",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "" ],
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
                        "rect": [ 100.0, 100.0, 640.0, 360.0 ],
                        "integercoordinates": 1,
                        "boxes": [
                            {
                                "box": {
                                    "id": "lb",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "bang" ],
                                    "patching_rect": [ 30.0, 60.0, 58.0, 22.0 ],
                                    "text": "loadbang"
                                }
                            },
                            {
                                "box": {
                                    "id": "pri",
                                    "linecount": 2,
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 30.0, 110.0, 420.0, 22.0 ],
                                    "text": "priority rate -2, priority mproll -1"
                                }
                            },
                            {
                                "box": {
                                    "id": "bind",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 250.0, 150.0, 140.0, 22.0 ],
                                    "text": "pattrstorage #1_uMP"
                                }
                            },
                            {
                                "box": {
                                    "id": "load",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 420.0, 190.0, 78.0, 22.0 ],
                                    "text": "readpresets"
                                }
                            },
                            {
                                "box": {
                                    "comment": "preset store (int)",
                                    "id": "in1",
                                    "index": 1,
                                    "maxclass": "inlet",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "int" ],
                                    "patching_rect": [ 500.0, 20.0, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "tb",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "bang" ],
                                    "patching_rect": [ 500.0, 110.0, 24.0, 22.0 ],
                                    "text": "t b"
                                }
                            },
                            {
                                "box": {
                                    "id": "def",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 500.0, 150.0, 58.0, 22.0 ],
                                    "text": "deferlow"
                                }
                            },
                            {
                                "box": {
                                    "id": "save",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 500.0, 190.0, 35.0, 22.0 ],
                                    "text": "save"
                                }
                            },
                            {
                                "box": {
                                    "comment": "to pattrstorage",
                                    "id": "o1",
                                    "index": 1,
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 30.0, 280.0, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "comment": "to preset",
                                    "id": "o2",
                                    "index": 2,
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 250.0, 280.0, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "comment": "to preset file js",
                                    "id": "o3",
                                    "index": 3,
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 450.0, 280.0, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "cm",
                                    "linecount": 2,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 30.0, 20.0, 440.0, 20.0 ],
                                    "text": "presets: file _maxPresets/uMP_<bpatcher argument>.json, read at load, written on every store"
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "destination": [ "o2", 0 ],
                                    "source": [ "bind", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "save", 0 ],
                                    "source": [ "def", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "tb", 0 ],
                                    "source": [ "in1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "bind", 0 ],
                                    "order": 1,
                                    "source": [ "lb", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "load", 0 ],
                                    "order": 0,
                                    "source": [ "lb", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "pri", 0 ],
                                    "order": 2,
                                    "source": [ "lb", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "o3", 0 ],
                                    "source": [ "load", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "o1", 0 ],
                                    "source": [ "pri", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "o3", 0 ],
                                    "source": [ "save", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "def", 0 ],
                                    "source": [ "tb", 0 ]
                                }
                            }
                        ]
                    },
                    "patching_rect": [ 1700.0, 760.0, 101.0, 17.0 ],
                    "text": "p presetLogic"
                }
            },
            {
                "box": {
                    "id": "pstore",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1700.0, 820.0, 300.0, 17.0 ],
                    "priority": {
                        "rate": -2,
                        "mproll": -1
                    },
                    "saved_object_attributes": {
                        "client_rect": [ 580, 87, 949, 304 ],
                        "parameter_enable": 0,
                        "parameter_mappable": 0,
                        "storage_rect": [ 583, 69, 1034, 197 ]
                    },
                    "text": "pattrstorage #1_uMP @savemode 0 @autorestore 0",
                    "varname": "#1_uMP"
                }
            },
            {
                "box": {
                    "filename": "dingus.presetFile.js",
                    "id": "pjs",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1700.0, 790.0, 190.0, 17.0 ],
                    "saved_object_attributes": {
                        "embed": 0,
                        "parameter_enable": 0
                    },
                    "text": "v8 dingus.presetFile.js uMP #1",
                    "textfile": {
                        "filename": "dingus.presetFile.js",
                        "flags": 0,
                        "embed": 0,
                        "autowatch": 1
                    }
                }
            },
            {
                "box": {
                    "id": "pjs_slotfilter",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 1910.0, 790.0, 120.0, 17.0 ],
                    "text": "routepass slotlist"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "id": "pcm",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1700.0, 670.0, 521.0, 15.0 ],
                    "text": "PRESETS: _maxPresets/uMP_<bpatcher argument>.json (click = recall, shift-click = store)"
                }
            },
            {
                "box": {
                    "id": "sq_bchg",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "int", "int" ],
                    "patching_rect": [ 1250.0, 1290.0, 50.0, 17.0 ],
                    "text": "change"
                }
            },
            {
                "box": {
                    "id": "sq_bpp",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1250.0, 1320.0, 100.0, 17.0 ],
                    "text": "prepend bankis"
                }
            },
            {
                "box": {
                    "id": "sq_dsp",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 4,
                    "outlettype": [ "int", "float", "int", "int" ],
                    "patching_rect": [ 1400.0, 1260.0, 70.0, 17.0 ],
                    "text": "dspstate~"
                }
            },
            {
                "box": {
                    "id": "sq_dsppp",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1400.0, 1290.0, 80.0, 17.0 ],
                    "text": "prepend dsp"
                }
            },
            {
                "box": {
                    "id": "sq_setsq",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 700.0, 1300.0, 75.0, 17.0 ],
                    "text": "prepend set"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "sq_cmt",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 40.0, 1230.0, 40.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 190.0, 2.0, 36.0, 24.0 ],
                    "text": "seq"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "sq_box",
                    "maxclass": "number",
                    "maximum": 32,
                    "minimum": 1,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 40.0, 1260.0, 58.0, 26.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 228.0, 1.0, 44.0, 26.0 ],
                    "textcolor": [ 0.8901960784313725, 0.6352941176470588, 0.3764705882352941, 1.0 ],
                    "varname": "pg_seq"
                }
            },
            {
                "box": {
                    "id": "sq_m1",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "patching_rect": [ 40.0, 1300.0, 40.0, 17.0 ],
                    "text": "- 1"
                }
            },
            {
                "box": {
                    "id": "sq_pseq",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 40.0, 1340.0, 80.0, 17.0 ],
                    "text": "prepend seq"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "sq_minus",
                    "maxclass": "textbutton",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 110.0, 1260.0, 24.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 276.0, 2.0, 24.0, 22.0 ],
                    "text": "-"
                }
            },
            {
                "box": {
                    "id": "sq_minus_m",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 110.0, 1300.0, 80.0, 17.0 ],
                    "text": "seqstep -1"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "sq_plus",
                    "maxclass": "textbutton",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 150.0, 1260.0, 24.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 304.0, 2.0, 24.0, 22.0 ],
                    "text": "+"
                }
            },
            {
                "box": {
                    "id": "sq_plus_m",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 190.0, 1300.0, 72.0, 17.0 ],
                    "text": "seqstep 1"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "sq_copy",
                    "maxclass": "textbutton",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 190.0, 1260.0, 50.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 336.0, 2.0, 52.0, 22.0 ],
                    "text": "copy"
                }
            },
            {
                "box": {
                    "id": "sq_copy_m",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 270.0, 1300.0, 70.0, 17.0 ],
                    "text": "copyseq"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "sq_paste",
                    "maxclass": "textbutton",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 250.0, 1260.0, 54.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 392.0, 2.0, 56.0, 22.0 ],
                    "text": "paste"
                }
            },
            {
                "box": {
                    "id": "sq_paste_m",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 350.0, 1300.0, 70.0, 17.0 ],
                    "text": "pasteseq"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "sq_clear",
                    "maxclass": "textbutton",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 320.0, 1260.0, 54.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 452.0, 2.0, 54.0, 22.0 ],
                    "text": "clear",
                    "textoncolor": [ 1.0, 0.34509803921568627, 0.34509803921568627, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "sq_clear_m",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 430.0, 1300.0, 70.0, 17.0 ],
                    "text": "clear"
                }
            },
            {
                "box": {
                    "id": "sq_dlg",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 3,
                    "outlettype": [ "", "bang", "bang" ],
                    "patching_rect": [ 1250.0, 1360.0, 300.0, 17.0 ],
                    "text": "dialog @mode 2 @label \"Empty all 32 sequences?\""
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "obj-8",
                    "maxclass": "textbutton",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 386.0, 116.0, 100.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 512.0, 2.0, 80.0, 22.0 ],
                    "text": "clear all",
                    "textoncolor": [ 1.0, 0.34509803921568627, 0.34509803921568627, 1.0 ],
                    "varname": "clearbtn"
                }
            },
            {
                "box": {
                    "id": "obj-9",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "clearall" ],
                    "patching_rect": [ 386.0, 146.0, 100.0, 17.0 ],
                    "text": "t clearall",
                    "varname": "cleart"
                }
            },
            {
                "box": {
                    "id": "obj-12",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 40.0, 620.0, 24.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 2.0, 140.0, 20.0, 20.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "off", "on" ],
                            "parameter_longname": "snap",
                            "parameter_mmax": 1,
                            "parameter_modmode": 0,
                            "parameter_shortname": "snap",
                            "parameter_type": 2
                        }
                    },
                    "varname": "snap"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "snc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 40.0, 600.0, 50.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 24.0, 137.0, 50.0, 24.0 ],
                    "text": "snap"
                }
            },
            {
                "box": {
                    "id": "snpp",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 40.0, 680.0, 90.0, 17.0 ],
                    "text": "prepend snap",
                    "varname": "pg_psnap"
                }
            },
            {
                "box": {
                    "id": "obj-13",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 200.0, 590.0, 70.0, 17.0 ],
                    "text": "loadmess 1",
                    "varname": "pg_snapon"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "obj-3",
                    "maxclass": "number",
                    "maximum": 16,
                    "minimum": 1,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 280.0, 80.0, 66.0, 26.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 148.0, 110.0, 36.0, 26.0 ],
                    "varname": "beat",
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_invisible": 1,
                            "parameter_longname": "beat",
                            "parameter_modmode": 0,
                            "parameter_shortname": "beat",
                            "parameter_type": 3
                        }
                    }
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "obj-7",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 330.0, 80.0, 250.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 110.0, 110.0, 40.0, 24.0 ],
                    "text": "beat",
                    "varname": "pg_beatcmt"
                }
            },
            {
                "box": {
                    "id": "obj-5",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 280.0, 30.0, 100.0, 17.0 ],
                    "text": "loadmess 1",
                    "varname": "pg_beatinit"
                }
            },
            {
                "box": {
                    "id": "obj-4",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 280.0, 110.0, 100.0, 17.0 ],
                    "text": "prepend beat",
                    "varname": "pg_pbeat"
                }
            },
            {
                "box": {
                    "id": "g_scope-gate",
                    "maxclass": "live.scope~",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 1360.0, 620.0, 233.0, 40.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 2.0, 424.0, 182.0, 40.0 ],
                    "range": [ 0.0, 1.5 ],
                    "varname": "sc_c",
                    "activelinecolor": [ 0.85, 0.65, 0.3, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "g_scope-env",
                    "maxclass": "live.scope~",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 1500.0, 1045.0, 233.0, 60.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 2.0, 468.0, 182.0, 50.0 ],
                    "range": [ 0.0, 1.5 ],
                    "varname": "sc_b"
                }
            },
            {
                "box": {
                    "id": "in-trig",
                    "maxclass": "inlet",
                    "patching_rect": [ 760.0, 20.0, 30.0, 22.0 ],
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "index": 0,
                    "comment": "trigger clock (signal): rows set to T step on every div-th rising edge"
                }
            },
            {
                "box": {
                    "id": "mp_gen",
                    "maxclass": "newobj",
                    "patching_rect": [ 700.0, 420.0, 420.0, 26.0 ],
                    "text": "mc.gen~ dingus.markovPerc @chans 8",
                    "numinlets": 4,
                    "numoutlets": 5,
                    "outlettype": [ "multichannelsignal", "multichannelsignal", "multichannelsignal", "multichannelsignal", "multichannelsignal" ],
                    "fontsize": 16.0,
                    "varname": "mpgen"
                }
            },
            {
                "box": {
                    "id": "mp_dupP",
                    "maxclass": "newobj",
                    "patching_rect": [ 700.0, 360.0, 90.0, 26.0 ],
                    "text": "mc.dup~ 8",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "multichannelsignal" ],
                    "fontsize": 16.0
                }
            },
            {
                "box": {
                    "id": "mp_dupT",
                    "maxclass": "newobj",
                    "patching_rect": [ 810.0, 360.0, 90.0, 26.0 ],
                    "text": "mc.dup~ 8",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "multichannelsignal" ],
                    "fontsize": 16.0
                }
            },
            {
                "box": {
                    "id": "mp_dupR",
                    "maxclass": "newobj",
                    "patching_rect": [ 920.0, 360.0, 90.0, 26.0 ],
                    "text": "mc.dup~ 8",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "multichannelsignal" ],
                    "fontsize": 16.0
                }
            },
            {
                "box": {
                    "id": "mp_unpT",
                    "maxclass": "newobj",
                    "patching_rect": [ 700.0, 640.0, 120.0, 26.0 ],
                    "text": "mc.unpack~ 8",
                    "numinlets": 1,
                    "numoutlets": 8,
                    "outlettype": [ "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal" ],
                    "fontsize": 16.0
                }
            },
            {
                "box": {
                    "id": "mp_unpE",
                    "maxclass": "newobj",
                    "patching_rect": [ 1400.0, 640.0, 120.0, 26.0 ],
                    "text": "mc.unpack~ 8",
                    "numinlets": 1,
                    "numoutlets": 8,
                    "outlettype": [ "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal" ],
                    "fontsize": 16.0
                }
            },
            {
                "box": {
                    "id": "out-t0",
                    "maxclass": "outlet",
                    "patching_rect": [ 700.0, 720.0, 30.0, 22.0 ],
                    "numinlets": 1,
                    "numoutlets": 0,
                    "index": 0,
                    "comment": "row 1 trigger (signal, level = velocity)"
                }
            },
            {
                "box": {
                    "id": "out-e0",
                    "maxclass": "outlet",
                    "patching_rect": [ 1400.0, 720.0, 30.0, 22.0 ],
                    "numinlets": 1,
                    "numoutlets": 0,
                    "index": 0,
                    "comment": "row 1 envelope (signal, peak = velocity)"
                }
            },
            {
                "box": {
                    "id": "out-t1",
                    "maxclass": "outlet",
                    "patching_rect": [ 760.0, 720.0, 30.0, 22.0 ],
                    "numinlets": 1,
                    "numoutlets": 0,
                    "index": 0,
                    "comment": "row 2 trigger (signal, level = velocity)"
                }
            },
            {
                "box": {
                    "id": "out-e1",
                    "maxclass": "outlet",
                    "patching_rect": [ 1460.0, 720.0, 30.0, 22.0 ],
                    "numinlets": 1,
                    "numoutlets": 0,
                    "index": 0,
                    "comment": "row 2 envelope (signal, peak = velocity)"
                }
            },
            {
                "box": {
                    "id": "out-t2",
                    "maxclass": "outlet",
                    "patching_rect": [ 820.0, 720.0, 30.0, 22.0 ],
                    "numinlets": 1,
                    "numoutlets": 0,
                    "index": 0,
                    "comment": "row 3 trigger (signal, level = velocity)"
                }
            },
            {
                "box": {
                    "id": "out-e2",
                    "maxclass": "outlet",
                    "patching_rect": [ 1520.0, 720.0, 30.0, 22.0 ],
                    "numinlets": 1,
                    "numoutlets": 0,
                    "index": 0,
                    "comment": "row 3 envelope (signal, peak = velocity)"
                }
            },
            {
                "box": {
                    "id": "out-t3",
                    "maxclass": "outlet",
                    "patching_rect": [ 880.0, 720.0, 30.0, 22.0 ],
                    "numinlets": 1,
                    "numoutlets": 0,
                    "index": 0,
                    "comment": "row 4 trigger (signal, level = velocity)"
                }
            },
            {
                "box": {
                    "id": "out-e3",
                    "maxclass": "outlet",
                    "patching_rect": [ 1580.0, 720.0, 30.0, 22.0 ],
                    "numinlets": 1,
                    "numoutlets": 0,
                    "index": 0,
                    "comment": "row 4 envelope (signal, peak = velocity)"
                }
            },
            {
                "box": {
                    "id": "out-t4",
                    "maxclass": "outlet",
                    "patching_rect": [ 940.0, 720.0, 30.0, 22.0 ],
                    "numinlets": 1,
                    "numoutlets": 0,
                    "index": 0,
                    "comment": "row 5 trigger (signal, level = velocity)"
                }
            },
            {
                "box": {
                    "id": "out-e4",
                    "maxclass": "outlet",
                    "patching_rect": [ 1640.0, 720.0, 30.0, 22.0 ],
                    "numinlets": 1,
                    "numoutlets": 0,
                    "index": 0,
                    "comment": "row 5 envelope (signal, peak = velocity)"
                }
            },
            {
                "box": {
                    "id": "out-t5",
                    "maxclass": "outlet",
                    "patching_rect": [ 1000.0, 720.0, 30.0, 22.0 ],
                    "numinlets": 1,
                    "numoutlets": 0,
                    "index": 0,
                    "comment": "row 6 trigger (signal, level = velocity)"
                }
            },
            {
                "box": {
                    "id": "out-e5",
                    "maxclass": "outlet",
                    "patching_rect": [ 1700.0, 720.0, 30.0, 22.0 ],
                    "numinlets": 1,
                    "numoutlets": 0,
                    "index": 0,
                    "comment": "row 6 envelope (signal, peak = velocity)"
                }
            },
            {
                "box": {
                    "id": "out-t6",
                    "maxclass": "outlet",
                    "patching_rect": [ 1060.0, 720.0, 30.0, 22.0 ],
                    "numinlets": 1,
                    "numoutlets": 0,
                    "index": 0,
                    "comment": "row 7 trigger (signal, level = velocity)"
                }
            },
            {
                "box": {
                    "id": "out-e6",
                    "maxclass": "outlet",
                    "patching_rect": [ 1760.0, 720.0, 30.0, 22.0 ],
                    "numinlets": 1,
                    "numoutlets": 0,
                    "index": 0,
                    "comment": "row 7 envelope (signal, peak = velocity)"
                }
            },
            {
                "box": {
                    "id": "out-t7",
                    "maxclass": "outlet",
                    "patching_rect": [ 1120.0, 720.0, 30.0, 22.0 ],
                    "numinlets": 1,
                    "numoutlets": 0,
                    "index": 0,
                    "comment": "row 8 trigger (signal, level = velocity)"
                }
            },
            {
                "box": {
                    "id": "out-e7",
                    "maxclass": "outlet",
                    "patching_rect": [ 1820.0, 720.0, 30.0, 22.0 ],
                    "numinlets": 1,
                    "numoutlets": 0,
                    "index": 0,
                    "comment": "row 8 envelope (signal, peak = velocity)"
                }
            },
            {
                "box": {
                    "id": "mp_mixT",
                    "maxclass": "newobj",
                    "patching_rect": [ 700.0, 480.0, 120.0, 26.0 ],
                    "text": "mc.mixdown~ 1",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "multichannelsignal" ],
                    "fontsize": 16.0
                }
            },
            {
                "box": {
                    "id": "mp_mixE",
                    "maxclass": "newobj",
                    "patching_rect": [ 900.0, 480.0, 120.0, 26.0 ],
                    "text": "mc.mixdown~ 1",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "multichannelsignal" ],
                    "fontsize": 16.0
                }
            },
            {
                "box": {
                    "id": "mp_hunp",
                    "maxclass": "newobj",
                    "patching_rect": [ 1120.0, 480.0, 120.0, 26.0 ],
                    "text": "mc.unpack~ 8",
                    "numinlets": 1,
                    "numoutlets": 8,
                    "outlettype": [ "signal", "signal", "signal", "signal", "signal", "signal", "signal", "signal" ],
                    "fontsize": 16.0
                }
            },
            {
                "box": {
                    "id": "mp_hpak",
                    "maxclass": "newobj",
                    "patching_rect": [ 1120.0, 560.0, 260.0, 26.0 ],
                    "text": "pak -1 -1 -1 -1 -1 -1 -1 -1",
                    "numinlets": 8,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "fontsize": 16.0
                }
            },
            {
                "box": {
                    "id": "mp_hs0",
                    "maxclass": "newobj",
                    "patching_rect": [ 1120.0, 520.0, 90.0, 26.0 ],
                    "text": "snapshot~ 30",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "fontsize": 16.0
                }
            },
            {
                "box": {
                    "id": "mp_hs1",
                    "maxclass": "newobj",
                    "patching_rect": [ 1215.0, 520.0, 90.0, 26.0 ],
                    "text": "snapshot~ 30",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "fontsize": 16.0
                }
            },
            {
                "box": {
                    "id": "mp_hs2",
                    "maxclass": "newobj",
                    "patching_rect": [ 1310.0, 520.0, 90.0, 26.0 ],
                    "text": "snapshot~ 30",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "fontsize": 16.0
                }
            },
            {
                "box": {
                    "id": "mp_hs3",
                    "maxclass": "newobj",
                    "patching_rect": [ 1405.0, 520.0, 90.0, 26.0 ],
                    "text": "snapshot~ 30",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "fontsize": 16.0
                }
            },
            {
                "box": {
                    "id": "mp_hs4",
                    "maxclass": "newobj",
                    "patching_rect": [ 1500.0, 520.0, 90.0, 26.0 ],
                    "text": "snapshot~ 30",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "fontsize": 16.0
                }
            },
            {
                "box": {
                    "id": "mp_hs5",
                    "maxclass": "newobj",
                    "patching_rect": [ 1595.0, 520.0, 90.0, 26.0 ],
                    "text": "snapshot~ 30",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "fontsize": 16.0
                }
            },
            {
                "box": {
                    "id": "mp_hs6",
                    "maxclass": "newobj",
                    "patching_rect": [ 1690.0, 520.0, 90.0, 26.0 ],
                    "text": "snapshot~ 30",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "fontsize": 16.0
                }
            },
            {
                "box": {
                    "id": "mp_hs7",
                    "maxclass": "newobj",
                    "patching_rect": [ 1785.0, 520.0, 90.0, 26.0 ],
                    "text": "snapshot~ 30",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "fontsize": 16.0
                }
            },
            {
                "box": {
                    "id": "mp_bsnap",
                    "maxclass": "newobj",
                    "patching_rect": [ 1300.0, 480.0, 130.0, 26.0 ],
                    "text": "mc.snapshot~ 20",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "fontsize": 16.0
                }
            },
            {
                "box": {
                    "id": "mp_bfirst",
                    "maxclass": "newobj",
                    "patching_rect": [ 1300.0, 515.0, 90.0, 26.0 ],
                    "text": "zl.slice 1",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "fontsize": 16.0
                }
            },
            {
                "box": {
                    "id": "mp_rt",
                    "maxclass": "newobj",
                    "patching_rect": [ 700.0, 580.0, 260.0, 26.0 ],
                    "text": "route needbuffer engine seqis",
                    "numinlets": 1,
                    "numoutlets": 4,
                    "outlettype": [ "", "", "", "" ],
                    "fontsize": 16.0
                }
            },
            {
                "box": {
                    "id": "mp_buf",
                    "maxclass": "newobj",
                    "patching_rect": [ 40.0, 560.0, 300.0, 26.0 ],
                    "text": "buffer~ #0-mp @samps 16408 @chans 11",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "float", "bang" ],
                    "fontsize": 16.0
                }
            },
            {
                "box": {
                    "id": "mp_chbuf",
                    "maxclass": "newobj",
                    "patching_rect": [ 40.0, 600.0, 320.0, 26.0 ],
                    "text": "buffer~ #0-mpch @samps 65536 @chans 5",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "float", "bang" ],
                    "fontsize": 16.0
                }
            },
            {
                "box": {
                    "id": "mp_cycles",
                    "maxclass": "number",
                    "patching_rect": [ 40.0, 700.0, 60.0, 26.0 ],
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "fontsize": 16.0,
                    "parameter_enable": 1,
                    "presentation": 1,
                    "presentation_rect": [ 60.0, 110.0, 44.0, 26.0 ],
                    "varname": "cycles",
                    "minimum": 1,
                    "maximum": 8,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_invisible": 1,
                            "parameter_longname": "cycles",
                            "parameter_modmode": 0,
                            "parameter_shortname": "cycles",
                            "parameter_type": 3
                        }
                    }
                }
            },
            {
                "box": {
                    "id": "mp_cycles_c",
                    "maxclass": "comment",
                    "patching_rect": [ 110.0, 700.0, 90.0, 26.0 ],
                    "text": "cycles",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "fontsize": 16.0,
                    "presentation": 1,
                    "presentation_rect": [ 2.0, 110.0, 56.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "mp_cycles_lm",
                    "maxclass": "newobj",
                    "patching_rect": [ 210.0, 700.0, 110.0, 26.0 ],
                    "text": "loadmess 1",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "fontsize": 16.0
                }
            },
            {
                "box": {
                    "id": "mp_cycles_m",
                    "maxclass": "message",
                    "patching_rect": [ 400.0, 700.0, 130.0, 26.0 ],
                    "text": "cycles $1",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "fontsize": 16.0
                }
            },
            {
                "box": {
                    "id": "mp_trigms",
                    "maxclass": "flonum",
                    "patching_rect": [ 40.0, 740.0, 60.0, 26.0 ],
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "fontsize": 16.0,
                    "parameter_enable": 1,
                    "presentation": 1,
                    "presentation_rect": [ 60.0, 230.0, 50.0, 26.0 ],
                    "varname": "trigms",
                    "minimum": 0.5,
                    "maximum": 50,
                    "format": 6,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_invisible": 1,
                            "parameter_longname": "trigms",
                            "parameter_modmode": 0,
                            "parameter_shortname": "trigms",
                            "parameter_type": 3
                        }
                    }
                }
            },
            {
                "box": {
                    "id": "mp_trigms_c",
                    "maxclass": "comment",
                    "patching_rect": [ 110.0, 740.0, 90.0, 26.0 ],
                    "text": "trig ms",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "fontsize": 16.0,
                    "presentation": 1,
                    "presentation_rect": [ 2.0, 230.0, 60.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "mp_trigms_lm",
                    "maxclass": "newobj",
                    "patching_rect": [ 210.0, 740.0, 110.0, 26.0 ],
                    "text": "loadmess 5",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "fontsize": 16.0
                }
            },
            {
                "box": {
                    "id": "mp_trigms_m",
                    "maxclass": "message",
                    "patching_rect": [ 400.0, 740.0, 130.0, 26.0 ],
                    "text": "trigms $1",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "fontsize": 16.0
                }
            },
            {
                "box": {
                    "id": "mp_accvel",
                    "maxclass": "number",
                    "patching_rect": [ 40.0, 780.0, 60.0, 26.0 ],
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "fontsize": 16.0,
                    "parameter_enable": 1,
                    "presentation": 1,
                    "presentation_rect": [ 60.0, 260.0, 44.0, 26.0 ],
                    "varname": "accvel",
                    "minimum": 0,
                    "maximum": 100,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_invisible": 1,
                            "parameter_longname": "accvel",
                            "parameter_modmode": 0,
                            "parameter_shortname": "accvel",
                            "parameter_type": 3
                        }
                    }
                }
            },
            {
                "box": {
                    "id": "mp_accvel_c",
                    "maxclass": "comment",
                    "patching_rect": [ 110.0, 780.0, 90.0, 26.0 ],
                    "text": "acc vel",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "fontsize": 16.0,
                    "presentation": 1,
                    "presentation_rect": [ 2.0, 260.0, 60.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "mp_accvel_lm",
                    "maxclass": "newobj",
                    "patching_rect": [ 210.0, 780.0, 110.0, 26.0 ],
                    "text": "loadmess 30",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "fontsize": 16.0
                }
            },
            {
                "box": {
                    "id": "mp_accvel_div",
                    "maxclass": "newobj",
                    "patching_rect": [ 330.0, 780.0, 60.0, 26.0 ],
                    "text": "/ 100.",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "fontsize": 16.0
                }
            },
            {
                "box": {
                    "id": "mp_accvel_m",
                    "maxclass": "message",
                    "patching_rect": [ 400.0, 780.0, 130.0, 26.0 ],
                    "text": "accvel $1",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "fontsize": 16.0
                }
            },
            {
                "box": {
                    "id": "mp_accdec",
                    "maxclass": "flonum",
                    "patching_rect": [ 40.0, 820.0, 60.0, 26.0 ],
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "fontsize": 16.0,
                    "parameter_enable": 1,
                    "presentation": 1,
                    "presentation_rect": [ 160.0, 260.0, 50.0, 26.0 ],
                    "varname": "accdec",
                    "minimum": 0.1,
                    "maximum": 10,
                    "format": 6,
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_invisible": 1,
                            "parameter_longname": "accdec",
                            "parameter_modmode": 0,
                            "parameter_shortname": "accdec",
                            "parameter_type": 3
                        }
                    }
                }
            },
            {
                "box": {
                    "id": "mp_accdec_c",
                    "maxclass": "comment",
                    "patching_rect": [ 110.0, 820.0, 90.0, 26.0 ],
                    "text": "x dec",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "fontsize": 16.0,
                    "presentation": 1,
                    "presentation_rect": [ 110.0, 260.0, 50.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "mp_accdec_lm",
                    "maxclass": "newobj",
                    "patching_rect": [ 210.0, 820.0, 110.0, 26.0 ],
                    "text": "loadmess 1.5",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "fontsize": 16.0
                }
            },
            {
                "box": {
                    "id": "mp_accdec_m",
                    "maxclass": "message",
                    "patching_rect": [ 400.0, 820.0, 130.0, 26.0 ],
                    "text": "accdec $1",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "fontsize": 16.0
                }
            },
            {
                "box": {
                    "id": "mp_ghosts",
                    "maxclass": "toggle",
                    "patching_rect": [ 40.0, 900.0, 24.0, 24.0 ],
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 1,
                    "presentation": 1,
                    "presentation_rect": [ 100.0, 140.0, 20.0, 20.0 ],
                    "varname": "ghosts",
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "off", "on" ],
                            "parameter_longname": "ghosts",
                            "parameter_mmax": 1,
                            "parameter_modmode": 0,
                            "parameter_shortname": "ghosts",
                            "parameter_type": 2
                        }
                    }
                }
            },
            {
                "box": {
                    "id": "mp_ghosts_c",
                    "maxclass": "comment",
                    "patching_rect": [ 70.0, 900.0, 70.0, 26.0 ],
                    "text": "ghosts",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "fontsize": 16.0,
                    "presentation": 1,
                    "presentation_rect": [ 122.0, 137.0, 60.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "mp_ghosts_lm",
                    "maxclass": "newobj",
                    "patching_rect": [ 150.0, 900.0, 100.0, 26.0 ],
                    "text": "loadmess 1",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "fontsize": 16.0
                }
            },
            {
                "box": {
                    "id": "mp_ghosts_m",
                    "maxclass": "message",
                    "patching_rect": [ 260.0, 900.0, 100.0, 26.0 ],
                    "text": "ghosts $1",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "fontsize": 16.0
                }
            },
            {
                "box": {
                    "id": "mp_rate_lm",
                    "maxclass": "newobj",
                    "patching_rect": [ 1330.0, 160.0, 100.0, 26.0 ],
                    "text": "loadmess 1.",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "fontsize": 16.0
                }
            },
            {
                "box": {
                    "id": "mp_outc",
                    "maxclass": "comment",
                    "patching_rect": [ 40.0, 940.0, 220.0, 26.0 ],
                    "text": "out: triggers / envelopes",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "fontsize": 16.0,
                    "presentation": 1,
                    "presentation_rect": [ 2.0, 400.0, 180.0, 24.0 ]
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "obj-8", 0 ],
                    "order": 1,
                    "source": [ "apat", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "sq_box", 0 ],
                    "order": 2,
                    "source": [ "apat", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "barm", 0 ],
                    "source": [ "barct", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "barct", 0 ],
                    "source": [ "barrt", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "barzero", 0 ],
                    "source": [ "barrt", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "barct", 3 ],
                    "source": [ "barzero", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "bufgen", 0 ],
                    "source": [ "bufdel", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "roll", 0 ],
                    "source": [ "bufm", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "g_ratetilde", 0 ],
                    "source": [ "g_in-clock", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "g_playmsg", 0 ],
                    "source": [ "g_in-play", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "g_stepreset_t", 0 ],
                    "source": [ "g_in-reset", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "g_rateadd", 1 ],
                    "source": [ "g_in-rmod", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "g_ratereset_t", 0 ],
                    "source": [ "g_in-rreset", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "g_ratesig", 0 ],
                    "source": [ "g_rate", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "g_ratetilde", 1 ],
                    "source": [ "g_rateadd", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "g_ratetilde", 0 ],
                    "source": [ "g_ratereset", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "g_ratereset", 0 ],
                    "source": [ "g_ratereset_t", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "g_rateadd", 0 ],
                    "source": [ "g_ratesig", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "g_scope-rate", 0 ],
                    "order": 1,
                    "source": [ "g_ratetilde", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "g_click", 0 ],
                    "source": [ "g_stepreset_t", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "help_t", 0 ],
                    "source": [ "help_btn", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "help_pc", 0 ],
                    "source": [ "help_open", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "help_p", 0 ],
                    "source": [ "help_pc", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "help_open", 0 ],
                    "source": [ "help_t", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "barrt", 0 ],
                    "source": [ "in-bar", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "csm", 0 ],
                    "source": [ "in-cscale", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "bufdel", 0 ],
                    "order": 1,
                    "source": [ "lb", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "bufgen", 0 ],
                    "order": 0,
                    "source": [ "lb", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "bufm", 0 ],
                    "order": 2,
                    "source": [ "lb", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mk_freezem", 0 ],
                    "source": [ "mk_freeze", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mk_mutdiv", 0 ],
                    "source": [ "mk_mutate", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mk_mutatem", 0 ],
                    "source": [ "mk_mutdiv", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "snpp", 0 ],
                    "source": [ "obj-12", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-12", 0 ],
                    "source": [ "obj-13", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-4", 0 ],
                    "source": [ "obj-3", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "roll", 0 ],
                    "source": [ "obj-4", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-3", 0 ],
                    "source": [ "obj-5", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "sq_dlg", 0 ],
                    "source": [ "obj-8", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "roll", 0 ],
                    "source": [ "obj-9", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pstore", 0 ],
                    "source": [ "pjs", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pjs", 0 ],
                    "source": [ "pjs_slotfilter", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pjs", 0 ],
                    "source": [ "plogic", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ppre", 0 ],
                    "source": [ "plogic", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pstore", 0 ],
                    "source": [ "plogic", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "plogic", 0 ],
                    "source": [ "ppre", 3 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pjs_slotfilter", 0 ],
                    "source": [ "pstore", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ptmm", 0 ],
                    "source": [ "ptm", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "roll", 0 ],
                    "source": [ "snpp", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "sq_bpp", 0 ],
                    "source": [ "sq_bchg", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "sq_m1", 0 ],
                    "source": [ "sq_box", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "roll", 0 ],
                    "source": [ "sq_bpp", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "sq_clear_m", 0 ],
                    "source": [ "sq_clear", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "roll", 0 ],
                    "source": [ "sq_clear_m", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "sq_copy_m", 0 ],
                    "source": [ "sq_copy", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "roll", 0 ],
                    "source": [ "sq_copy_m", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-9", 0 ],
                    "source": [ "sq_dlg", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "sq_dsppp", 0 ],
                    "source": [ "sq_dsp", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "roll", 0 ],
                    "source": [ "sq_dsppp", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "sq_m1", 0 ],
                    "source": [ "sq_in", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "sq_pseq", 0 ],
                    "source": [ "sq_m1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "sq_minus_m", 0 ],
                    "source": [ "sq_minus", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "roll", 0 ],
                    "source": [ "sq_minus_m", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "sq_paste_m", 0 ],
                    "source": [ "sq_paste", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "roll", 0 ],
                    "source": [ "sq_paste_m", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "sq_plus_m", 0 ],
                    "source": [ "sq_plus", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "roll", 0 ],
                    "source": [ "sq_plus_m", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "roll", 0 ],
                    "source": [ "sq_pseq", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "sq_box", 0 ],
                    "source": [ "sq_setsq", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "un_sel", 0 ],
                    "source": [ "un_expr", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "un_expr", 1 ],
                    "source": [ "un_key", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "un_expr", 0 ],
                    "source": [ "un_key", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "roll", 0 ],
                    "source": [ "un_redo", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "un_redo", 0 ],
                    "source": [ "un_sel", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "un_undo", 0 ],
                    "source": [ "un_sel", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "roll", 0 ],
                    "source": [ "un_undo", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "g_ratetilde", 0 ],
                    "destination": [ "mp_dupP", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "mp_dupP", 0 ],
                    "destination": [ "mp_gen", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "in-trig", 0 ],
                    "destination": [ "mp_dupT", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "mp_dupT", 0 ],
                    "destination": [ "mp_gen", 1 ]
                }
            },
            {
                "patchline": {
                    "source": [ "g_click", 0 ],
                    "destination": [ "mp_dupR", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "mp_dupR", 0 ],
                    "destination": [ "mp_gen", 2 ]
                }
            },
            {
                "patchline": {
                    "source": [ "in-trig", 0 ],
                    "destination": [ "ck_ticks", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "g_playmsg", 0 ],
                    "destination": [ "mp_gen", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "mk_freezem", 0 ],
                    "destination": [ "mp_gen", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "mk_mutatem", 0 ],
                    "destination": [ "mp_gen", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "ptmm", 0 ],
                    "destination": [ "mp_gen", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "csm", 0 ],
                    "destination": [ "mp_gen", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "barm", 0 ],
                    "destination": [ "mp_gen", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "bufgen", 0 ],
                    "destination": [ "mp_gen", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "g_in-lmod", 0 ],
                    "destination": [ "mk_freeze", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "mp_gen", 0 ],
                    "destination": [ "mp_unpT", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "mp_gen", 1 ],
                    "destination": [ "mp_unpE", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "mp_unpT", 0 ],
                    "destination": [ "out-t0", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "mp_unpE", 0 ],
                    "destination": [ "out-e0", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "mp_unpT", 1 ],
                    "destination": [ "out-t1", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "mp_unpE", 1 ],
                    "destination": [ "out-e1", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "mp_unpT", 2 ],
                    "destination": [ "out-t2", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "mp_unpE", 2 ],
                    "destination": [ "out-e2", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "mp_unpT", 3 ],
                    "destination": [ "out-t3", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "mp_unpE", 3 ],
                    "destination": [ "out-e3", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "mp_unpT", 4 ],
                    "destination": [ "out-t4", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "mp_unpE", 4 ],
                    "destination": [ "out-e4", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "mp_unpT", 5 ],
                    "destination": [ "out-t5", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "mp_unpE", 5 ],
                    "destination": [ "out-e5", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "mp_unpT", 6 ],
                    "destination": [ "out-t6", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "mp_unpE", 6 ],
                    "destination": [ "out-e6", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "mp_unpT", 7 ],
                    "destination": [ "out-t7", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "mp_unpE", 7 ],
                    "destination": [ "out-e7", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "mp_gen", 0 ],
                    "destination": [ "mp_mixT", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "mp_gen", 1 ],
                    "destination": [ "mp_mixE", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "mp_mixT", 0 ],
                    "destination": [ "g_scope-gate", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "mp_mixE", 0 ],
                    "destination": [ "g_scope-env", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "mp_gen", 2 ],
                    "destination": [ "mp_hunp", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "mp_hunp", 0 ],
                    "destination": [ "mp_hs0", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "mp_hs0", 0 ],
                    "destination": [ "mp_hpak", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "mp_hunp", 1 ],
                    "destination": [ "mp_hs1", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "mp_hs1", 0 ],
                    "destination": [ "mp_hpak", 1 ]
                }
            },
            {
                "patchline": {
                    "source": [ "mp_hunp", 2 ],
                    "destination": [ "mp_hs2", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "mp_hs2", 0 ],
                    "destination": [ "mp_hpak", 2 ]
                }
            },
            {
                "patchline": {
                    "source": [ "mp_hunp", 3 ],
                    "destination": [ "mp_hs3", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "mp_hs3", 0 ],
                    "destination": [ "mp_hpak", 3 ]
                }
            },
            {
                "patchline": {
                    "source": [ "mp_hunp", 4 ],
                    "destination": [ "mp_hs4", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "mp_hs4", 0 ],
                    "destination": [ "mp_hpak", 4 ]
                }
            },
            {
                "patchline": {
                    "source": [ "mp_hunp", 5 ],
                    "destination": [ "mp_hs5", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "mp_hs5", 0 ],
                    "destination": [ "mp_hpak", 5 ]
                }
            },
            {
                "patchline": {
                    "source": [ "mp_hunp", 6 ],
                    "destination": [ "mp_hs6", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "mp_hs6", 0 ],
                    "destination": [ "mp_hpak", 6 ]
                }
            },
            {
                "patchline": {
                    "source": [ "mp_hunp", 7 ],
                    "destination": [ "mp_hs7", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "mp_hs7", 0 ],
                    "destination": [ "mp_hpak", 7 ]
                }
            },
            {
                "patchline": {
                    "source": [ "mp_hpak", 0 ],
                    "destination": [ "roll", 1 ]
                }
            },
            {
                "patchline": {
                    "source": [ "mp_gen", 3 ],
                    "destination": [ "mp_bsnap", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "mp_bsnap", 0 ],
                    "destination": [ "mp_bfirst", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "mp_bfirst", 0 ],
                    "destination": [ "sq_bchg", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "roll", 0 ],
                    "destination": [ "mp_rt", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "mp_rt", 0 ],
                    "destination": [ "bufm", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "mp_rt", 1 ],
                    "destination": [ "mp_gen", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "mp_rt", 2 ],
                    "destination": [ "sq_setsq", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "mp_cycles_lm", 0 ],
                    "destination": [ "mp_cycles", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "mp_cycles", 0 ],
                    "destination": [ "mp_cycles_m", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "mp_trigms_lm", 0 ],
                    "destination": [ "mp_trigms", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "mp_trigms", 0 ],
                    "destination": [ "mp_trigms_m", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "mp_accvel_lm", 0 ],
                    "destination": [ "mp_accvel", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "mp_accvel", 0 ],
                    "destination": [ "mp_accvel_div", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "mp_accvel_div", 0 ],
                    "destination": [ "mp_accvel_m", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "mp_accdec_lm", 0 ],
                    "destination": [ "mp_accdec", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "mp_accdec", 0 ],
                    "destination": [ "mp_accdec_m", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "mp_cycles_m", 0 ],
                    "destination": [ "roll", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "mp_trigms_m", 0 ],
                    "destination": [ "mp_gen", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "mp_accvel_m", 0 ],
                    "destination": [ "mp_gen", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "mp_accdec_m", 0 ],
                    "destination": [ "mp_gen", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "mp_ghosts_lm", 0 ],
                    "destination": [ "mp_ghosts", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "mp_ghosts", 0 ],
                    "destination": [ "mp_ghosts_m", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "mp_ghosts_m", 0 ],
                    "destination": [ "roll", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "mp_rate_lm", 0 ],
                    "destination": [ "g_rate", 0 ]
                }
            }
        ]
    }
}
