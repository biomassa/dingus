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
        "rect": [ 1176.0, 161.0, 737.0, 780.0 ],
        "openinpresentation": 1,
        "integercoordinates": 1,
        "boxes": [
            {
                "box": {
                    "id": "obj-6",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1122.0, 307.0, 35.0, 22.0 ],
                    "text": "clear"
                }
            },
            {
                "box": {
                    "fontsize": 12.0,
                    "id": "obj-5",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 277.0, 268.0, 45.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 105.0, 49.0, 45.0, 22.0 ],
                    "text": "unplug",
                    "textcolor": [ 0.9803921568627451, 0.33725490196078434, 0.2627450980392157, 1.0 ]
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
                    "presentation_rect": [ 1.0, 188.0, 149.40000146627426, 13.0 ]
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
                    "presentation_rect": [ 1.0, 173.0, 149.40000146627426, 13.0 ]
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
                    "presentation_rect": [ 100.00000298023224, 148.00000220537186, 50.00000149011612, 22.0 ],
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
                    "presentation_rect": [ 0.800000011920929, 148.00000220537186, 97.60000145435333, 22.0 ],
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
                    "presentation_rect": [ 100.40000146627426, 122.40000182390213, 50.0, 22.0 ],
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
                    "presentation_rect": [ 0.800000011920929, 122.40000182390213, 97.60000145435333, 22.0 ],
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
                    "patching_rect": [ 1172.8000174760818, 475.2000070810318, 79.0, 22.0 ],
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
                    "patching_rect": [ 1172.8000174760818, 428.000006377697, 100.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 0.800000011920929, 24.0, 149.60000145435333, 22.0 ],
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
                    "patching_rect": [ 1552.0000231266022, 323.2000048160553, 35.0, 22.0 ],
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
                    "patching_rect": [ 1172.8000174760818, 380.00000566244125, 96.0, 22.0 ],
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
                    "patching_rect": [ 1172.8000174760818, 323.2000048160553, 366.40000545978546, 22.0 ],
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
                    "patching_rect": [ 1172.8000174760818, 264.8000039458275, 49.0, 22.0 ],
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
                    "patching_rect": [ 1291.2000192403793, 202.40000301599503, 45.0, 22.0 ],
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
                    "patching_rect": [ 1232.0000183582306, 202.40000301599503, 38.0, 22.0 ],
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
                    "patching_rect": [ 1172.8000174760818, 202.40000301599503, 37.0, 22.0 ],
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
                    "presentation_rect": [ 100.40000146627426, 96.8000014424324, 50.0, 22.0 ],
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
                        "number[1]": [ 0.0 ],
                        "number[2]": [ 0.0 ],
                        "umenu": [ 0 ],
                        "umenu[1]": [ 0 ],
                        "umenu[2]": [ 0 ],
                        "umenu[3]": [ 0 ],
                        "vst~": [
                            {
                                "filetype": "C74Snapshot",
                                "version": 2,
                                "minorversion": 0,
                                "name": "",
                                "origin": "",
                                "type": "VST",
                                "subtype": "AudioEffect",
                                "embed": 1,
                                "snapshot": {                                }
                            }
                        ]
                    },
                    "restore_extra": {
                        "number": {
                            "id": "obj-14"
                        },
                        "number[1]": {
                            "id": "obj-40"
                        },
                        "number[2]": {
                            "id": "obj-48"
                        },
                        "umenu": {
                            "id": "obj-8"
                        },
                        "umenu[1]": {
                            "id": "obj-44"
                        },
                        "umenu[2]": {
                            "id": "obj-52"
                        },
                        "umenu[3]": {
                            "id": "obj-36"
                        },
                        "vst~": {
                            "id": "obj-1"
                        }
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
                    "presentation_rect": [ 0.800000011920929, 96.8000014424324, 97.60000145435333, 22.0 ],
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
                    "patching_rect": [ 455.2000067830086, 213.60000318288803, 49.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 0.800000011920929, 72.80000108480453, 149.60000145435333, 22.0 ],
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
                    "patching_rect": [ 386.4000057578087, 306.4000045657158, 92.5, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 0.800000011920929, 48.800000727176666, 149.60000145435333, 22.0 ],
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
                        "snapshot": {                        },
                        "snapshotlist": {
                            "current_snapshot": 0,
                            "entries": [
                                {
                                    "filetype": "C74Snapshot",
                                    "version": 2,
                                    "minorversion": 0,
                                    "name": "kHs Distortion",
                                    "origin": "",
                                    "type": "VST",
                                    "subtype": "AudioEffect",
                                    "embed": 1,
                                    "snapshot": {                                    },
                                    "fileref": {
                                        "name": "kHs Distortion",
                                        "filename": "kHs Distortion.maxsnap",
                                        "filepath": "~/Dropbox/musicstuff/Max 9/Snapshots",
                                        "filepos": -1,
                                        "snapshotfileid": "c86278bdfc23814f047edb3dfc378a0f"
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
                    "destination": [ "obj-2", 0 ],
                    "order": 1,
                    "source": [ "obj-1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-45", 0 ],
                    "order": 1,
                    "source": [ "obj-1", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-53", 0 ],
                    "order": 0,
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
                    "destination": [ "obj-7", 0 ],
                    "order": 2,
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
                    "destination": [ "obj-12", 0 ],
                    "source": [ "obj-11", 0 ]
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
                    "destination": [ "obj-12", 0 ],
                    "source": [ "obj-14", 0 ]
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
                    "destination": [ "obj-1", 0 ],
                    "order": 3,
                    "source": [ "obj-3", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-54", 0 ],
                    "order": 0,
                    "source": [ "obj-3", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-55", 0 ],
                    "order": 1,
                    "source": [ "obj-3", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-56", 0 ],
                    "order": 2,
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
                    "destination": [ "obj-1", 0 ],
                    "order": 4,
                    "source": [ "obj-5", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-54", 0 ],
                    "order": 1,
                    "source": [ "obj-5", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-55", 0 ],
                    "order": 2,
                    "source": [ "obj-5", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-56", 0 ],
                    "order": 3,
                    "source": [ "obj-5", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-6", 0 ],
                    "order": 0,
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
                    "destination": [ "obj-36", 0 ],
                    "source": [ "obj-6", 0 ]
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
                    "destination": [ "obj-11", 0 ],
                    "source": [ "obj-8", 1 ]
                }
            }
        ],
        "parameters": {
            "obj-1": [ "vst~", "vst~", 0 ],
            "obj-14": [ "number", "number", 0 ],
            "obj-36": [ "umenu[3]", "umenu[3]", 0 ],
            "obj-40": [ "number[1]", "number[1]", 0 ],
            "obj-44": [ "umenu[1]", "umenu[1]", 0 ],
            "obj-48": [ "number[2]", "number[2]", 0 ],
            "obj-52": [ "umenu[2]", "umenu[2]", 0 ],
            "obj-8": [ "umenu", "umenu", 0 ],
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