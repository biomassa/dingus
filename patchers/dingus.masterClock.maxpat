{
    "patcher": {
        "fileversion": 1,
        "appversion": {
            "major": 9,
            "minor": 1,
            "revision": 5,
            "architecture": "x64",
            "modernui": 1
        },
        "classnamespace": "box",
        "rect": [ 393.0, 205.0, 1364.0, 988.0 ],
        "openinpresentation": 1,
        "integercoordinates": 1,
        "boxes": [
            {
                "box": {
                    "id": "obj-6",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "patching_rect": [ 204.0, 1447.0, 35.0, 22.0 ],
                    "text": "t 248",
                    "varname": "clk_fa[3]"
                }
            },
            {
                "box": {
                    "id": "obj-5",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "patching_rect": [ 281.0, 1447.0, 35.0, 22.0 ],
                    "text": "t 250",
                    "varname": "clk_fa[2]"
                }
            },
            {
                "box": {
                    "id": "obj-1",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "patching_rect": [ 354.0, 1447.0, 35.0, 22.0 ],
                    "text": "t 252",
                    "varname": "clk_fa[1]"
                }
            },
            {
                "box": {
                    "id": "obj-4",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 4,
                    "outlettype": [ "", "", "", "" ],
                    "patching_rect": [ 476.91, 58.94, 100.0, 22.0 ],
                    "restore": {
                        "attrui": [ "tempo", 120.0 ],
                        "attrui[1]": [ "syncupdate", 0 ],
                        "crosspatch[1]": [
                            {
                                "data": {
                                    "numins": 6,
                                    "numouts": 1,
                                    "connections": [
                                        {
                                            "in": 5,
                                            "out": 0,
                                            "gain": 1.0
                                        }
                                    ]
                                }
                            }
                        ],
                        "function[6]": [ 1000.0, -1.0, 1.0, 0.0, 0.0, 0, 0.0, 700.4264391053206, 0.010526315789473717, 0, 0.0, 819.8294241799474, 0.010526315789473717, 0, 0.0, 860.3411512588387, -0.8315789473684211, 0, 0.44999999999999996, 924.3070361202459, 0.24210526315789482, 0, -0.3, 958.4221747129965, 0.5368421052631578, 0, 0.7500000000000001, 1000.0, 0.0, 0, 0.7000000000000001, "curve" ],
                        "live.slider": [ 0.0 ],
                        "number[12]": [ 0.0 ],
                        "number[13]": [ 0.0 ],
                        "toggle[1]": [ 0 ]
                    },
                    "text": "autopattr",
                    "varname": "u956003708"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.407843137254902, 0.592156862745098, 0.309803921568627, 0.0 ],
                    "bubble_bgcolor": [ 0.392156862745098, 0.666666666666667, 0.372549019607843, 1.0 ],
                    "fontsize": 16.0,
                    "id": "obj-3",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 39.0, 844.0, 122.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 3.0, 345.0, 96.0, 24.0 ],
                    "text": "samplerate:"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.407843137254902, 0.592156862745098, 0.309803921568627, 0.0 ],
                    "bubble_bgcolor": [ 0.392156862745098, 0.666666666666667, 0.372549019607843, 1.0 ],
                    "fontsize": 16.0,
                    "id": "obj-2",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 270.0, 941.0, 122.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 37.0, 95.0, 67.0, 24.0 ],
                    "text": "actual:"
                }
            },
            {
                "box": {
                    "id": "obj-604",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "bang", "" ],
                    "patching_rect": [ 158.25, 1101.0, 41.0, 22.0 ],
                    "text": "sel 32"
                }
            },
            {
                "box": {
                    "id": "obj-622",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 4,
                    "outlettype": [ "int", "int", "int", "int" ],
                    "patching_rect": [ 158.25, 1075.0, 50.5, 22.0 ],
                    "text": "key 32"
                }
            },
            {
                "box": {
                    "id": "obj-529",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 960.9299999999998, 963.49, 73.0, 22.0 ],
                    "text": "r recallBang"
                }
            },
            {
                "box": {
                    "fontsize": 20.0,
                    "id": "obj-592",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1426.0, 891.5, 231.0, 29.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 546.0, 85.0, 67.0, 29.0 ],
                    "text": "divisor",
                    "textcolor": [ 0.997900664806366, 0.6942399144172668, 0.4273000657558441, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-631",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 506.0, 1400.0, 139.0, 22.0 ],
                    "text": "if $i1 > 0. then $i1 else 1"
                }
            },
            {
                "box": {
                    "id": "obj-623",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1335.0, 892.0, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-611",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1383.0, 895.0, 45.0, 22.0 ],
                    "text": "goto 0."
                }
            },
            {
                "box": {
                    "id": "obj-528",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 381.0, 196.0, 150.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 264.0, 64.0, 49.0, 20.0 ],
                    "text": "random"
                }
            },
            {
                "box": {
                    "fontsize": 20.0,
                    "format": 6,
                    "id": "obj-525",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 1426.0, 923.0, 62.0, 31.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 613.0, 84.0, 62.0, 31.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_invisible": 1,
                            "parameter_longname": "number[13]",
                            "parameter_modmode": 0,
                            "parameter_shortname": "number[13]",
                            "parameter_type": 3
                        }
                    },
                    "textcolor": [ 0.997900664806366, 0.6942399144172668, 0.4273000657558441, 1.0 ],
                    "varname": "number[13]"
                }
            },
            {
                "box": {
                    "id": "obj-487",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 883.0, 928.5, 184.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 492.0, 129.0, 184.0, 20.0 ],
                    "text": "CLOCK MODULATION CURVE"
                }
            },
            {
                "box": {
                    "id": "obj-402",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "patching_rect": [ 1404.0, 1292.0, 81.0, 22.0 ],
                    "text": "snapshot~ 10"
                }
            },
            {
                "box": {
                    "floatoutput": 1,
                    "id": "obj-420",
                    "ignoreclick": 1,
                    "knobcolor": [ 0.5450980392156862, 0.5450980392156862, 0.5450980392156862, 1.0 ],
                    "maxclass": "slider",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 882.0, 1277.000032544136, 492.0, 10.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 185.0, 252.0, 492.0, 10.0 ],
                    "size": 1.0
                }
            },
            {
                "box": {
                    "id": "obj-425",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 958.0, 997.000032544136, 58.0, 22.0 ],
                    "text": "loadbang"
                }
            },
            {
                "box": {
                    "id": "obj-426",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 829.0, 1060.000032544136, 47.0, 22.0 ],
                    "text": "delay 5"
                }
            },
            {
                "box": {
                    "id": "obj-431",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 796.0, 1000.000032544136, 47.0, 22.0 ],
                    "text": "delay 5"
                }
            },
            {
                "box": {
                    "id": "obj-432",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 759.0, 1033.000032544136, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-435",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 748.0, 1085.000032544136, 45.0, 22.0 ],
                    "text": "1000 0"
                }
            },
            {
                "box": {
                    "id": "obj-438",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 704.0, 1085.000032544136, 29.5, 22.0 ],
                    "text": "0 0"
                }
            },
            {
                "box": {
                    "fontsize": 20.0,
                    "id": "obj-466",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 802.0, 942.000032544136, 52.0, 31.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 319.0, 83.5, 52.0, 31.0 ],
                    "text": "clear",
                    "textcolor": [ 1.0, 0.4392156862745098, 0.4392156862745098, 1.0 ]
                }
            },
            {
                "box": {
                    "addpoints_with_curve": [ 0.0, 0.0, 0, 0.0, 700.4264391053206, 0.010526315789473717, 0, 0.0, 819.8294241799474, 0.010526315789473717, 0, 0.0, 860.3411512588387, -0.8315789473684211, 0, 0.44999999999999996, 924.3070361202459, 0.24210526315789482, 0, -0.3, 958.4221747129965, 0.5368421052631578, 0, 0.7500000000000001, 1000.0, 0.0, 0, 0.7000000000000001 ],
                    "classic_curve": 1,
                    "id": "obj-475",
                    "linecolor": [ 0.8509803921568627, 0.5764705882352941, 0.34901960784313724, 1.0 ],
                    "linethickness": 2.0,
                    "maxclass": "function",
                    "mode": 1,
                    "mousereport": 1,
                    "numinlets": 1,
                    "numoutlets": 4,
                    "outlettype": [ "float", "", "", "bang" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 883.0, 1123.000032544136, 491.0, 152.0 ],
                    "pointsize": 5.0,
                    "presentation": 1,
                    "presentation_rect": [ 185.0, 125.0, 491.0, 130.0 ],
                    "range": [ -1.0, 1.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_invisible": 1,
                            "parameter_longname": "function[6]",
                            "parameter_modmode": 0,
                            "parameter_shortname": "function",
                            "parameter_type": 3
                        }
                    },
                    "varname": "function[6]"
                }
            },
            {
                "box": {
                    "id": "obj-476",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 1404.0, 964.000032544136, 36.0, 22.0 ],
                    "text": "rate~"
                }
            },
            {
                "box": {
                    "id": "obj-479",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 883.0, 1048.000032544136, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "activelinecolor": [ 0.997900664806366, 0.6942399144172668, 0.4273000657558441, 1.0 ],
                    "id": "obj-484",
                    "line_width": 2.0,
                    "maxclass": "live.scope~",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 1439.0, 1157.000032544136, 95.0, 57.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 319.0, 14.0, 357.0, 68.0 ],
                    "range": [ -1.1, 1.1 ]
                }
            },
            {
                "box": {
                    "id": "obj-485",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 1365.0, 1071.0, 48.0, 22.0 ],
                    "text": "shape~"
                }
            },
            {
                "box": {
                    "id": "obj-654",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "patching_rect": [ 506.2199999999998, 1371.38, 81.0, 22.0 ],
                    "text": "snapshot~ 10"
                }
            },
            {
                "box": {
                    "id": "obj-652",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 9,
                    "outlettype": [ "int", "int", "float", "float", "float", "", "int", "float", "" ],
                    "patching_rect": [ 506.0, 1455.0, 103.0, 22.0 ],
                    "text": "transport"
                }
            },
            {
                "box": {
                    "id": "obj-653",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 506.0, 1424.0, 59.0, 22.0 ],
                    "text": "tempo $1"
                }
            },
            {
                "box": {
                    "id": "obj-651",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 271.0, 113.0, 150.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 236.0, 89.0, 77.5, 20.0 ],
                    "text": "random freq"
                }
            },
            {
                "box": {
                    "id": "obj-646",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 189.5, 157.0, 77.0, 22.0 ],
                    "text": "prepend freq"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-647",
                    "maxclass": "flonum",
                    "minimum": 0.0,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 216.0, 112.0, 50.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 185.0, 88.0, 50.0, 22.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_invisible": 1,
                            "parameter_longname": "number[12]",
                            "parameter_modmode": 0,
                            "parameter_shortname": "number[12]",
                            "parameter_type": 3
                        }
                    },
                    "varname": "number[12]"
                }
            },
            {
                "box": {
                    "activelinecolor": [ 0.803921568627451, 0.9450980392156862, 0.5490196078431373, 1.0 ],
                    "id": "obj-648",
                    "maxclass": "live.scope~",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 195.0, 233.0, 184.0, 68.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 185.0, 14.0, 128.0, 68.0 ],
                    "range": [ 0.0, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-649",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patcher": {
                        "fileversion": 1,
                        "appversion": {
                            "major": 9,
                            "minor": 1,
                            "revision": 5,
                            "architecture": "x64",
                            "modernui": 1
                        },
                        "classnamespace": "dsp.gen",
                        "rect": [ 766.0, 1587.0, 600.0, 450.0 ],
                        "integercoordinates": 1,
                        "boxes": [
                            {
                                "box": {
                                    "id": "obj-2",
                                    "maxclass": "newobj",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 109.0, 14.0, 28.0, 22.0 ],
                                    "text": "in 2"
                                }
                            },
                            {
                                "box": {
                                    "code": "Param freq(1, min=0);\r\nHistory last;\r\nphase = phasor(freq);\r\n\npulse = delta(phase) < 0;\nrandom = abs(noise());\n\nnext = latch(random, pulse);\nlast = latch(last, pulse);\n\nglide = interp(phase, last, next, mode=\"cosine\");\n\nlast = next; \nout1 = glide;\r\n",
                                    "fontface": 0,
                                    "fontname": "<Monospaced>",
                                    "fontsize": 12.0,
                                    "id": "obj-5",
                                    "maxclass": "codebox",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 109.0, 48.0, 508.0, 307.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-1",
                                    "maxclass": "newobj",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 50.0, 14.0, 28.0, 22.0 ],
                                    "text": "in 1"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-4",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 50.0, 354.0, 35.0, 22.0 ],
                                    "text": "out 1"
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "destination": [ "obj-5", 0 ],
                                    "source": [ "obj-1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-5", 0 ],
                                    "source": [ "obj-2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-4", 0 ],
                                    "source": [ "obj-5", 0 ]
                                }
                            }
                        ]
                    },
                    "patching_rect": [ 195.0, 197.0, 133.0, 22.0 ],
                    "text": "gen~ @t glider @freq 1"
                }
            },
            {
                "box": {
                    "id": "obj-643",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 331.0, 1166.0, 46.0, 22.0 ],
                    "text": "rate~ 4"
                }
            },
            {
                "box": {
                    "id": "obj-633",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 362.0, 1283.0, 96.0, 22.0 ],
                    "text": "pong~ 1 -0.5 0.5"
                }
            },
            {
                "box": {
                    "id": "obj-634",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 657.0, 1380.0, 101.0, 20.0 ],
                    "text": "bpm"
                }
            },
            {
                "box": {
                    "id": "obj-635",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 555.0, 1259.0, 150.0, 20.0 ],
                    "text": "< sample rate"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontname": "Arial",
                    "fontsize": 16.0,
                    "id": "obj-636",
                    "maxclass": "number~",
                    "mode": 2,
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "signal", "float" ],
                    "patching_rect": [ 657.0, 1356.0, 68.0, 26.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 110.0, 94.0, 68.0, 26.0 ],
                    "sig": 0.0
                }
            },
            {
                "box": {
                    "id": "obj-637",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 597.0, 1356.0, 44.0, 22.0 ],
                    "text": "*~ 240"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "format": 6,
                    "id": "obj-638",
                    "ignoreclick": 1,
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 479.0, 1259.0, 91.0, 26.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 108.0, 344.0, 72.0, 26.0 ],
                    "textcolor": [ 0.6666666666666666, 0.5647058823529412, 0.16862745098039217, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-640",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "int" ],
                    "patching_rect": [ 391.0, 1244.0, 67.0, 22.0 ],
                    "text": "adstatus sr"
                }
            },
            {
                "box": {
                    "id": "obj-641",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 362.0, 1316.0, 112.0, 22.0 ],
                    "text": "*~"
                }
            },
            {
                "box": {
                    "id": "obj-642",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 354.0, 1213.0, 42.0, 22.0 ],
                    "text": "delta~"
                }
            },
            {
                "box": {
                    "id": "obj-630",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 73.0, 1300.0, 39.0, 33.0 ],
                    "text": "beat clock"
                }
            },
            {
                "box": {
                    "id": "obj-628",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "bang", "bang" ],
                    "patching_rect": [ 99.5, 1201.0, 42.0, 22.0 ],
                    "text": "edge~"
                }
            },
            {
                "box": {
                    "id": "obj-620",
                    "maxclass": "newobj",
                    "numinlets": 6,
                    "numoutlets": 2,
                    "outlettype": [ "signal", "" ],
                    "patching_rect": [ 206.0, 524.0, 337.33333333333303, 22.0 ],
                    "text": "matrix~ 6 1"
                }
            },
            {
                "box": {
                    "id": "obj-605",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 50.0, 100.0, 58.0, 22.0 ],
                    "text": "loadbang"
                }
            },
            {
                "box": {
                    "fontsize": 12.0,
                    "id": "obj-606",
                    "maxclass": "live.slider",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 50.0, 747.0, 59.0, 95.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 447.0, 274.5, 67.0, 95.0 ],
                    "saved_attribute_attributes": {
                        "slidercolor": {
                            "expression": "themecolor.live_display_handle_one"
                        },
                        "textcolor": {
                            "expression": "themecolor.live_display_handle_one"
                        },
                        "tribordercolor": {
                            "expression": "themecolor.live_display_handle_one"
                        },
                        "valueof": {
                            "parameter_longname": "live.slider",
                            "parameter_mmax": 1.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "modDepth",
                            "parameter_type": 0,
                            "parameter_unitstyle": 1
                        }
                    },
                    "slidercolor": [ 1.0, 0.725490196078431, 0.003921568627451, 1.0 ],
                    "textcolor": [ 1.0, 0.725490196078431, 0.003921568627451, 1.0 ],
                    "tribordercolor": [ 1.0, 0.725490196078431, 0.003921568627451, 1.0 ],
                    "varname": "live.slider"
                }
            },
            {
                "box": {
                    "id": "obj-607",
                    "maxclass": "live.scope~",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 482.0, 901.8000327944756, 190.0, 131.0 ],
                    "range": [ -0.10000000149011612, 1.1 ]
                }
            },
            {
                "box": {
                    "id": "obj-608",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patcher": {
                        "fileversion": 1,
                        "appversion": {
                            "major": 9,
                            "minor": 1,
                            "revision": 5,
                            "architecture": "x64",
                            "modernui": 1
                        },
                        "classnamespace": "box",
                        "rect": [ 367.0, 449.0, 640.0, 480.0 ],
                        "integercoordinates": 1,
                        "boxes": [
                            {
                                "box": {
                                    "id": "obj-10",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 93.5, 40.0, 60.0, 20.0 ],
                                    "text": "phasor in"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-7",
                                    "linecount": 2,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 245.0, 33.5, 71.80000329017639, 33.0 ],
                                    "text": "modulation depth"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-9",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "outlettype": [ "signal", "signal", "int" ],
                                    "patching_rect": [ 123.0, 113.0, 67.0, 22.0 ],
                                    "text": "subdiv~ 24"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-8",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 365.0, 40.0, 80.0, 20.0 ],
                                    "text": "modulation in"
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-4",
                                    "index": 3,
                                    "maxclass": "inlet",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 333.0, 40.0, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-6",
                                    "maxclass": "live.scope~",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "bang" ],
                                    "patching_rect": [ 303.0, 257.0, 184.0, 68.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-5",
                                    "maxclass": "live.scope~",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "bang" ],
                                    "patching_rect": [ 303.2000045180321, 131.4000023007393, 184.0, 68.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-135",
                                    "maxclass": "newobj",
                                    "numinlets": 3,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 220.8000032901764, 213.60000318288803, 96.0, 22.0 ],
                                    "text": "pong~ 1 -0.5 0.5"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-101",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 220.8000032901764, 154.4000023007393, 42.0, 22.0 ],
                                    "text": "delta~"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-1",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 48.0, 112.0, 34.0, 22.0 ],
                                    "text": "*~ 0."
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-3",
                                    "index": 2,
                                    "maxclass": "inlet",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 211.0, 40.0, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-2",
                                    "index": 1,
                                    "maxclass": "inlet",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 154.0, 40.0, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-133",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "int" ],
                                    "patching_rect": [ 103.0, 147.0, 41.0, 22.0 ],
                                    "text": "what~"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-131",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 49.0, 339.0, 40.0, 22.0 ],
                                    "text": "%~ 1."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-130",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 49.0, 315.0, 30.0, 22.0 ],
                                    "text": "+=~"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-129",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 49.0, 291.0, 57.5, 22.0 ],
                                    "text": "*~"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-127",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 49.0, 234.0, 36.0, 22.0 ],
                                    "text": "+~ 1."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-124",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 49.0, 191.0, 73.0, 22.0 ],
                                    "text": "sah~"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-123",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 46.0, 62.0, 38.0, 22.0 ],
                                    "text": "pink~"
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-192",
                                    "index": 1,
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 49.0, 388.0, 30.0, 30.0 ]
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "destination": [ "obj-124", 0 ],
                                    "source": [ "obj-1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-135", 0 ],
                                    "order": 1,
                                    "source": [ "obj-101", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-5", 0 ],
                                    "order": 0,
                                    "source": [ "obj-101", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-127", 0 ],
                                    "source": [ "obj-124", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-129", 0 ],
                                    "source": [ "obj-127", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-130", 0 ],
                                    "source": [ "obj-129", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-131", 0 ],
                                    "source": [ "obj-130", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-192", 0 ],
                                    "source": [ "obj-131", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-124", 1 ],
                                    "source": [ "obj-133", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-129", 1 ],
                                    "order": 1,
                                    "source": [ "obj-135", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-6", 0 ],
                                    "order": 0,
                                    "source": [ "obj-135", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-101", 0 ],
                                    "order": 0,
                                    "source": [ "obj-2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-9", 0 ],
                                    "order": 1,
                                    "source": [ "obj-2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-1", 1 ],
                                    "source": [ "obj-3", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-1", 0 ],
                                    "source": [ "obj-4", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-133", 0 ],
                                    "source": [ "obj-9", 0 ]
                                }
                            }
                        ]
                    },
                    "patching_rect": [ 121.0, 891.8000327944756, 104.0, 22.0 ],
                    "text": "p modulateClocks"
                }
            },
            {
                "box": {
                    "activelinecolor": [ 0.19607843137254902, 1.0, 0.984313725490196, 1.0 ],
                    "id": "obj-609",
                    "ignoreclick": 1,
                    "maxclass": "live.scope~",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 442.0, 1144.0, 158.0, 40.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 3.0, 285.5, 175.0, 40.0 ],
                    "range": [ -0.10000000149011612, 1.1 ],
                    "samples": 11025.0
                }
            },
            {
                "box": {
                    "id": "obj-610",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "signal", "int" ],
                    "patching_rect": [ 99.0, 1111.8000327944756, 41.0, 22.0 ],
                    "text": "what~"
                }
            },
            {
                "box": {
                    "id": "obj-612",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 3,
                    "outlettype": [ "bang", "bang", "" ],
                    "patching_rect": [ 160.0, 1247.8000327944756, 100.00000149011612, 22.0 ],
                    "text": "sel 1 0"
                }
            },
            {
                "box": {
                    "id": "obj-615",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 312.0, 1581.0, 165.0, 22.0 ],
                    "text": "midiout \"interapp MIDI Bus 1\""
                }
            },
            {
                "box": {
                    "id": "obj-616",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 392.0, 1554.0, 85.0, 22.0 ],
                    "text": "midiout Vector"
                }
            },
            {
                "box": {
                    "id": "obj-617",
                    "ignoreclick": 1,
                    "maxclass": "live.scope~",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 442.0, 1059.0, 158.0, 77.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 3.0, 230.5, 175.0, 53.0 ],
                    "range": [ -0.10000000149011612, 1.1 ],
                    "samples": 11025.0
                }
            },
            {
                "box": {
                    "id": "obj-618",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "signal", "signal", "int" ],
                    "patching_rect": [ 95.0, 1016.0, 67.0, 22.0 ],
                    "text": "subdiv~ 24"
                }
            },
            {
                "box": {
                    "attr": "syncupdate",
                    "id": "obj-619",
                    "maxclass": "attrui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 129.5, 974.2000303268433, 209.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 3.0, 204.0, 175.0, 22.0 ],
                    "varname": "attrui[1]"
                }
            },
            {
                "box": {
                    "id": "obj-44",
                    "maxclass": "live.scope~",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 319.0, 750.0, 184.0, 68.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 3.0, 125.0, 175.0, 68.0 ],
                    "range": [ -0.10000000149011612, 1.1 ]
                }
            },
            {
                "box": {
                    "id": "obj-532",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 9,
                    "outlettype": [ "int", "int", "float", "float", "float", "", "int", "float", "" ],
                    "patching_rect": [ 127.0, 645.0, 146.0, 22.0 ],
                    "text": "transport @name inaction"
                }
            },
            {
                "box": {
                    "id": "obj-537",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 127.0, 679.0, 223.0, 22.0 ],
                    "text": "phasor~ 4n @lock 1 @transport inaction"
                }
            },
            {
                "box": {
                    "attr": "tempo",
                    "fontsize": 16.0,
                    "id": "obj-540",
                    "maxclass": "attrui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 153.0, 616.0, 159.0, 26.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 24.0, 67.0, 156.0, 26.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_invisible": 1,
                            "parameter_longname": "attrui",
                            "parameter_modmode": 0,
                            "parameter_shortname": "attrui",
                            "parameter_type": 3
                        }
                    },
                    "varname": "attrui"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.407843137254902, 0.592156862745098, 0.309803921568627, 0.0 ],
                    "bubble_bgcolor": [ 0.392156862745098, 0.666666666666667, 0.372549019607843, 1.0 ],
                    "fontsize": 16.0,
                    "id": "obj-478",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 214.0, 1183.4000335931778, 122.0, 42.0 ],
                    "presentation": 1,
                    "presentation_linecount": 2,
                    "presentation_rect": [ 56.0, 14.0, 124.0, 42.0 ],
                    "text": "START\nSEQUENCERS"
                }
            },
            {
                "box": {
                    "checkedcolor": [ 0.168627450980392, 1.0, 0.0, 1.0 ],
                    "id": "obj-422",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 160.0, 1178.4000335931778, 52.0, 52.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 15.0, 14.0, 42.0, 42.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "off", "on" ],
                            "parameter_longname": "toggle[1]",
                            "parameter_mmax": 1,
                            "parameter_modmode": 0,
                            "parameter_shortname": "toggle[1]",
                            "parameter_type": 2
                        }
                    },
                    "uncheckedcolor": [ 0.129411764705882, 0.368627450980392, 0.133333333333333, 1.0 ],
                    "varname": "toggle[1]"
                }
            },
            {
                "box": {
                    "id": "obj-639",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 425.0, 1201.0, 58.0, 22.0 ],
                    "text": "loadbang"
                }
            },
            {
                "box": {
                    "candycane": 6,
                    "candycane6": [ 0.997900664806366, 0.6942399144172668, 0.4273000657558441, 1.0 ],
                    "colorlabels": 1,
                    "connections": [
                        {
                            "in": 5,
                            "out": 0,
                            "gain": 1.0
                        }
                    ],
                    "dividers": "none",
                    "fontface": 0,
                    "fontname": "Arial",
                    "fontsize": 12.0,
                    "id": "obj-621",
                    "incolormap": "none",
                    "inlabels": [ "in1", "in2", "in3", "in4", "random", "curve" ],
                    "labelheight": 16.0,
                    "maxclass": "crosspatch",
                    "numinlets": 1,
                    "numins": 6,
                    "numoutlets": 2,
                    "numouts": 1,
                    "outcolormap": "none",
                    "outlabels": "clockMod",
                    "outlettype": [ "", "dictionary" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 169.0, 364.0, 260.0, 96.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 185.0, 274.0, 260.0, 96.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_invisible": 1,
                            "parameter_longname": "crosspatch[1]",
                            "parameter_modmode": 0,
                            "parameter_shortname": "crosspatch[1]",
                            "parameter_type": 3
                        }
                    },
                    "varname": "crosspatch[1]"
                }
            },
            {
                "box": {
                    "comment": "",
                    "id": "obj-669",
                    "index": 0,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 206.0, 40.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "comment": "",
                    "id": "obj-670",
                    "index": 0,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 269.0, 40.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "comment": "",
                    "id": "obj-671",
                    "index": 0,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 333.0, 40.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "comment": "",
                    "id": "obj-672",
                    "index": 0,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 396.0, 40.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "comment": "",
                    "id": "obj-673",
                    "index": 0,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 121.0, 1532.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "comment": "",
                    "id": "obj-674",
                    "index": 0,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 77.5, 1532.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "comment": "",
                    "id": "obj-675",
                    "index": 0,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 169.5, 1537.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "comment": "",
                    "id": "obj-676",
                    "index": 0,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 506.0, 1537.0, 30.0, 30.0 ]
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "obj-615", 0 ],
                    "order": 1,
                    "source": [ "obj-1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-616", 0 ],
                    "order": 0,
                    "source": [ "obj-1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-420", 0 ],
                    "source": [ "obj-402", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-532", 0 ],
                    "order": 4,
                    "source": [ "obj-422", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-612", 0 ],
                    "order": 3,
                    "source": [ "obj-422", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-623", 0 ],
                    "order": 0,
                    "source": [ "obj-422", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-652", 0 ],
                    "order": 1,
                    "source": [ "obj-422", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-675", 0 ],
                    "order": 2,
                    "source": [ "obj-422", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-475", 0 ],
                    "source": [ "obj-425", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-479", 0 ],
                    "source": [ "obj-426", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-432", 0 ],
                    "source": [ "obj-431", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-426", 0 ],
                    "order": 0,
                    "source": [ "obj-432", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-435", 0 ],
                    "order": 1,
                    "source": [ "obj-432", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-438", 0 ],
                    "order": 2,
                    "source": [ "obj-432", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-475", 0 ],
                    "source": [ "obj-435", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-475", 0 ],
                    "source": [ "obj-438", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-431", 0 ],
                    "order": 1,
                    "source": [ "obj-466", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-475", 0 ],
                    "order": 0,
                    "source": [ "obj-466", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-479", 0 ],
                    "source": [ "obj-475", 3 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-485", 0 ],
                    "source": [ "obj-475", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-402", 0 ],
                    "order": 0,
                    "source": [ "obj-476", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-485", 0 ],
                    "order": 1,
                    "source": [ "obj-476", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-649", 1 ],
                    "order": 2,
                    "source": [ "obj-476", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-475", 0 ],
                    "source": [ "obj-479", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-484", 0 ],
                    "order": 0,
                    "source": [ "obj-485", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-620", 5 ],
                    "order": 1,
                    "source": [ "obj-485", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-615", 0 ],
                    "order": 1,
                    "source": [ "obj-5", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-616", 0 ],
                    "order": 0,
                    "source": [ "obj-5", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-476", 1 ],
                    "source": [ "obj-525", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-425", 0 ],
                    "source": [ "obj-529", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-537", 0 ],
                    "source": [ "obj-532", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-44", 0 ],
                    "order": 1,
                    "source": [ "obj-537", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-476", 0 ],
                    "order": 0,
                    "source": [ "obj-537", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-608", 0 ],
                    "order": 2,
                    "source": [ "obj-537", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-532", 0 ],
                    "source": [ "obj-540", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-615", 0 ],
                    "order": 1,
                    "source": [ "obj-6", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-616", 0 ],
                    "order": 0,
                    "source": [ "obj-6", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-422", 0 ],
                    "source": [ "obj-604", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-606", 0 ],
                    "order": 1,
                    "source": [ "obj-605", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-647", 0 ],
                    "order": 0,
                    "source": [ "obj-605", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-608", 1 ],
                    "source": [ "obj-606", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-607", 0 ],
                    "order": 0,
                    "source": [ "obj-608", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-618", 0 ],
                    "order": 2,
                    "source": [ "obj-608", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-643", 0 ],
                    "order": 1,
                    "source": [ "obj-608", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-674", 0 ],
                    "order": 3,
                    "source": [ "obj-608", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-609", 0 ],
                    "order": 0,
                    "source": [ "obj-610", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-628", 0 ],
                    "order": 1,
                    "source": [ "obj-610", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-476", 0 ],
                    "source": [ "obj-611", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 0 ],
                    "source": [ "obj-612", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-5", 0 ],
                    "source": [ "obj-612", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-610", 0 ],
                    "order": 1,
                    "source": [ "obj-618", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-617", 0 ],
                    "order": 0,
                    "source": [ "obj-618", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-618", 0 ],
                    "source": [ "obj-619", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-608", 2 ],
                    "source": [ "obj-620", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-620", 0 ],
                    "source": [ "obj-621", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-604", 0 ],
                    "source": [ "obj-622", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-611", 0 ],
                    "source": [ "obj-623", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-6", 0 ],
                    "order": 0,
                    "source": [ "obj-628", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-673", 0 ],
                    "order": 1,
                    "source": [ "obj-628", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-653", 0 ],
                    "order": 1,
                    "source": [ "obj-631", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-676", 0 ],
                    "order": 0,
                    "source": [ "obj-631", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-641", 0 ],
                    "source": [ "obj-633", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-636", 0 ],
                    "order": 0,
                    "source": [ "obj-637", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-654", 0 ],
                    "order": 1,
                    "source": [ "obj-637", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-640", 0 ],
                    "hidden": 1,
                    "source": [ "obj-639", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-638", 0 ],
                    "order": 0,
                    "source": [ "obj-640", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-641", 1 ],
                    "order": 1,
                    "source": [ "obj-640", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-637", 0 ],
                    "source": [ "obj-641", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-633", 0 ],
                    "source": [ "obj-642", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-642", 0 ],
                    "source": [ "obj-643", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-649", 0 ],
                    "source": [ "obj-646", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-646", 0 ],
                    "source": [ "obj-647", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-620", 4 ],
                    "order": 0,
                    "source": [ "obj-649", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-648", 0 ],
                    "order": 1,
                    "source": [ "obj-649", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-652", 0 ],
                    "source": [ "obj-653", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-631", 0 ],
                    "source": [ "obj-654", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-620", 0 ],
                    "source": [ "obj-669", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-620", 1 ],
                    "source": [ "obj-670", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-620", 2 ],
                    "source": [ "obj-671", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-620", 3 ],
                    "source": [ "obj-672", 0 ]
                }
            }
        ],
        "parameters": {
            "obj-422": [ "toggle[1]", "toggle[1]", 0 ],
            "obj-475": [ "function[6]", "function", 0 ],
            "obj-525": [ "number[13]", "number[13]", 0 ],
            "obj-540": [ "attrui", "attrui", 0 ],
            "obj-606": [ "live.slider", "modDepth", 0 ],
            "obj-621": [ "crosspatch[1]", "crosspatch[1]", 0 ],
            "obj-647": [ "number[12]", "number[12]", 0 ],
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