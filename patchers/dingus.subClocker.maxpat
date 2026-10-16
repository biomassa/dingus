{
    "patcher": {
        "fileversion": 1,
        "appversion": {
            "major": 9,
            "minor": 1,
            "revision": 2,
            "architecture": "x64",
            "modernui": 1
        },
        "classnamespace": "box",
        "rect": [ 337.0, 1391.0, 1361.0, 988.0 ],
        "openinpresentation": 1,
        "boxes": [
            {
                "box": {
                    "id": "obj-4",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 673.0, 289.0, 90.0, 22.0 ],
                    "text": "r intRecallBang"
                }
            },
            {
                "box": {
                    "fontsize": 20.0,
                    "id": "obj-3",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 173.0, 372.0, 190.0, 29.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 11.0, 40.0, 118.0, 29.0 ],
                    "text": "subClocker",
                    "textcolor": [ 1.0, 0.8509803921568627, 0.22745098039215686, 0.46 ]
                }
            },
            {
                "box": {
                    "comment": "resync bang OUT",
                    "id": "obj-2",
                    "index": 0,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1014.0, -11.0, 53.0, 53.0 ]
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "obj-81",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 947.0, -43.0, 197.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 389.0, 8.0, 82.0, 24.0 ],
                    "text": "resyncing"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.0, 0.0, 0.0, 0.0 ],
                    "blinkcolor": [ 0.24313725490196078, 0.29411764705882354, 0.8313725490196079, 1.0 ],
                    "id": "obj-79",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "outlinecolor": [ 1.0, 0.00392156862745098, 0.00392156862745098, 1.0 ],
                    "parameter_enable": 0,
                    "patching_rect": [ 952.0, -3.0, 36.0, 36.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 467.0, 2.0, 36.0, 36.0 ]
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "obj-106",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 614.0, -259.0, 83.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 156.0, 9.0, 49.0, 24.0 ],
                    "text": "beats",
                    "textcolor": [ 0.8903264403343201, 0.7958435416221619, 0.1209682747721672, 1.0 ]
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "obj-105",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 476.0, -119.0, 30.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 245.0, 9.0, 26.0, 24.0 ],
                    "text": "on",
                    "textcolor": [ 0.8903264403343201, 0.7958435416221619, 0.1209682747721672, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-104",
                    "int": 1,
                    "maxclass": "gswitch",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 574.0, 22.0, 41.0, 32.0 ]
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.11, 0.135, 0.16, 0.0 ],
                    "checkedcolor": [ 0.11372549019607843, 0.8509803921568627, 0.24313725490196078, 1.0 ],
                    "id": "obj-102",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 502.0, -124.0, 33.0, 33.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 210.0, 5.0, 33.0, 33.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "off", "on" ],
                            "parameter_longname": "toggle[5]",
                            "parameter_mmax": 1,
                            "parameter_modmode": 0,
                            "parameter_shortname": "toggle[5]",
                            "parameter_type": 2
                        }
                    },
                    "uncheckedcolor": [ 0.6470588235294118, 0.07058823529411765, 0.07058823529411765, 1.0 ],
                    "varname": "toggle"
                }
            },
            {
                "box": {
                    "id": "obj-100",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "bang", "bang" ],
                    "patching_rect": [ 675.0, -27.0, 52.0, 22.0 ],
                    "text": "togedge"
                }
            },
            {
                "box": {
                    "id": "obj-98",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 666.0, -124.0, 38.0, 22.0 ],
                    "text": "min 1"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "obj-95",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 499.0, -160.0, 83.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 31.0, 8.0, 74.0, 24.0 ],
                    "text": "resync at",
                    "textcolor": [ 0.8903264403343201, 0.7958435416221619, 0.1209682747721672, 1.0 ]
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.11, 0.135, 0.16, 0.0 ],
                    "fontsize": 16.0,
                    "id": "obj-93",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 590.0, -161.0, 58.0, 26.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 107.0, 8.0, 36.0, 26.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_invisible": 1,
                            "parameter_longname": "number[17]",
                            "parameter_modmode": 0,
                            "parameter_shortname": "number[17]",
                            "parameter_type": 3
                        }
                    },
                    "textcolor": [ 0.8903264403343201, 0.7958435416221619, 0.1209682747721672, 1.0 ],
                    "tricolor": [ 0.438625166187593, 0.438625058064006, 0.438625086318427, 0.0 ],
                    "varname": "number"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.11, 0.135, 0.16, 0.0 ],
                    "fontsize": 16.0,
                    "id": "obj-91",
                    "ignoreclick": 1,
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 581.0, -38.0, 58.0, 26.0 ],
                    "presentation": 1,
                    "presentation_rect": [ -2.0, 7.0, 58.0, 26.0 ],
                    "textcolor": [ 0.5450980392156862, 0.5450980392156862, 0.5450980392156862, 1.0 ],
                    "tricolor": [ 0.438625166187593, 0.438625058064006, 0.438625086318427, 0.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-89",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 590.0, -124.0, 48.0, 22.0 ],
                    "text": "max $1"
                }
            },
            {
                "box": {
                    "id": "obj-87",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 590.0, -204.0, 58.0, 22.0 ],
                    "text": "loadbang"
                }
            },
            {
                "box": {
                    "id": "obj-86",
                    "maxclass": "newobj",
                    "numinlets": 5,
                    "numoutlets": 4,
                    "outlettype": [ "int", "", "", "int" ],
                    "patching_rect": [ 581.0, -74.0, 61.0, 22.0 ],
                    "text": "counter"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.11, 0.135, 0.16, 0.0 ],
                    "blinkcolor": [ 0.8901960784313725, 0.796078431372549, 0.12156862745098039, 1.0 ],
                    "id": "obj-85",
                    "ignoreclick": 1,
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "outlinecolor": [ 0.202652016134754, 0.214928828394336, 0.228372411655534, 0.0 ],
                    "parameter_enable": 0,
                    "patching_rect": [ 533.0, -233.0, 40.0, 40.0 ],
                    "presentation": 1,
                    "presentation_rect": [ -23.0, 0.0, 40.0, 40.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-76",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "bang", "bang" ],
                    "patching_rect": [ 450.0, -203.0, 42.0, 22.0 ],
                    "text": "edge~"
                }
            },
            {
                "box": {
                    "id": "obj-75",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "signal", "int" ],
                    "patching_rect": [ 450.0, -234.0, 41.0, 22.0 ],
                    "text": "what~"
                }
            },
            {
                "box": {
                    "fontsize": 20.0,
                    "id": "obj-592",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1414.0, 1154.0, 231.0, 29.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 252.0, 208.0, 67.0, 29.0 ],
                    "text": "divisor",
                    "textcolor": [ 0.997900664806366, 0.6942399144172668, 0.4273000657558441, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-1",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 4,
                    "outlettype": [ "", "", "", "" ],
                    "patching_rect": [ 2.0, 57.0, 56.0, 22.0 ],
                    "restore": {
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
                        "function[6]": [ 1000.0, -1.0, 1.0, 0.0, 0.0, 0, 0.0, 1000.0, 0.0, 0, 0.0, "curve" ],
                        "live.slider": [ 0.0 ],
                        "number": [ 8 ],
                        "number[12]": [ 2.0 ],
                        "number[13]": [ 8.0 ],
                        "toggle": [ 1 ]
                    },
                    "text": "autopattr",
                    "varname": "u852013053"
                }
            },
            {
                "box": {
                    "comment": "phasorClock input",
                    "id": "obj-12",
                    "index": 0,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 114.0, 81.0, 38.0, 38.0 ]
                }
            },
            {
                "box": {
                    "activebgcolor": [ 0.156862745098039, 0.156862745098039, 0.156862745098039, 0.0 ],
                    "activelinecolor": [ 0.19607843137254902, 1.0, 0.984313725490196, 1.0 ],
                    "id": "obj-7",
                    "ignoreclick": 1,
                    "maxclass": "live.scope~",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 453.0, 821.0, 185.0, 91.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 6.0, 81.0, 170.0, 168.0 ],
                    "range": [ -0.10000000149011612, 1.1 ]
                }
            },
            {
                "box": {
                    "id": "obj-8",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "signal", "int" ],
                    "patching_rect": [ 375.0, 876.0, 41.0, 22.0 ],
                    "text": "what~"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "obj-6",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 275.0, 184.0, 187.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 437.0, 216.0, 38.0, 24.0 ],
                    "text": "rate"
                }
            },
            {
                "box": {
                    "comment": "modulated clock OUT",
                    "id": "obj-5",
                    "index": 0,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 124.0, 1052.0, 53.0, 53.0 ]
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
                    "patching_rect": [ 1300.0, 286.0, 24.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 414.0, 104.0, 32.0, 32.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-611",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1348.0, 289.0, 45.0, 22.0 ],
                    "text": "goto 0."
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
                    "patching_rect": [ 1391.0, 317.0, 62.0, 31.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 323.0, 208.0, 62.0, 31.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_invisible": 1,
                            "parameter_longname": "number[16]",
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
                    "patching_rect": [ 851.0, 351.0, 184.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 314.0, 243.0, 184.0, 20.0 ],
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
                    "patching_rect": [ 1369.0, 684.0, 81.0, 22.0 ],
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
                    "patching_rect": [ 847.0, 671.0, 492.0, 10.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 7.0, 366.0, 492.0, 12.0 ],
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
                    "patching_rect": [ 673.0, 340.5, 58.0, 22.0 ],
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
                    "patching_rect": [ 794.0, 454.0, 47.0, 22.0 ],
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
                    "patching_rect": [ 761.0, 394.0, 47.0, 22.0 ],
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
                    "patching_rect": [ 724.0, 427.0, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-435",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 713.0, 479.0, 45.0, 22.0 ],
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
                    "patching_rect": [ 761.0, 478.0, 29.5, 22.0 ],
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
                    "patching_rect": [ 767.0, 336.0, 52.0, 31.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 186.0, 208.0, 52.0, 31.0 ],
                    "text": "clear",
                    "textcolor": [ 1.0, 0.4392156862745098, 0.4392156862745098, 1.0 ]
                }
            },
            {
                "box": {
                    "addpoints_with_curve": [ 0.0, 0.0, 0, 0.0, 1000.0, 0.0, 0, 0.0 ],
                    "classic_curve": 0,
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
                    "patching_rect": [ 848.0, 517.0, 491.0, 152.0 ],
                    "pointsize": 5.0,
                    "presentation": 1,
                    "presentation_rect": [ 6.0, 239.0, 491.5, 130.0 ],
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
                    "patching_rect": [ 1369.0, 358.0, 36.0, 22.0 ],
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
                    "patching_rect": [ 848.0, 442.0, 24.0, 24.0 ]
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
                    "patching_rect": [ 1404.0, 551.0, 95.0, 57.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 186.0, 138.0, 207.0, 68.0 ],
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
                    "patching_rect": [ 1330.0, 465.0, 48.0, 22.0 ],
                    "text": "shape~"
                }
            },
            {
                "box": {
                    "id": "obj-646",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 192.5, 57.0, 77.0, 22.0 ],
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
                    "patching_rect": [ 219.0, 12.0, 50.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 396.0, 219.0, 35.0, 22.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_invisible": 1,
                            "parameter_longname": "number[15]",
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
                    "patching_rect": [ 192.5, 174.0, 184.0, 68.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 406.0, 144.0, 86.0, 68.0 ],
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
                            "revision": 2,
                            "architecture": "x64",
                            "modernui": 1
                        },
                        "classnamespace": "dsp.gen",
                        "rect": [ 554.0, 1646.0, 600.0, 450.0 ],
                        "boxes": [
                            {
                                "box": {
                                    "id": "obj-2",
                                    "maxclass": "newobj",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 124.0, 29.0, 28.0, 22.0 ],
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
                                    "patching_rect": [ 124.0, 63.0, 508.0, 307.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-1",
                                    "maxclass": "newobj",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 65.0, 29.0, 28.0, 22.0 ],
                                    "text": "in 1"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-4",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 65.0, 369.0, 35.0, 22.0 ],
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
                    "patching_rect": [ 198.0, 97.0, 133.0, 22.0 ],
                    "text": "gen~ @t glider @freq 1"
                }
            },
            {
                "box": {
                    "color": [ 0.8705882352941177, 0.6078431372549019, 0.12941176470588237, 1.0 ],
                    "id": "obj-627",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 902.0, 124.0, 56.0, 22.0 ],
                    "text": "r~ ES8-4"
                }
            },
            {
                "box": {
                    "color": [ 0.8705882352941177, 0.6078431372549019, 0.12941176470588237, 1.0 ],
                    "id": "obj-626",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 839.0, 124.0, 56.0, 22.0 ],
                    "text": "r~ ES8-3"
                }
            },
            {
                "box": {
                    "color": [ 0.8705882352941177, 0.6078431372549019, 0.12941176470588237, 1.0 ],
                    "id": "obj-625",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 776.0, 124.0, 56.0, 22.0 ],
                    "text": "r~ ES8-2"
                }
            },
            {
                "box": {
                    "color": [ 0.8705882352941177, 0.6078431372549019, 0.12941176470588237, 1.0 ],
                    "id": "obj-624",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 711.0, 124.0, 56.0, 22.0 ],
                    "text": "r~ ES8-1"
                }
            },
            {
                "box": {
                    "id": "obj-620",
                    "maxclass": "newobj",
                    "numinlets": 6,
                    "numoutlets": 2,
                    "outlettype": [ "signal", "" ],
                    "patching_rect": [ 558.3333333333334, 203.0, 337.33333333333303, 22.0 ],
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
                    "patching_rect": [ 53.0, 0.0, 58.0, 22.0 ],
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
                    "patching_rect": [ 53.0, 642.0, 59.0, 95.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 441.0, 47.0, 67.0, 95.0 ],
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
                            "parameter_mmax": 10.0,
                            "parameter_mmin": -10.0,
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
                    "patching_rect": [ 452.0, 781.0, 190.0, 131.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 6.0, 40.0, 170.0, 199.0 ],
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
                            "revision": 2,
                            "architecture": "x64",
                            "modernui": 1
                        },
                        "classnamespace": "box",
                        "rect": [ 1027.0, 567.0, 640.0, 480.0 ],
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
                                    "outlettype": [ "" ],
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
                    "patching_rect": [ 124.0, 791.8000327944756, 104.0, 22.0 ],
                    "text": "p modulateClocks"
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
                    "patching_rect": [ 172.0, 264.0, 260.0, 96.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 186.0, 40.0, 260.0, 96.0 ],
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
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "obj-104", 2 ],
                    "source": [ "obj-100", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-104", 0 ],
                    "source": [ "obj-102", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-79", 0 ],
                    "source": [ "obj-104", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-476", 0 ],
                    "order": 0,
                    "source": [ "obj-12", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-608", 0 ],
                    "order": 2,
                    "source": [ "obj-12", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-75", 0 ],
                    "order": 1,
                    "source": [ "obj-12", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-425", 0 ],
                    "source": [ "obj-4", 0 ]
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
                    "order": 2,
                    "source": [ "obj-432", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-438", 0 ],
                    "order": 1,
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
                    "destination": [ "obj-476", 1 ],
                    "source": [ "obj-525", 0 ]
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
                    "destination": [ "obj-5", 0 ],
                    "order": 2,
                    "source": [ "obj-608", 0 ]
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
                    "destination": [ "obj-8", 0 ],
                    "order": 1,
                    "source": [ "obj-608", 0 ]
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
                    "destination": [ "obj-611", 0 ],
                    "source": [ "obj-623", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-620", 0 ],
                    "source": [ "obj-624", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-620", 1 ],
                    "source": [ "obj-625", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-620", 2 ],
                    "source": [ "obj-626", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-620", 3 ],
                    "source": [ "obj-627", 0 ]
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
                    "destination": [ "obj-76", 0 ],
                    "source": [ "obj-75", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-85", 0 ],
                    "source": [ "obj-76", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-2", 0 ],
                    "order": 1,
                    "source": [ "obj-79", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-623", 0 ],
                    "order": 0,
                    "source": [ "obj-79", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-7", 0 ],
                    "source": [ "obj-8", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-86", 0 ],
                    "source": [ "obj-85", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-100", 0 ],
                    "source": [ "obj-86", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-91", 0 ],
                    "source": [ "obj-86", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-93", 0 ],
                    "order": 1,
                    "source": [ "obj-87", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-98", 0 ],
                    "order": 0,
                    "source": [ "obj-87", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-86", 0 ],
                    "source": [ "obj-89", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-89", 0 ],
                    "source": [ "obj-93", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-86", 0 ],
                    "source": [ "obj-98", 0 ]
                }
            }
        ],
        "parameters": {
            "obj-102": [ "toggle[5]", "toggle[5]", 0 ],
            "obj-475": [ "function[6]", "function", 0 ],
            "obj-525": [ "number[16]", "number[13]", 0 ],
            "obj-606": [ "live.slider", "modDepth", 0 ],
            "obj-621": [ "crosspatch[1]", "crosspatch[1]", 0 ],
            "obj-647": [ "number[15]", "number[12]", 0 ],
            "obj-93": [ "number[17]", "number[17]", 0 ],
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