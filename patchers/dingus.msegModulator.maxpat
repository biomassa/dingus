{
    "patcher": {
        "fileversion": 1,
        "appversion": {
            "major": 9,
            "minor": 1,
            "revision": 3,
            "architecture": "x64",
            "modernui": 1
        },
        "classnamespace": "box",
        "rect": [ 402.0, 267.0, 1000.0, 780.0 ],
        "openinpresentation": 1,
        "boxes": [
            {
                "box": {
                    "id": "obj-69",
                    "maxclass": "newobj",
                    "numinlets": 6,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 794.5, 566.0, 94.0, 22.0 ],
                    "text": "scale -1. 1. 0. 1."
                }
            },
            {
                "box": {
                    "id": "obj-68",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "patching_rect": [ 794.5, 525.0, 81.0, 22.0 ],
                    "text": "snapshot~ 10"
                }
            },
            {
                "box": {
                    "comment": "CONTROL OUT 0..1",
                    "id": "obj-14",
                    "index": 0,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 932.5, 623.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-6",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 305.71, 130.0, 90.0, 22.0 ],
                    "text": "r intRecallBang"
                }
            },
            {
                "box": {
                    "id": "obj-4",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 305.71, 160.44, 58.0, 22.0 ],
                    "text": "loadbang"
                }
            },
            {
                "box": {
                    "id": "obj-9",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 861.0, 115.0, 35.0, 22.0 ],
                    "text": "reset"
                }
            },
            {
                "box": {
                    "comment": "resyncBang",
                    "id": "obj-5",
                    "index": 0,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 900.0, 40.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-3",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 669.0, 507.0, 29.5, 22.0 ],
                    "text": "*~"
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
                    "patching_rect": [ 518.0, 514.0, 78.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 613.0, 82.0, 36.0, 22.0 ],
                    "saved_attribute_attributes": {
                        "textcolor": {
                            "expression": "themecolor.theme_textcolor"
                        }
                    },
                    "text": "out"
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
                    "patching_rect": [ 584.0, 513.0, 24.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 645.0, 82.0, 22.0, 22.0 ],
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
                    "comment": "loadbang",
                    "id": "obj-2",
                    "index": 0,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 852.0, 40.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-1",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 4,
                    "outlettype": [ "", "", "", "" ],
                    "patching_rect": [ 31.0, 48.0, 56.0, 22.0 ],
                    "restore": {
                        "attrui[1]": [ "syncupdate", 0 ],
                        "button": [ 0.0 ],
                        "button[1]": [ 0.0 ],
                        "function[1]": [ 1000.0, -1.0, 1.0, 0.0, 0.0, 0, 0.0, 1000.0, 0.0, 0, 0.0, "curve" ],
                        "number[1]": [ 1.0 ],
                        "slider": [ 0.0 ],
                        "toggle": [ 0 ]
                    },
                    "text": "autopattr",
                    "varname": "u752005119"
                }
            },
            {
                "box": {
                    "fontsize": 20.0,
                    "id": "obj-85",
                    "linecount": 4,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 197.0, 342.0, 30.0, 96.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 4.0, 2.0, 87.0, 29.0 ],
                    "text": "MSEG",
                    "textcolor": [ 1.0, 0.8509803921568627, 0.22745098039215686, 0.46 ]
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontname": "Arial",
                    "fontsize": 12.0,
                    "id": "obj-86",
                    "maxclass": "number~",
                    "mode": 2,
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "signal", "float" ],
                    "patching_rect": [ 739.0, 383.0, 56.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 496.0, 128.0, 56.0, 22.0 ],
                    "sig": 0.0
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 11.595187,
                    "id": "obj-87",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 353.0, 244.0, 60.0, 21.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 586.0, -2.0, 79.0, 21.0 ],
                    "text": "range 0 1"
                }
            },
            {
                "box": {
                    "fontname": "Arial",
                    "fontsize": 11.595187,
                    "id": "obj-88",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 284.0, 244.0, 63.0, 21.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 495.0, -2.0, 87.0, 21.0 ],
                    "text": "range -1 1"
                }
            },
            {
                "box": {
                    "fontsize": 20.0,
                    "id": "obj-89",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 878.0, 195.0, 47.0, 29.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 558.0, 26.0, 44.0, 29.0 ],
                    "text": "rate"
                }
            },
            {
                "box": {
                    "fontsize": 20.0,
                    "format": 6,
                    "id": "obj-92",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 814.0, 194.0, 62.0, 31.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 604.0, 25.0, 62.0, 31.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_invisible": 1,
                            "parameter_longname": "number[1]",
                            "parameter_modmode": 0,
                            "parameter_shortname": "number[13]",
                            "parameter_type": 3
                        }
                    },
                    "textcolor": [ 0.40784313725490196, 0.7725490196078432, 1.0, 1.0 ],
                    "varname": "number[1]"
                }
            },
            {
                "box": {
                    "id": "obj-93",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "patching_rect": [ 733.0, 458.0, 81.0, 22.0 ],
                    "text": "snapshot~ 10"
                }
            },
            {
                "box": {
                    "floatoutput": 1,
                    "id": "obj-94",
                    "ignoreclick": 1,
                    "knobcolor": [ 0.5450980392156862, 0.5450980392156862, 0.5450980392156862, 1.0 ],
                    "maxclass": "slider",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 228.0, 435.0, 492.0, 10.0 ],
                    "presentation": 1,
                    "presentation_rect": [ -1.0, 138.0, 492.0, 12.0 ],
                    "size": 1.0,
                    "varname": "slider"
                }
            },
            {
                "box": {
                    "id": "obj-96",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 175.0, 218.0, 47.0, 22.0 ],
                    "text": "delay 5"
                }
            },
            {
                "box": {
                    "id": "obj-97",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 142.0, 158.0, 47.0, 22.0 ],
                    "text": "delay 5"
                }
            },
            {
                "box": {
                    "id": "obj-98",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 105.0, 191.0, 24.0, 24.0 ],
                    "varname": "button[1]"
                }
            },
            {
                "box": {
                    "id": "obj-99",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 94.0, 243.0, 45.0, 22.0 ],
                    "text": "1000 0"
                }
            },
            {
                "box": {
                    "id": "obj-100",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 50.0, 243.0, 29.5, 22.0 ],
                    "text": "0 0"
                }
            },
            {
                "box": {
                    "fontsize": 20.0,
                    "id": "obj-101",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 148.0, 100.0, 52.0, 31.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 492.0, 25.0, 52.0, 31.0 ],
                    "text": "clear",
                    "textcolor": [ 0.49411764705882355, 0.7254901960784313, 1.0, 1.0 ]
                }
            },
            {
                "box": {
                    "addpoints_with_curve": [ 0.0, 0.0, 0, 0.0, 1000.0, 0.0, 0, 0.0 ],
                    "classic_curve": 1,
                    "id": "obj-102",
                    "linecolor": [ 0.40784313725490196, 0.796078431372549, 1.0, 1.0 ],
                    "linethickness": 2.0,
                    "maxclass": "function",
                    "mode": 1,
                    "mousereport": 1,
                    "numinlets": 1,
                    "numoutlets": 4,
                    "outlettype": [ "float", "", "", "bang" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 229.0, 281.0, 491.0, 152.0 ],
                    "pointsize": 5.0,
                    "presentation": 1,
                    "presentation_rect": [ 0.0, -2.0, 491.0, 138.0 ],
                    "range": [ -1.0, 1.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_invisible": 1,
                            "parameter_longname": "function[1]",
                            "parameter_modmode": 0,
                            "parameter_shortname": "function",
                            "parameter_type": 3
                        }
                    },
                    "varname": "function[1]"
                }
            },
            {
                "box": {
                    "id": "obj-103",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 792.0, 235.0, 86.0, 22.0 ],
                    "text": "rate~ @sync 1"
                }
            },
            {
                "box": {
                    "id": "obj-104",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 229.0, 206.0, 24.0, 24.0 ],
                    "varname": "button"
                }
            },
            {
                "box": {
                    "activelinecolor": [ 0.5137254901960784, 0.7215686274509804, 1.0, 1.0 ],
                    "id": "obj-105",
                    "line_width": 2.0,
                    "maxclass": "live.scope~",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 733.0, 297.0, 208.0, 121.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 492.0, 82.0, 174.0, 68.0 ],
                    "range": [ -1.1, 1.1 ]
                }
            },
            {
                "box": {
                    "id": "obj-106",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 695.0, 251.0, 48.0, 22.0 ],
                    "text": "shape~"
                }
            },
            {
                "box": {
                    "attr": "syncupdate",
                    "id": "obj-108",
                    "maxclass": "attrui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 618.0, 207.0, 150.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 492.0, 58.0, 174.0, 22.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_invisible": 1,
                            "parameter_longname": "attrui[1]",
                            "parameter_modmode": 0,
                            "parameter_shortname": "attrui",
                            "parameter_type": 3
                        }
                    },
                    "varname": "attrui[1]"
                }
            },
            {
                "box": {
                    "comment": "phaser input",
                    "id": "obj-61",
                    "index": 0,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 704.0, 27.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "comment": "",
                    "id": "obj-62",
                    "index": 0,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 695.0, 547.449219, 30.0, 30.0 ]
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "obj-102", 0 ],
                    "source": [ "obj-100", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-102", 0 ],
                    "order": 0,
                    "source": [ "obj-101", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-97", 0 ],
                    "order": 1,
                    "source": [ "obj-101", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-104", 0 ],
                    "source": [ "obj-102", 3 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-106", 0 ],
                    "source": [ "obj-102", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-106", 0 ],
                    "order": 1,
                    "source": [ "obj-103", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-93", 0 ],
                    "order": 0,
                    "source": [ "obj-103", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-102", 0 ],
                    "source": [ "obj-104", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-105", 0 ],
                    "order": 1,
                    "source": [ "obj-106", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-3", 0 ],
                    "order": 2,
                    "source": [ "obj-106", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-86", 0 ],
                    "order": 0,
                    "source": [ "obj-106", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-106", 0 ],
                    "source": [ "obj-108", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-102", 0 ],
                    "source": [ "obj-2", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-62", 0 ],
                    "order": 1,
                    "source": [ "obj-3", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-68", 0 ],
                    "order": 0,
                    "source": [ "obj-3", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-102", 0 ],
                    "source": [ "obj-4", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-9", 0 ],
                    "source": [ "obj-5", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-4", 0 ],
                    "source": [ "obj-6", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-103", 0 ],
                    "source": [ "obj-61", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-69", 0 ],
                    "source": [ "obj-68", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-14", 0 ],
                    "source": [ "obj-69", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-3", 1 ],
                    "source": [ "obj-7", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-102", 0 ],
                    "source": [ "obj-87", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-102", 0 ],
                    "source": [ "obj-88", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-103", 0 ],
                    "source": [ "obj-9", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-103", 1 ],
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
                    "destination": [ "obj-104", 0 ],
                    "source": [ "obj-96", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-98", 0 ],
                    "source": [ "obj-97", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-100", 0 ],
                    "order": 2,
                    "source": [ "obj-98", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-96", 0 ],
                    "order": 0,
                    "source": [ "obj-98", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-99", 0 ],
                    "order": 1,
                    "source": [ "obj-98", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-102", 0 ],
                    "source": [ "obj-99", 0 ]
                }
            }
        ],
        "parameters": {
            "obj-102": [ "function[1]", "function", 0 ],
            "obj-108": [ "attrui[1]", "attrui", 0 ],
            "obj-7": [ "toggle", "toggle", 0 ],
            "obj-92": [ "number[1]", "number[13]", 0 ],
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