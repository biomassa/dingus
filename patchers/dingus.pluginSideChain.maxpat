{
    "patcher": {
        "fileversion": 1,
        "appversion": {
            "major": 9,
            "minor": 1,
            "revision": 4,
            "architecture": "x64",
            "modernui": 1
        },
        "classnamespace": "box",
        "rect": [ 59.0, 111.0, 1000.0, 780.0 ],
        "openinpresentation": 1,
        "boxes": [
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
                    "id": "obj-4",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 455.2000067830086, 213.60000318288803, 49.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 0.800000011920929, 83.0, 149.60000145435333, 22.0 ],
                    "text": "params"
                }
            },
            {
                "box": {
                    "id": "obj-39",
                    "maxclass": "meter~",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "patching_rect": [ 130.5, 259.0, 81.0, 12.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 0.9000000059604645, 122.0, 149.40000146627426, 13.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-43",
                    "maxclass": "meter~",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "patching_rect": [ 131.5, 244.0, 80.0, 13.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1.9000000059604645, 107.0, 149.40000146627426, 13.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-33",
                    "maxclass": "meter~",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "patching_rect": [ 131.0, 201.0, 81.0, 12.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 0.9000000059604645, 66.0, 149.40000146627426, 13.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-34",
                    "maxclass": "meter~",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "patching_rect": [ 132.0, 186.0, 80.0, 13.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1.9000000059604645, 51.0, 149.40000146627426, 13.0 ]
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
                    "presentation_rect": [ 0.9000000059604645, 279.0, 149.40000146627426, 13.0 ]
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
                    "presentation_rect": [ 0.9000000059604645, 264.0, 149.40000146627426, 13.0 ]
                }
            },
            {
                "box": {
                    "comment": "SideChain IN R",
                    "id": "obj-15",
                    "index": 0,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 361.20000475645065, 107.20000159740448, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "comment": "SideChain IN L",
                    "id": "obj-16",
                    "index": 0,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 319.20000475645065, 107.20000159740448, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-13",
                    "maxclass": "newobj",
                    "numinlets": 4,
                    "numoutlets": 1,
                    "outlettype": [ "multichannelsignal" ],
                    "patching_rect": [ 284.0, 171.0, 70.0, 22.0 ],
                    "text": "mc.pack~ 4",
                    "textcolor": [ 1.0, 0.529411764705882, 0.666666666666667, 1.0 ]
                }
            },
            {
                "box": {
                    "fontsize": 13.0,
                    "id": "obj-10",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "signal", "signal" ],
                    "patching_rect": [ 319.20000475645065, 415.0, 90.0, 23.0 ],
                    "text": "mc.unpack~ 2",
                    "textcolor": [ 1.0, 0.529411764705882, 0.666666666666667, 1.0 ]
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
                    "patching_rect": [ 390.20000475645065, 469.6000069975853, 30.0, 30.0 ]
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
                    "presentation_rect": [ 99.90000000596046, 239.0, 50.40000146627426, 22.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "number[5]",
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
                    "items": [ "Enabled", ",", "Threshold", ",", "Range", ",", "Stereo", ",", "Mode", ",", "Attack", ",", "Hold", ",", "Release", ",", "Mix" ],
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 995.2000148296356, 420.0000062584877, 100.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 0.9000000059604645, 239.0, 97.60000145435333, 22.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "Enabled", "Threshold", "Range", "Stereo", "Mode", "Attack", "Hold", "Release", "Mix" ],
                            "parameter_longname": "umenu[7]",
                            "parameter_mmax": 8,
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
                    "presentation_rect": [ 99.90000000596046, 213.0, 50.0, 22.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "number[6]",
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
                    "items": [ "Enabled", ",", "Threshold", ",", "Range", ",", "Stereo", ",", "Mode", ",", "Attack", ",", "Hold", ",", "Release", ",", "Mix" ],
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 792.8000118136406, 420.0000062584877, 100.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 0.9000000059604645, 213.0, 97.60000145435333, 22.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "Enabled", "Threshold", "Range", "Stereo", "Mode", "Attack", "Hold", "Release", "Mix" ],
                            "parameter_longname": "umenu[5]",
                            "parameter_mmax": 8,
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
                            "parameter_enum": [ "++bubbler", "++chebyshev", "++compand", "++decimate", "++delay", "++flipper", "++matrix", "++phasor", "++pitchdelay", "Aalto", "Aaltoverb 2", "Airwindows Consolidated", "Amalgame", "Antagone", "Articulate", "AUAudioFilePlayer", "AUBandpass", "AUDelay", "AUDistortion", "Audulus 4 FX", "Audulus 4", "AUDynamicsProcessor", "AUFilter", "AUGraphicEQ", "AUHighShelfFilter", "AUHipass", "AULowpass", "AULowShelfFilter", "AUMatrixReverb", "AUMIDISynth", "AUMultibandCompressor", "AUNBandEQ", "AUNetReceive", "AUNetSend", "AUNewPitch", "AUParametricEQ", "AUPeakLimiter", "AUPitch", "AUReverb2", "AURogerBeep", "AURoundTripAAC", "AUSampleDelay", "AUSampler", "AUScheduledSoundPlayer", "AUSoundFieldPanner", "AUSoundIsolation", "AUSpeechSynthesis", "AUSphericalHeadPanner", "AUVectorPanner", "Blackhole (No MIDI)", "Blackhole Immersive", "Blackhole", "bx_clipper", "Cardinal FX", "Cardinal Synth", "Cruelle", "CrushStation", "Crystals", "DeBoom", "Digitakt II", "DLSMusicDevice", "EChannel", "EchoBoy Jr", "Ephemere", "EQ45", "EQ65", "Equator2", "Generate", "GorgonV2", "GRM Tools Atelier", "H3000 Band Delays Mk II", "H3000 Factory Mk II", "H910 Dual Harmonizer", "H910 Harmonizer", "H949 Dual Harmonizer", "H949 Harmonizer", "HRTFPanner", "Incipit", "Initial Clipper 2", "Instant Flanger Mk II", "Instant Phaser Mk II", "Interstice", "Invigorate", "Kaivo", "kHs 3-Band EQ", "kHs Bitcrush", "kHs Channel Mixer", "kHs Chorus", "kHs Clipper", "kHs Comb Filter", "kHs Compactor", "kHs Compressor", "kHs Delay", "kHs Distortion", "kHs Dual Delay", "kHs Dynamics", "kHs Ensemble", "kHs Filter", "kHs Flanger", "kHs Formant Filter", "kHs Frequency Shifter", "kHs Gain", "kHs Gate", "kHs Haas", "kHs Ladder Filter", "kHs Limiter", "kHs Nonlinear Filter", "kHs Phase Distortion", "kHs Phaser", "kHs Pitch Shifter", "kHs Resonator", "kHs Reverb", "kHs Reverser", "kHs Ring Mod", "kHs Shaper", "kHs Stereo", "kHs Tape Stop", "kHs Trance Gate", "kHs Transient Shaper", "Lancinantes", "Litote", "Little MicroShift", "Little PrimalTap", "Little Radiator", "MangledVerb", "MAP", "Micro", "MicroPitch Immersive", "MicroPitch", "Newfangled Elevate", "Newfangled EQuivocate", "Newfangled Punctuate", "Newfangled Saturate", "NightSky", "Octavox (No MIDI)", "Octavox", "Omnipressor", "One", "Pam Sync", "Physion Mk II", "Pigments", "plugdata-fx", "plugdata", "Precision Time Align", "Pro-C 2", "Pro-C 3", "Pro-DS", "Pro-G", "Pro-L 2", "Pro-L", "Pro-MB", "Pro-Q 2", "Pro-Q 3", "Pro-Q 4", "Pro-R 2", "Pro-R", "PSP stereoAnalyser2", "Quadravox", "Recirculate", "Regressif", "Rotary Mod", "Ruina", "RX 11 Breath Control", "RX 11 Connect", "RX 11 De-click", "RX 11 De-clip", "RX 11 De-crackle", "RX 11 De-ess", "RX 11 De-hum", "RX 11 De-plosive", "RX 11 De-reverb", "RX 11 Dialogue Isolate", "RX 11 Guitar De-noise", "RX 11 Monitor", "RX 11 Mouth De-click", "RX 11 Music Rebalance", "RX 11 Repair Assistant", "RX 11 Spectral De-noise", "RX 11 Spectral Editor", "RX 11 Voice De-noise", "Saturn 2", "Saturn", "Sheen Machine", "ShimmerVerb", "Simplon", "Sinc Vereor", "Skew v2", "smartComp3", "smartEQ4", "soothe2", "SP2016 Reverb", "SpaceBlender", "spiff", "SplitEQ", "Spring", "Sumu", "Timeless 2", "Timeless 3", "TriceraChorus", "Tverb", "Twin 2", "Twin 3", "UltraChannel", "UltraReverb", "UltraTap", "Undulator", "UnFairchild", "ValhallaDelay", "ValhallaFreqEcho", "ValhallaFutureVerb", "ValhallaPlate", "ValhallaRoom", "ValhallaShimmer", "ValhallaSpaceModulator", "ValhallaSupermassive", "ValhallaUberMod", "ValhallaVintageVerb", "Virt Vereor", "Virta", "Volcano 2 (Mono)", "Volcano 2", "Volcano 3", "Youlean Loudness Meter 2", "Zen Delay Virtual" ],
                            "parameter_invisible": 3,
                            "parameter_longname": "umenu[8]",
                            "parameter_mmax": 223,
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
                    "patching_rect": [ 284.0, 107.20000159740448, 30.0, 30.0 ]
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
                    "patching_rect": [ 242.0, 107.20000159740448, 30.0, 30.0 ]
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
                    "presentation_rect": [ 99.90000000596046, 188.0, 50.0, 22.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "number[20]",
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
                    "patching_rect": [ 105.60000157356262, 76.00000113248825, 56.0, 22.0 ],
                    "restore": {
                        "number": [ 0.0 ],
                        "number[1]": [ 0.0 ],
                        "number[2]": [ 0.0 ],
                        "umenu": [ 1 ],
                        "umenu[1]": [ 2 ],
                        "umenu[2]": [ 7 ],
                        "umenu[3]": [ 0 ],
                        "vst~": [
                            {
                                "filetype": "C74Snapshot",
                                "version": 2,
                                "minorversion": 0,
                                "name": "kHs Compactor",
                                "origin": "kHs Compactor.vstinfo",
                                "type": "VST",
                                "subtype": "AudioEffect",
                                "embed": 1,
                                "snapshot": {
                                    "pluginname": "kHs Compactor.vstinfo",
                                    "plugindisplayname": "kHs Compactor",
                                    "pluginsavedname": "",
                                    "pluginsaveduniqueid": 0,
                                    "version": 1,
                                    "isbank": 0,
                                    "isbase64": 1,
                                    "blob": "618.CMlaKA....fQPMDZ....Ar1biMFPBP.A....A........................................HfKPsz.DPA.Hf.B.TvtbxE...............fB....yQWXzUlKpM2at091M4zvv.QAfW2bJPVrDgRQvFtCHN.HT0zjIsV0wNxdbEnpd2w1IoME3H71Do7lexWRV6SUqT8tV1nd8tSUqVotW9dfS2nZb8CTi37pGx4sbGEMRXpuEMdoxCkbitgsAdiw0bHWtiLAdpFaosFtMGK9HqRgmKaemwsM02eW9bgw4SRiFRzNat0OxYqJCrbjqMMNUplP9crj2944neSYNuI5OVVS8kHp2EsxsYAWz2vkMVRl1Kv.L.Cv.L.Cv.L.Cv.L.Cv.L.Cv.L.Cv.L.Cv.L.Cv.L.Cv.L.Cv.L.Cv.L.Cv.L.Cv.L.Cv.L.Cv.L.Cv.L.Cv.L.y+hIe8yRUkM1+1MmWtzbUyG3tftka1SZad1R65BBqyNeX8rTeQv6ccSIWd2z1gnrIXbx0Mx1ia7rgovB2kz8NS6hnd8W46VesARDZ7vBV+Xc8KiEBB6Y2x4bskMOvzgwDOY2s7gI68b3xSKsp0IdYcpgTgwu7UKdylqdj8g7+ooxg1hkmddbqcNeOIKHOXh6Je3TqqqqmWROKz7Fnnr24ycP9.a02IdmVBGz4lqNW8C.TKc.BE0F3ugZ...fc4...PsT.B...T..BHf..ErKmbUTaf+FpA...1kC..n.......................LGcgQWYtn1bu4FTKUfA.....D..A..N....fG......"
                                }
                            }
                        ]
                    },
                    "text": "autopattr",
                    "varname": "u753006994"
                }
            },
            {
                "box": {
                    "id": "obj-8",
                    "items": [ "Enabled", ",", "Threshold", ",", "Range", ",", "Stereo", ",", "Mode", ",", "Attack", ",", "Hold", ",", "Release", ",", "Mix" ],
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 578.4000086188316, 420.0000062584877, 100.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 0.9000000059604645, 188.0, 97.60000145435333, 22.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "Enabled", "Threshold", "Range", "Stereo", "Mode", "Attack", "Hold", "Release", "Mix" ],
                            "parameter_longname": "umenu[6]",
                            "parameter_mmax": 8,
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
                    "id": "obj-3",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 455.2000067830086, 213.60000318288803, 49.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 0.9000000059604645, 164.0, 149.60000145435333, 22.0 ],
                    "text": "params"
                }
            },
            {
                "box": {
                    "autosave": 1,
                    "bgmode": 0,
                    "border": 0,
                    "clickthrough": 0,
                    "color": [ 0.6941176470588235, 0.13333333333333333, 0.13333333333333333, 1.0 ],
                    "enablehscroll": 0,
                    "enablevscroll": 0,
                    "id": "obj-1",
                    "lockeddragscroll": 0,
                    "lockedsize": 0,
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 7,
                    "offset": [ 0.0, 0.0 ],
                    "outlettype": [ "multichannelsignal", "", "list", "int", "", "", "" ],
                    "patching_rect": [ 386.4000057578087, 306.4000045657158, 82.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 0.9000000059604645, 140.0, 149.60000145435333, 22.0 ],
                    "save": [ "#N", "mcs.vst~", "loaduniqueid", 0, 4, 2, ";" ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_invisible": 1,
                            "parameter_longname": "vst~[2]",
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
                        "origin": "mcs.vst~",
                        "type": "list",
                        "subtype": "Undefined",
                        "embed": 1,
                        "snapshot": {
                            "pluginname": "kHs Compactor.vstinfo",
                            "plugindisplayname": "kHs Compactor",
                            "pluginsavedname": "",
                            "pluginsaveduniqueid": 0,
                            "version": 1,
                            "isbank": 0,
                            "isbase64": 1,
                            "blob": "618.CMlaKA....fQPMDZ....Ar1biMFPBP.A....A........................................HfKPsz.DPA.Hf.B.TvtbxE...............fB....yQWXzUlKpM2at091M4zvv.QAfW2bJPVrDgRQvFtCHN.HT0zjIsV0wNxdbEnpd2w1IoME3H71Do7lexWRV6SUqT8tV1nd8tSUqVotW9dfS2nZb8CTi37pGx4sbGEMRXpuEMdoxCkbitgsAdiw0bHWtiLAdpFaosFtMGK9HqRgmKaemwsM02eW9bgw4SRiFRzNat0OxYqJCrbjqMMNUplP9crj2944neSYNuI5OVVS8kHp2EsxsYAWz2vkMVRl1Kv.L.Cv.L.Cv.L.Cv.L.Cv.L.Cv.L.Cv.L.Cv.L.Cv.L.Cv.L.Cv.L.Cv.L.Cv.L.Cv.L.Cv.L.Cv.L.Cv.L.Cv.L.y+hIe8yRUkM1+1MmWtzbUyG3tftka1SZad1R65BBqyNeX8rTeQv6ccSIWd2z1gnrIXbx0Mx1ia7rgovB2kz8NS6hnd8W46VesARDZ7vBV+Xc8KiEBB6Y2x4bskMOvzgwDOY2s7gI68b3xSKsp0IdYcpgTgwu7UKdylqdj8g7+ooxg1hkmddbqcNeOIKHOXh6Je3TqqqqmWROKz7Fnnr24ycP9.a02IdmVBGz4lqNW8C.TKc.BE0F3ugZ...fc4...PsT.B...T..BHf..ErKmbUTaf+FpA...1kC..n.......................LGcgQWYtn1bu4FTKUfA.....D..A..N....fG......"
                        },
                        "snapshotlist": {
                            "current_snapshot": 0,
                            "entries": [
                                {
                                    "filetype": "C74Snapshot",
                                    "version": 2,
                                    "minorversion": 0,
                                    "name": "kHs Compactor",
                                    "origin": "kHs Compactor.vstinfo",
                                    "type": "VST",
                                    "subtype": "AudioEffect",
                                    "embed": 1,
                                    "snapshot": {
                                        "pluginname": "kHs Compactor.vstinfo",
                                        "plugindisplayname": "kHs Compactor",
                                        "pluginsavedname": "",
                                        "pluginsaveduniqueid": 0,
                                        "version": 1,
                                        "isbank": 0,
                                        "isbase64": 1,
                                        "blob": "618.CMlaKA....fQPMDZ....Ar1biMFPBP.A....A........................................HfKPsz.DPA.Hf.B.TvtbxE...............fB....yQWXzUlKpM2at091M4zvv.QAfW2bJPVrDgRQvFtCHN.HT0zjIsV0wNxdbEnpd2w1IoME3H71Do7lexWRV6SUqT8tV1nd8tSUqVotW9dfS2nZb8CTi37pGx4sbGEMRXpuEMdoxCkbitgsAdiw0bHWtiLAdpFaosFtMGK9HqRgmKaemwsM02eW9bgw4SRiFRzNat0OxYqJCrbjqMMNUplP9crj2944neSYNuI5OVVS8kHp2EsxsYAWz2vkMVRl1Kv.L.Cv.L.Cv.L.Cv.L.Cv.L.Cv.L.Cv.L.Cv.L.Cv.L.Cv.L.Cv.L.Cv.L.Cv.L.Cv.L.Cv.L.Cv.L.Cv.L.Cv.L.y+hIe8yRUkM1+1MmWtzbUyG3tftka1SZad1R65BBqyNeX8rTeQv6ccSIWd2z1gnrIXbx0Mx1ia7rgovB2kz8NS6hnd8W46VesARDZ7vBV+Xc8KiEBB6Y2x4bskMOvzgwDOY2s7gI68b3xSKsp0IdYcpgTgwu7UKdylqdj8g7+ooxg1hkmddbqcNeOIKHOXh6Je3TqqqqmWROKz7Fnnr24ycP9.a02IdmVBGz4lqNW8C.TKc.BE0F3ugZ...fc4...PsT.B...T..BHf..ErKmbUTaf+FpA...1kC..n.......................LGcgQWYtn1bu4FTKUfA.....D..A..N....fG......"
                                    },
                                    "fileref": {
                                        "name": "kHs Compactor",
                                        "filename": "kHs Compactor.maxsnap",
                                        "filepath": "~/Dropbox/musicstuff/Max 9/Snapshots",
                                        "filepos": -1,
                                        "snapshotfileid": "a1c99f1de4b6fd5c8772e6f133946bd4"
                                    }
                                }
                            ]
                        }
                    },
                    "text": "mcs.vst~ 4 2",
                    "varname": "vst~",
                    "viewvisibility": 0
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "obj-10", 0 ],
                    "source": [ "obj-1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-45", 0 ],
                    "order": 1,
                    "source": [ "obj-1", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-53", 0 ],
                    "order": 0,
                    "source": [ "obj-1", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-7", 0 ],
                    "order": 2,
                    "source": [ "obj-1", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-2", 0 ],
                    "order": 1,
                    "source": [ "obj-10", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-58", 0 ],
                    "order": 0,
                    "source": [ "obj-10", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-59", 0 ],
                    "order": 0,
                    "source": [ "obj-10", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-87", 0 ],
                    "order": 1,
                    "source": [ "obj-10", 1 ]
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
                    "destination": [ "obj-1", 0 ],
                    "source": [ "obj-13", 0 ]
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
                    "destination": [ "obj-13", 3 ],
                    "order": 0,
                    "source": [ "obj-15", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-39", 0 ],
                    "order": 1,
                    "source": [ "obj-15", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-13", 2 ],
                    "order": 0,
                    "source": [ "obj-16", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-43", 0 ],
                    "order": 1,
                    "source": [ "obj-16", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-13", 0 ],
                    "order": 0,
                    "source": [ "obj-20", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-34", 0 ],
                    "order": 1,
                    "source": [ "obj-20", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-13", 1 ],
                    "order": 0,
                    "source": [ "obj-21", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-33", 0 ],
                    "order": 1,
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
            "obj-1": [ "vst~[2]", "vst~", 0 ],
            "obj-14": [ "number[20]", "number", 0 ],
            "obj-36": [ "umenu[8]", "umenu[3]", 0 ],
            "obj-40": [ "number[6]", "number[1]", 0 ],
            "obj-44": [ "umenu[5]", "umenu[1]", 0 ],
            "obj-48": [ "number[5]", "number[2]", 0 ],
            "obj-52": [ "umenu[7]", "umenu[2]", 0 ],
            "obj-8": [ "umenu[6]", "umenu", 0 ],
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