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
        "rect": [ 34.0, 92.0, 2236.0, 1170.0 ],
        "openinpresentation": 1,
        "integercoordinates": 1,
        "boxes": [
            {
                "box": {
                    "id": "obj-13",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 200.0, 590.0, 70.0, 22.0 ],
                    "text": "loadmess 1",
                    "varname": "pg_snapon"
                }
            },
            {
                "box": {
                    "id": "obj-12",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 40.0, 620.0, 24.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 107.0, 331.0, 24.0, 24.0 ],
                    "varname": "snap"
                }
            },
            {
                "box": {
                    "id": "obj-10",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 580.0, 830.0, 100.0, 22.0 ],
                    "text": "route low",
                    "varname": "pg_routelow"
                }
            },
            {
                "box": {
                    "id": "obj-7",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 330.0, 80.0, 150.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 2.0, 32.0, 38.0, 20.0 ],
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
                    "patching_rect": [ 280.0, 30.0, 100.0, 22.0 ],
                    "text": "loadmess 4",
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
                    "patching_rect": [ 280.0, 110.0, 100.0, 22.0 ],
                    "text": "prepend beat",
                    "varname": "pg_pbeat"
                }
            },
            {
                "box": {
                    "id": "obj-3",
                    "maxclass": "number",
                    "maximum": 16,
                    "minimum": 1,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 280.0, 80.0, 50.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 40.0, 32.0, 38.0, 22.0 ],
                    "varname": "beat"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "obj-16",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1225.0, 26.0, 183.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1129.0, 5.0, 41.0, 24.0 ],
                    "text": "env",
                    "textcolor": [ 0.9058823529411765, 0.7450980392156863, 0.12941176470588237, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-9",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "clearall" ],
                    "patching_rect": [ 386.0, 146.0, 100.0, 22.0 ],
                    "text": "t clearall",
                    "varname": "cleart"
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
                    "presentation_rect": [ 957.0, 5.0, 80.0, 22.0 ],
                    "text": "clear all",
                    "textoncolor": [ 1.0, 0.34509803921568627, 0.34509803921568627, 1.0 ],
                    "varname": "clearbtn"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "obj-2",
                    "linecount": 13,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1700.0, 950.0, 420.0, 239.0 ],
                    "presentation": 1,
                    "presentation_linecount": 13,
                    "presentation_rect": [ 957.0, 302.0, 356.0, 239.0 ],
                    "text": "click = new note, drag right = length\ndrag end = resize (alt = free)\ndrag note = move in time and pitch\noption-drag = copy\ndouble-click = delete\nclick row label = scale degree on/off\nLANES\nclick / drag = value, shift-drag = fine\nCHANCE\n+ CHANCE = add lane, x on label = remove\nclick cell = op menu\ndrag = PROB, alt-drag = amount\nshift-click = next PTN, shift-alt-click = previous",
                    "varname": "hints"
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
                    "presentation_rect": [ 2.0, 0.0, 50.0, 27.0 ],
                    "text": "uPG"
                }
            },
            {
                "box": {
                    "id": "use",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 100.0, 14.0, 420.0, 20.0 ],
                    "text": "USE [bpatcher dingus.pitchGateSeq.maxpat @args NAME]"
                }
            },
            {
                "box": {
                    "id": "mcp",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 550.0, 13.0, 100.0, 22.0 ],
                    "saved_object_attributes": {
                        "alias": "",
                        "group": ""
                    },
                    "text": "maxmcp uPG"
                }
            },
            {
                "box": {
                    "embed": 0,
                    "filename": "dingus.pgRoll.js",
                    "id": "roll",
                    "maxclass": "v8ui",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 386.0, 280.0, 770.0, 622.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 177.0, 23.0, 770.0, 622.0 ],
                    "textfile": {
                        "filename": "dingus.pgRoll.js",
                        "flags": 0,
                        "embed": 0,
                        "autowatch": 1
                    },
                    "varname": "pgroll"
                }
            },
            {
                "box": {
                    "id": "buf",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "float", "bang" ],
                    "patching_rect": [ 40.0, 560.0, 140.0, 22.0 ],
                    "text": "buffer~ #0-pg @samps 4352 @chans 22"
                }
            },
            {
                "box": {
                    "id": "rt",
                    "maxclass": "newobj",
                    "numinlets": 4,
                    "numoutlets": 4,
                    "outlettype": [ "", "", "", "" ],
                    "patching_rect": [ 400.0, 830.0, 162.0, 22.0 ],
                    "text": "route needbuffer range lanes"
                }
            },
            {
                "box": {
                    "id": "bufm",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 400.0, 200.0, 200.0, 22.0 ],
                    "text": "buffer #0-pg, chbuffer #0-pgch, seqname #1"
                }
            },
            {
                "box": {
                    "id": "lb",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 400.0, 160.0, 60.0, 22.0 ],
                    "text": "loadbang"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "stc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 40.0, 60.0, 51.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 81.0, 2.0, 51.0, 24.0 ],
                    "text": "steps",
                    "textcolor": [ 0.8901960784313725, 0.6352941176470588, 0.3764705882352941, 1.0 ]
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "steps",
                    "maxclass": "number",
                    "maximum": 64,
                    "minimum": 1,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 40.0, 80.0, 58.0, 26.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 120.0, 1.0, 53.0, 26.0 ],
                    "textcolor": [ 0.8901960784313725, 0.6352941176470588, 0.3764705882352941, 1.0 ],
                    "varname": "steps"
                }
            },
            {
                "box": {
                    "id": "stp",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 40.0, 110.0, 90.0, 22.0 ],
                    "text": "prepend steps"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "loc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 150.0, 60.0, 49.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 81.0, 32.0, 49.0, 24.0 ],
                    "text": "low",
                    "textcolor": [ 0.8901960784313725, 0.6352941176470588, 0.3764705882352941, 1.0 ]
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "low",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 150.0, 80.0, 57.0, 26.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 121.0, 32.0, 51.0, 26.0 ],
                    "textcolor": [ 0.8901960784313725, 0.6352941176470588, 0.3764705882352941, 1.0 ],
                    "varname": "low"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "rgc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 210.0, 60.0, 51.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 81.0, 57.0, 51.0, 24.0 ],
                    "text": "range",
                    "textcolor": [ 0.8901960784313725, 0.6352941176470588, 0.3764705882352941, 1.0 ]
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "rng",
                    "maxclass": "number",
                    "minimum": 1,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 210.0, 80.0, 57.0, 26.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 121.0, 57.0, 51.0, 26.0 ],
                    "textcolor": [ 0.8901960784313725, 0.6352941176470588, 0.3764705882352941, 1.0 ],
                    "varname": "range"
                }
            },
            {
                "box": {
                    "id": "pk",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 150.0, 110.0, 70.0, 22.0 ],
                    "text": "pak 29 24"
                }
            },
            {
                "box": {
                    "id": "ex",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 150.0, 140.0, 90.0, 22.0 ],
                    "text": "expr $i1 + $i2"
                }
            },
            {
                "box": {
                    "id": "unp",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "int", "int" ],
                    "patching_rect": [ 250.0, 140.0, 70.0, 22.0 ],
                    "text": "unpack 0 0"
                }
            },
            {
                "box": {
                    "id": "tlh",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 150.0, 170.0, 40.0, 22.0 ],
                    "text": "t l l"
                }
            },
            {
                "box": {
                    "id": "smin",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 250.0, 200.0, 95.0, 22.0 ],
                    "text": "prepend setmin"
                }
            },
            {
                "box": {
                    "id": "smax",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 150.0, 200.0, 95.0, 22.0 ],
                    "text": "prepend setmax"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "tuc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 40.0, 260.0, 64.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 4.0, 85.0, 64.0, 24.0 ],
                    "text": "tuning",
                    "textcolor": [ 0.5019607843137255, 0.8705882352941177, 0.37254901960784315, 1.0 ]
                }
            },
            {
                "box": {
                    "autopopulate": 1,
                    "fontsize": 16.0,
                    "id": "tmenu",
                    "items": [ "09-22.scl", ",", "12-edo.scl", ",", "12edo.scl", ",", "22edo.scl", ",", "31-edo.scl", ",", "31edo-linnstrument.scl", ",", "31edo.scl", ",", "53edo.scl", ",", "ji_11.scl", ",", "ji_13.scl", ",", "ji_17.scl", ",", "ji_7.scl", ",", "ji_7a.scl", ",", "ji_8coh.scl", ",", "ji_9.scl", ",", "ji_9coh.scl", ",", "partch-grm.scl", ",", "partch_43.scl" ],
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 40.0, 280.0, 142.0, 26.0 ],
                    "prefix": "~/Dropbox/musicstuff/Max 9/Library/th.scala/scl/",
                    "prefix_mode": 2,
                    "presentation": 1,
                    "presentation_rect": [ 2.0, 105.0, 172.0, 26.0 ],
                    "textcolor": [ 0.8901084065437317, 0.6354577541351318, 0.3763751983642578, 1.0 ],
                    "varname": "tuningmenu"
                }
            },
            {
                "box": {
                    "id": "ldm",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 40.0, 310.0, 60.0, 22.0 ],
                    "text": "load $1"
                }
            },
            {
                "box": {
                    "id": "ths",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 40.0, 340.0, 250.0, 22.0 ],
                    "text": "th.scala #0_pgtuning @tune 440 @center 69"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "scc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 40.0, 400.0, 63.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 2.0, 130.0, 63.0, 24.0 ],
                    "text": "scale",
                    "textcolor": [ 0.5019607843137255, 0.8705882352941177, 0.37254901960784315, 1.0 ]
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.1843137254901961, 0.4, 0.6666666666666666, 1.0 ],
                    "bgcolor2": [ 0.1843137254901961, 0.4, 0.6666666666666666, 1.0 ],
                    "bgfillcolor_angle": 270.0,
                    "bgfillcolor_autogradient": 0.0,
                    "bgfillcolor_color": [ 0.19607843137254902, 0.3411764705882353, 0.5176470588235295, 1.0 ],
                    "bgfillcolor_color1": [ 0.1843137254901961, 0.4, 0.6666666666666666, 1.0 ],
                    "bgfillcolor_color2": [ 0.15577539321082065, 0.17425720720925325, 0.19375129117572923, 1.0 ],
                    "bgfillcolor_proportion": 0.5,
                    "bgfillcolor_type": "color",
                    "fontsize": 16.0,
                    "gradient": 1,
                    "id": "mall",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 40.0, 420.0, 42.0, 26.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 50.0, 130.0, 28.0, 26.0 ],
                    "text": "all",
                    "textcolor": [ 0.5019607843137255, 0.8705882352941177, 0.37254901960784315, 1.0 ]
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.1843137254901961, 0.4, 0.6666666666666666, 1.0 ],
                    "bgcolor2": [ 0.1843137254901961, 0.4, 0.6666666666666666, 1.0 ],
                    "bgfillcolor_angle": 270.0,
                    "bgfillcolor_autogradient": 0.0,
                    "bgfillcolor_color": [ 0.19607843137254902, 0.3411764705882353, 0.5176470588235295, 1.0 ],
                    "bgfillcolor_color1": [ 0.1843137254901961, 0.4, 0.6666666666666666, 1.0 ],
                    "bgfillcolor_color2": [ 0.15577539321082065, 0.17425720720925325, 0.19375129117572923, 1.0 ],
                    "bgfillcolor_proportion": 0.5,
                    "bgfillcolor_type": "color",
                    "fontsize": 16.0,
                    "gradient": 1,
                    "id": "mnone",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 80.0, 420.0, 51.0, 26.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 90.0, 130.0, 48.0, 26.0 ],
                    "text": "none",
                    "textcolor": [ 0.5019607843137255, 0.8705882352941177, 0.37254901960784315, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "mpp",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 40.0, 450.0, 90.0, 22.0 ],
                    "text": "prepend mask"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "scc2",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 40.0, 475.0, 219.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 2.0, 155.0, 219.0, 24.0 ],
                    "text": "or click row labels",
                    "textcolor": [ 0.5019607843137255, 0.8705882352941177, 0.37254901960784315, 1.0 ]
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
                    "presentation_rect": [ 57.0, 331.0, 50.0, 24.0 ],
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
                    "patching_rect": [ 40.0, 680.0, 90.0, 22.0 ],
                    "text": "prepend snap",
                    "varname": "pg_psnap"
                }
            },
            {
                "box": {
                    "id": "dlb",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 600.0, 60.0, 60.0, 22.0 ],
                    "text": "loadbang"
                }
            },
            {
                "box": {
                    "id": "d5",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 600.0, 90.0, 30.0, 22.0 ],
                    "text": "5"
                }
            },
            {
                "box": {
                    "id": "d29",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 640.0, 90.0, 30.0, 22.0 ],
                    "text": "29"
                }
            },
            {
                "box": {
                    "id": "d24",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 680.0, 90.0, 30.0, 22.0 ],
                    "text": "24"
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
                    "comment": "step reset (bang)",
                    "hint": "step reset (bang)",
                    "id": "g_in-reset",
                    "index": 0,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 750.0, 20.0, 30.0, 22.0 ]
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
                    "patching_rect": [ 800.0, 20.0, 30.0, 22.0 ]
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
                    "patching_rect": [ 850.0, 20.0, 30.0, 22.0 ]
                }
            },
            {
                "box": {
                    "annotation": "length mod (signal -1..1)",
                    "comment": "length mod (signal -1..1)",
                    "hint": "length mod (signal -1..1)",
                    "id": "g_in-lmod",
                    "index": 0,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 900.0, 20.0, 30.0, 22.0 ]
                }
            },
            {
                "box": {
                    "annotation": "direction mod (signal -1..1)",
                    "comment": "direction mod (signal -1..1)",
                    "hint": "direction mod (signal -1..1)",
                    "id": "g_in-dmod",
                    "index": 0,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 950.0, 20.0, 30.0, 22.0 ]
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
                    "patching_rect": [ 1000.0, 20.0, 30.0, 22.0 ]
                }
            },
            {
                "box": {
                    "comment": "gate (signal, level = velocity)",
                    "id": "g_out-gate",
                    "index": 0,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 150.0, 1100.0, 30.0, 22.0 ]
                }
            },
            {
                "box": {
                    "comment": "envelope (signal, peak = velocity)",
                    "id": "g_out-env",
                    "index": 0,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 350.0, 1100.0, 30.0, 22.0 ]
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
                    "parameter_enable": 0,
                    "patching_rect": [ 1330.0, 200.0, 60.0, 26.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1.0, 202.0, 40.0, 26.0 ],
                    "varname": "rate"
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
                    "presentation_rect": [ 39.0, 203.0, 50.0, 24.0 ],
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
                    "patching_rect": [ 1330.0, 240.0, 54.0, 22.0 ],
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
                    "patching_rect": [ 1330.0, 275.0, 30.0, 22.0 ],
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
                    "patching_rect": [ 1530.0, 200.0, 33.0, 22.0 ],
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
                    "patching_rect": [ 1530.0, 235.0, 40.0, 22.0 ],
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
                    "patching_rect": [ 1250.0, 310.0, 86.0, 22.0 ],
                    "text": "rate~ @sync 1",
                    "varname": "pgrate"
                }
            },
            {
                "box": {
                    "id": "g_scope-rate",
                    "maxclass": "live.scope~",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 1360.0, 310.0, 95.0, 40.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 2.0, 226.0, 172.0, 43.0 ]
                }
            },
            {
                "box": {
                    "id": "g_stepreset_t",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 1400.0, 350.0, 33.0, 22.0 ],
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
                    "patching_rect": [ 1400.0, 380.0, 54.0, 22.0 ],
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
                    "patching_rect": [ 1650.0, 380.0, 55.0, 22.0 ],
                    "text": "play $1"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.1607843137254902, 0.1803921568627451, 0.3333333333333333, 1.0 ],
                    "id": "g_triggers",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1720.0, 350.0, 24.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1.0, 295.0, 20.0, 20.0 ],
                    "uncheckedcolor": [ 0.21176470588235294, 0.20392156862745098, 0.22745098039215686, 1.0 ],
                    "varname": "triggers"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "g_c-trig",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1748.0, 352.0, 76.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 23.0, 293.0, 63.0, 24.0 ],
                    "text": "triggers"
                }
            },
            {
                "box": {
                    "id": "g_trigmsg",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1720.0, 380.0, 50.0, 22.0 ],
                    "text": "trig $1"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "g_direction",
                    "items": [ "->", ",", "<-", ",", "rand" ],
                    "maxclass": "umenu",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 2200.0, 200.0, 74.0, 26.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 109.0, 204.0, 64.0, 26.0 ],
                    "varname": "direction"
                }
            },
            {
                "box": {
                    "id": "g_dirmsg",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 2200.0, 240.0, 45.0, 22.0 ],
                    "text": "dir $1"
                }
            },
            {
                "box": {
                    "id": "g_gen",
                    "maxclass": "newobj",
                    "numinlets": 6,
                    "numoutlets": 6,
                    "outlettype": [ "signal", "signal", "signal", "signal", "signal", "signal" ],
                    "patcher": {
                        "fileversion": 1,
                        "appversion": {
                            "major": 9,
                            "minor": 2,
                            "revision": 0,
                            "architecture": "x64",
                            "modernui": 1
                        },
                        "classnamespace": "dsp.gen",
                        "rect": [ 100.0, 100.0, 700.0, 700.0 ],
                        "integercoordinates": 1,
                        "boxes": [
                            {
                                "box": {
                                    "id": "gin1",
                                    "maxclass": "newobj",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 20.0, 14.0, 40.0, 22.0 ],
                                    "text": "in 1"
                                }
                            },
                            {
                                "box": {
                                    "id": "gin2",
                                    "maxclass": "newobj",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 130.0, 14.0, 40.0, 22.0 ],
                                    "text": "in 2"
                                }
                            },
                            {
                                "box": {
                                    "id": "gin3",
                                    "maxclass": "newobj",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 240.0, 14.0, 40.0, 22.0 ],
                                    "text": "in 3"
                                }
                            },
                            {
                                "box": {
                                    "id": "gin4",
                                    "maxclass": "newobj",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 350.0, 14.0, 40.0, 22.0 ],
                                    "text": "in 4"
                                }
                            },
                            {
                                "box": {
                                    "id": "gin5",
                                    "maxclass": "newobj",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 460.0, 14.0, 40.0, 22.0 ],
                                    "text": "in 5"
                                }
                            },
                            {
                                "box": {
                                    "id": "gin6",
                                    "maxclass": "newobj",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 570.0, 14.0, 40.0, 22.0 ],
                                    "text": "in 6"
                                }
                            },
                            {
                                "box": {
                                    "code": "// uPG engine: steps from the phasor, notes from the note tables (dingus.pgRoll.js)\n// note buffer: frame = step * 16 + slot; ch 0-10 forward table, ch 11-21 reverse table\n//   slot: offset, length (0 = end), pitch (MIDI), ratchets, velocity, duty, glide, degree, fade, note index, room\n//   pitch table: frame 1024 + degree: ch 0 MIDI, ch 1 scale degrees at or below, ch 2 below; 1024 ch 3 count\n//   scale list: frame 1536 + n: ch 0 degree index of the n-th scale degree\n// chance buffer: frame = lane * 1024 + note index: op, prob, ptnA, ptnB, amount\n// in1 phasor (one cycle = whole loop)  in2 step reset (click)\n// in3 length mod (-1..1, x steps)      in4 direction mod (-1..1, x 3 modes)\n// in5 range start mod (-1..1, x steps) in6 range end mod (-1..1, x steps)\n// out1 gate or trigger (level = velocity of the current hit)  out2 velocity of the current hit (held)\n// out3 current step  out4 envelope gate (every ratchet, or whole note)  out5 pitch (tuned MIDI float, glides)\n// out6 the bank that plays (0 / 1)\n// two banks of note and chance tables, one per sequence: bank b's notes at frame b * 2048, its chance\n//   cells at b * 32768; its meta at frame 4096 + b: ch 0 steps, ch 1 range start, ch 2 range end,\n//   ch 3 chance lanes, ch 4 swing (50..75; 0 = straight). pend = the bank of a waiting sequence (-1 none): it takes over at the phasor\n//   wrap, at once when the clock stands still (0.1 s) or play is off, or when swapnow changes.\n//   The new sequence starts at its first step, with the PTN count from 0.\nBuffer gb(\"dingus-pg-none\");\nBuffer cb(\"dingus-pgch-none\");\nParam steps(5, min=1, max=64);\nParam dir(0, min=0, max=2);\nParam play(1, min=0, max=1);\nParam trig(0, min=0, max=1);\nParam rstart(0, min=0, max=63);\nParam rend(63, min=0, max=63);\nParam everyr(1, min=0, max=1);\nParam lanes(0, min=0, max=32);\nParam cscale(1, min=0, max=2);\nParam ptnmode(0, min=0, max=1);\nParam barcount(0, min=0);\nParam pend(-1, min=-1, max=1);\nParam swapnow(0);\n\nHistory prevsub(0);\nHistory cur(-1);\nHistory rst(0);\nHistory act(0);\nHistory el(0);\nHistory glen(1);\nHistory grat(1);\nHistory gvel(0);\nHistory gduty(0.5);\nHistory base(0);\nHistory slot(16);\nHistory tb(0);\nHistory gapc(0);\nHistory lastout(0);\nHistory gfill(1);\nHistory hitprev(-1);\nHistory tc(0);\nHistory ppitch(0);\nHistory pfrom(0);\nHistory pto(0);\nHistory gpos(0);\nHistory gdur(0);\nHistory havep(0);\nHistory gfade(0);\nHistory hvel(0);\nHistory reps(-1);\nHistory jt(-1);\nHistory tienext(0);\nHistory bk(0);\nHistory pph(0);\nHistory still(0);\nHistory lastsw(0);\n\n// bank swap, before anything reads the tables of this sample\nwrapped = (in1 - pph) < -0.5;\nif (in1 != pph) {\n\tstill = 0;\n} else {\n\tstill = min(still + 1, 100000000);\n}\npph = in1;\nif (pend >= 0 && pend != bk && (wrapped || still > samplerate * 0.1 || swapnow != lastsw || play <= 0)) {\n\tbk = pend;\n\trst = 1;\n}\nlastsw = swapnow;\nnb = bk * 2048;\ncbo = bk * 32768;\nmb = 4096 + bk;\nmsteps = max(peek(gb, mb, 0), 1);\nmrs = peek(gb, mb, 1);\nmre = peek(gb, mb, 2);\nmlanes = peek(gb, mb, 3);\nmsw = clamp(peek(gb, mb, 4), 50, 75) / 100;\n\nn = clamp(floor(msteps + in3 * msteps + 0.5), 1, 64);\nd = wrap(floor(dir + in4 * 3 + 0.5), 0, 3);\nrunning = play > 0;\nnxt = 0;\nfr = 0;\no = 0;\nL = 0;\nrp = 0;\nfire = 0;\nfidx = 0;\nflen = 0;\nfcut = 64;\ng = 0;\nlo = 0;\nhi = 0;\nhit = 0;\neg = 0;\ngl = 0;\nhn = 0;\nfa = 0;\nfm = 0;\nok = 0;\nsk = 0;\ns = 0;\nj = 0;\nk = 0;\nq = 0;\ni = 0;\nfr2 = 0;\nni = 0;\ncf = 0;\nop = 0;\npa = 0;\npb = 0;\ncnt = 0;\npok = 0;\namt = 0;\nmuted = 0;\ncv = 0;\nclen = 0;\ncrat = 0;\npidx = 0;\nroom = 0;\ntie = 0;\nsdir = 0;\nscnt = 0;\ntot = 0;\nrle = 0;\nrlt = 0;\ntgt = 0;\nrr = 0;\nspan = 1;\n\nif (in2 > 0) {\n\trst = 1;\n}\n\n// position inside the current step\n// swing: in each pair of steps the first takes msw of the pair's time (0.5 = straight, 0.75 = dotted);\n// an unpaired last step plays straight. Everything timed in steps follows the warped position.\npos0 = in1 * n;\npos = pos0;\npp = floor(pos0 / 2);\npu = pos0 - pp * 2;\nif (pp * 2 + 1 < n) {\n\tpos = pp * 2 + ((pu < 2 * msw) ? pu / (2 * msw) : 1 + (pu - 2 * msw) / (2 - 2 * msw));\n}\n\nsub = pos - floor(pos);\nds = sub - prevsub;\nnewstep = ds < -0.5;\nadv = ds;\nif (newstep) {\n\tadv = ds + 1;\n}\nadv = max(adv, 0);\nprevsub = sub;\n\n// advance the running note (time counted in steps, straight from the phasor)\nif (act > 0) {\n\tel = el + adv;\n\tif (el >= glen || running == 0) {\n\t\tact = 0;\n\t}\n}\n\n// play range (sub-loop) from the editor's range strip, plus modulation\nlo = clamp(mrs + floor(in5 * n + 0.5), 0, n - 1);\nhi = clamp(mre + floor(in6 * n + 0.5), lo, n - 1);\nspan = hi - lo + 1;\n\n// PTN counter: pattern repeats (times the loop restarts) or bars (from the bar inlet)\ncnt = (ptnmode > 0) ? barcount : max(reps, 0);\n\nif (newstep && running) {\n\tif (rst > 0) {\n\t\tnxt = (d == 1) ? hi : lo;\n\t\trst = 0;\n\t\treps = -1;\n\t\tjt = -1;\n\t} else if (jt >= 0) {\n\t\t// a jump op from the step before\n\t\tnxt = clamp(jt, lo, hi);\n\t} else if (d == 0) {\n\t\tnxt = (cur + 1 > hi || cur + 1 < lo) ? lo : cur + 1;\n\t} else if (d == 1) {\n\t\tnxt = (cur - 1 < lo || cur - 1 > hi) ? hi : cur - 1;\n\t} else {\n\t\tnxt = lo + min(floor((noise() * 0.5 + 0.5) * span), hi - lo);\n\t}\n\tjt = -1;\n\t// a new repeat starts each time the loop's first step comes up\n\tif (nxt == ((d == 1) ? hi : lo)) {\n\t\treps = reps + 1;\n\t}\n\tcnt = (ptnmode > 0) ? barcount : max(reps, 0);\n\t// SKIP / UNSKIP ops of the notes starting in the step: rolled before the step plays\n\tfor (i = 0; i < n; i += 1) {\n\t\tsk = 0;\n\t\tfor (j = 0; j < 16; j += 1) {\n\t\t\tfr2 = nb + nxt * 16 + j;\n\t\t\tif (peek(gb, fr2, 1) <= 0) {\n\t\t\t\tbreak;\n\t\t\t}\n\t\t\tni = peek(gb, fr2, 9);\n\t\t\ts = 0;\n\t\t\tfor (k = 0; k < mlanes; k += 1) {\n\t\t\t\tcf = cbo + k * 1024 + ni;\n\t\t\t\top = peek(cb, cf, 0);\n\t\t\t\tif (op == 3 || op == 4) {\n\t\t\t\t\tpa = peek(cb, cf, 2);\n\t\t\t\t\tpb = peek(cb, cf, 3);\n\t\t\t\t\tpok = (pb <= 1) || (wrap(cnt, 0, pb) == pa - 1);\n\t\t\t\t\tif (pok && noise() * 0.5 + 0.5 < min(peek(cb, cf, 1) * cscale, 1)) {\n\t\t\t\t\t\ts = (op == 3) ? 1 : 0;\n\t\t\t\t\t}\n\t\t\t\t}\n\t\t\t}\n\t\t\tif (s > 0) {\n\t\t\t\tsk = 1;\n\t\t\t}\n\t\t}\n\t\tif (sk == 0) {\n\t\t\tok = 1;\n\t\t\tbreak;\n\t\t}\n\t\tif (d == 0) {\n\t\t\tnxt = (nxt + 1 > hi) ? lo : nxt + 1;\n\t\t} else if (d == 1) {\n\t\t\tnxt = (nxt - 1 < lo) ? hi : nxt - 1;\n\t\t} else {\n\t\t\tnxt = lo + min(floor((noise() * 0.5 + 0.5) * span), hi - lo);\n\t\t}\n\t}\n\tcur = nxt;\n\tbase = nb + nxt * 16;\n\tslot = (ok > 0) ? 0 : 16;\n\ttb = (d == 1) ? 11 : 0;\n}\n\n// notes of the current step, in order of their offset into the step\n// (forward: their start; reverse: their mirrored start = played end)\nif (running && slot < 16) {\n\tfr = base + slot;\n\tL = peek(gb, fr, tb + 1);\n\tif (L <= 0) {\n\t\tslot = 16;\n\t} else {\n\t\to = peek(gb, fr, tb);\n\t\tif (sub >= o) {\n\t\t\tslot = slot + 1;\n\t\t\tfire = 1;\n\t\t\tfidx = fr;\n\t\t\t// forward: cut at the end of the play range\n\t\t\tfcut = (d == 0) ? hi + 1 - cur - o : 64;\n\t\t\tflen = min(L, fcut);\n\t\t}\n\t}\n}\n\nif (fire > 0 && flen > 0) {\n\t// chance lanes, top to bottom; every note rolls its own dice\n\tni = peek(gb, fidx, tb + 9);\n\troom = peek(gb, fidx, tb + 10);\n\tcv = peek(gb, fidx, tb + 4);\n\tclen = flen;\n\tcrat = max(peek(gb, fidx, tb + 3), 1);\n\tpidx = peek(gb, fidx, tb + 7);\n\tmuted = 0;\n\ttie = 0;\n\tfor (k = 0; k < mlanes; k += 1) {\n\t\tcf = cbo + k * 1024 + ni;\n\t\top = peek(cb, cf, 0);\n\t\tif (op > 0) {\n\t\t\tpa = peek(cb, cf, 2);\n\t\t\tpb = peek(cb, cf, 3);\n\t\t\tpok = (pb <= 1) || (wrap(cnt, 0, pb) == pa - 1);\n\t\t\tif (pok && noise() * 0.5 + 0.5 < min(peek(cb, cf, 1) * cscale, 1)) {\n\t\t\t\tamt = peek(cb, cf, 4);\n\t\t\t\tsdir = 0;\n\t\t\t\tscnt = 0;\n\t\t\t\tif (op == 1) {\n\t\t\t\t\tmuted = 1;\n\t\t\t\t} else if (op == 2) {\n\t\t\t\t\tmuted = 0;\n\t\t\t\t} else if (op == 5) {\n\t\t\t\t\tjt = lo + wrap(cur - amt - lo, 0, span);\n\t\t\t\t} else if (op == 6) {\n\t\t\t\t\tjt = lo + min(floor((noise() * 0.5 + 0.5) * span), hi - lo);\n\t\t\t\t} else if (op == 7) {\n\t\t\t\t\tjt = lo + wrap(cur + amt - lo, 0, span);\n\t\t\t\t} else if (op == 8) {\n\t\t\t\t\tjt = amt - 1;\n\t\t\t\t} else if (op == 9) {\n\t\t\t\t\tcv = max(0, cv - amt / 100);\n\t\t\t\t} else if (op == 10) {\n\t\t\t\t\tcv = min(1, cv + amt / 100);\n\t\t\t\t} else if (op == 11) {\n\t\t\t\t\tcv = 1;\n\t\t\t\t} else if (op == 12) {\n\t\t\t\t\tclen = max(clen - amt, 0.01);\n\t\t\t\t} else if (op == 13) {\n\t\t\t\t\tclen = min(clen + amt, max(room, clen));\n\t\t\t\t} else if (op == 14) {\n\t\t\t\t\tclen = max(room, clen);\n\t\t\t\t\ttie = 1;\n\t\t\t\t} else if (op == 15) {\n\t\t\t\t\tcrat = amt;\n\t\t\t\t} else if (op == 16) {\n\t\t\t\t\tsdir = 1;\n\t\t\t\t\tscnt = amt;\n\t\t\t\t} else if (op == 17) {\n\t\t\t\t\tsdir = -1;\n\t\t\t\t\tscnt = amt;\n\t\t\t\t} else if (op == 18) {\n\t\t\t\t\tsdir = 1;\n\t\t\t\t\tscnt = 1 + min(floor((noise() * 0.5 + 0.5) * amt), amt - 1);\n\t\t\t\t} else if (op == 19) {\n\t\t\t\t\tsdir = -1;\n\t\t\t\t\tscnt = 1 + min(floor((noise() * 0.5 + 0.5) * amt), amt - 1);\n\t\t\t\t} else if (op == 20) {\n\t\t\t\t\trr = min(floor((noise() * 0.5 + 0.5) * (2 * amt + 1)), 2 * amt) - amt;\n\t\t\t\t\tsdir = (rr < 0) ? -1 : 1;\n\t\t\t\t\tscnt = abs(rr);\n\t\t\t\t}\n\t\t\t\t// pitch ops: move by scale degrees (degrees in the scale mask), via the rank tables:\n\t\t\t\t// ch 1 = scale degrees at or below an index, ch 2 = below it, list at 1536 + n\n\t\t\t\tif (sdir != 0 && scnt > 0) {\n\t\t\t\t\ttot = peek(gb, 1024, 3);\n\t\t\t\t\trle = peek(gb, 1024 + pidx, 1);\n\t\t\t\t\trlt = peek(gb, 1024 + pidx, 2);\n\t\t\t\t\tif (tot > 0) {\n\t\t\t\t\t\tif (sdir > 0) {\n\t\t\t\t\t\t\trr = min(rle + scnt - 1, tot - 1);\n\t\t\t\t\t\t\ttgt = peek(gb, 1536 + rr, 0);\n\t\t\t\t\t\t\tpidx = max(pidx, tgt);\n\t\t\t\t\t\t} else {\n\t\t\t\t\t\t\trr = max(rlt - scnt, 0);\n\t\t\t\t\t\t\ttgt = peek(gb, 1536 + rr, 0);\n\t\t\t\t\t\t\tpidx = min(pidx, tgt);\n\t\t\t\t\t\t}\n\t\t\t\t\t}\n\t\t\t\t}\n\t\t\t}\n\t\t}\n\t}\n\tclen = min(clen, fcut);\n\tif (muted == 0) {\n\t\tif (lastout > 0 && trig == 0 && tienext == 0) {\n\t\t\tgapc = floor(samplerate * 0.003);\n\t\t}\n\t\ttienext = tie;\n\t\tact = 1;\n\t\tel = 0;\n\t\tglen = clen;\n\t\tgrat = max(crat, 1);\n\t\tgvel = cv;\n\t\tgduty = peek(gb, fidx, tb + 5);\n\t\tgfade = peek(gb, fidx, tb + 8);\n\t\tgfill = min(clen, 1);\n\t\thitprev = -1;\n\t\t// pitch: jump, or glide from the current pitch over GLIDE steps\n\t\tgl = peek(gb, fidx, tb + 6);\n\t\tif (havep > 0 && gl > 0) {\n\t\t\tpfrom = ppitch;\n\t\t\tgdur = gl;\n\t\t\tgpos = 0;\n\t\t} else {\n\t\t\tgdur = 0;\n\t\t}\n\t\tpto = (pidx >= 0 && pidx < 512) ? peek(gb, 1024 + pidx, 0) : peek(gb, fidx, tb + 2);\n\t\thavep = 1;\n\t}\n}\n\nif (gdur > 0) {\n\tgpos = gpos + adv;\n\tppitch = pfrom + (pto - pfrom) * min(gpos / gdur, 1);\n\tif (gpos >= gdur) {\n\t\tgdur = 0;\n\t}\n} else {\n\tppitch = pto;\n}\n\n// FADE: velocity per ratchet hit, exponential; < 0 rises to VEL, > 0 falls from VEL;\n// at +-50 the quietest hit is 1% of VEL\nif (act > 0) {\n\thvel = gvel;\n\tif (grat > 1 && gfade != 0) {\n\t\thn = min(floor(el / glen * grat), grat - 1) / (grat - 1);\n\t\tfm = pow(0.01, abs(gfade) / 50);\n\t\tfa = (gfade < 0) ? pow(fm, 1 - hn) : pow(fm, hn);\n\t\thvel = gvel * fa;\n\t}\n}\n\nif (trig > 0) {\n\t// trigger mode: one pulse per note / ratchet hit, 1..10 ms\n\t// pulse length from the note length (up to 1 step), or from DUTY (0.05..0.95) when ratcheted\n\tif (act > 0) {\n\t\thit = floor(el / glen * grat);\n\t\tif (hit != hitprev) {\n\t\t\thitprev = hit;\n\t\t\tif (grat > 1) {\n\t\t\t\ttc = floor(samplerate * (1 + (gduty - 0.05) / 0.9 * 9) * 0.001);\n\t\t\t} else {\n\t\t\t\ttc = floor(samplerate * (1 + (gfill - 0.05) / 0.95 * 9) * 0.001);\n\t\t\t}\n\t\t}\n\t}\n\tif (tc > 0) {\n\t\ttc = tc - 1;\n\t\tg = hvel;\n\t}\n} else if (act > 0) {\n\t// ratchets split the whole note evenly; duty only applies with 2+ ratchets\n\tif (grat <= 1) {\n\t\tg = hvel;\n\t} else {\n\t\trp = el / glen * grat;\n\t\tif (rp - floor(rp) < gduty) {\n\t\t\tg = hvel;\n\t\t}\n\t}\n}\n// 3 ms low gap when a new note follows a high one, so it retriggers (not after TIE)\n// envelope gate: every ratchet hit, or the whole note\neg = g;\nif (everyr == 0) {\n\teg = (act > 0) ? gvel : 0;\n}\nif (gapc > 0) {\n\tgapc = gapc - 1;\n\tg = 0;\n\teg = 0;\n}\nlastout = g;\n\nout1 = g;\nout2 = hvel;\nout3 = cur;\nout4 = eg;\nout5 = ppitch;\nout6 = bk;\n",
                                    "fontface": 0,
                                    "fontname": "<Monospaced>",
                                    "fontsize": 12.0,
                                    "id": "gcode",
                                    "maxclass": "codebox",
                                    "numinlets": 6,
                                    "numoutlets": 6,
                                    "outlettype": [ "", "", "", "", "", "" ],
                                    "patching_rect": [ 20.0, 50.0, 640.0, 560.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "gout1",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 20.0, 630.0, 45.0, 22.0 ],
                                    "text": "out 1"
                                }
                            },
                            {
                                "box": {
                                    "id": "gout2",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 140.0, 630.0, 45.0, 22.0 ],
                                    "text": "out 2"
                                }
                            },
                            {
                                "box": {
                                    "id": "gout3",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 260.0, 630.0, 45.0, 22.0 ],
                                    "text": "out 3"
                                }
                            },
                            {
                                "box": {
                                    "id": "gout4",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 380.0, 630.0, 45.0, 22.0 ],
                                    "text": "out 4"
                                }
                            },
                            {
                                "box": {
                                    "id": "gout5",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 500.0, 630.0, 45.0, 22.0 ],
                                    "text": "out 5"
                                }
                            },
                            {
                                "box": {
                                    "id": "gout6",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 620.0, 630.0, 45.0, 22.0 ],
                                    "text": "out 6"
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "destination": [ "gout1", 0 ],
                                    "source": [ "gcode", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "gout2", 0 ],
                                    "source": [ "gcode", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "gout3", 0 ],
                                    "source": [ "gcode", 2 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "gout4", 0 ],
                                    "source": [ "gcode", 3 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "gout5", 0 ],
                                    "source": [ "gcode", 4 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "gcode", 0 ],
                                    "source": [ "gin1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "gcode", 1 ],
                                    "source": [ "gin2", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "gcode", 2 ],
                                    "source": [ "gin3", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "gcode", 3 ],
                                    "source": [ "gin4", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "gcode", 4 ],
                                    "source": [ "gin5", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "gcode", 5 ],
                                    "source": [ "gin6", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "source": [ "gcode", 5 ],
                                    "destination": [ "gout6", 0 ]
                                }
                            }
                        ]
                    },
                    "patching_rect": [ 1250.0, 600.0, 400.0, 22.0 ],
                    "text": "gen~",
                    "varname": "pggen"
                }
            },
            {
                "box": {
                    "id": "g_snap",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "patching_rect": [ 1650.0, 610.0, 96.0, 22.0 ],
                    "text": "snapshot~ 20"
                }
            },
            {
                "box": {
                    "id": "g_chg",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "int", "int" ],
                    "patching_rect": [ 1650.0, 640.0, 54.0, 22.0 ],
                    "text": "change"
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
                    "presentation_rect": [ 957.0, 221.0, 356.0, 30.0 ],
                    "range": [ 0.0, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "g_env-obj-8",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "bang", "bang" ],
                    "patching_rect": [ 1250.0, 810.0, 42.0, 22.0 ],
                    "text": "edge~"
                }
            },
            {
                "box": {
                    "id": "g_env-obj-7",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1250.0, 845.0, 24.0, 24.0 ],
                    "varname": "button"
                }
            },
            {
                "box": {
                    "autosustain": 2,
                    "classic_curve": 0,
                    "domain": 132.7433624267578,
                    "fontface": 0,
                    "fontsize": 12.0,
                    "id": "g_env-obj-2",
                    "linethickness": 2.0,
                    "maxclass": "function",
                    "mode": 1,
                    "numinlets": 1,
                    "numoutlets": 4,
                    "outlettype": [ "float", "", "", "bang" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 1430.0, 880.0, 212.0, 98.0 ],
                    "pointsize": 5.0,
                    "presentation": 1,
                    "presentation_rect": [ 957.0, 30.0, 356.0, 115.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_invisible": 1,
                            "parameter_longname": "function",
                            "parameter_modmode": 0,
                            "parameter_shortname": "function",
                            "parameter_type": 3
                        }
                    },
                    "style": "rnbodefault",
                    "varname": "function"
                }
            },
            {
                "box": {
                    "floatoutput": 1,
                    "id": "g_env-obj-242",
                    "maxclass": "slider",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 1430.0, 985.0, 212.0, 10.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 957.0, 147.0, 356.0, 18.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_longname": "slider[13]",
                            "parameter_mmax": 10000.0,
                            "parameter_modmode": 3,
                            "parameter_shortname": "slider[8]",
                            "parameter_type": 0
                        }
                    },
                    "size": 10000.0,
                    "style": "rnbodefault",
                    "varname": "slider[13]"
                }
            },
            {
                "box": {
                    "id": "g_env-obj-15",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1670.0, 845.0, 81.0, 22.0 ],
                    "text": "setdomain $1"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "g_env-obj-11",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1370.0, 845.0, 43.0, 26.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1087.0, 4.0, 50.0, 26.0 ],
                    "text": "clear",
                    "textcolor": [ 0.9058823529411765, 0.7450980392156863, 0.12941176470588237, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "g_env-obj-3",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 2,
                    "outlettype": [ "signal", "bang" ],
                    "patching_rect": [ 1430.0, 1010.0, 45.0, 22.0 ],
                    "text": "curve~"
                }
            },
            {
                "box": {
                    "id": "g_env-next",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1310.0, 845.0, 208.0, 22.0 ],
                    "saved_object_attributes": {
                        "filename": "dingus.envNext.js",
                        "parameter_enable": 0
                    },
                    "text": "v8 dingus.envNext.js function"
                }
            },
            {
                "box": {
                    "id": "g_envvel",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 1430.0, 1045.0, 30.0, 22.0 ],
                    "text": "*~"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.1607843137254902, 0.1803921568627451, 0.3333333333333333, 1.0 ],
                    "id": "g_everyr",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1760.0, 810.0, 24.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 87.0, 295.0, 20.0, 20.0 ],
                    "uncheckedcolor": [ 0.21176470588235294, 0.20392156862745098, 0.22745098039215686, 1.0 ],
                    "varname": "everyratchet"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "g_c-everyr",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1788.0, 812.0, 117.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 107.0, 293.0, 68.0, 24.0 ],
                    "text": "ratchets"
                }
            },
            {
                "box": {
                    "id": "g_everyrmsg",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1760.0, 845.0, 60.0, 22.0 ],
                    "text": "everyr $1"
                }
            },
            {
                "box": {
                    "id": "g_everyr_lb",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1760.0, 780.0, 82.0, 22.0 ],
                    "text": "loadmess 1"
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
                    "presentation_rect": [ 957.0, 254.0, 356.0, 36.0 ],
                    "range": [ 0.0, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "g_def_rate",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 2300.0, 510.0, 30.0, 22.0 ],
                    "text": "1."
                }
            },
            {
                "box": {
                    "id": "g_def_dir",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 2380.0, 510.0, 30.0, 22.0 ],
                    "text": "0"
                }
            },
            {
                "box": {
                    "comment": "range start mod (signal -1..1 x steps)",
                    "id": "in-rsmod",
                    "index": 0,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1050.0, 20.0, 30.0, 22.0 ]
                }
            },
            {
                "box": {
                    "comment": "range end mod (signal -1..1 x steps)",
                    "id": "in-remod",
                    "index": 0,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1100.0, 20.0, 30.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "bufgen",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 600.0, 200.0, 150.0, 22.0 ],
                    "text": "gb #0-pg, cb #0-pgch"
                }
            },
            {
                "box": {
                    "id": "stg",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 40.0, 140.0, 60.0, 22.0 ],
                    "text": "steps $1"
                }
            },
            {
                "box": {
                    "id": "rgu",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "int", "int" ],
                    "patching_rect": [ 550.0, 860.0, 70.0, 22.0 ],
                    "text": "unpack 0 0"
                }
            },
            {
                "box": {
                    "id": "rgs",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 550.0, 890.0, 90.0, 22.0 ],
                    "text": "prepend rstart"
                }
            },
            {
                "box": {
                    "id": "rge",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 650.0, 890.0, 90.0, 22.0 ],
                    "text": "prepend rend"
                }
            },
            {
                "box": {
                    "id": "pscale",
                    "maxclass": "newobj",
                    "numinlets": 6,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 50.0, 980.0, 160.0, 22.0 ],
                    "text": "scale~ 0. 127. 0. 1.0494"
                }
            },
            {
                "box": {
                    "id": "pon",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 50.0, 1010.0, 40.0, 22.0 ],
                    "text": "*~ 1"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.1607843137254902, 0.1803921568627451, 0.3333333333333333, 1.0 ],
                    "id": "ptog",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 100.0, 980.0, 24.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1.0, 367.0, 20.0, 20.0 ],
                    "uncheckedcolor": [ 0.21176470588235294, 0.20392156862745098, 0.22745098039215686, 1.0 ],
                    "varname": "pitchout"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "ptc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 130.0, 980.0, 90.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 27.0, 365.0, 90.0, 24.0 ],
                    "text": "pitch out"
                }
            },
            {
                "box": {
                    "id": "plm",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 100.0, 950.0, 70.0, 22.0 ],
                    "text": "loadmess 1"
                }
            },
            {
                "box": {
                    "comment": "pitch (signal, 0..1.0494 = MIDI 0..127)",
                    "id": "out-pitch",
                    "index": 0,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 50.0, 1100.0, 30.0, 22.0 ]
                }
            },
            {
                "box": {
                    "comment": "velocity (signal, held)",
                    "id": "out-vel",
                    "index": 0,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 250.0, 1100.0, 30.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "psnap",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "patching_rect": [ 220.0, 1010.0, 81.0, 22.0 ],
                    "text": "snapshot~ 50"
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "format": 6,
                    "id": "pmidi",
                    "ignoreclick": 1,
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 220.0, 1040.0, 67.0, 26.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 99.0, 365.0, 67.0, 26.0 ]
                }
            },
            {
                "box": {
                    "activelinecolor": [ 0.38823529411764707, 0.8901960784313725, 0.3686274509803922, 1.0 ],
                    "id": "scope-pitch",
                    "maxclass": "live.scope~",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 320.0, 1010.0, 200.0, 40.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 957.0, 163.0, 356.0, 55.0 ],
                    "range": [ 0.0, 127.0 ]
                }
            },
            {
                "box": {
                    "id": "chbuf",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "float", "bang" ],
                    "patching_rect": [ 40.0, 590.0, 150.0, 22.0 ],
                    "text": "buffer~ #0-pgch @samps 65536 @chans 5"
                }
            },
            {
                "box": {
                    "id": "lnp",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 700.0, 890.0, 90.0, 22.0 ],
                    "text": "prepend lanes"
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
                    "parameter_enable": 0,
                    "patching_rect": [ 700.0, 950.0, 24.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 1.0, 397.0, 20.0, 20.0 ],
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
                    "presentation_rect": [ 25.0, 397.0, 157.0, 24.0 ],
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
                    "patching_rect": [ 700.0, 980.0, 80.0, 22.0 ],
                    "text": "ptnmode $1"
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
                    "patching_rect": [ 1150.0, 20.0, 30.0, 22.0 ]
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
                    "patching_rect": [ 1200.0, 20.0, 30.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "csm",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1150.0, 60.0, 70.0, 22.0 ],
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
                    "patching_rect": [ 1200.0, 60.0, 75.0, 22.0 ],
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
                    "patching_rect": [ 1200.0, 90.0, 60.0, 22.0 ],
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
                    "patching_rect": [ 1280.0, 90.0, 30.0, 22.0 ],
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
                    "patching_rect": [ 1200.0, 120.0, 80.0, 22.0 ],
                    "text": "barcount $1"
                }
            },
            {
                "box": {
                    "id": "bufdel",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 580.0, 170.0, 65.0, 22.0 ],
                    "text": "delay 500"
                }
            },
            {
                "box": {
                    "id": "apat",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 4,
                    "outlettype": [ "", "", "", "" ],
                    "patching_rect": [ 1700.0, 700.0, 150.0, 22.0 ],
                    "restore": {
                        "beat": [ 5 ],
                        "button": [ 0.0 ],
                        "clearbtn": [ -1 ],
                        "direction": [ 0 ],
                        "everyratchet": [ 1 ],
                        "function": [ 132.7433624267578, 0.0, 1.0, "curve" ],
                        "low": [ 29 ],
                        "pgroll": [ -4, 5, 0, 4, 12, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 0.5, 0.75, 35, 1, 0, 1, 0.5, 0, 0, 0, 0, 0, 0, 1.4, 0.75, 38, 1, 0, 2, 0.2576923076923076, -19, 0, 0, 0, 0, 0 ],
                        "pitchout": [ 1 ],
                        "ptnmode": [ 0 ],
                        "range": [ 24 ],
                        "rate": [ 1.0 ],
                        "slider[13]": [ 0.0 ],
                        "snap": [ 1 ],
                        "steps": [ 5 ],
                        "triggers": [ 0 ]
                    },
                    "restore_extra": {
                        "beat": {
                            "id": "obj-3"
                        },
                        "button": {
                            "id": "g_env-obj-7"
                        },
                        "clearbtn": {
                            "id": "obj-8"
                        },
                        "direction": {
                            "id": "g_direction"
                        },
                        "everyratchet": {
                            "id": "g_everyr"
                        },
                        "function": {
                            "id": "g_env-obj-2"
                        },
                        "low": {
                            "id": "low"
                        },
                        "pgroll": {
                            "id": "roll"
                        },
                        "pitchout": {
                            "id": "ptog"
                        },
                        "ptnmode": {
                            "id": "ptm"
                        },
                        "range": {
                            "id": "rng"
                        },
                        "rate": {
                            "id": "g_rate"
                        },
                        "slider[13]": {
                            "id": "g_env-obj-242"
                        },
                        "snap": {
                            "id": "obj-12"
                        },
                        "steps": {
                            "id": "steps"
                        },
                        "triggers": {
                            "id": "g_triggers"
                        }
                    },
                    "text": "autopattr @autorestore 0",
                    "varname": "u_pg_autopattr"
                }
            },
            {
                "box": {
                    "id": "ptun",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "" ],
                    "patching_rect": [ 40.0, 370.0, 80.0, 22.0 ],
                    "restore": [ 0 ],
                    "saved_object_attributes": {
                        "parameter_enable": 0,
                        "parameter_mappable": 0
                    },
                    "text": "pattr tuning",
                    "varname": "tuning"
                }
            },
            {
                "box": {
                    "id": "ptset",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 130.0, 370.0, 85.0, 22.0 ],
                    "text": "setsymbol $1"
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
                    "pattrstorage": "#1_uPG",
                    "presentation": 1,
                    "presentation_rect": [ -1.0, 432.0, 161.0, 52.0 ]
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
                            "revision": 0,
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
                                    "text": "priority tuning -6, priority low -5, priority range -5, priority steps -4, priority direction -3, priority rate -2, priority pgroll -1"
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
                                    "text": "pattrstorage #1_uPG"
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
                                    "text": "presets: file _maxPresets/uPG_<bpatcher argument>.json, read at load, written on every store"
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
                    "patching_rect": [ 1700.0, 760.0, 101.0, 22.0 ],
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
                    "patching_rect": [ 1700.0, 820.0, 300.0, 22.0 ],
                    "priority": {
                        "tuning": -6,
                        "direction": -3,
                        "low": -5,
                        "pgroll": -1,
                        "range": -5,
                        "rate": -2,
                        "steps": -4
                    },
                    "saved_object_attributes": {
                        "client_rect": [ 580, 87, 949, 304 ],
                        "parameter_enable": 0,
                        "parameter_mappable": 0,
                        "storage_rect": [ 583, 69, 1034, 197 ]
                    },
                    "text": "pattrstorage #1_uPG @savemode 0 @autorestore 0",
                    "varname": "#1_uPG"
                }
            },
            {
                "box": {
                    "id": "pjs",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1700.0, 790.0, 190.0, 22.0 ],
                    "saved_object_attributes": {
                        "filename": "dingus.presetFile.js",
                        "parameter_enable": 0
                    },
                    "text": "v8 dingus.presetFile.js uPG #1"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "id": "pcm",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1700.0, 670.0, 520.0, 20.0 ],
                    "text": "PRESETS: _maxPresets/uPG_<bpatcher argument>.json (click = recall, shift-click = store)"
                }
            },
            {
                "box": {
                    "id": "pjs_slotfilter",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 1910.0, 790.0, 120.0, 22.0 ],
                    "text": "routepass slotlist"
                }
            },
            {
                "box": {
                    "id": "sq_bsnap",
                    "maxclass": "newobj",
                    "text": "snapshot~ 20",
                    "patching_rect": [ 1250.0, 1260.0, 80.0, 22.0 ],
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "float" ]
                }
            },
            {
                "box": {
                    "id": "sq_bchg",
                    "maxclass": "newobj",
                    "text": "change",
                    "patching_rect": [ 1250.0, 1290.0, 50.0, 22.0 ],
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "int", "int" ]
                }
            },
            {
                "box": {
                    "id": "sq_bpp",
                    "maxclass": "newobj",
                    "text": "prepend bankis",
                    "patching_rect": [ 1250.0, 1320.0, 100.0, 22.0 ],
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ]
                }
            },
            {
                "box": {
                    "id": "sq_dsp",
                    "maxclass": "newobj",
                    "text": "dspstate~",
                    "patching_rect": [ 1400.0, 1260.0, 70.0, 22.0 ],
                    "numinlets": 1,
                    "numoutlets": 4,
                    "outlettype": [ "int", "float", "int", "int" ]
                }
            },
            {
                "box": {
                    "id": "sq_dsppp",
                    "maxclass": "newobj",
                    "text": "prepend dsp",
                    "patching_rect": [ 1400.0, 1290.0, 80.0, 22.0 ],
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ]
                }
            },
            {
                "box": {
                    "id": "sq_rt",
                    "maxclass": "newobj",
                    "text": "route engine stepsis seqis swingis",
                    "patching_rect": [ 600.0, 1260.0, 170.0, 22.0 ],
                    "numinlets": 1,
                    "numoutlets": 5,
                    "outlettype": [ "", "", "", "", "" ]
                }
            },
            {
                "box": {
                    "id": "sq_setst",
                    "maxclass": "newobj",
                    "text": "prepend set",
                    "patching_rect": [ 600.0, 1300.0, 75.0, 22.0 ],
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ]
                }
            },
            {
                "box": {
                    "id": "sq_setsq",
                    "maxclass": "newobj",
                    "text": "prepend set",
                    "patching_rect": [ 700.0, 1300.0, 75.0, 22.0 ],
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ]
                }
            },
            {
                "box": {
                    "id": "sq_cmt",
                    "maxclass": "comment",
                    "text": "seq",
                    "fontsize": 16.0,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 40.0, 1230.0, 40.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 180.0, 0.0, 36.0, 24.0 ]
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
                    "presentation_rect": [ 218.0, 0.0, 44.0, 22.0 ],
                    "textcolor": [ 0.8901960784313725, 0.6352941176470588, 0.3764705882352941, 1.0 ],
                    "varname": "pg_seq"
                }
            },
            {
                "box": {
                    "id": "sq_m1",
                    "maxclass": "newobj",
                    "text": "- 1",
                    "patching_rect": [ 40.0, 1300.0, 40.0, 22.0 ],
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "int" ]
                }
            },
            {
                "box": {
                    "id": "sq_pseq",
                    "maxclass": "newobj",
                    "text": "prepend seq",
                    "patching_rect": [ 40.0, 1340.0, 80.0, 22.0 ],
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ]
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
                    "presentation_rect": [ 266.0, 0.0, 24.0, 22.0 ],
                    "text": "-"
                }
            },
            {
                "box": {
                    "id": "sq_minus_m",
                    "maxclass": "message",
                    "text": "seqstep -1",
                    "patching_rect": [ 110.0, 1300.0, 80.0, 22.0 ],
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ]
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
                    "presentation_rect": [ 294.0, 0.0, 24.0, 22.0 ],
                    "text": "+"
                }
            },
            {
                "box": {
                    "id": "sq_plus_m",
                    "maxclass": "message",
                    "text": "seqstep 1",
                    "patching_rect": [ 190.0, 1300.0, 72.0, 22.0 ],
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ]
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
                    "presentation_rect": [ 326.0, 0.0, 52.0, 22.0 ],
                    "text": "copy"
                }
            },
            {
                "box": {
                    "id": "sq_copy_m",
                    "maxclass": "message",
                    "text": "copyseq",
                    "patching_rect": [ 270.0, 1300.0, 70.0, 22.0 ],
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ]
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
                    "presentation_rect": [ 382.0, 0.0, 56.0, 22.0 ],
                    "text": "paste"
                }
            },
            {
                "box": {
                    "id": "sq_paste_m",
                    "maxclass": "message",
                    "text": "pasteseq",
                    "patching_rect": [ 350.0, 1300.0, 70.0, 22.0 ],
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ]
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
                    "presentation_rect": [ 442.0, 0.0, 54.0, 22.0 ],
                    "text": "clear",
                    "textoncolor": [ 1.0, 0.34509803921568627, 0.34509803921568627, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "sq_clear_m",
                    "maxclass": "message",
                    "text": "clear",
                    "patching_rect": [ 430.0, 1300.0, 70.0, 22.0 ],
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ]
                }
            },
            {
                "box": {
                    "id": "sq_dlg",
                    "maxclass": "newobj",
                    "text": "dialog @mode 2 @label \"Empty all 32 sequences?\"",
                    "patching_rect": [ 1250.0, 1360.0, 300.0, 22.0 ],
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ]
                }
            },
            {
                "box": {
                    "id": "sq_in",
                    "maxclass": "inlet",
                    "comment": "sequence 1-32 (takes over at the phasor wrap)",
                    "index": 0,
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1420.0, 20.0, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "fontsize": 16.0,
                    "id": "sw_box",
                    "maxclass": "number",
                    "maximum": 75,
                    "minimum": 50,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1470.0, 720.0, 50.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 50.0, 270.0, 40.0, 22.0 ],
                    "textcolor": [ 0.8901960784313725, 0.6352941176470588, 0.3764705882352941, 1.0 ],
                    "varname": "pitchGateSeq_swing"
                }
            },
            {
                "box": {
                    "id": "sw_cmt",
                    "maxclass": "comment",
                    "text": "swing",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1530.0, 720.0, 50.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 2.0, 270.0, 48.0, 22.0 ],
                    "fontsize": 16.0
                }
            },
            {
                "box": {
                    "id": "sw_pp",
                    "maxclass": "newobj",
                    "text": "prepend swing",
                    "patching_rect": [ 1470.0, 750.0, 90.0, 22.0 ],
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ]
                }
            },
            {
                "box": {
                    "id": "sw_set",
                    "maxclass": "newobj",
                    "text": "prepend set",
                    "patching_rect": [ 1570.0, 750.0, 75.0, 22.0 ],
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ]
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "tmenu", 0 ],
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
                    "destination": [ "g_gen", 0 ],
                    "source": [ "barm", 0 ]
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
                    "destination": [ "g_gen", 0 ],
                    "source": [ "bufgen", 0 ]
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
                    "destination": [ "g_gen", 0 ],
                    "source": [ "csm", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "rng", 0 ],
                    "source": [ "d24", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "low", 0 ],
                    "source": [ "d29", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "steps", 0 ],
                    "source": [ "d5", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "d24", 0 ],
                    "order": 2,
                    "source": [ "dlb", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "d29", 0 ],
                    "order": 3,
                    "source": [ "dlb", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "d5", 0 ],
                    "order": 4,
                    "source": [ "dlb", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "g_def_dir", 0 ],
                    "order": 0,
                    "source": [ "dlb", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "g_def_rate", 0 ],
                    "order": 1,
                    "source": [ "dlb", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "smax", 0 ],
                    "source": [ "ex", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "roll", 1 ],
                    "source": [ "g_chg", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "g_gen", 1 ],
                    "source": [ "g_click", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "g_direction", 0 ],
                    "source": [ "g_def_dir", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "g_rate", 0 ],
                    "source": [ "g_def_rate", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "g_dirmsg", 0 ],
                    "source": [ "g_direction", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "g_gen", 0 ],
                    "source": [ "g_dirmsg", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "g_env-obj-2", 0 ],
                    "source": [ "g_env-next", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "g_env-obj-2", 0 ],
                    "source": [ "g_env-obj-11", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "g_env-obj-2", 0 ],
                    "source": [ "g_env-obj-15", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "g_env-obj-3", 0 ],
                    "source": [ "g_env-obj-2", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "g_env-obj-7", 0 ],
                    "source": [ "g_env-obj-2", 3 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "g_env-obj-15", 0 ],
                    "source": [ "g_env-obj-242", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "g_envvel", 0 ],
                    "source": [ "g_env-obj-3", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "g_env-obj-2", 0 ],
                    "source": [ "g_env-obj-7", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "g_env-next", 0 ],
                    "source": [ "g_env-obj-8", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "g_env-obj-7", 0 ],
                    "source": [ "g_env-obj-8", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "g_out-env", 0 ],
                    "order": 1,
                    "source": [ "g_envvel", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "g_scope-env", 0 ],
                    "order": 0,
                    "source": [ "g_envvel", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "g_everyrmsg", 0 ],
                    "source": [ "g_everyr", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "g_everyr", 0 ],
                    "source": [ "g_everyr_lb", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "g_gen", 0 ],
                    "source": [ "g_everyrmsg", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "g_env-obj-8", 0 ],
                    "source": [ "g_gen", 3 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "g_envvel", 1 ],
                    "order": 0,
                    "source": [ "g_gen", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "g_out-gate", 0 ],
                    "order": 1,
                    "source": [ "g_gen", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "g_scope-gate", 0 ],
                    "order": 0,
                    "source": [ "g_gen", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "g_snap", 0 ],
                    "source": [ "g_gen", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "out-vel", 0 ],
                    "order": 1,
                    "source": [ "g_gen", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pscale", 0 ],
                    "order": 2,
                    "source": [ "g_gen", 4 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "psnap", 0 ],
                    "order": 1,
                    "source": [ "g_gen", 4 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "scope-pitch", 0 ],
                    "order": 0,
                    "source": [ "g_gen", 4 ]
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
                    "destination": [ "g_gen", 3 ],
                    "source": [ "g_in-dmod", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "g_gen", 2 ],
                    "source": [ "g_in-lmod", 0 ]
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
                    "destination": [ "g_gen", 0 ],
                    "source": [ "g_playmsg", 0 ]
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
                    "destination": [ "g_gen", 0 ],
                    "source": [ "g_ratetilde", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "g_chg", 0 ],
                    "source": [ "g_snap", 0 ]
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
                    "destination": [ "g_trigmsg", 0 ],
                    "source": [ "g_triggers", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "g_gen", 0 ],
                    "source": [ "g_trigmsg", 0 ]
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
                    "destination": [ "g_gen", 5 ],
                    "source": [ "in-remod", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "g_gen", 4 ],
                    "source": [ "in-rsmod", 0 ]
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
                    "destination": [ "ths", 0 ],
                    "source": [ "ldm", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "g_gen", 0 ],
                    "source": [ "lnp", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pk", 0 ],
                    "source": [ "low", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mpp", 0 ],
                    "source": [ "mall", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "mpp", 0 ],
                    "source": [ "mnone", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "roll", 0 ],
                    "source": [ "mpp", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "low", 0 ],
                    "source": [ "obj-10", 0 ]
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
                    "destination": [ "ex", 0 ],
                    "order": 1,
                    "source": [ "pk", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "unp", 0 ],
                    "order": 0,
                    "source": [ "pk", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ptog", 0 ],
                    "source": [ "plm", 0 ]
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
                    "destination": [ "out-pitch", 0 ],
                    "source": [ "pon", 0 ]
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
                    "destination": [ "pon", 0 ],
                    "source": [ "pscale", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pmidi", 0 ],
                    "source": [ "psnap", 0 ]
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
                    "destination": [ "g_gen", 0 ],
                    "source": [ "ptmm", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pon", 1 ],
                    "source": [ "ptog", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "tmenu", 0 ],
                    "source": [ "ptset", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ldm", 0 ],
                    "order": 1,
                    "source": [ "ptun", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ptset", 0 ],
                    "order": 0,
                    "source": [ "ptun", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "g_gen", 0 ],
                    "source": [ "rge", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "g_gen", 0 ],
                    "source": [ "rgs", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "rge", 0 ],
                    "source": [ "rgu", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "rgs", 0 ],
                    "source": [ "rgu", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "pk", 1 ],
                    "source": [ "rng", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-10", 0 ],
                    "order": 0,
                    "source": [ "roll", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "rt", 0 ],
                    "order": 1,
                    "source": [ "roll", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "bufm", 0 ],
                    "source": [ "rt", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "lnp", 0 ],
                    "source": [ "rt", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "rgu", 0 ],
                    "source": [ "rt", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "roll", 0 ],
                    "source": [ "smax", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "roll", 0 ],
                    "source": [ "smin", 0 ]
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
                    "destination": [ "stg", 0 ],
                    "order": 0,
                    "source": [ "steps", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "stp", 0 ],
                    "order": 1,
                    "source": [ "steps", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "g_gen", 0 ],
                    "source": [ "stg", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "roll", 0 ],
                    "source": [ "stp", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "roll", 0 ],
                    "source": [ "ths", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "ptun", 0 ],
                    "source": [ "tmenu", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "smin", 0 ],
                    "source": [ "unp", 0 ]
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
                    "destination": [ "pjs", 0 ],
                    "source": [ "pjs_slotfilter", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "g_gen", 5 ],
                    "destination": [ "sq_bsnap", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "sq_bsnap", 0 ],
                    "destination": [ "sq_bchg", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "sq_bchg", 0 ],
                    "destination": [ "sq_bpp", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "sq_bpp", 0 ],
                    "destination": [ "roll", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "sq_dsp", 0 ],
                    "destination": [ "sq_dsppp", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "sq_dsppp", 0 ],
                    "destination": [ "roll", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "roll", 0 ],
                    "destination": [ "sq_rt", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "sq_rt", 0 ],
                    "destination": [ "g_gen", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "sq_rt", 1 ],
                    "destination": [ "sq_setst", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "sq_setst", 0 ],
                    "destination": [ "steps", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "sq_rt", 2 ],
                    "destination": [ "sq_setsq", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "sq_setsq", 0 ],
                    "destination": [ "sq_box", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "sq_box", 0 ],
                    "destination": [ "sq_m1", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "sq_m1", 0 ],
                    "destination": [ "sq_pseq", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "sq_pseq", 0 ],
                    "destination": [ "roll", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "sq_minus", 0 ],
                    "destination": [ "sq_minus_m", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "sq_minus_m", 0 ],
                    "destination": [ "roll", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "sq_plus", 0 ],
                    "destination": [ "sq_plus_m", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "sq_plus_m", 0 ],
                    "destination": [ "roll", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "sq_copy", 0 ],
                    "destination": [ "sq_copy_m", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "sq_copy_m", 0 ],
                    "destination": [ "roll", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "sq_paste", 0 ],
                    "destination": [ "sq_paste_m", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "sq_paste_m", 0 ],
                    "destination": [ "roll", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "sq_clear", 0 ],
                    "destination": [ "sq_clear_m", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "sq_clear_m", 0 ],
                    "destination": [ "roll", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "obj-8", 0 ],
                    "destination": [ "sq_dlg", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "sq_dlg", 0 ],
                    "destination": [ "obj-9", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "sq_in", 0 ],
                    "destination": [ "sq_m1", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "apat", 1 ],
                    "destination": [ "sq_box", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "apat", 1 ],
                    "destination": [ "steps", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "apat", 1 ],
                    "destination": [ "obj-8", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "sw_box", 0 ],
                    "destination": [ "sw_pp", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "sw_pp", 0 ],
                    "destination": [ "roll", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "sq_rt", 3 ],
                    "destination": [ "sw_set", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "sw_set", 0 ],
                    "destination": [ "sw_box", 0 ]
                }
            },
            {
                "patchline": {
                    "source": [ "apat", 1 ],
                    "destination": [ "sw_box", 0 ]
                }
            }
        ],
        "parameters": {
            "g_env-obj-2": [ "function", "function", 0 ],
            "g_env-obj-242": [ "slider[13]", "slider[8]", 0 ],
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