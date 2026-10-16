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
        "rect": [ 34.0, 92.0, 1881.0, 1170.0 ],
        "openinpresentation": 1,
        "assistshowspatchername": 1,
        "integercoordinates": 1,
        "boxes": [
            {
                "box": {
                    "id": "obj-4",
                    "linecount": 3,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1108.0, 401.0, 150.0, 47.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 669.0, 1.0, 278.0, 20.0 ],
                    "text": "USE [bpatcher dingus.pitchSeq.maxpat @args NAME]"
                }
            },
            {
                "box": {
                    "id": "obj-71",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1700.0, 270.0, 100.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1173.0, 890.0, 100.0, 22.0 ],
                    "saved_object_attributes": {
                        "alias": "",
                        "group": ""
                    },
                    "text": "maxmcp uPITCH"
                }
            },
            {
                "box": {
                    "id": "obj-10",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "float", "float" ],
                    "patching_rect": [ 1420.0, 495.0, 52.0, 22.0 ],
                    "text": "th.ftomb"
                }
            },
            {
                "box": {
                    "filename": "dingus.tuningSlider.js",
                    "id": "obj-25",
                    "maxclass": "jsui",
                    "numinlets": 3,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1250.0, 405.0, 336.0, 52.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 349.0, 829.0, 334.0, 52.0 ]
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontname": "Helvetica",
                    "fontsize": 16.0,
                    "id": "obj-101",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 480.0, 125.0, 63.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 73.0, 216.0, 41.0, 22.0 ],
                    "saved_attribute_attributes": {
                        "textcolor": {
                            "expression": "themecolor.theme_textcolor"
                        }
                    },
                    "text": "low"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "obj-79",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 420.0, 125.0, 57.0, 26.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 130.0, 214.0, 40.0, 26.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_invisible": 1,
                            "parameter_longname": "number[5]",
                            "parameter_modmode": 0,
                            "parameter_shortname": "number[5]",
                            "parameter_type": 3
                        }
                    },
                    "varname": "number[5]"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontname": "Helvetica",
                    "fontsize": 16.0,
                    "id": "obj-23",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 620.0, 125.0, 63.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 73.0, 249.0, 55.0, 22.0 ],
                    "saved_attribute_attributes": {
                        "textcolor": {
                            "expression": "themecolor.theme_textcolor"
                        }
                    },
                    "text": "range"
                }
            },
            {
                "box": {
                    "id": "obj-72",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1430.0, 105.0, 35.0, 22.0 ],
                    "text": "clear"
                }
            },
            {
                "box": {
                    "id": "obj-69",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 20.0, 550.0, 301.0, 22.0 ],
                    "text": "prefix \"~/Dropbox/musicstuff/Max 9/Library/th.scala/scl\""
                }
            },
            {
                "box": {
                    "id": "obj-21",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 330.0, 90.0, 35.0, 22.0 ],
                    "text": "reset"
                }
            },
            {
                "box": {
                    "comment": "resetbang",
                    "id": "obj-14",
                    "index": 0,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 330.0, 40.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "annotation": "frequency",
                    "comment": "frequency",
                    "hint": "frequency",
                    "id": "obj-2",
                    "index": 0,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1820.0, 690.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "obj-100",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1770.0, 565.0, 183.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 763.0, 861.0, 71.0, 24.0 ],
                    "text": "N+cents"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "obj-99",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1815.0, 470.0, 183.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 802.0, 828.0, 32.0, 24.0 ],
                    "text": "Hz"
                }
            },
            {
                "box": {
                    "id": "obj-96",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1700.0, 440.0, 293.0, 22.0 ],
                    "text": "min 8.175799, max 8372.01807, numdecimalplaces 6"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.117647058823529, 0.419607843137255, 0.666666666666667, 1.0 ],
                    "fontsize": 16.0,
                    "format": 6,
                    "htricolor": [ 1.0, 1.0, 1.0, 1.0 ],
                    "id": "obj-94",
                    "ignoreclick": 1,
                    "maxclass": "flonum",
                    "maximum": 120.0,
                    "minimum": 0.0,
                    "numdecimalplaces": 2,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "parameter_mappable": 0,
                    "patching_rect": [ 1700.0, 565.0, 64.00000095367432, 26.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 837.0, 860.0, 64.0, 26.0 ],
                    "textcolor": [ 1.0, 1.0, 1.0, 1.0 ],
                    "triangle": 0,
                    "tricolor": [ 1.0, 1.0, 1.0, 1.0 ]
                }
            },
            {
                "box": {
                    "bgcolor": [ 1.0, 0.0, 0.0, 1.0 ],
                    "color": [ 0.0, 0.0, 0.0, 1.0 ],
                    "id": "obj-6",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "patching_rect": [ 1700.0, 505.0, 69.0, 22.0 ],
                    "text": "+ 0.000001",
                    "textcolor": [ 1.0, 1.0, 1.0, 1.0 ]
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.117647058823529, 0.419607843137255, 0.666666666666667, 1.0 ],
                    "fontsize": 16.0,
                    "format": 6,
                    "htricolor": [ 1.0, 1.0, 1.0, 1.0 ],
                    "id": "obj-92",
                    "ignoreclick": 1,
                    "maxclass": "flonum",
                    "maximum": 8372.01807,
                    "minimum": 8.175799,
                    "numdecimalplaces": 6,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "parameter_mappable": 0,
                    "patching_rect": [ 1700.0, 470.0, 108.0, 26.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 835.0, 827.0, 108.0, 26.0 ],
                    "textcolor": [ 1.0, 1.0, 1.0, 1.0 ],
                    "triangle": 0,
                    "tricolor": [ 1.0, 1.0, 1.0, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-93",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1700.0, 535.0, 45.0, 22.0 ],
                    "text": "ftom 0."
                }
            },
            {
                "box": {
                    "id": "obj-84",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 20.0, 520.0, 58.0, 22.0 ],
                    "text": "loadbang"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "obj-35",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 560.0, 125.0, 57.0, 26.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 130.0, 247.0, 46.0, 26.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_invisible": 1,
                            "parameter_longname": "number[4]",
                            "parameter_modmode": 0,
                            "parameter_shortname": "number[4]",
                            "parameter_type": 3
                        }
                    },
                    "varname": "number[4]"
                }
            },
            {
                "box": {
                    "id": "obj-12",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 20.0, 600.0, 58.0, 22.0 ],
                    "text": "loadbang"
                }
            },
            {
                "box": {
                    "id": "obj-13",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1370.0, 235.0, 180.0, 20.0 ],
                    "text": "<- double-click to see the tuning"
                }
            },
            {
                "box": {
                    "id": "obj-83",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 5,
                    "outlettype": [ "dictionary", "", "", "", "" ],
                    "patching_rect": [ 1250.0, 235.0, 115.0, 22.0 ],
                    "saved_object_attributes": {
                        "legacy": 1,
                        "parameter_enable": 0,
                        "parameter_mappable": 0
                    },
                    "text": "dict myTuningName"
                }
            },
            {
                "box": {
                    "id": "obj-82",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1410.0, 140.0, 199.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 115.0, 832.0, 199.0, 20.0 ],
                    "text": "tune from                  Hz at value      "
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "obj-15",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 1340.0, 140.0, 57.0, 26.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 291.0, 829.0, 57.0, 26.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [ 69 ],
                            "parameter_initial_enable": 1,
                            "parameter_invisible": 1,
                            "parameter_longname": "number[1]",
                            "parameter_modmode": 0,
                            "parameter_shortname": "number[1]",
                            "parameter_type": 3
                        }
                    },
                    "textcolor": [ 0.9975724816322327, 0.9134618043899536, 0.07348711043596268, 1.0 ],
                    "varname": "number[2]"
                }
            },
            {
                "box": {
                    "id": "obj-17",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1340.0, 170.0, 59.0, 22.0 ],
                    "text": "center $1"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "format": 6,
                    "id": "obj-59",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 1250.0, 140.0, 60.0, 26.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 168.0, 829.0, 60.0, 26.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [ 440 ],
                            "parameter_initial_enable": 1,
                            "parameter_invisible": 1,
                            "parameter_longname": "number[2]",
                            "parameter_modmode": 0,
                            "parameter_shortname": "number",
                            "parameter_type": 3
                        }
                    },
                    "textcolor": [ 0.9958613514900208, 0.9134617447853088, 0.07348660379648209, 1.0 ],
                    "varname": "number[3]"
                }
            },
            {
                "box": {
                    "id": "obj-18",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1250.0, 170.0, 49.0, 22.0 ],
                    "text": "tune $1"
                }
            },
            {
                "box": {
                    "id": "obj-24",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1250.0, 465.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-26",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "patching_rect": [ 1250.0, 495.0, 129.0, 22.0 ],
                    "text": "th.stof myTuningName"
                }
            },
            {
                "box": {
                    "autopopulate": 1,
                    "fontsize": 16.0,
                    "id": "obj-52",
                    "items": [ "09-22.scl", ",", "12-edo.scl", ",", "12edo.scl", ",", "22edo.scl", ",", "31-edo.scl", ",", "31edo-linnstrument.scl", ",", "31edo.scl", ",", "53edo.scl", ",", "ji_11.scl", ",", "ji_13.scl", ",", "ji_17.scl", ",", "ji_7.scl", ",", "ji_7a.scl", ",", "ji_8coh.scl", ",", "ji_9.scl", ",", "ji_9coh.scl", ",", "partch-grm.scl", ",", "partch_43.scl" ],
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 1250.0, 40.0, 100.0, 26.0 ],
                    "prefix": "~/Dropbox/musicstuff/Max 9/Library/th.scala/scl/",
                    "prefix_mode": 2,
                    "presentation": 1,
                    "presentation_rect": [ 28.0, 176.0, 142.0, 26.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "09-22.scl", "12-edo.scl", "12edo.scl", "22edo.scl", "31-edo.scl", "31edo-linnstrument.scl", "31edo.scl", "53edo.scl", "ji_11.scl", "ji_13.scl", "ji_17.scl", "ji_7.scl", "ji_7a.scl", "ji_8coh.scl", "ji_9.scl", "ji_9coh.scl", "partch-grm.scl", "partch_43.scl" ],
                            "parameter_longname": "umenu",
                            "parameter_mmax": 17,
                            "parameter_modmode": 0,
                            "parameter_shortname": "umenu",
                            "parameter_type": 2
                        }
                    },
                    "textcolor": [ 1.0, 0.9137254901960784, 0.07450980392156863, 1.0 ],
                    "varname": "umenu"
                }
            },
            {
                "box": {
                    "id": "obj-53",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 20.0, 630.0, 55.0, 22.0 ],
                    "text": "getmenu"
                }
            },
            {
                "box": {
                    "id": "obj-57",
                    "maxclass": "dict.view",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1250.0, 265.0, 265.0, 127.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 115.0, 890.0, 572.0, 120.0 ],
                    "textcolor": [ 0.9975724816322327, 0.9134618043899536, 0.07348711043596268, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-73",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 1250.0, 205.0, 265.0, 22.0 ],
                    "text": "th.scala myTuningName @tune 440 @center 69"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 12.0,
                    "id": "obj-74",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1250.0, 530.0, 435.0, 20.0 ],
                    "text": "written by Timo Hoogland 2020, www.timohoogland.com, MIT License"
                }
            },
            {
                "box": {
                    "fontsize": 20.0,
                    "id": "obj-85",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 90.0, 0.0, 83.8000038266182, 29.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 2.0, 0.0, 87.0, 29.0 ],
                    "text": "uPITCH",
                    "textcolor": [ 1.0, 0.8509803921568627, 0.22745098039215686, 0.46 ]
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontname": "Helvetica",
                    "fontsize": 16.0,
                    "id": "obj-8",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1870.0, 600.0, 78.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 70.0, 137.0, 60.0, 22.0 ],
                    "saved_attribute_attributes": {
                        "textcolor": {
                            "expression": "themecolor.theme_textcolor"
                        }
                    },
                    "text": "output"
                }
            },
            {
                "box": {
                    "checkedcolor": [ 0.03529411764705882, 1.0, 0.09803921568627451, 1.0 ],
                    "id": "obj-7",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 1840.0, 600.0, 24.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 132.0, 122.0, 45.0, 45.0 ],
                    "prototypename": "muteButton",
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "off", "on" ],
                            "parameter_longname": "toggle",
                            "parameter_mmax": 1,
                            "parameter_modmode": 0,
                            "parameter_shortname": "toggle",
                            "parameter_type": 2
                        }
                    },
                    "uncheckedcolor": [ 0.8, 0.14901960784313725, 0.14901960784313725, 1.0 ],
                    "varname": "toggle"
                }
            },
            {
                "box": {
                    "id": "obj-5",
                    "int": 1,
                    "maxclass": "gswitch",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1700.0, 635.0, 41.0, 32.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-1",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 4,
                    "outlettype": [ "", "", "", "" ],
                    "patching_rect": [ 1700.0, 240.0, 142.0, 22.0 ],
                    "restore": {
                        "multislider[1]": [ 0.0, 0.0, 0.0, 1.0, 1.0 ],
                        "multislider[2]": [ 0.0, 0.0, 0.0, 1.0, 1.0 ],
                        "number": [ 5 ],
                        "number[1]": [ 0.0 ],
                        "number[2]": [ 69 ],
                        "number[3]": [ 440.0 ],
                        "number[4]": [ 0 ],
                        "number[5]": [ 0 ],
                        "pitchgrid": [ -2, 5, 43, 48, 50, 45, 45, 0, 0.5, 0, 0, 0, 0, 0, 0, 0, 0 ],
                        "rslider": [ 0, 5 ],
                        "snap": [ 1 ],
                        "toggle": [ 0 ]
                    },
                    "restore_extra": {
                        "multislider[1]": {
                            "id": "obj-75"
                        },
                        "multislider[2]": {
                            "id": "obj-32"
                        },
                        "number": {
                            "id": "obj-33"
                        },
                        "number[1]": {
                            "id": "obj-61"
                        },
                        "number[2]": {
                            "id": "obj-15"
                        },
                        "number[3]": {
                            "id": "obj-59"
                        },
                        "number[4]": {
                            "id": "obj-35"
                        },
                        "number[5]": {
                            "id": "obj-79"
                        },
                        "pitchgrid": {
                            "id": "obj-pg1"
                        },
                        "rslider": {
                            "id": "obj-40"
                        },
                        "snap": {
                            "id": "sn-tg"
                        },
                        "toggle": {
                            "id": "obj-7"
                        }
                    },
                    "text": "autopattr @autorestore 0",
                    "varname": "u127011046"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontname": "Helvetica",
                    "fontsize": 16.0,
                    "id": "obj-65",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 175.0, 130.0, 45.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 82.0, 98.0, 41.0, 22.0 ],
                    "saved_attribute_attributes": {
                        "textcolor": {
                            "expression": "themecolor.theme_textcolor"
                        }
                    },
                    "text": "rate"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontname": "Helvetica",
                    "fontsize": 16.0,
                    "id": "obj-64",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 420.0, 40.0, 58.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 274.0, 0.0, 59.0, 22.0 ],
                    "saved_attribute_attributes": {
                        "textcolor": {
                            "expression": "themecolor.theme_textcolor"
                        }
                    },
                    "text": "steps"
                }
            },
            {
                "box": {
                    "id": "obj-36",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1010.0, 635.0, 48.0, 22.0 ],
                    "text": "0 5"
                }
            },
            {
                "box": {
                    "bubble": 1,
                    "fontname": "Arial",
                    "fontsize": 12.0,
                    "id": "obj-37",
                    "linecount": 3,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1010.0, 575.0, 212.0, 51.0 ],
                    "saved_attribute_attributes": {
                        "textcolor": {
                            "expression": "themecolor.theme_textcolor"
                        }
                    },
                    "text": "can be set as ints representing the steps or as floats representing the normalized range"
                }
            },
            {
                "box": {
                    "id": "obj-38",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 950.0, 575.0, 29.5, 22.0 ],
                    "text": "join"
                }
            },
            {
                "box": {
                    "id": "obj-40",
                    "maxclass": "rslider",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 950.0, 445.0, 241.0, 123.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 254.0, 644.0, 692.0, 19.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [ 0, 16 ],
                            "parameter_initial_enable": 1,
                            "parameter_invisible": 1,
                            "parameter_longname": "rslider[4]",
                            "parameter_modmode": 0,
                            "parameter_shortname": "rslider",
                            "parameter_type": 3
                        }
                    },
                    "size": 6.0,
                    "varname": "rslider"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontname": "Helvetica",
                    "fontsize": 16.0,
                    "id": "obj-41",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 950.0, 420.0, 52.0, 22.0 ],
                    "saved_attribute_attributes": {
                        "textcolor": {
                            "expression": "themecolor.theme_textcolor"
                        }
                    },
                    "text": "range"
                }
            },
            {
                "box": {
                    "id": "obj-42",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 950.0, 665.0, 87.0, 22.0 ],
                    "text": "prepend range"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontname": "Helvetica",
                    "fontsize": 16.0,
                    "id": "obj-29",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 950.0, 230.0, 127.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 115.0, 768.0, 127.0, 22.0 ],
                    "saved_attribute_attributes": {
                        "textcolor": {
                            "expression": "themecolor.theme_textcolor"
                        }
                    },
                    "text": "skip probability"
                }
            },
            {
                "box": {
                    "contdata": 1,
                    "id": "obj-32",
                    "maxclass": "multislider",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 950.0, 255.0, 241.0, 123.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 255.0, 738.0, 691.0, 69.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [ 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0 ],
                            "parameter_invisible": 1,
                            "parameter_longname": "multislider[2]",
                            "parameter_modmode": 0,
                            "parameter_shortname": "multislider[8]",
                            "parameter_type": 3
                        }
                    },
                    "setminmax": [ 0.0, 1.0 ],
                    "setstyle": 1,
                    "shadowalpha": 1.0,
                    "size": 5,
                    "slidercolor": [ 0.498, 0.5561, 0.7451, 1.0 ],
                    "varname": "multislider[2]"
                }
            },
            {
                "box": {
                    "id": "obj-204",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 950.0, 385.0, 101.0, 22.0 ],
                    "text": "prepend skipprob"
                }
            },
            {
                "box": {
                    "id": "obj-70",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 260.0, 90.0, 22.0, 22.0 ],
                    "text": "t b"
                }
            },
            {
                "box": {
                    "id": "obj-66",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 260.0, 120.0, 29.5, 22.0 ],
                    "text": "0"
                }
            },
            {
                "box": {
                    "activebgcolor": [ 0.156862745098039, 0.156862745098039, 0.156862745098039, 0.0 ],
                    "activelinecolor": [ 0.3607843137254902, 1.0, 0.19607843137254902, 1.0 ],
                    "id": "obj-62",
                    "maxclass": "live.scope~",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 160.0, 245.0, 95.0, 21.600000321865082 ],
                    "presentation": 1,
                    "presentation_rect": [ 0.0, 36.0, 175.0, 64.0 ],
                    "range": [ -0.10000000149011612, 1.1 ]
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-61",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 120.0, 130.0, 50.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 125.0, 98.0, 50.0, 22.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_invisible": 1,
                            "parameter_longname": "number[10]",
                            "parameter_modmode": 0,
                            "parameter_shortname": "number[10]",
                            "parameter_type": 3
                        }
                    },
                    "varname": "number[1]"
                }
            },
            {
                "box": {
                    "id": "obj-56",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 20.0, 130.0, 86.0, 22.0 ],
                    "text": "rate~ @sync 1"
                }
            },
            {
                "box": {
                    "id": "obj-55",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 620.0, 40.0, 24.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 147.0, 283.0, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-33",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 480.0, 40.0, 50.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 338.0, 0.0, 50.0, 22.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_invisible": 1,
                            "parameter_longname": "number",
                            "parameter_modmode": 0,
                            "parameter_shortname": "number",
                            "parameter_type": 3
                        }
                    },
                    "varname": "number"
                }
            },
            {
                "box": {
                    "id": "obj-30",
                    "maxclass": "newobj",
                    "numinlets": 6,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1700.0, 600.0, 130.0, 22.0 ],
                    "text": "scale 0. 127. 0. 1.0494"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "obj-95",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 20.0, 370.0, 58.0, 26.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 130.0, 315.0, 47.0, 26.0 ],
                    "textcolor": [ 0.32941176470588235, 0.45098039215686275, 1.0, 1.0 ]
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "obj-86",
                    "ignoreclick": 1,
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 100.0, 370.0, 58.0, 26.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 80.0, 315.0, 48.0, 26.0 ],
                    "textcolor": [ 0.32941176470588235, 0.45098039215686275, 1.0, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-164",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 260.0, 195.0, 71.0, 22.0 ],
                    "text": "direction $1"
                }
            },
            {
                "box": {
                    "id": "obj-39",
                    "items": [ "forward", ",", "reverse", ",", "random" ],
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 260.0, 165.0, 74.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 70.0, 284.0, 74.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-205",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 950.0, 195.0, 100.0, 22.0 ],
                    "text": "prepend restprob"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontname": "Helvetica",
                    "fontsize": 16.0,
                    "id": "obj-91",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 950.0, 40.0, 127.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 115.0, 694.0, 127.0, 22.0 ],
                    "saved_attribute_attributes": {
                        "textcolor": {
                            "expression": "themecolor.theme_textcolor"
                        }
                    },
                    "text": "rest probability"
                }
            },
            {
                "box": {
                    "contdata": 1,
                    "id": "obj-75",
                    "maxclass": "multislider",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 950.0, 65.0, 241.0, 123.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 255.0, 665.0, 691.0, 72.0 ],
                    "prototypename": "skip-temp-1",
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_initial": [ 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0 ],
                            "parameter_invisible": 1,
                            "parameter_longname": "multislider[3]",
                            "parameter_modmode": 0,
                            "parameter_shortname": "multislider[7]",
                            "parameter_type": 3
                        }
                    },
                    "setminmax": [ 0.0, 1.0 ],
                    "setstyle": 1,
                    "shadowalpha": 1.0,
                    "shadowblend": 0.12,
                    "size": 5,
                    "style": "rnbohighcontrast",
                    "varname": "multislider[1]"
                }
            },
            {
                "box": {
                    "activelinecolor": [ 1.0, 0.709803921568627, 0.196078431372549, 0.65 ],
                    "id": "obj-45",
                    "maxclass": "live.scope~",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 20.0, 165.0, 95.0, 57.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 0.0, 29.0, 175.0, 64.0 ],
                    "range": [ -0.10000000149011612, 1.1 ]
                }
            },
            {
                "box": {
                    "comment": "phasor input",
                    "id": "obj-46",
                    "index": 0,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 20.0, 40.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "comment": "isRunning",
                    "id": "obj-47",
                    "index": 0,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 260.0, 40.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "annotation": "to sig~ for voltage",
                    "comment": "to sig~ for voltage",
                    "hint": "to sig~ for voltage",
                    "id": "obj-49",
                    "index": 0,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1700.0, 690.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 12.0,
                    "id": "obj-206",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 20.0, 440.0, 72.0, 22.0 ],
                    "text": "loadbang"
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 12.0,
                    "id": "obj-207",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 100.0, 470.0, 79.0, 22.0 ],
                    "text": "delay 100"
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 12.0,
                    "id": "obj-208",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 5.0, 58.0, 20.0 ],
                    "text": "v0.0.6"
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 12.0,
                    "id": "obj-209",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 180.0, 470.0, 79.0, 22.0 ],
                    "text": "delay 150"
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 12.0,
                    "id": "obj-210",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 20.0, 470.0, 72.0, 22.0 ],
                    "text": "delay 50"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontname": "Arial",
                    "fontsize": 12.0,
                    "id": "obj-78",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "signal", "int" ],
                    "patching_rect": [ 20.0, 245.0, 131.0, 22.0 ],
                    "text": "what~ 0 0.2 0.4 0.6 0.8"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontname": "Arial",
                    "fontsize": 12.0,
                    "id": "obj-122",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 4,
                    "outlettype": [ "", "int", "float", "" ],
                    "patching_rect": [ 20.0, 335.0, 343.0, 22.0 ],
                    "text": "dingus.sequencedata~"
                }
            },
            {
                "box": {
                    "comment": "play (1) / pause (0)",
                    "id": "obj-play1",
                    "index": 0,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 395.0, 40.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-play2",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 20.0, 285.0, 40.0, 22.0 ],
                    "text": "*~ 1"
                }
            },
            {
                "box": {
                    "id": "obj-play3",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 65.0, 285.0, 95.0, 20.0 ],
                    "text": "play/pause gate"
                }
            },
            {
                "box": {
                    "id": "obj-ord1",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "bang", "" ],
                    "patching_rect": [ 950.0, 605.0, 40.0, 22.0 ],
                    "text": "t b l"
                }
            },
            {
                "box": {
                    "id": "obj-ord2",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "bang", "bang", "bang" ],
                    "patching_rect": [ 620.0, 75.0, 50.0, 22.0 ],
                    "text": "t b b b"
                }
            },
            {
                "box": {
                    "filename": "dingus.pitchGrid.js",
                    "id": "obj-pg1",
                    "maxclass": "jsui",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 420.0, 210.0, 389.0, 123.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 177.0, 23.0, 770.0, 619.0 ],
                    "varname": "pitchgrid"
                }
            },
            {
                "box": {
                    "id": "obj-ps1",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1700.0, 100.0, 306.0, 22.0 ],
                    "saved_object_attributes": {
                        "client_rect": [ 580, 87, 949, 304 ],
                        "parameter_enable": 0,
                        "parameter_mappable": 0,
                        "storage_rect": [ 583, 69, 1034, 197 ]
                    },
                    "text": "pattrstorage #1_uPITCH @savemode 0 @autorestore 0",
                    "varname": "#1_uPITCH"
                }
            },
            {
                "box": {
                    "id": "obj-ps2",
                    "maxclass": "preset",
                    "numinlets": 1,
                    "numoutlets": 5,
                    "outlettype": [ "preset", "int", "preset", "int", "" ],
                    "patching_rect": [ 1700.0, 40.0, 100.0, 20.0 ],
                    "pattrstorage": "#1_uPITCH",
                    "presentation": 1,
                    "presentation_rect": [ 395.0, 2.0, 264.0, 18.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-ps4",
                    "linecount": 3,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1700.0, 165.0, 495.0, 47.0 ],
                    "text": "presets: click = recall, shift-click = store (written to uPITCH_<bpatcher argument>.json right away). Give every instance its own argument (Inspector > Arguments, or type: bpatcher dingus.pitchSeq.maxpat @args name). Recall order: steps, pitch, range, then the rest."
                }
            },
            {
                "box": {
                    "id": "obj-pf1",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1700.0, 130.0, 200.0, 22.0 ],
                    "saved_object_attributes": {
                        "filename": "dingus.presetFile.js",
                        "parameter_enable": 0
                    },
                    "text": "v8 dingus.presetFile.js uPITCH #1"
                }
            },
            {
                "box": {
                    "id": "obj-sc2",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "" ],
                    "patching_rect": [ 1250.0, 75.0, 70.0, 22.0 ],
                    "restore": [ "ji_7.scl" ],
                    "saved_object_attributes": {
                        "parameter_enable": 0,
                        "parameter_mappable": 0
                    },
                    "text": "pattr scale",
                    "varname": "scale"
                }
            },
            {
                "box": {
                    "id": "obj-sc3",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1320.0, 105.0, 105.0, 22.0 ],
                    "text": "setsymbol $1"
                }
            },
            {
                "box": {
                    "id": "obj-sc4",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1360.0, 40.0, 200.0, 33.0 ],
                    "text": "scale name for presets (stored by file name, not menu position)"
                }
            },
            {
                "box": {
                    "id": "obj-sc5",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1250.0, 105.0, 50.0, 22.0 ],
                    "text": "load $1"
                }
            },
            {
                "box": {
                    "id": "obj-PstepsChange",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 6,
                    "outlettype": [ "", "", "", "", "", "bang" ],
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
                        "rect": [ 100.0, 100.0, 800.0, 500.0 ],
                        "integercoordinates": 1,
                        "boxes": [
                            {
                                "box": {
                                    "id": "obj-stp3",
                                    "linecount": 2,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 1250.0, 80.0, 260.0, 33.0 ],
                                    "text": "steps change: resize + thresholds, pad new skip/rest bars with 1, re-send lists, reset range"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-stp1",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "outlettype": [ "int", "int", "bang" ],
                                    "patching_rect": [ 648.0, 166.06634521484375, 70.0, 22.0 ],
                                    "text": "t i i b"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-stp6",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 3,
                                    "outlettype": [ "bang", "bang", "int" ],
                                    "patching_rect": [ 578.0, 218.06634521484375, 50.0, 22.0 ],
                                    "text": "t b b i"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-stp2",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 1100.0, 200.0, 70.0, 22.0 ],
                                    "text": "set 0 $1"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-pg2",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 1500.0, 570.0, 55.0, 22.0 ],
                                    "text": "steps $1"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-48",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 721.9000134468079, 159.86635774374008, 47.0, 22.0 ],
                                    "text": "size $1"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-63",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "int" ],
                                    "patching_rect": [ 1152.0, 160.0, 29.5, 22.0 ],
                                    "text": "+ 1"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-60",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 1208.0, 168.06634521484375, 47.0, 22.0 ],
                                    "text": "size $1"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-123",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "int", "int" ],
                                    "patching_rect": [ 30.0, 102.0, 100.0, 22.0 ],
                                    "text": "t i i"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-124",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 3,
                                    "outlettype": [ "bang", "bang", "int" ],
                                    "patching_rect": [ 30.0, 128.0, 100.0, 22.0 ],
                                    "text": "uzi 1 0"
                                }
                            },
                            {
                                "box": {
                                    "fontface": 0,
                                    "fontname": "Arial",
                                    "fontsize": 12.0,
                                    "id": "obj-127",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "float" ],
                                    "patching_rect": [ 100.0, 154.0, 100.0, 22.0 ],
                                    "text": "/ 1."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-126",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "" ],
                                    "patching_rect": [ 30.0, 180.0, 100.0, 22.0 ],
                                    "text": "zl.group 256"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-padr0",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "" ],
                                    "patching_rect": [ 650.0, 113.0, 129.0, 22.0 ],
                                    "text": "zl.reg @zlmaxsize 256"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-padr1",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "" ],
                                    "patching_rect": [ 780.0, 100.0, 129.0, 22.0 ],
                                    "text": "zl.reg @zlmaxsize 256"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-padr2",
                                    "linecount": 7,
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "" ],
                                    "patching_rect": [ 780.0, 126.0, 131.0, 22.0 ],
                                    "text": "zl.join 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 @zlmaxsize 256"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-padr3",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "" ],
                                    "patching_rect": [ 780.0, 152.0, 136.0, 22.0 ],
                                    "text": "zl.slice @zlmaxsize 256"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-padr4",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 780.0, 178.0, 90.0, 22.0 ],
                                    "text": "prepend setlist"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-pads0",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "" ],
                                    "patching_rect": [ 880.0, 113.0, 129.0, 22.0 ],
                                    "text": "zl.reg @zlmaxsize 256"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-pads1",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "" ],
                                    "patching_rect": [ 1010.0, 100.0, 129.0, 22.0 ],
                                    "text": "zl.reg @zlmaxsize 256"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-pads2",
                                    "linecount": 7,
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "" ],
                                    "patching_rect": [ 1010.0, 126.0, 131.0, 22.0 ],
                                    "text": "zl.join 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 @zlmaxsize 256"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-pads3",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "" ],
                                    "patching_rect": [ 1010.0, 152.0, 136.0, 22.0 ],
                                    "text": "zl.slice @zlmaxsize 256"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-pads4",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 1010.0, 178.0, 90.0, 22.0 ],
                                    "text": "prepend setlist"
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-in2",
                                    "index": 1,
                                    "maxclass": "inlet",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 100.0, 20.0, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-in3",
                                    "index": 2,
                                    "maxclass": "inlet",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 170.0, 20.0, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-in4",
                                    "index": 3,
                                    "maxclass": "inlet",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 240.0, 20.0, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-out1",
                                    "index": 1,
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 30.0, 632.0, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-out2",
                                    "index": 2,
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 100.0, 632.0, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-out3",
                                    "index": 3,
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 170.0, 632.0, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-out4",
                                    "index": 4,
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 240.0, 632.0, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-out5",
                                    "index": 5,
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 310.0, 632.0, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-out6",
                                    "index": 6,
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 380.0, 632.0, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-stp5",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 638.0, 218.06634521484375, 55.0, 22.0 ],
                                    "text": "deferlow"
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "destination": [ "obj-124", 0 ],
                                    "source": [ "obj-123", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-127", 1 ],
                                    "source": [ "obj-123", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-126", 0 ],
                                    "source": [ "obj-124", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-127", 0 ],
                                    "source": [ "obj-124", 2 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-out1", 0 ],
                                    "source": [ "obj-126", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-126", 0 ],
                                    "source": [ "obj-127", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-out2", 0 ],
                                    "order": 1,
                                    "source": [ "obj-48", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-out3", 0 ],
                                    "order": 0,
                                    "source": [ "obj-48", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-out4", 0 ],
                                    "source": [ "obj-60", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-60", 0 ],
                                    "source": [ "obj-63", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-pads1", 1 ],
                                    "source": [ "obj-in2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-stp1", 0 ],
                                    "source": [ "obj-in3", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-padr1", 1 ],
                                    "source": [ "obj-in4", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-padr2", 0 ],
                                    "source": [ "obj-padr0", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-padr0", 1 ],
                                    "source": [ "obj-padr1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-padr3", 0 ],
                                    "source": [ "obj-padr2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-padr4", 0 ],
                                    "source": [ "obj-padr3", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-out3", 0 ],
                                    "source": [ "obj-padr4", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-pads2", 0 ],
                                    "source": [ "obj-pads0", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-pads0", 1 ],
                                    "source": [ "obj-pads1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-pads3", 0 ],
                                    "source": [ "obj-pads2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-pads4", 0 ],
                                    "source": [ "obj-pads3", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-out2", 0 ],
                                    "source": [ "obj-pads4", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-out5", 0 ],
                                    "source": [ "obj-pg2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-123", 0 ],
                                    "order": 5,
                                    "source": [ "obj-stp1", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-48", 0 ],
                                    "order": 4,
                                    "source": [ "obj-stp1", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-63", 0 ],
                                    "order": 1,
                                    "source": [ "obj-stp1", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-padr1", 0 ],
                                    "order": 1,
                                    "source": [ "obj-stp1", 2 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-padr3", 1 ],
                                    "order": 3,
                                    "source": [ "obj-stp1", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-pads1", 0 ],
                                    "order": 0,
                                    "source": [ "obj-stp1", 2 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-pads3", 1 ],
                                    "order": 2,
                                    "source": [ "obj-stp1", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-pg2", 0 ],
                                    "order": 0,
                                    "source": [ "obj-stp1", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-stp5", 0 ],
                                    "source": [ "obj-stp1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-out4", 0 ],
                                    "source": [ "obj-stp2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-stp6", 0 ],
                                    "source": [ "obj-stp5", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-out6", 0 ],
                                    "source": [ "obj-stp6", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-padr0", 0 ],
                                    "order": 1,
                                    "source": [ "obj-stp6", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-pads0", 0 ],
                                    "order": 0,
                                    "source": [ "obj-stp6", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-stp2", 0 ],
                                    "source": [ "obj-stp6", 2 ]
                                }
                            }
                        ]
                    },
                    "patching_rect": [ 420.0, 75.0, 150.0, 22.0 ],
                    "text": "p stepsChange"
                }
            },
            {
                "box": {
                    "id": "obj-PpitchRange",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
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
                        "rect": [ 100.0, 100.0, 800.0, 500.0 ],
                        "integercoordinates": 1,
                        "boxes": [
                            {
                                "box": {
                                    "id": "obj-102",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "bang", "int" ],
                                    "patching_rect": [ 214.3499903678894, 80.0, 29.5, 22.0 ],
                                    "text": "t b i"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-98",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "int" ],
                                    "patching_rect": [ 151.3499903678894, 95.0000002148438, 29.5, 22.0 ],
                                    "text": "+"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-97",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 151.3499903678894, 137.0, 64.0, 22.0 ],
                                    "text": "setmax $1"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-77",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 30.0, 145.0, 61.0, 22.0 ],
                                    "text": "setmin $1"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-9",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 159.35000014305115, 626.0, 56.0, 22.0 ],
                                    "text": "range $1"
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-in1",
                                    "index": 1,
                                    "maxclass": "inlet",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 30.0, 20.0, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-in2",
                                    "index": 2,
                                    "maxclass": "inlet",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 100.0, 20.0, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-out1",
                                    "index": 1,
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 30.0, 688.0, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-out2",
                                    "index": 2,
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 100.0, 688.0, 30.0, 30.0 ]
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "destination": [ "obj-98", 1 ],
                                    "source": [ "obj-102", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-98", 0 ],
                                    "source": [ "obj-102", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-out1", 0 ],
                                    "source": [ "obj-77", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-out2", 0 ],
                                    "source": [ "obj-9", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-out1", 0 ],
                                    "source": [ "obj-97", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-97", 0 ],
                                    "source": [ "obj-98", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-102", 0 ],
                                    "order": 0,
                                    "source": [ "obj-in1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-9", 0 ],
                                    "order": 1,
                                    "source": [ "obj-in1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-77", 0 ],
                                    "order": 1,
                                    "source": [ "obj-in2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-98", 0 ],
                                    "order": 0,
                                    "source": [ "obj-in2", 0 ]
                                }
                            }
                        ]
                    },
                    "patching_rect": [ 420.0, 165.0, 94.0, 22.0 ],
                    "text": "p pitchRange"
                }
            },
            {
                "box": {
                    "id": "obj-PpresetLogic",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "" ],
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
                        "rect": [ 100.0, 100.0, 800.0, 500.0 ],
                        "integercoordinates": 1,
                        "boxes": [
                            {
                                "box": {
                                    "id": "obj-ps3",
                                    "linecount": 2,
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 30.0, 80.0, 330.0, 22.0 ],
                                    "text": "priority scale -4, priority number -3, priority pitchgrid -2, priority rslider -1"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-ps5",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 30.0, 170.0, 140.0, 22.0 ],
                                    "text": "pattrstorage #1_uPITCH"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-pf2",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 180.0, 222.0, 35.0, 22.0 ],
                                    "text": "save"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-pf3",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 230.0, 222.0, 78.0, 22.0 ],
                                    "text": "readpresets"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-pw1",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "bang" ],
                                    "patching_rect": [ 180.0, 170.0, 25.0, 22.0 ],
                                    "text": "t b"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-pw2",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 180.0, 196.0, 55.0, 22.0 ],
                                    "text": "deferlow"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-pw6",
                                    "linecount": 4,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 340.0, 248.0, 260.0, 60.0 ],
                                    "text": "preset file per instance: <this folder>/uPITCH_<bpatcher argument>.json - read at load if it exists, written every time a preset is stored."
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-in3",
                                    "index": 1,
                                    "maxclass": "inlet",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "int" ],
                                    "patching_rect": [ 170.0, 20.0, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-out1",
                                    "index": 1,
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 30.0, 348.0, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-out2",
                                    "index": 2,
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 100.0, 348.0, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-out3",
                                    "index": 3,
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 170.0, 348.0, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-lbin",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "bang" ],
                                    "patching_rect": [ 100.0, 50.0, 58.0, 22.0 ],
                                    "text": "loadbang"
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "destination": [ "obj-pw1", 0 ],
                                    "source": [ "obj-in3", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-pf3", 0 ],
                                    "order": 0,
                                    "source": [ "obj-lbin", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-ps3", 0 ],
                                    "order": 2,
                                    "source": [ "obj-lbin", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-ps5", 0 ],
                                    "order": 1,
                                    "source": [ "obj-lbin", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-out1", 0 ],
                                    "source": [ "obj-pf2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-out1", 0 ],
                                    "source": [ "obj-pf3", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-out2", 0 ],
                                    "source": [ "obj-ps3", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-out3", 0 ],
                                    "source": [ "obj-ps5", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-pw2", 0 ],
                                    "source": [ "obj-pw1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-pf2", 0 ],
                                    "source": [ "obj-pw2", 0 ]
                                }
                            }
                        ]
                    },
                    "patching_rect": [ 1700.0, 70.0, 101.0, 22.0 ],
                    "text": "p presetLogic"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "id": "obj-hdr0",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 22.0, 200.0, 20.0 ],
                    "text": "CLOCK"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "id": "obj-hdr1",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 420.0, 200.0, 20.0 ],
                    "text": "INIT"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "id": "obj-hdr2",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 420.0, 18.0, 200.0, 20.0 ],
                    "text": "STEPS / PITCH"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "id": "obj-hdr3",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 950.0, 18.0, 200.0, 20.0 ],
                    "text": "PROBABILITIES & RANGE"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "id": "obj-hdr4",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1250.0, 18.0, 200.0, 20.0 ],
                    "text": "TUNING"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "id": "obj-hdr5",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1700.0, 420.0, 200.0, 20.0 ],
                    "text": "OUTPUT"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "id": "obj-hdr6",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1700.0, 18.0, 200.0, 20.0 ],
                    "text": "PRESETS"
                }
            },
            {
                "box": {
                    "id": "obj-sc6",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1790.0, 240.0, 395.0, 20.0 ],
                    "text": "autopattr exclude -> scale menu (scale is stored by name in [pattr scale])"
                }
            },
            {
                "box": {
                    "id": "def-cm",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 1500.0, 200.0, 20.0 ],
                    "text": "defaults at load (presets override)"
                }
            },
            {
                "box": {
                    "id": "def-lb",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 20.0, 1525.0, 58.0, 22.0 ],
                    "text": "loadbang"
                }
            },
            {
                "box": {
                    "id": "def-m0",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 200.0, 1555.0, 40.0, 22.0 ],
                    "text": "1."
                }
            },
            {
                "box": {
                    "id": "def-m1",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 155.0, 1555.0, 40.0, 22.0 ],
                    "text": "1"
                }
            },
            {
                "box": {
                    "id": "def-m2",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 110.0, 1555.0, 40.0, 22.0 ],
                    "text": "29"
                }
            },
            {
                "box": {
                    "id": "def-m3",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 65.0, 1555.0, 40.0, 22.0 ],
                    "text": "24"
                }
            },
            {
                "box": {
                    "id": "def-m4",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 20.0, 1555.0, 40.0, 22.0 ],
                    "text": "5"
                }
            },
            {
                "box": {
                    "id": "tm-js",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 20.0, 375.0, 160.0, 22.0 ],
                    "saved_object_attributes": {
                        "filename": "dingus.pitchTiming.js",
                        "parameter_enable": 0
                    },
                    "text": "v8 dingus.pitchTiming.js"
                }
            },
            {
                "box": {
                    "id": "sn-lm",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 240.0, 255.0, 70.0, 22.0 ],
                    "text": "loadmess 1"
                }
            },
            {
                "box": {
                    "id": "sn-tg",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 240.0, 280.0, 22.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 34.0, 351.0, 24.0, 24.0 ],
                    "varname": "snap"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "sn-cm",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 266.0, 280.0, 156.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 62.0, 351.0, 109.0, 24.0 ],
                    "text": "snap 1/4 step"
                }
            },
            {
                "box": {
                    "id": "sn-pp",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 240.0, 307.0, 82.0, 22.0 ],
                    "text": "prepend snap"
                }
            },
            {
                "box": {
                    "id": "obj-pf1_slotfilter",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 1920.0, 130.0, 120.0, 22.0 ],
                    "text": "routepass slotlist"
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "def-m0", 0 ],
                    "order": 0,
                    "source": [ "def-lb", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "def-m1", 0 ],
                    "order": 1,
                    "source": [ "def-lb", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "def-m2", 0 ],
                    "order": 2,
                    "source": [ "def-lb", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "def-m3", 0 ],
                    "order": 3,
                    "source": [ "def-lb", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "def-m4", 0 ],
                    "order": 4,
                    "source": [ "def-lb", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-61", 0 ],
                    "source": [ "def-m0", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-7", 0 ],
                    "source": [ "def-m1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-79", 0 ],
                    "source": [ "def-m2", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-35", 0 ],
                    "source": [ "def-m3", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-33", 0 ],
                    "source": [ "def-m4", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-52", 0 ],
                    "source": [ "obj-1", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-53", 0 ],
                    "source": [ "obj-12", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-86", 0 ],
                    "order": 2,
                    "source": [ "obj-122", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-pg1", 1 ],
                    "order": 0,
                    "source": [ "obj-122", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "tm-js", 1 ],
                    "order": 1,
                    "source": [ "obj-122", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "tm-js", 0 ],
                    "source": [ "obj-122", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-21", 0 ],
                    "source": [ "obj-14", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-17", 0 ],
                    "source": [ "obj-15", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-122", 0 ],
                    "source": [ "obj-164", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-73", 0 ],
                    "source": [ "obj-17", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-73", 0 ],
                    "source": [ "obj-18", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-122", 0 ],
                    "source": [ "obj-204", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-122", 0 ],
                    "source": [ "obj-205", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-207", 0 ],
                    "order": 1,
                    "source": [ "obj-206", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-209", 0 ],
                    "order": 0,
                    "source": [ "obj-206", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-210", 0 ],
                    "order": 2,
                    "source": [ "obj-206", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-55", 0 ],
                    "source": [ "obj-207", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-36", 0 ],
                    "source": [ "obj-209", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-56", 0 ],
                    "source": [ "obj-21", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-33", 0 ],
                    "source": [ "obj-210", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-26", 0 ],
                    "source": [ "obj-24", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-24", 0 ],
                    "source": [ "obj-25", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-92", 0 ],
                    "source": [ "obj-26", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-5", 2 ],
                    "source": [ "obj-30", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-204", 0 ],
                    "order": 0,
                    "source": [ "obj-32", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-PstepsChange", 0 ],
                    "order": 1,
                    "source": [ "obj-32", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-PstepsChange", 1 ],
                    "source": [ "obj-33", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-PpitchRange", 0 ],
                    "source": [ "obj-35", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-42", 0 ],
                    "source": [ "obj-36", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-36", 1 ],
                    "order": 0,
                    "source": [ "obj-38", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-ord1", 0 ],
                    "order": 1,
                    "source": [ "obj-38", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-164", 0 ],
                    "source": [ "obj-39", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-38", 1 ],
                    "source": [ "obj-40", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-38", 0 ],
                    "source": [ "obj-40", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-122", 0 ],
                    "source": [ "obj-42", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-56", 0 ],
                    "source": [ "obj-46", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-70", 0 ],
                    "source": [ "obj-47", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-49", 0 ],
                    "source": [ "obj-5", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-sc2", 0 ],
                    "source": [ "obj-52", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-73", 0 ],
                    "source": [ "obj-53", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-ord2", 0 ],
                    "source": [ "obj-55", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-45", 0 ],
                    "order": 1,
                    "source": [ "obj-56", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-78", 0 ],
                    "order": 0,
                    "source": [ "obj-56", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-18", 0 ],
                    "source": [ "obj-59", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-93", 0 ],
                    "source": [ "obj-6", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-56", 1 ],
                    "source": [ "obj-61", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-122", 0 ],
                    "source": [ "obj-66", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-52", 0 ],
                    "source": [ "obj-69", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-5", 0 ],
                    "source": [ "obj-7", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-66", 0 ],
                    "source": [ "obj-70", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-52", 0 ],
                    "source": [ "obj-72", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-25", 0 ],
                    "order": 0,
                    "source": [ "obj-73", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-57", 0 ],
                    "order": 1,
                    "source": [ "obj-73", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-pg1", 0 ],
                    "order": 2,
                    "source": [ "obj-73", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-205", 0 ],
                    "order": 0,
                    "source": [ "obj-75", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-PstepsChange", 2 ],
                    "order": 1,
                    "source": [ "obj-75", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-62", 0 ],
                    "order": 0,
                    "source": [ "obj-78", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-play2", 0 ],
                    "order": 1,
                    "source": [ "obj-78", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-25", 2 ],
                    "order": 0,
                    "source": [ "obj-79", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-PpitchRange", 1 ],
                    "order": 1,
                    "source": [ "obj-79", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-35", 0 ],
                    "order": 1,
                    "source": [ "obj-84", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-69", 0 ],
                    "order": 2,
                    "source": [ "obj-84", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-96", 0 ],
                    "order": 0,
                    "source": [ "obj-84", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-2", 0 ],
                    "order": 0,
                    "source": [ "obj-92", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-6", 0 ],
                    "order": 1,
                    "source": [ "obj-92", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-94", 0 ],
                    "source": [ "obj-93", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-30", 0 ],
                    "source": [ "obj-94", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-92", 0 ],
                    "source": [ "obj-96", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-25", 0 ],
                    "source": [ "obj-PpitchRange", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-pg1", 0 ],
                    "source": [ "obj-PpitchRange", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-pf1", 0 ],
                    "source": [ "obj-PpresetLogic", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-ps1", 0 ],
                    "source": [ "obj-PpresetLogic", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-ps2", 0 ],
                    "source": [ "obj-PpresetLogic", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-32", 0 ],
                    "source": [ "obj-PstepsChange", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-40", 0 ],
                    "source": [ "obj-PstepsChange", 3 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-55", 0 ],
                    "source": [ "obj-PstepsChange", 5 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-75", 0 ],
                    "source": [ "obj-PstepsChange", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-78", 0 ],
                    "source": [ "obj-PstepsChange", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-pg1", 0 ],
                    "source": [ "obj-PstepsChange", 4 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-32", 0 ],
                    "source": [ "obj-ord1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-42", 0 ],
                    "source": [ "obj-ord1", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-40", 0 ],
                    "source": [ "obj-ord2", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-75", 0 ],
                    "source": [ "obj-ord2", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-pg1", 0 ],
                    "source": [ "obj-ord2", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-ps1", 0 ],
                    "source": [ "obj-pf1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-122", 0 ],
                    "source": [ "obj-pg1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "tm-js", 0 ],
                    "source": [ "obj-pg1", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-play2", 1 ],
                    "source": [ "obj-play1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-122", 0 ],
                    "source": [ "obj-play2", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-PpresetLogic", 0 ],
                    "source": [ "obj-ps2", 3 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-sc3", 0 ],
                    "order": 0,
                    "source": [ "obj-sc2", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-sc5", 0 ],
                    "order": 1,
                    "source": [ "obj-sc2", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-52", 0 ],
                    "source": [ "obj-sc3", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-73", 0 ],
                    "source": [ "obj-sc5", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "sn-tg", 0 ],
                    "source": [ "sn-lm", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-pg1", 0 ],
                    "source": [ "sn-pp", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "sn-pp", 0 ],
                    "source": [ "sn-tg", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-25", 0 ],
                    "order": 0,
                    "source": [ "tm-js", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-95", 0 ],
                    "order": 1,
                    "source": [ "tm-js", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-pf1_slotfilter", 0 ],
                    "source": [ "obj-ps1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-pf1", 0 ],
                    "source": [ "obj-pf1_slotfilter", 0 ]
                }
            }
        ],
        "parameters": {
            "obj-15": [ "number[1]", "number[1]", 0 ],
            "obj-32": [ "multislider[2]", "multislider[8]", 0 ],
            "obj-33": [ "number", "number", 0 ],
            "obj-35": [ "number[4]", "number[4]", 0 ],
            "obj-40": [ "rslider[4]", "rslider", 0 ],
            "obj-52": [ "umenu", "umenu", 0 ],
            "obj-59": [ "number[2]", "number", 0 ],
            "obj-61": [ "number[10]", "number[10]", 0 ],
            "obj-7": [ "toggle", "toggle", 0 ],
            "obj-75": [ "multislider[3]", "multislider[7]", 0 ],
            "obj-79": [ "number[5]", "number[5]", 0 ],
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
        "styles": [
            {
                "name": "rnbohighcontrast",
                "default": {
                    "accentcolor": [ 0.666666666666667, 0.666666666666667, 0.666666666666667, 1.0 ],
                    "bgcolor": [ 0.0, 0.0, 0.0, 1.0 ],
                    "bgfillcolor": {
                        "angle": 270.0,
                        "autogradient": 0.0,
                        "color": [ 0.0, 0.0, 0.0, 1.0 ],
                        "color1": [ 0.090196078431373, 0.090196078431373, 0.090196078431373, 1.0 ],
                        "color2": [ 0.156862745098039, 0.168627450980392, 0.164705882352941, 1.0 ],
                        "proportion": 0.5,
                        "type": "color"
                    },
                    "clearcolor": [ 1.0, 1.0, 1.0, 0.0 ],
                    "color": [ 1.0, 0.874509803921569, 0.141176470588235, 1.0 ],
                    "editing_bgcolor": [ 0.258823529411765, 0.258823529411765, 0.258823529411765, 1.0 ],
                    "elementcolor": [ 0.223386004567146, 0.254748553037643, 0.998085916042328, 1.0 ],
                    "fontsize": [ 13.0 ],
                    "locked_bgcolor": [ 0.258823529411765, 0.258823529411765, 0.258823529411765, 1.0 ],
                    "selectioncolor": [ 0.301960784313725, 0.694117647058824, 0.949019607843137, 1.0 ],
                    "stripecolor": [ 0.258823529411765, 0.258823529411765, 0.258823529411765, 1.0 ],
                    "textcolor": [ 1.0, 1.0, 1.0, 1.0 ],
                    "textcolor_inverse": [ 1.0, 1.0, 1.0, 1.0 ]
                },
                "parentstyle": "",
                "multi": 0
            }
        ],
        "bgcolor": [ 0.027450980392156862, 0.08627450980392157, 0.1411764705882353, 1.0 ]
    }
}