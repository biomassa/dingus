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
        "rect": [ 313.0, 1391.0, 1660.0, 988.0 ],
        "openinpresentation": 1,
        "integercoordinates": 1,
        "boxes": [
            {
                "box": {
                    "id": "obj-133",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 60.0, 602.0, 35.0, 22.0 ],
                    "text": "clear"
                }
            },
            {
                "box": {
                    "fontsize": 12.0,
                    "id": "obj-124",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 60.0, 205.0, 45.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 191.0, 49.0, 45.0, 22.0 ],
                    "text": "unplug",
                    "textcolor": [ 0.9803921568627451, 0.33725490196078434, 0.2627450980392157, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-103",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1280.0, 1204.0, 35.0, 22.0 ],
                    "text": "clear",
                    "textcolor": [ 1.0, 0.1803921568627451, 0.1803921568627451, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-105",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1499.0, 1200.0, 35.0, 22.0 ],
                    "text": "clear",
                    "textcolor": [ 1.0, 0.1803921568627451, 0.1803921568627451, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-106",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1718.0, 1200.0, 35.0, 22.0 ],
                    "text": "clear",
                    "textcolor": [ 1.0, 0.1803921568627451, 0.1803921568627451, 1.0 ]
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-107",
                    "maxclass": "flonum",
                    "maximum": 1.0,
                    "minimum": 0.0,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 1543.0, 1200.0, 50.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 186.0, 457.0, 50.0, 22.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "number[12]",
                            "parameter_mmax": 1.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "number[2]",
                            "parameter_type": 0
                        }
                    },
                    "textcolor": [ 0.5803921568627451, 0.7529411764705882, 1.0, 1.0 ],
                    "varname": "number[12]"
                }
            },
            {
                "box": {
                    "id": "obj-108",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1637.0, 1312.0, 53.0, 22.0 ],
                    "text": "prepend"
                }
            },
            {
                "box": {
                    "id": "obj-109",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1637.0, 1272.0, 72.0, 22.0 ],
                    "text": "prepend set"
                }
            },
            {
                "box": {
                    "id": "obj-110",
                    "items": "<empty>",
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 1597.0, 1228.0, 100.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1.0, 457.0, 190.0, 22.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "time", "timevariation", "feedback", "grainsize", "panvariation", "density", "grainstartvariation", "octave", "octavevariation", "reversegrain", "timelock", "just", "filterfreq", "filterreson", "pitchzero", "pitchone", "pitchtwo", "pitchthree", "pitchfour", "pitchfive", "pitchsix", "pitchseven", "pitcheight", "pitchnine", "pitchten", "pitcheleven", "color", "wetdry", "ingain", "outgain" ],
                            "parameter_invisible": 3,
                            "parameter_longname": "umenu[13]",
                            "parameter_mmax": 29,
                            "parameter_modmode": 0,
                            "parameter_shortname": "umenu[2]",
                            "parameter_type": 2
                        }
                    },
                    "textcolor": [ 0.9803921568627451, 0.8431372549019608, 0.41568627450980394, 1.0 ],
                    "varname": "umenu[13]"
                }
            },
            {
                "box": {
                    "id": "obj-111",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1599.0, 1172.0, 96.0, 22.0 ],
                    "text": "prepend append"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-112",
                    "maxclass": "flonum",
                    "maximum": 1.0,
                    "minimum": 0.0,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 1341.0, 1200.0, 50.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 186.0, 433.0, 50.0, 22.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "number[13]",
                            "parameter_mmax": 1.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "number[1]",
                            "parameter_type": 0
                        }
                    },
                    "textcolor": [ 0.5803921568627451, 0.7529411764705882, 1.0, 1.0 ],
                    "varname": "number[13]"
                }
            },
            {
                "box": {
                    "id": "obj-114",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1435.0, 1312.0, 53.0, 22.0 ],
                    "text": "prepend"
                }
            },
            {
                "box": {
                    "id": "obj-115",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1435.0, 1272.0, 72.0, 22.0 ],
                    "text": "prepend set"
                }
            },
            {
                "box": {
                    "id": "obj-116",
                    "items": "<empty>",
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 1395.0, 1228.0, 100.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1.0, 433.0, 190.0, 22.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "time", "timevariation", "feedback", "grainsize", "panvariation", "density", "grainstartvariation", "octave", "octavevariation", "reversegrain", "timelock", "just", "filterfreq", "filterreson", "pitchzero", "pitchone", "pitchtwo", "pitchthree", "pitchfour", "pitchfive", "pitchsix", "pitchseven", "pitcheight", "pitchnine", "pitchten", "pitcheleven", "color", "wetdry", "ingain", "outgain" ],
                            "parameter_invisible": 3,
                            "parameter_longname": "umenu[14]",
                            "parameter_mmax": 29,
                            "parameter_modmode": 0,
                            "parameter_shortname": "umenu[1]",
                            "parameter_type": 2
                        }
                    },
                    "textcolor": [ 0.9803921568627451, 0.8431372549019608, 0.41568627450980394, 1.0 ],
                    "varname": "umenu[14]"
                }
            },
            {
                "box": {
                    "id": "obj-117",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1397.0, 1172.0, 96.0, 22.0 ],
                    "text": "prepend append"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-118",
                    "maxclass": "flonum",
                    "maximum": 1.0,
                    "minimum": 0.0,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 1126.0, 1200.0, 50.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 186.0, 409.0, 50.0, 22.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "number[15]",
                            "parameter_mmax": 1.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "number",
                            "parameter_type": 0
                        }
                    },
                    "textcolor": [ 0.5803921568627451, 0.7529411764705882, 1.0, 1.0 ],
                    "varname": "number[14]"
                }
            },
            {
                "box": {
                    "id": "obj-120",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1221.0, 1312.0, 53.0, 22.0 ],
                    "text": "prepend"
                }
            },
            {
                "box": {
                    "id": "obj-121",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1221.0, 1272.0, 72.0, 22.0 ],
                    "text": "prepend set"
                }
            },
            {
                "box": {
                    "id": "obj-122",
                    "items": "<empty>",
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 1181.0, 1228.0, 100.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1.0, 409.0, 190.0, 22.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "time", "timevariation", "feedback", "grainsize", "panvariation", "density", "grainstartvariation", "octave", "octavevariation", "reversegrain", "timelock", "just", "filterfreq", "filterreson", "pitchzero", "pitchone", "pitchtwo", "pitchthree", "pitchfour", "pitchfive", "pitchsix", "pitchseven", "pitcheight", "pitchnine", "pitchten", "pitcheleven", "color", "wetdry", "ingain", "outgain" ],
                            "parameter_invisible": 3,
                            "parameter_longname": "umenu[15]",
                            "parameter_mmax": 29,
                            "parameter_modmode": 0,
                            "parameter_shortname": "umenu",
                            "parameter_type": 2
                        }
                    },
                    "textcolor": [ 0.9803921568627451, 0.8431372549019608, 0.41568627450980394, 1.0 ],
                    "varname": "umenu[15]"
                }
            },
            {
                "box": {
                    "id": "obj-123",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1171.0, 1174.0, 96.0, 22.0 ],
                    "text": "prepend append"
                }
            },
            {
                "box": {
                    "id": "obj-126",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1058.0, 1208.0, 35.0, 22.0 ],
                    "text": "clear",
                    "textcolor": [ 1.0, 0.1803921568627451, 0.1803921568627451, 1.0 ]
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-127",
                    "maxclass": "flonum",
                    "maximum": 1.0,
                    "minimum": 0.0,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 883.0, 1208.0, 50.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 186.0, 385.0, 50.0, 22.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "number[14]",
                            "parameter_mmax": 1.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "number[2]",
                            "parameter_type": 0
                        }
                    },
                    "textcolor": [ 0.5803921568627451, 0.7529411764705882, 1.0, 1.0 ],
                    "varname": "number[15]"
                }
            },
            {
                "box": {
                    "id": "obj-128",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 977.0, 1321.0, 53.0, 22.0 ],
                    "text": "prepend"
                }
            },
            {
                "box": {
                    "id": "obj-129",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 977.0, 1280.0, 72.0, 22.0 ],
                    "text": "prepend set"
                }
            },
            {
                "box": {
                    "id": "obj-130",
                    "items": "<empty>",
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 937.0, 1236.0, 100.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1.0, 385.0, 190.0, 22.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "time", "timevariation", "feedback", "grainsize", "panvariation", "density", "grainstartvariation", "octave", "octavevariation", "reversegrain", "timelock", "just", "filterfreq", "filterreson", "pitchzero", "pitchone", "pitchtwo", "pitchthree", "pitchfour", "pitchfive", "pitchsix", "pitchseven", "pitcheight", "pitchnine", "pitchten", "pitcheleven", "color", "wetdry", "ingain", "outgain" ],
                            "parameter_invisible": 3,
                            "parameter_longname": "umenu[16]",
                            "parameter_mmax": 29,
                            "parameter_modmode": 0,
                            "parameter_shortname": "umenu[2]",
                            "parameter_type": 2
                        }
                    },
                    "textcolor": [ 0.9803921568627451, 0.8431372549019608, 0.41568627450980394, 1.0 ],
                    "varname": "umenu[16]"
                }
            },
            {
                "box": {
                    "id": "obj-131",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 939.0, 1180.0, 96.0, 22.0 ],
                    "text": "prepend append"
                }
            },
            {
                "box": {
                    "comment": "PARAM 16  0. - 1.",
                    "id": "obj-104",
                    "index": 0,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 3752.0, 99.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "comment": "PARAM 15  0. - 1.",
                    "id": "obj-113",
                    "index": 0,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 3509.0, 107.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "comment": "PARAM 14  0. - 1.",
                    "id": "obj-119",
                    "index": 0,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 3307.0, 107.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "comment": "PARAM 13  0. - 1.",
                    "id": "obj-125",
                    "index": 0,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 3092.0, 107.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-60",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1294.0, 890.0, 35.0, 22.0 ],
                    "text": "clear",
                    "textcolor": [ 1.0, 0.1803921568627451, 0.1803921568627451, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-61",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1513.0, 886.0, 35.0, 22.0 ],
                    "text": "clear",
                    "textcolor": [ 1.0, 0.1803921568627451, 0.1803921568627451, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-62",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1732.0, 886.0, 35.0, 22.0 ],
                    "text": "clear",
                    "textcolor": [ 1.0, 0.1803921568627451, 0.1803921568627451, 1.0 ]
                }
            },
            {
                "box": {
                    "comment": "PARAM 12 0. - 1.",
                    "id": "obj-63",
                    "index": 0,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 2868.0, 107.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-64",
                    "maxclass": "flonum",
                    "maximum": 1.0,
                    "minimum": 0.0,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 1557.0, 886.0, 50.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 186.00000554323196, 360.66667741537094, 50.00000149011612, 22.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "number[6]",
                            "parameter_mmax": 1.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "number[2]",
                            "parameter_type": 0
                        }
                    },
                    "textcolor": [ 0.5803921568627451, 0.7529411764705882, 1.0, 1.0 ],
                    "varname": "number[6]"
                }
            },
            {
                "box": {
                    "id": "obj-65",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1651.0, 998.0, 53.0, 22.0 ],
                    "text": "prepend"
                }
            },
            {
                "box": {
                    "id": "obj-66",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1651.0, 958.0, 72.0, 22.0 ],
                    "text": "prepend set"
                }
            },
            {
                "box": {
                    "id": "obj-67",
                    "items": "<empty>",
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 1611.0, 914.0, 100.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1.0, 361.0, 190.0, 22.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "time", "timevariation", "feedback", "grainsize", "panvariation", "density", "grainstartvariation", "octave", "octavevariation", "reversegrain", "timelock", "just", "filterfreq", "filterreson", "pitchzero", "pitchone", "pitchtwo", "pitchthree", "pitchfour", "pitchfive", "pitchsix", "pitchseven", "pitcheight", "pitchnine", "pitchten", "pitcheleven", "color", "wetdry", "ingain", "outgain" ],
                            "parameter_invisible": 3,
                            "parameter_longname": "umenu[7]",
                            "parameter_mmax": 29,
                            "parameter_modmode": 0,
                            "parameter_shortname": "umenu[2]",
                            "parameter_type": 2
                        }
                    },
                    "textcolor": [ 0.9803921568627451, 0.8431372549019608, 0.41568627450980394, 1.0 ],
                    "varname": "umenu[7]"
                }
            },
            {
                "box": {
                    "id": "obj-68",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1613.0, 858.0, 96.0, 22.0 ],
                    "text": "prepend append"
                }
            },
            {
                "box": {
                    "comment": "PARAM 11 0. - 1.",
                    "id": "obj-69",
                    "index": 0,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 2665.0, 107.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-70",
                    "maxclass": "flonum",
                    "maximum": 1.0,
                    "minimum": 0.0,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 1355.0, 886.0, 50.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 186.00000554323196, 336.6666767001152, 50.0, 22.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "number[7]",
                            "parameter_mmax": 1.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "number[1]",
                            "parameter_type": 0
                        }
                    },
                    "textcolor": [ 0.5803921568627451, 0.7529411764705882, 1.0, 1.0 ],
                    "varname": "number[7]"
                }
            },
            {
                "box": {
                    "id": "obj-71",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1449.0, 998.0, 53.0, 22.0 ],
                    "text": "prepend"
                }
            },
            {
                "box": {
                    "id": "obj-72",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1449.0, 958.0, 72.0, 22.0 ],
                    "text": "prepend set"
                }
            },
            {
                "box": {
                    "id": "obj-73",
                    "items": "<empty>",
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 1409.0, 914.0, 100.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1.3333333730697632, 336.8000014424324, 190.00000566244125, 22.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "time", "timevariation", "feedback", "grainsize", "panvariation", "density", "grainstartvariation", "octave", "octavevariation", "reversegrain", "timelock", "just", "filterfreq", "filterreson", "pitchzero", "pitchone", "pitchtwo", "pitchthree", "pitchfour", "pitchfive", "pitchsix", "pitchseven", "pitcheight", "pitchnine", "pitchten", "pitcheleven", "color", "wetdry", "ingain", "outgain" ],
                            "parameter_invisible": 3,
                            "parameter_longname": "umenu[8]",
                            "parameter_mmax": 29,
                            "parameter_modmode": 0,
                            "parameter_shortname": "umenu[1]",
                            "parameter_type": 2
                        }
                    },
                    "textcolor": [ 0.9803921568627451, 0.8431372549019608, 0.41568627450980394, 1.0 ],
                    "varname": "umenu[8]"
                }
            },
            {
                "box": {
                    "id": "obj-74",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1411.0, 858.0, 96.0, 22.0 ],
                    "text": "prepend append"
                }
            },
            {
                "box": {
                    "comment": "PARAM 10  0. - 1.",
                    "id": "obj-75",
                    "index": 0,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 2450.0, 107.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-76",
                    "maxclass": "flonum",
                    "maximum": 1.0,
                    "minimum": 0.0,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 1140.0, 886.0, 50.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 186.00000554323196, 312.66667598485947, 50.0, 22.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "number[8]",
                            "parameter_mmax": 1.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "number",
                            "parameter_type": 0
                        }
                    },
                    "textcolor": [ 0.5803921568627451, 0.7529411764705882, 1.0, 1.0 ],
                    "varname": "number[8]"
                }
            },
            {
                "box": {
                    "id": "obj-77",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1235.0, 998.0, 53.0, 22.0 ],
                    "text": "prepend"
                }
            },
            {
                "box": {
                    "id": "obj-78",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1235.0, 958.0, 72.0, 22.0 ],
                    "text": "prepend set"
                }
            },
            {
                "box": {
                    "id": "obj-79",
                    "items": "<empty>",
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 1195.0, 914.0, 100.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1.3333333730697632, 312.8000014424324, 190.00000566244125, 22.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "time", "timevariation", "feedback", "grainsize", "panvariation", "density", "grainstartvariation", "octave", "octavevariation", "reversegrain", "timelock", "just", "filterfreq", "filterreson", "pitchzero", "pitchone", "pitchtwo", "pitchthree", "pitchfour", "pitchfive", "pitchsix", "pitchseven", "pitcheight", "pitchnine", "pitchten", "pitcheleven", "color", "wetdry", "ingain", "outgain" ],
                            "parameter_invisible": 3,
                            "parameter_longname": "umenu[9]",
                            "parameter_mmax": 29,
                            "parameter_modmode": 0,
                            "parameter_shortname": "umenu",
                            "parameter_type": 2
                        }
                    },
                    "textcolor": [ 0.9803921568627451, 0.8431372549019608, 0.41568627450980394, 1.0 ],
                    "varname": "umenu[9]"
                }
            },
            {
                "box": {
                    "id": "obj-80",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1185.0, 860.0, 96.0, 22.0 ],
                    "text": "prepend append"
                }
            },
            {
                "box": {
                    "id": "obj-81",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 633.8000084757805, 881.0, 35.0, 22.0 ],
                    "text": "clear",
                    "textcolor": [ 1.0, 0.1803921568627451, 0.1803921568627451, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-82",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 853.0, 894.0, 35.0, 22.0 ],
                    "text": "clear",
                    "textcolor": [ 1.0, 0.1803921568627451, 0.1803921568627451, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-83",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1072.0, 894.0, 35.0, 22.0 ],
                    "text": "clear",
                    "textcolor": [ 1.0, 0.1803921568627451, 0.1803921568627451, 1.0 ]
                }
            },
            {
                "box": {
                    "comment": "PARAM 9 0. - 1.",
                    "id": "obj-84",
                    "index": 0,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 2207.0, 115.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-85",
                    "maxclass": "flonum",
                    "maximum": 1.0,
                    "minimum": 0.0,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 897.0, 894.0, 50.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 186.00000554323196, 288.66667526960373, 50.00000149011612, 22.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "number[9]",
                            "parameter_mmax": 1.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "number[2]",
                            "parameter_type": 0
                        }
                    },
                    "textcolor": [ 0.5803921568627451, 0.7529411764705882, 1.0, 1.0 ],
                    "varname": "number[9]"
                }
            },
            {
                "box": {
                    "id": "obj-86",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 991.0, 1007.0, 53.0, 22.0 ],
                    "text": "prepend"
                }
            },
            {
                "box": {
                    "id": "obj-88",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 991.0, 966.0, 72.0, 22.0 ],
                    "text": "prepend set"
                }
            },
            {
                "box": {
                    "id": "obj-89",
                    "items": "<empty>",
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 951.0, 922.0, 100.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1.3333333730697632, 288.8000014424324, 190.00000566244125, 22.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "time", "timevariation", "feedback", "grainsize", "panvariation", "density", "grainstartvariation", "octave", "octavevariation", "reversegrain", "timelock", "just", "filterfreq", "filterreson", "pitchzero", "pitchone", "pitchtwo", "pitchthree", "pitchfour", "pitchfive", "pitchsix", "pitchseven", "pitcheight", "pitchnine", "pitchten", "pitcheleven", "color", "wetdry", "ingain", "outgain" ],
                            "parameter_invisible": 3,
                            "parameter_longname": "umenu[10]",
                            "parameter_mmax": 29,
                            "parameter_modmode": 0,
                            "parameter_shortname": "umenu[2]",
                            "parameter_type": 2
                        }
                    },
                    "textcolor": [ 0.9803921568627451, 0.8431372549019608, 0.41568627450980394, 1.0 ],
                    "varname": "umenu[10]"
                }
            },
            {
                "box": {
                    "id": "obj-90",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 953.0, 866.0, 96.0, 22.0 ],
                    "text": "prepend append"
                }
            },
            {
                "box": {
                    "comment": "PARAM 8 0. - 1.",
                    "id": "obj-91",
                    "index": 0,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 2005.0, 115.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-92",
                    "maxclass": "flonum",
                    "maximum": 1.0,
                    "minimum": 0.0,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 693.8000084757805, 877.0, 50.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 186.00000554323196, 264.666674554348, 50.0, 22.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "number[10]",
                            "parameter_mmax": 1.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "number[1]",
                            "parameter_type": 0
                        }
                    },
                    "textcolor": [ 0.5803921568627451, 0.7529411764705882, 1.0, 1.0 ],
                    "varname": "number[10]"
                }
            },
            {
                "box": {
                    "id": "obj-93",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 788.8000084757805, 990.0, 53.0, 22.0 ],
                    "text": "prepend"
                }
            },
            {
                "box": {
                    "id": "obj-94",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 788.8000084757805, 949.0, 72.0, 22.0 ],
                    "text": "prepend set"
                }
            },
            {
                "box": {
                    "id": "obj-95",
                    "items": "<empty>",
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 748.8000084757805, 905.0, 100.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1.3333333730697632, 264.8000014424324, 190.00000566244125, 22.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "time", "timevariation", "feedback", "grainsize", "panvariation", "density", "grainstartvariation", "octave", "octavevariation", "reversegrain", "timelock", "just", "filterfreq", "filterreson", "pitchzero", "pitchone", "pitchtwo", "pitchthree", "pitchfour", "pitchfive", "pitchsix", "pitchseven", "pitcheight", "pitchnine", "pitchten", "pitcheleven", "color", "wetdry", "ingain", "outgain" ],
                            "parameter_invisible": 3,
                            "parameter_longname": "umenu[11]",
                            "parameter_mmax": 29,
                            "parameter_modmode": 0,
                            "parameter_shortname": "umenu[1]",
                            "parameter_type": 2
                        }
                    },
                    "textcolor": [ 0.9803921568627451, 0.8431372549019608, 0.41568627450980394, 1.0 ],
                    "varname": "umenu[11]"
                }
            },
            {
                "box": {
                    "id": "obj-96",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 749.8000084757805, 849.0, 96.0, 22.0 ],
                    "text": "prepend append"
                }
            },
            {
                "box": {
                    "comment": "PARAM 7  0. - 1.",
                    "id": "obj-97",
                    "index": 0,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1790.0, 115.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-98",
                    "maxclass": "flonum",
                    "maximum": 1.0,
                    "minimum": 0.0,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 479.8000084757805, 877.0, 50.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 186.00000554323196, 240.66667383909225, 50.0, 22.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "number[11]",
                            "parameter_mmax": 1.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "number",
                            "parameter_type": 0
                        }
                    },
                    "textcolor": [ 0.5803921568627451, 0.7529411764705882, 1.0, 1.0 ],
                    "varname": "number[11]"
                }
            },
            {
                "box": {
                    "id": "obj-99",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 573.8000084757805, 990.0, 53.0, 22.0 ],
                    "text": "prepend"
                }
            },
            {
                "box": {
                    "id": "obj-100",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 573.8000084757805, 949.0, 72.0, 22.0 ],
                    "text": "prepend set"
                }
            },
            {
                "box": {
                    "id": "obj-101",
                    "items": "<empty>",
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 533.8000084757805, 905.0, 100.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1.3333333730697632, 240.8000014424324, 190.00000566244125, 22.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "time", "timevariation", "feedback", "grainsize", "panvariation", "density", "grainstartvariation", "octave", "octavevariation", "reversegrain", "timelock", "just", "filterfreq", "filterreson", "pitchzero", "pitchone", "pitchtwo", "pitchthree", "pitchfour", "pitchfive", "pitchsix", "pitchseven", "pitcheight", "pitchnine", "pitchten", "pitcheleven", "color", "wetdry", "ingain", "outgain" ],
                            "parameter_invisible": 3,
                            "parameter_longname": "umenu[12]",
                            "parameter_mmax": 29,
                            "parameter_modmode": 0,
                            "parameter_shortname": "umenu",
                            "parameter_type": 2
                        }
                    },
                    "textcolor": [ 0.9803921568627451, 0.8431372549019608, 0.41568627450980394, 1.0 ],
                    "varname": "umenu[12]"
                }
            },
            {
                "box": {
                    "id": "obj-102",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 524.8000084757805, 851.0, 96.0, 22.0 ],
                    "text": "prepend append"
                }
            },
            {
                "box": {
                    "id": "obj-4",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1338.0, 388.0, 35.0, 22.0 ],
                    "text": "clear",
                    "textcolor": [ 1.0, 0.1803921568627451, 0.1803921568627451, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-5",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1557.0, 384.0, 35.0, 22.0 ],
                    "text": "clear",
                    "textcolor": [ 1.0, 0.1803921568627451, 0.1803921568627451, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-6",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1776.0, 384.0, 35.0, 22.0 ],
                    "text": "clear",
                    "textcolor": [ 1.0, 0.1803921568627451, 0.1803921568627451, 1.0 ]
                }
            },
            {
                "box": {
                    "comment": "PARAM 6 0. - 1.",
                    "id": "obj-10",
                    "index": 0,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1691.0, 99.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-13",
                    "maxclass": "flonum",
                    "maximum": 1.0,
                    "minimum": 0.0,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 1601.0, 384.0, 50.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 186.00000554323196, 216.66667312383652, 50.00000149011612, 22.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "number[3]",
                            "parameter_mmax": 1.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "number[2]",
                            "parameter_type": 0
                        }
                    },
                    "textcolor": [ 0.5803921568627451, 0.7529411764705882, 1.0, 1.0 ],
                    "varname": "number[3]"
                }
            },
            {
                "box": {
                    "id": "obj-15",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1695.0, 496.0, 53.0, 22.0 ],
                    "text": "prepend"
                }
            },
            {
                "box": {
                    "id": "obj-16",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1695.0, 456.0, 72.0, 22.0 ],
                    "text": "prepend set"
                }
            },
            {
                "box": {
                    "id": "obj-17",
                    "items": "<empty>",
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 1655.0, 412.0, 100.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1.3333333730697632, 216.8000014424324, 190.00000566244125, 22.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "time", "timevariation", "feedback", "grainsize", "panvariation", "density", "grainstartvariation", "octave", "octavevariation", "reversegrain", "timelock", "just", "filterfreq", "filterreson", "pitchzero", "pitchone", "pitchtwo", "pitchthree", "pitchfour", "pitchfive", "pitchsix", "pitchseven", "pitcheight", "pitchnine", "pitchten", "pitcheleven", "color", "wetdry", "ingain", "outgain" ],
                            "parameter_invisible": 3,
                            "parameter_longname": "umenu[4]",
                            "parameter_mmax": 29,
                            "parameter_modmode": 0,
                            "parameter_shortname": "umenu[2]",
                            "parameter_type": 2
                        }
                    },
                    "textcolor": [ 0.9803921568627451, 0.8431372549019608, 0.41568627450980394, 1.0 ],
                    "varname": "umenu[4]"
                }
            },
            {
                "box": {
                    "id": "obj-18",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1657.0, 356.0, 96.0, 22.0 ],
                    "text": "prepend append"
                }
            },
            {
                "box": {
                    "comment": "PARAM 5 0. - 1.",
                    "id": "obj-19",
                    "index": 0,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1488.0, 99.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-23",
                    "maxclass": "flonum",
                    "maximum": 1.0,
                    "minimum": 0.0,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 1399.0, 384.0, 50.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 186.00000554323196, 192.66667240858078, 50.0, 22.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "number[4]",
                            "parameter_mmax": 1.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "number[1]",
                            "parameter_type": 0
                        }
                    },
                    "textcolor": [ 0.5803921568627451, 0.7529411764705882, 1.0, 1.0 ],
                    "varname": "number[4]"
                }
            },
            {
                "box": {
                    "id": "obj-25",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1493.0, 496.0, 53.0, 22.0 ],
                    "text": "prepend"
                }
            },
            {
                "box": {
                    "id": "obj-29",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1493.0, 456.0, 72.0, 22.0 ],
                    "text": "prepend set"
                }
            },
            {
                "box": {
                    "id": "obj-32",
                    "items": "<empty>",
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 1453.0, 412.0, 100.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1.3333333730697632, 192.8000014424324, 190.00000566244125, 22.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "time", "timevariation", "feedback", "grainsize", "panvariation", "density", "grainstartvariation", "octave", "octavevariation", "reversegrain", "timelock", "just", "filterfreq", "filterreson", "pitchzero", "pitchone", "pitchtwo", "pitchthree", "pitchfour", "pitchfive", "pitchsix", "pitchseven", "pitcheight", "pitchnine", "pitchten", "pitcheleven", "color", "wetdry", "ingain", "outgain" ],
                            "parameter_invisible": 3,
                            "parameter_longname": "umenu[5]",
                            "parameter_mmax": 29,
                            "parameter_modmode": 0,
                            "parameter_shortname": "umenu[1]",
                            "parameter_type": 2
                        }
                    },
                    "textcolor": [ 0.9803921568627451, 0.8431372549019608, 0.41568627450980394, 1.0 ],
                    "varname": "umenu[5]"
                }
            },
            {
                "box": {
                    "id": "obj-33",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1455.0, 356.0, 96.0, 22.0 ],
                    "text": "prepend append"
                }
            },
            {
                "box": {
                    "comment": "PARAM 4  0. - 1.",
                    "id": "obj-34",
                    "index": 0,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1273.0, 99.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-39",
                    "maxclass": "flonum",
                    "maximum": 1.0,
                    "minimum": 0.0,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 1184.0, 384.0, 50.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 186.00000554323196, 168.66667169332504, 50.0, 22.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "number[5]",
                            "parameter_mmax": 1.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "number",
                            "parameter_type": 0
                        }
                    },
                    "textcolor": [ 0.5803921568627451, 0.7529411764705882, 1.0, 1.0 ],
                    "varname": "number[5]"
                }
            },
            {
                "box": {
                    "id": "obj-43",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1279.0, 496.0, 53.0, 22.0 ],
                    "text": "prepend"
                }
            },
            {
                "box": {
                    "id": "obj-47",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1279.0, 456.0, 72.0, 22.0 ],
                    "text": "prepend set"
                }
            },
            {
                "box": {
                    "id": "obj-51",
                    "items": "<empty>",
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 1239.0, 412.0, 100.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1.3333333730697632, 168.8000014424324, 190.00000566244125, 22.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "time", "timevariation", "feedback", "grainsize", "panvariation", "density", "grainstartvariation", "octave", "octavevariation", "reversegrain", "timelock", "just", "filterfreq", "filterreson", "pitchzero", "pitchone", "pitchtwo", "pitchthree", "pitchfour", "pitchfive", "pitchsix", "pitchseven", "pitcheight", "pitchnine", "pitchten", "pitcheleven", "color", "wetdry", "ingain", "outgain" ],
                            "parameter_invisible": 3,
                            "parameter_longname": "umenu[6]",
                            "parameter_mmax": 29,
                            "parameter_modmode": 0,
                            "parameter_shortname": "umenu",
                            "parameter_type": 2
                        }
                    },
                    "textcolor": [ 0.9803921568627451, 0.8431372549019608, 0.41568627450980394, 1.0 ],
                    "varname": "umenu[6]"
                }
            },
            {
                "box": {
                    "id": "obj-57",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1229.0, 358.0, 96.0, 22.0 ],
                    "text": "prepend append"
                }
            },
            {
                "box": {
                    "id": "obj-87",
                    "maxclass": "meter~",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "patching_rect": [ 213.0, 397.0000058412552, 81.0, 12.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1.0, 495.0, 235.0, 13.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-2",
                    "maxclass": "meter~",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "patching_rect": [ 214.0, 382.0000058412552, 80.0, 13.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1.0, 481.0, 235.0, 13.0 ]
                }
            },
            {
                "box": {
                    "comment": "",
                    "id": "obj-59",
                    "index": 0,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 362.4000054001808, 469.6000069975853, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "comment": "",
                    "id": "obj-58",
                    "index": 0,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 319.20000475645065, 469.6000069975853, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-56",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 678.0000086426735, 396.0000062584877, 35.0, 22.0 ],
                    "text": "clear",
                    "textcolor": [ 1.0, 0.1803921568627451, 0.1803921568627451, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-55",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 896.8000133633614, 392.0000058412552, 35.0, 22.0 ],
                    "text": "clear",
                    "textcolor": [ 1.0, 0.1803921568627451, 0.1803921568627451, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-54",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1116.000016629696, 392.0000058412552, 35.0, 22.0 ],
                    "text": "clear",
                    "textcolor": [ 1.0, 0.1803921568627451, 0.1803921568627451, 1.0 ]
                }
            },
            {
                "box": {
                    "comment": "PARAM 3 0. - 1.",
                    "id": "obj-46",
                    "index": 0,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1030.4000153541565, 107.20000159740448, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-48",
                    "maxclass": "flonum",
                    "maximum": 1.0,
                    "minimum": 0.0,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 940.8000140190125, 392.0000058412552, 50.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 186.00000554323196, 144.6666709780693, 50.00000149011612, 22.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "number[2]",
                            "parameter_mmax": 1.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "number[2]",
                            "parameter_type": 0
                        }
                    },
                    "textcolor": [ 0.5803921568627451, 0.7529411764705882, 1.0, 1.0 ],
                    "varname": "number[2]"
                }
            },
            {
                "box": {
                    "id": "obj-49",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1035.200015425682, 504.80000752210617, 53.0, 22.0 ],
                    "text": "prepend"
                }
            },
            {
                "box": {
                    "id": "obj-50",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1035.200015425682, 464.0000069141388, 72.0, 22.0 ],
                    "text": "prepend set"
                }
            },
            {
                "box": {
                    "id": "obj-52",
                    "items": "<empty>",
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 995.2000148296356, 420.0000062584877, 100.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1.3333333730697632, 144.8000014424324, 190.00000566244125, 22.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "time", "timevariation", "feedback", "grainsize", "panvariation", "density", "grainstartvariation", "octave", "octavevariation", "reversegrain", "timelock", "just", "filterfreq", "filterreson", "pitchzero", "pitchone", "pitchtwo", "pitchthree", "pitchfour", "pitchfive", "pitchsix", "pitchseven", "pitcheight", "pitchnine", "pitchten", "pitcheleven", "color", "wetdry", "ingain", "outgain" ],
                            "parameter_invisible": 3,
                            "parameter_longname": "umenu[2]",
                            "parameter_mmax": 29,
                            "parameter_modmode": 0,
                            "parameter_shortname": "umenu[2]",
                            "parameter_type": 2
                        }
                    },
                    "textcolor": [ 0.9803921568627451, 0.8431372549019608, 0.41568627450980394, 1.0 ],
                    "varname": "umenu[2]"
                }
            },
            {
                "box": {
                    "id": "obj-53",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 996.8000148534775, 364.0000054240227, 96.0, 22.0 ],
                    "text": "prepend append"
                }
            },
            {
                "box": {
                    "comment": "PARAM 2 0. - 1.",
                    "id": "obj-38",
                    "index": 0,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 828.0000123381615, 107.20000159740448, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-40",
                    "maxclass": "flonum",
                    "maximum": 1.0,
                    "minimum": 0.0,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 738.4000110030174, 392.0000058412552, 50.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 186.00000554323196, 120.66667026281357, 50.0, 22.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "number[1]",
                            "parameter_mmax": 1.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "number[1]",
                            "parameter_type": 0
                        }
                    },
                    "textcolor": [ 0.5803921568627451, 0.7529411764705882, 1.0, 1.0 ],
                    "varname": "number[1]"
                }
            },
            {
                "box": {
                    "id": "obj-41",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 832.800012409687, 504.80000752210617, 53.0, 22.0 ],
                    "text": "prepend"
                }
            },
            {
                "box": {
                    "id": "obj-42",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 832.800012409687, 464.0000069141388, 72.0, 22.0 ],
                    "text": "prepend set"
                }
            },
            {
                "box": {
                    "id": "obj-44",
                    "items": "<empty>",
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 792.8000118136406, 420.0000062584877, 100.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1.3333333730697632, 120.8000014424324, 190.00000566244125, 22.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "time", "timevariation", "feedback", "grainsize", "panvariation", "density", "grainstartvariation", "octave", "octavevariation", "reversegrain", "timelock", "just", "filterfreq", "filterreson", "pitchzero", "pitchone", "pitchtwo", "pitchthree", "pitchfour", "pitchfive", "pitchsix", "pitchseven", "pitcheight", "pitchnine", "pitchten", "pitcheleven", "color", "wetdry", "ingain", "outgain" ],
                            "parameter_invisible": 3,
                            "parameter_longname": "umenu[1]",
                            "parameter_mmax": 29,
                            "parameter_modmode": 0,
                            "parameter_shortname": "umenu[1]",
                            "parameter_type": 2
                        }
                    },
                    "textcolor": [ 0.9803921568627451, 0.8431372549019608, 0.41568627450980394, 1.0 ],
                    "varname": "umenu[1]"
                }
            },
            {
                "box": {
                    "id": "obj-45",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 794.4000118374825, 364.0000054240227, 96.0, 22.0 ],
                    "text": "prepend append"
                }
            },
            {
                "box": {
                    "id": "obj-37",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 126.0, 739.0, 79.0, 22.0 ],
                    "text": "prepend plug"
                }
            },
            {
                "box": {
                    "id": "obj-36",
                    "items": "<empty>",
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 126.0, 692.0, 100.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 0.6666666865348816, 24.0, 235.3333403468132, 22.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "++bubbler", "++chebyshev", "++compand", "++decimate", "++delay", "++flipper", "++matrix", "++phasor", "++pitchdelay", "Aalto", "bx_clipper", "CardinalFX", "CardinalSynth", "EchoBoyJr", "FabFilter Micro (Mono)", "FabFilter Micro", "FabFilter One", "FabFilter Pro-C 2 (Mono)", "FabFilter Pro-C 2", "FabFilter Pro-C 3", "FabFilter Pro-DS (Mono)", "FabFilter Pro-DS", "FabFilter Pro-G (Mono)", "FabFilter Pro-G", "FabFilter Pro-L (Mono)", "FabFilter Pro-L 2", "FabFilter Pro-L", "FabFilter Pro-MB (Mono)", "FabFilter Pro-MB", "FabFilter Pro-Q 2 (Mono)", "FabFilter Pro-Q 2", "FabFilter Pro-Q 3", "FabFilter Pro-Q 4", "FabFilter Pro-R (Mono)", "FabFilter Pro-R 2", "FabFilter Pro-R", "FabFilter Saturn (Mono)", "FabFilter Saturn 2", "FabFilter Saturn", "FabFilter Simplon", "FabFilter Timeless 2 (SC)", "FabFilter Timeless 2", "FabFilter Timeless 3", "FabFilter Twin 2", "FabFilter Twin 3", "FabFilter Volcano 2 (Mono)", "FabFilter Volcano 2 (SC Mono)", "FabFilter Volcano 2 (SC)", "FabFilter Volcano 2", "FabFilter Volcano 3", "Kaivo", "kHs 3-Band EQ", "kHs Bitcrush", "kHs Channel Mixer", "kHs Chorus", "kHs Clipper", "kHs Comb Filter", "kHs Compactor", "kHs Compressor", "kHs Delay", "kHs Distortion", "kHs Dual Delay", "kHs Dynamics", "kHs Ensemble", "kHs Filter", "kHs Flanger", "kHs Formant Filter", "kHs Frequency Shifter", "kHs Gain", "kHs Gate", "kHs Haas", "kHs Ladder Filter", "kHs Limiter", "kHs Nonlinear Filter", "kHs Phase Distortion", "kHs Phaser", "kHs Pitch Shifter", "kHs Resonator", "kHs Reverb", "kHs Reverser", "kHs Ring Mod", "kHs Shaper", "kHs Stereo", "kHs Tape Stop", "kHs Trance Gate", "kHs Transient Shaper", "LittleMicroShift", "LittlePrimalTap", "LittleRadiator", "MAP", "Pigments", "PSP stereoAnalyser2", "smartcomp3", "smartEQ4", "soothe2", "SpaceBlender", "spiff", "ValhallaDelay", "ValhallaFreqEcho", "ValhallaFutureVerb", "ValhallaPlate", "ValhallaRoom_x64", "ValhallaShimmer_x64", "ValhallaSpaceModulator", "ValhallaSupermassive", "ValhallaUberMod_x64", "ValhallaVintageVerb_x64", "Virta", "Youlean Loudness Meter 2" ],
                            "parameter_invisible": 3,
                            "parameter_longname": "umenu[3]",
                            "parameter_mmax": 108,
                            "parameter_modmode": 0,
                            "parameter_shortname": "umenu[3]",
                            "parameter_type": 2
                        }
                    },
                    "textcolor": [ 0.28627450980392155, 0.9137254901960784, 1.0, 1.0 ],
                    "varname": "umenu[3]"
                }
            },
            {
                "box": {
                    "id": "obj-35",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 506.0, 587.0, 35.0, 22.0 ],
                    "text": "clear",
                    "textcolor": [ 1.0, 0.1803921568627451, 0.1803921568627451, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-31",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 126.0, 644.0, 96.0, 22.0 ],
                    "text": "prepend append"
                }
            },
            {
                "box": {
                    "id": "obj-30",
                    "maxclass": "newobj",
                    "numinlets": 4,
                    "numoutlets": 4,
                    "outlettype": [ "", "", "", "" ],
                    "patching_rect": [ 126.0, 587.0, 366.40000545978546, 22.0 ],
                    "text": "route plug_au plug_vst plug_vst3"
                }
            },
            {
                "box": {
                    "id": "obj-28",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 126.0, 529.0, 49.0, 22.0 ],
                    "text": "vstscan"
                }
            },
            {
                "box": {
                    "id": "obj-27",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 245.0, 467.0, 45.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 105.40000146627426, 0.0, 45.0, 22.0 ],
                    "text": "listvst3",
                    "textcolor": [ 0.4745098039215686, 0.9254901960784314, 0.44313725490196076, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-26",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 186.0, 467.0, 38.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 52.80000078678131, 0.0, 38.0, 22.0 ],
                    "text": "listvst",
                    "textcolor": [ 0.4745098039215686, 0.9254901960784314, 0.44313725490196076, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-24",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 126.0, 467.0, 37.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 0.800000011920929, 0.0, 37.0, 22.0 ],
                    "text": "listau",
                    "textcolor": [ 0.4745098039215686, 0.9254901960784314, 0.44313725490196076, 1.0 ]
                }
            },
            {
                "box": {
                    "comment": "PARAM 1  0. - 1.",
                    "id": "obj-22",
                    "index": 0,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 613.0000086426735, 107.20000159740448, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "comment": "IN R",
                    "id": "obj-21",
                    "index": 0,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 368.80000549554825, 107.20000159740448, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "comment": "IN L",
                    "id": "obj-20",
                    "index": 0,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 279.2000041604042, 107.20000159740448, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-14",
                    "maxclass": "flonum",
                    "maximum": 1.0,
                    "minimum": 0.0,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 524.0000078082085, 392.0000058412552, 50.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 186.00000554323196, 96.66666954755783, 50.0, 22.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "number",
                            "parameter_mmax": 1.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "number",
                            "parameter_type": 0
                        }
                    },
                    "textcolor": [ 0.5803921568627451, 0.7529411764705882, 1.0, 1.0 ],
                    "varname": "number"
                }
            },
            {
                "box": {
                    "id": "obj-12",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 618.4000092148781, 504.80000752210617, 53.0, 22.0 ],
                    "text": "prepend"
                }
            },
            {
                "box": {
                    "id": "obj-11",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 618.4000092148781, 464.0000069141388, 72.0, 22.0 ],
                    "text": "prepend set"
                }
            },
            {
                "box": {
                    "id": "obj-9",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 4,
                    "outlettype": [ "", "", "", "" ],
                    "patching_rect": [ 73.0, 103.0, 118.0, 22.0 ],
                    "restore": {
                        "number": [ 0.0 ],
                        "number[10]": [ 0.0 ],
                        "number[11]": [ 0.0 ],
                        "number[12]": [ 0.0 ],
                        "number[13]": [ 0.0 ],
                        "number[14]": [ 0.0 ],
                        "number[15]": [ 0.0 ],
                        "number[1]": [ 0.0 ],
                        "number[2]": [ 0.0 ],
                        "number[3]": [ 0.0 ],
                        "number[4]": [ 0.0 ],
                        "number[5]": [ 0.0 ],
                        "number[6]": [ 0.0 ],
                        "number[7]": [ 0.0 ],
                        "number[8]": [ 0.0 ],
                        "number[9]": [ 0.0 ],
                        "umenu": [ 0 ],
                        "umenu[10]": [ 0 ],
                        "umenu[11]": [ 0 ],
                        "umenu[12]": [ 0 ],
                        "umenu[13]": [ 0 ],
                        "umenu[14]": [ 0 ],
                        "umenu[15]": [ 0 ],
                        "umenu[16]": [ 0 ],
                        "umenu[1]": [ 0 ],
                        "umenu[2]": [ 0 ],
                        "umenu[3]": [ 0 ],
                        "umenu[4]": [ 0 ],
                        "umenu[5]": [ 0 ],
                        "umenu[6]": [ 0 ],
                        "umenu[7]": [ 0 ],
                        "umenu[8]": [ 0 ],
                        "umenu[9]": [ 0 ],
                        "vst~": [
                            {
                                "filetype": "C74Snapshot",
                                "version": 2,
                                "minorversion": 0,
                                "name": "++bubbler",
                                "origin": "++bubbler.vstinfo",
                                "type": "VST",
                                "subtype": "MidiEffect",
                                "embed": 1,
                                "snapshot": {
                                    "pluginname": "++bubbler.vstinfo",
                                    "plugindisplayname": "++bubbler",
                                    "pluginsavedname": "",
                                    "pluginsaveduniqueid": 724722274,
                                    "version": 1,
                                    "isbank": 0,
                                    "isbase64": 1,
                                    "blob": "1192.CMlaKA....fQPMDZ....ArhLhIF.IH......A........................................P.aVMjLgLFA...O+fWarAhckI2bo8la8HRLt.iHfTlai8FYo41Y8HRUTYTK3HxO9.BOhUmXhwVYxYEU9vCTAIUPMARZj0iHi8FauImHfXWXrUWY8HBLt.iHu3COPEjTA0DHoQVOhPVYtMWZzkmHfXWXrUWY8HBNv3BLh7hO7.UPRETSfjFY8HhYkUFYhE1XqIBH1EFa0UVOh.iKvHxK9vCTAIUPMARZj0iHlkFazUlblIWYwIBH1EFa0UVOhHCLv.CLt.iHu3COPEjTA0DHoQVOhXVZrQWYxIWYy8lah.hcgwVck0iHw.iKvHxK9vCTAIUPMARZj0iHmIWXo41booWYh.hcgwVck0iHv3BLh7hO7.UPRETSfjFY8HxYxEVZtMGcgIGc1ElboEFco8lah.hcgwVck0iHv3BLh7hO7.UPRETSfjFY8HRZtcVXo4lHfXWXrUWY8HBLt.iHu3COPEjTA0DHoQVOhnVcyQmHfXWXrUWY8HBLt.iHu3COPEjTA0DHoQVOh71XzElckIBH1EFa0UVOh.iKvHxK9vCTAIUPMARZj0iHuMFcgYWY1ElboEFco8lah.hcgwVck0iHv3BLh7hO7.UPRETSfjFY8Hxa0Q2Ygklah.hcgwVck0iHv3BLh7hO7.UPRETSfjFY8HBbg4lcgIWZgQWZu4lHfXWXrUWY8HBLt.iHu3COPEjTA0DHoQVOh.WZzMFZkk1YnQmHfXWXrUWY8HBLt.iHu3COPEjTA0DHoQVOh.WZzMFZkwVY1Ulah.hcgwVck0iHv3BLh7hO7.UPRETSfjFY8HBboQ2XnYVZ1UlHfXWXrUWY8HBLt.iHu3COPEjTA0DHoQVOh.WZzMFZl8VcxIBH1EFa0UVOh.iKvHxK9vCTAIUPMARZj0iHvkFciglao4VYh.hcgwVck0iHv3BLh7hO7.UPRETSfjFY8HBboQ2Xn8lakIBH1EFa0UVOh.iKvHxK9vCTAIUPMARZj0iHvkFcig1bkYWYtIBH1EFa0UVOh.iKvHxK9vCTAIUPMARZj0iHvkFcig1bogmHfXWXrUWY8HBLt.iHu3COPEjTA0DHoQVOh.WZzMFZzUlah.hcgwVck0iHv3BLh7hO7.UPRETSfjFY8HBboQ2XnQGZxUVYh.hcgwVck0iHv3BLh7hO7.UPRETSfjFY8HBboQ2XnQ2cuIBH1EFa0UVOh.iKvHxK9vCTAIUPMARZj0iHvkFcigldkI2ah.hcgwVck0iHv3BLh7hO7.UPRETSfjFY8HhbkYWYxMWYmIWXo4lHfXWXrUWY8HRMv3BLh7hO7.UPRETSfjFY8HBco0VYh.hcgwVck0iHw.iKvHxK9vCTAIUPMARZj0iHzkVakw1aislHfXWXrUWY8HBLt.iHu3COPEjTA0DHoQVOhPWZsUlcgIWZgQWZu4lHfXWXrUWY8HRMv3BLh7hO7.UPRETSfjFY8HxckQGYxkmHfXWXrUWY8HRMv3BLh7hO77hX0IlXrUlbVQkO.."
                                }
                            }
                        ]
                    },
                    "text": "autopattr @greedy 1",
                    "varname": "u753006994"
                }
            },
            {
                "box": {
                    "id": "obj-8",
                    "items": "<empty>",
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 578.4000086188316, 420.0000062584877, 100.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1.3333333730697632, 96.8000014424324, 190.00000566244125, 22.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "time", "timevariation", "feedback", "grainsize", "panvariation", "density", "grainstartvariation", "octave", "octavevariation", "reversegrain", "timelock", "just", "filterfreq", "filterreson", "pitchzero", "pitchone", "pitchtwo", "pitchthree", "pitchfour", "pitchfive", "pitchsix", "pitchseven", "pitcheight", "pitchnine", "pitchten", "pitcheleven", "color", "wetdry", "ingain", "outgain" ],
                            "parameter_invisible": 3,
                            "parameter_longname": "umenu",
                            "parameter_mmax": 29,
                            "parameter_modmode": 0,
                            "parameter_shortname": "umenu",
                            "parameter_type": 2
                        }
                    },
                    "textcolor": [ 0.9803921568627451, 0.8431372549019608, 0.41568627450980394, 1.0 ],
                    "varname": "umenu"
                }
            },
            {
                "box": {
                    "id": "obj-7",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 568.8000084757805, 365.86, 96.0, 22.0 ],
                    "text": "prepend append"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.0784313725490196, 0.36470588235294116, 0.7215686274509804, 1.0 ],
                    "bgcolor2": [ 0.155775393210821, 0.174257207209253, 0.193751291175729, 1.0 ],
                    "bgfillcolor_angle": 270.0,
                    "bgfillcolor_autogradient": 0.0,
                    "bgfillcolor_color": [ 0.0784313725490196, 0.36470588235294116, 0.7215686274509804, 1.0 ],
                    "bgfillcolor_color1": [ 0.0784313725490196, 0.36470588235294116, 0.7215686274509804, 1.0 ],
                    "bgfillcolor_color2": [ 0.155775393210821, 0.174257207209253, 0.193751291175729, 1.0 ],
                    "bgfillcolor_proportion": 0.5,
                    "bgfillcolor_type": "gradient",
                    "gradient": 1,
                    "id": "obj-3",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 460.0, 215.0, 49.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 0.6666666865348816, 72.80000108480453, 235.3333403468132, 22.0 ],
                    "text": "params"
                }
            },
            {
                "box": {
                    "autosave": 1,
                    "bgmode": 0,
                    "border": 0,
                    "clickthrough": 0,
                    "id": "obj-1",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 8,
                    "offset": [ 0.0, 0.0 ],
                    "outlettype": [ "signal", "signal", "", "list", "int", "", "", "" ],
                    "patching_rect": [ 232.0, 307.0, 392.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1.3333333730697632, 48.800000727176666, 234.66667366027832, 22.0 ],
                    "save": [ "#N", "vst~", "loaduniqueid", 0, ";" ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_invisible": 1,
                            "parameter_longname": "vst~",
                            "parameter_modmode": 0,
                            "parameter_shortname": "vst~",
                            "parameter_type": 3
                        }
                    },
                    "saved_object_attributes": {
                        "parameter_enable": 1,
                        "parameter_mappable": 0
                    },
                    "snapshot": {
                        "filetype": "C74Snapshot",
                        "version": 2,
                        "minorversion": 0,
                        "name": "snapshotlist",
                        "origin": "vst~",
                        "type": "list",
                        "subtype": "Undefined",
                        "embed": 1,
                        "snapshot": {
                            "pluginname": "++bubbler.vstinfo",
                            "plugindisplayname": "++bubbler",
                            "pluginsavedname": "",
                            "pluginsaveduniqueid": 724722274,
                            "version": 1,
                            "isbank": 0,
                            "isbase64": 1,
                            "blob": "1192.CMlaKA....fQPMDZ....ArhLhIF.IH......A........................................P.aVMjLgLFA...O+fWarAhckI2bo8la8HRLt.iHfTlai8FYo41Y8HRUTYTK3HxO9.BOhUmXhwVYxYEU9vCTAIUPMARZj0iHi8FauImHfXWXrUWY8HBLt.iHu3COPEjTA0DHoQVOhPVYtMWZzkmHfXWXrUWY8HBNv3BLh7hO7.UPRETSfjFY8HhYkUFYhE1XqIBH1EFa0UVOh.iKvHxK9vCTAIUPMARZj0iHlkFazUlblIWYwIBH1EFa0UVOhHCLv.CLt.iHu3COPEjTA0DHoQVOhXVZrQWYxIWYy8lah.hcgwVck0iHw.iKvHxK9vCTAIUPMARZj0iHmIWXo41booWYh.hcgwVck0iHv3BLh7hO7.UPRETSfjFY8HxYxEVZtMGcgIGc1ElboEFco8lah.hcgwVck0iHv3BLh7hO7.UPRETSfjFY8HRZtcVXo4lHfXWXrUWY8HBLt.iHu3COPEjTA0DHoQVOhnVcyQmHfXWXrUWY8HBLt.iHu3COPEjTA0DHoQVOh71XzElckIBH1EFa0UVOh.iKvHxK9vCTAIUPMARZj0iHuMFcgYWY1ElboEFco8lah.hcgwVck0iHv3BLh7hO7.UPRETSfjFY8Hxa0Q2Ygklah.hcgwVck0iHv3BLh7hO7.UPRETSfjFY8HBbg4lcgIWZgQWZu4lHfXWXrUWY8HBLt.iHu3COPEjTA0DHoQVOh.WZzMFZkk1YnQmHfXWXrUWY8HBLt.iHu3COPEjTA0DHoQVOh.WZzMFZkwVY1Ulah.hcgwVck0iHv3BLh7hO7.UPRETSfjFY8HBboQ2XnYVZ1UlHfXWXrUWY8HBLt.iHu3COPEjTA0DHoQVOh.WZzMFZl8VcxIBH1EFa0UVOh.iKvHxK9vCTAIUPMARZj0iHvkFciglao4VYh.hcgwVck0iHv3BLh7hO7.UPRETSfjFY8HBboQ2Xn8lakIBH1EFa0UVOh.iKvHxK9vCTAIUPMARZj0iHvkFcig1bkYWYtIBH1EFa0UVOh.iKvHxK9vCTAIUPMARZj0iHvkFcig1bogmHfXWXrUWY8HBLt.iHu3COPEjTA0DHoQVOh.WZzMFZzUlah.hcgwVck0iHv3BLh7hO7.UPRETSfjFY8HBboQ2XnQGZxUVYh.hcgwVck0iHv3BLh7hO7.UPRETSfjFY8HBboQ2XnQ2cuIBH1EFa0UVOh.iKvHxK9vCTAIUPMARZj0iHvkFcigldkI2ah.hcgwVck0iHv3BLh7hO7.UPRETSfjFY8HhbkYWYxMWYmIWXo4lHfXWXrUWY8HRMv3BLh7hO7.UPRETSfjFY8HBco0VYh.hcgwVck0iHw.iKvHxK9vCTAIUPMARZj0iHzkVakw1aislHfXWXrUWY8HBLt.iHu3COPEjTA0DHoQVOhPWZsUlcgIWZgQWZu4lHfXWXrUWY8HRMv3BLh7hO7.UPRETSfjFY8HxckQGYxkmHfXWXrUWY8HRMv3BLh7hO77hX0IlXrUlbVQkO.."
                        },
                        "snapshotlist": {
                            "current_snapshot": 0,
                            "entries": [
                                {
                                    "filetype": "C74Snapshot",
                                    "version": 2,
                                    "minorversion": 0,
                                    "name": "kHs Distortion",
                                    "origin": "++bubbler.vstinfo",
                                    "type": "VST",
                                    "subtype": "MidiEffect",
                                    "embed": 1,
                                    "snapshot": {
                                        "pluginname": "++bubbler.vstinfo",
                                        "plugindisplayname": "++bubbler",
                                        "pluginsavedname": "",
                                        "pluginsaveduniqueid": 724722274,
                                        "version": 1,
                                        "isbank": 0,
                                        "isbase64": 1,
                                        "blob": "1192.CMlaKA....fQPMDZ....ArhLhIF.IH......A........................................P.aVMjLgLFA...O+fWarAhckI2bo8la8HRLt.iHfTlai8FYo41Y8HRUTYTK3HxO9.BOhUmXhwVYxYEU9vCTAIUPMARZj0iHi8FauImHfXWXrUWY8HBLt.iHu3COPEjTA0DHoQVOhPVYtMWZzkmHfXWXrUWY8HBNv3BLh7hO7.UPRETSfjFY8HhYkUFYhE1XqIBH1EFa0UVOh.iKvHxK9vCTAIUPMARZj0iHlkFazUlblIWYwIBH1EFa0UVOhHCLv.CLt.iHu3COPEjTA0DHoQVOhXVZrQWYxIWYy8lah.hcgwVck0iHw.iKvHxK9vCTAIUPMARZj0iHmIWXo41booWYh.hcgwVck0iHv3BLh7hO7.UPRETSfjFY8HxYxEVZtMGcgIGc1ElboEFco8lah.hcgwVck0iHv3BLh7hO7.UPRETSfjFY8HRZtcVXo4lHfXWXrUWY8HBLt.iHu3COPEjTA0DHoQVOhnVcyQmHfXWXrUWY8HBLt.iHu3COPEjTA0DHoQVOh71XzElckIBH1EFa0UVOh.iKvHxK9vCTAIUPMARZj0iHuMFcgYWY1ElboEFco8lah.hcgwVck0iHv3BLh7hO7.UPRETSfjFY8Hxa0Q2Ygklah.hcgwVck0iHv3BLh7hO7.UPRETSfjFY8HBbg4lcgIWZgQWZu4lHfXWXrUWY8HBLt.iHu3COPEjTA0DHoQVOh.WZzMFZkk1YnQmHfXWXrUWY8HBLt.iHu3COPEjTA0DHoQVOh.WZzMFZkwVY1Ulah.hcgwVck0iHv3BLh7hO7.UPRETSfjFY8HBboQ2XnYVZ1UlHfXWXrUWY8HBLt.iHu3COPEjTA0DHoQVOh.WZzMFZl8VcxIBH1EFa0UVOh.iKvHxK9vCTAIUPMARZj0iHvkFciglao4VYh.hcgwVck0iHv3BLh7hO7.UPRETSfjFY8HBboQ2Xn8lakIBH1EFa0UVOh.iKvHxK9vCTAIUPMARZj0iHvkFcig1bkYWYtIBH1EFa0UVOh.iKvHxK9vCTAIUPMARZj0iHvkFcig1bogmHfXWXrUWY8HBLt.iHu3COPEjTA0DHoQVOh.WZzMFZzUlah.hcgwVck0iHv3BLh7hO7.UPRETSfjFY8HBboQ2XnQGZxUVYh.hcgwVck0iHv3BLh7hO7.UPRETSfjFY8HBboQ2XnQ2cuIBH1EFa0UVOh.iKvHxK9vCTAIUPMARZj0iHvkFcigldkI2ah.hcgwVck0iHv3BLh7hO7.UPRETSfjFY8HhbkYWYxMWYmIWXo4lHfXWXrUWY8HRMv3BLh7hO7.UPRETSfjFY8HBco0VYh.hcgwVck0iHw.iKvHxK9vCTAIUPMARZj0iHzkVakw1aislHfXWXrUWY8HBLt.iHu3COPEjTA0DHoQVOhPWZsUlcgIWZgQWZu4lHfXWXrUWY8HRMv3BLh7hO7.UPRETSfjFY8HxckQGYxkmHfXWXrUWY8HRMv3BLh7hO77hX0IlXrUlbVQkO.."
                                    },
                                    "fileref": {
                                        "name": "kHs Distortion",
                                        "filename": "kHs Distortion.maxsnap",
                                        "filepath": "~/Dropbox/musicstuff/Max 9/Snapshots",
                                        "filepos": -1,
                                        "snapshotfileid": "8852f4de9ea2e806103a57cd3ad2cea2"
                                    }
                                }
                            ]
                        }
                    },
                    "text": "vst~",
                    "varname": "vst~",
                    "viewvisibility": 0
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "obj-102", 0 ],
                    "order": 15,
                    "source": [ "obj-1", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-111", 0 ],
                    "order": 2,
                    "source": [ "obj-1", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-117", 0 ],
                    "order": 5,
                    "source": [ "obj-1", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-123", 0 ],
                    "order": 8,
                    "source": [ "obj-1", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-131", 0 ],
                    "order": 11,
                    "source": [ "obj-1", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-18", 0 ],
                    "order": 0,
                    "source": [ "obj-1", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-2", 0 ],
                    "order": 1,
                    "source": [ "obj-1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-33", 0 ],
                    "order": 3,
                    "source": [ "obj-1", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-45", 0 ],
                    "order": 12,
                    "source": [ "obj-1", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-53", 0 ],
                    "order": 9,
                    "source": [ "obj-1", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-57", 0 ],
                    "order": 6,
                    "source": [ "obj-1", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-58", 0 ],
                    "order": 0,
                    "source": [ "obj-1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-59", 0 ],
                    "order": 0,
                    "source": [ "obj-1", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-68", 0 ],
                    "order": 1,
                    "source": [ "obj-1", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-7", 0 ],
                    "order": 14,
                    "source": [ "obj-1", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-74", 0 ],
                    "order": 4,
                    "source": [ "obj-1", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-80", 0 ],
                    "order": 7,
                    "source": [ "obj-1", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-87", 0 ],
                    "order": 1,
                    "source": [ "obj-1", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-90", 0 ],
                    "order": 10,
                    "source": [ "obj-1", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-96", 0 ],
                    "order": 13,
                    "source": [ "obj-1", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-13", 0 ],
                    "source": [ "obj-10", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-99", 0 ],
                    "source": [ "obj-100", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-100", 0 ],
                    "source": [ "obj-101", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-101", 0 ],
                    "source": [ "obj-102", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-122", 0 ],
                    "source": [ "obj-103", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-107", 0 ],
                    "source": [ "obj-104", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-116", 0 ],
                    "source": [ "obj-105", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-110", 0 ],
                    "source": [ "obj-106", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-108", 0 ],
                    "source": [ "obj-107", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 0 ],
                    "source": [ "obj-108", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-108", 0 ],
                    "source": [ "obj-109", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-12", 0 ],
                    "source": [ "obj-11", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-109", 0 ],
                    "source": [ "obj-110", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-110", 0 ],
                    "source": [ "obj-111", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-114", 0 ],
                    "source": [ "obj-112", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-112", 0 ],
                    "source": [ "obj-113", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 0 ],
                    "source": [ "obj-114", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-114", 0 ],
                    "source": [ "obj-115", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-115", 0 ],
                    "source": [ "obj-116", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-116", 0 ],
                    "source": [ "obj-117", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-120", 0 ],
                    "source": [ "obj-118", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-118", 0 ],
                    "source": [ "obj-119", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 0 ],
                    "source": [ "obj-12", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 0 ],
                    "source": [ "obj-120", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-120", 0 ],
                    "source": [ "obj-121", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-121", 0 ],
                    "source": [ "obj-122", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-122", 0 ],
                    "source": [ "obj-123", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 0 ],
                    "order": 0,
                    "source": [ "obj-124", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-133", 0 ],
                    "order": 1,
                    "source": [ "obj-124", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-127", 0 ],
                    "source": [ "obj-125", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-130", 0 ],
                    "source": [ "obj-126", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-128", 0 ],
                    "source": [ "obj-127", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 0 ],
                    "source": [ "obj-128", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-128", 0 ],
                    "source": [ "obj-129", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-15", 0 ],
                    "source": [ "obj-13", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-129", 0 ],
                    "source": [ "obj-130", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-130", 0 ],
                    "source": [ "obj-131", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-36", 0 ],
                    "source": [ "obj-133", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-12", 0 ],
                    "source": [ "obj-14", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 0 ],
                    "source": [ "obj-15", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-15", 0 ],
                    "source": [ "obj-16", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-16", 0 ],
                    "source": [ "obj-17", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-17", 0 ],
                    "source": [ "obj-18", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-23", 0 ],
                    "source": [ "obj-19", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 0 ],
                    "source": [ "obj-20", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 1 ],
                    "source": [ "obj-21", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-14", 0 ],
                    "source": [ "obj-22", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-25", 0 ],
                    "source": [ "obj-23", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-28", 0 ],
                    "order": 1,
                    "source": [ "obj-24", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-35", 0 ],
                    "order": 0,
                    "source": [ "obj-24", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 0 ],
                    "source": [ "obj-25", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-28", 0 ],
                    "order": 1,
                    "source": [ "obj-26", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-35", 0 ],
                    "order": 0,
                    "source": [ "obj-26", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-28", 0 ],
                    "order": 1,
                    "source": [ "obj-27", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-35", 0 ],
                    "order": 0,
                    "source": [ "obj-27", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-30", 0 ],
                    "source": [ "obj-28", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-25", 0 ],
                    "source": [ "obj-29", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 0 ],
                    "order": 16,
                    "source": [ "obj-3", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-103", 0 ],
                    "order": 8,
                    "source": [ "obj-3", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-105", 0 ],
                    "order": 5,
                    "source": [ "obj-3", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-106", 0 ],
                    "order": 2,
                    "source": [ "obj-3", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-126", 0 ],
                    "order": 11,
                    "source": [ "obj-3", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-4", 0 ],
                    "order": 6,
                    "source": [ "obj-3", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-5", 0 ],
                    "order": 3,
                    "source": [ "obj-3", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-54", 0 ],
                    "order": 9,
                    "source": [ "obj-3", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-55", 0 ],
                    "order": 12,
                    "source": [ "obj-3", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-56", 0 ],
                    "order": 14,
                    "source": [ "obj-3", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-6", 0 ],
                    "order": 0,
                    "source": [ "obj-3", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-60", 0 ],
                    "order": 7,
                    "source": [ "obj-3", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-61", 0 ],
                    "order": 4,
                    "source": [ "obj-3", 0 ]
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
                    "destination": [ "obj-81", 0 ],
                    "order": 15,
                    "source": [ "obj-3", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-82", 0 ],
                    "order": 13,
                    "source": [ "obj-3", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-83", 0 ],
                    "order": 10,
                    "source": [ "obj-3", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-31", 0 ],
                    "source": [ "obj-30", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-31", 0 ],
                    "source": [ "obj-30", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-31", 0 ],
                    "source": [ "obj-30", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-36", 0 ],
                    "source": [ "obj-31", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-29", 0 ],
                    "source": [ "obj-32", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-32", 0 ],
                    "source": [ "obj-33", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-39", 0 ],
                    "source": [ "obj-34", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-36", 0 ],
                    "source": [ "obj-35", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-37", 0 ],
                    "source": [ "obj-36", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 0 ],
                    "source": [ "obj-37", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-40", 0 ],
                    "source": [ "obj-38", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-43", 0 ],
                    "source": [ "obj-39", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-51", 0 ],
                    "source": [ "obj-4", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-41", 0 ],
                    "source": [ "obj-40", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 0 ],
                    "source": [ "obj-41", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-41", 0 ],
                    "source": [ "obj-42", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 0 ],
                    "source": [ "obj-43", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-42", 0 ],
                    "source": [ "obj-44", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-44", 0 ],
                    "source": [ "obj-45", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-48", 0 ],
                    "source": [ "obj-46", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-43", 0 ],
                    "source": [ "obj-47", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-49", 0 ],
                    "source": [ "obj-48", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 0 ],
                    "source": [ "obj-49", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-32", 0 ],
                    "source": [ "obj-5", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-49", 0 ],
                    "source": [ "obj-50", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-47", 0 ],
                    "source": [ "obj-51", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-50", 0 ],
                    "source": [ "obj-52", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-52", 0 ],
                    "source": [ "obj-53", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-52", 0 ],
                    "source": [ "obj-54", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-44", 0 ],
                    "source": [ "obj-55", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-8", 0 ],
                    "source": [ "obj-56", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-51", 0 ],
                    "source": [ "obj-57", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-17", 0 ],
                    "source": [ "obj-6", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-79", 0 ],
                    "source": [ "obj-60", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-73", 0 ],
                    "source": [ "obj-61", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-67", 0 ],
                    "source": [ "obj-62", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-64", 0 ],
                    "source": [ "obj-63", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-65", 0 ],
                    "source": [ "obj-64", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 0 ],
                    "source": [ "obj-65", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-65", 0 ],
                    "source": [ "obj-66", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-66", 0 ],
                    "source": [ "obj-67", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-67", 0 ],
                    "source": [ "obj-68", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-70", 0 ],
                    "source": [ "obj-69", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-8", 0 ],
                    "source": [ "obj-7", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-71", 0 ],
                    "source": [ "obj-70", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 0 ],
                    "source": [ "obj-71", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-71", 0 ],
                    "source": [ "obj-72", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-72", 0 ],
                    "source": [ "obj-73", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-73", 0 ],
                    "source": [ "obj-74", 0 ]
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
                    "destination": [ "obj-77", 0 ],
                    "source": [ "obj-76", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 0 ],
                    "source": [ "obj-77", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-77", 0 ],
                    "source": [ "obj-78", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-78", 0 ],
                    "source": [ "obj-79", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-11", 0 ],
                    "source": [ "obj-8", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-79", 0 ],
                    "source": [ "obj-80", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-101", 0 ],
                    "source": [ "obj-81", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-95", 0 ],
                    "source": [ "obj-82", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-89", 0 ],
                    "source": [ "obj-83", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-85", 0 ],
                    "source": [ "obj-84", 0 ]
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
                    "destination": [ "obj-1", 0 ],
                    "source": [ "obj-86", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-86", 0 ],
                    "source": [ "obj-88", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-88", 0 ],
                    "source": [ "obj-89", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-89", 0 ],
                    "source": [ "obj-90", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-92", 0 ],
                    "source": [ "obj-91", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-93", 0 ],
                    "source": [ "obj-92", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 0 ],
                    "source": [ "obj-93", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-93", 0 ],
                    "source": [ "obj-94", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-94", 0 ],
                    "source": [ "obj-95", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-95", 0 ],
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
                    "destination": [ "obj-99", 0 ],
                    "source": [ "obj-98", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 0 ],
                    "source": [ "obj-99", 0 ]
                }
            }
        ],
        "parameters": {
            "obj-1": [ "vst~", "vst~", 0 ],
            "obj-101": [ "umenu[12]", "umenu", 0 ],
            "obj-107": [ "number[12]", "number[2]", 0 ],
            "obj-110": [ "umenu[13]", "umenu[2]", 0 ],
            "obj-112": [ "number[13]", "number[1]", 0 ],
            "obj-116": [ "umenu[14]", "umenu[1]", 0 ],
            "obj-118": [ "number[15]", "number", 0 ],
            "obj-122": [ "umenu[15]", "umenu", 0 ],
            "obj-127": [ "number[14]", "number[2]", 0 ],
            "obj-13": [ "number[3]", "number[2]", 0 ],
            "obj-130": [ "umenu[16]", "umenu[2]", 0 ],
            "obj-14": [ "number", "number", 0 ],
            "obj-17": [ "umenu[4]", "umenu[2]", 0 ],
            "obj-23": [ "number[4]", "number[1]", 0 ],
            "obj-32": [ "umenu[5]", "umenu[1]", 0 ],
            "obj-36": [ "umenu[3]", "umenu[3]", 0 ],
            "obj-39": [ "number[5]", "number", 0 ],
            "obj-40": [ "number[1]", "number[1]", 0 ],
            "obj-44": [ "umenu[1]", "umenu[1]", 0 ],
            "obj-48": [ "number[2]", "number[2]", 0 ],
            "obj-51": [ "umenu[6]", "umenu", 0 ],
            "obj-52": [ "umenu[2]", "umenu[2]", 0 ],
            "obj-64": [ "number[6]", "number[2]", 0 ],
            "obj-67": [ "umenu[7]", "umenu[2]", 0 ],
            "obj-70": [ "number[7]", "number[1]", 0 ],
            "obj-73": [ "umenu[8]", "umenu[1]", 0 ],
            "obj-76": [ "number[8]", "number", 0 ],
            "obj-79": [ "umenu[9]", "umenu", 0 ],
            "obj-8": [ "umenu", "umenu", 0 ],
            "obj-85": [ "number[9]", "number[2]", 0 ],
            "obj-89": [ "umenu[10]", "umenu[2]", 0 ],
            "obj-92": [ "number[10]", "number[1]", 0 ],
            "obj-95": [ "umenu[11]", "umenu[1]", 0 ],
            "obj-98": [ "number[11]", "number", 0 ],
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