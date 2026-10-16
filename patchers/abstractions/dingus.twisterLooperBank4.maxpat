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
        "rect": [ 588.0, 173.0, 1033.0, 780.0 ],
        "boxes": [
            {
                "box": {
                    "id": "obj-5",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 779.0, 164.0, 57.0, 22.0 ],
                    "text": "tosymbol"
                }
            },
            {
                "box": {
                    "id": "obj-12",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 779.0, 71.0, 58.0, 22.0 ],
                    "text": "loadbang"
                }
            },
            {
                "box": {
                    "id": "obj-163",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 779.0, 231.0, 72.0, 22.0 ],
                    "text": "prepend set"
                }
            },
            {
                "box": {
                    "id": "obj-162",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 779.0, 115.0, 86.0, 22.0 ],
                    "text": "random 10000"
                }
            },
            {
                "box": {
                    "id": "obj-153",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 590.800008058548, 717.6000092029572, 52.00000077486038, 20.0 ],
                    "text": "colors",
                    "textcolor": [ 0.4549019607843137, 0.8980392156862745, 1.0, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-151",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "patching_rect": [ 605.2000082731247, 684.8000087141991, 32.0, 22.0 ],
                    "text": "+ 16"
                }
            },
            {
                "box": {
                    "id": "obj-150",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 498.0000066757202, 535.2000064849854, 46.0, 22.0 ],
                    "text": "route 1"
                }
            },
            {
                "box": {
                    "id": "obj-149",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 525.2000070810318, 570.4000070095062, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-145",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 509.2000068426132, 716.0000091791153, 29.5, 22.0 ],
                    "text": "85"
                }
            },
            {
                "box": {
                    "id": "obj-143",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 533.2000072002411, 684.8000087141991, 29.5, 22.0 ],
                    "text": "35"
                }
            },
            {
                "box": {
                    "id": "obj-139",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 564.4000076651573, 684.8000087141991, 29.5, 22.0 ],
                    "text": "53"
                }
            },
            {
                "box": {
                    "id": "obj-131",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 644.4000088572502, 702.4000089764595, 29.5, 22.0 ],
                    "text": "1"
                }
            },
            {
                "box": {
                    "id": "obj-132",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 0,
                    "patching_rect": [ 582.8000079393387, 746.4000096321106, 153.0, 22.0 ],
                    "text": "ctlout \"Midi Fighter Twister\""
                }
            },
            {
                "box": {
                    "id": "obj-127",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 329.2000041604042, 590.4000073075294, 129.0, 22.0 ],
                    "text": "rampsmooth~ 100 100"
                }
            },
            {
                "box": {
                    "id": "obj-125",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "patching_rect": [ 618.8000084757805, 473.6000055670738, 29.5, 22.0 ],
                    "text": "> 0."
                }
            },
            {
                "box": {
                    "id": "obj-124",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "patching_rect": [ 618.8000084757805, 429.60000491142273, 81.0, 22.0 ],
                    "text": "snapshot~ 20"
                }
            },
            {
                "box": {
                    "id": "obj-123",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "patching_rect": [ 447.6000059247017, 540.0000065565109, 29.5, 22.0 ],
                    "text": "+ 1"
                }
            },
            {
                "box": {
                    "id": "obj-122",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 356.4000045657158, 540.0000065565109, 68.0, 22.0 ],
                    "text": "selector~ 2"
                }
            },
            {
                "box": {
                    "id": "obj-117",
                    "maxclass": "gswitch2",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 540.4000073075294, 516.800006210804, 39.0, 32.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-106",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 543.6000073552132, 396.80000442266464, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-104",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 543.6000073552132, 356.8000038266182, 46.0, 22.0 ],
                    "text": "route 1"
                }
            },
            {
                "box": {
                    "id": "obj-100",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "patching_rect": [ 543.6000073552132, 320.00000327825546, 42.0, 22.0 ],
                    "text": "< 200."
                }
            },
            {
                "box": {
                    "id": "obj-97",
                    "maxclass": "newobj",
                    "numinlets": 6,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 560.4000076055527, 572.0000070333481, 103.0, 22.0 ],
                    "text": "scale 0. 1. 0. 127."
                }
            },
            {
                "box": {
                    "id": "obj-96",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "patching_rect": [ 486.8000065088272, 473.6000055670738, 81.0, 22.0 ],
                    "text": "snapshot~ 20"
                }
            },
            {
                "box": {
                    "id": "obj-93",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 162.00000166893005, 197.60000145435333, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-90",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 338.80000430345535, 162.40000092983246, 35.0, 22.0 ],
                    "text": "clear"
                }
            },
            {
                "box": {
                    "id": "obj-80",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 326.0000041127205, 273.6000025868416, 29.5, 22.0 ],
                    "text": "0."
                }
            },
            {
                "box": {
                    "id": "obj-76",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 442.8000058531761, 320.00000327825546, 29.5, 22.0 ],
                    "text": "0."
                }
            },
            {
                "box": {
                    "id": "obj-74",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 457.20000606775284, 356.8000038266182, 31.0, 22.0 ],
                    "text": "sig~"
                }
            },
            {
                "box": {
                    "id": "obj-73",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 474.00000631809235, 320.00000327825546, 29.5, 22.0 ],
                    "text": "1."
                }
            },
            {
                "box": {
                    "id": "obj-58",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 2,
                    "outlettype": [ "signal", "signal" ],
                    "patching_rect": [ 306.8000038266182, 393.6000043749809, 195.0, 22.0 ],
                    "text": "groove~ k1 @loop 1 @loopinterp 1"
                }
            },
            {
                "box": {
                    "id": "obj-56",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 224.4000025987625, 332.8000034689903, 66.0, 22.0 ],
                    "text": "record~ k1"
                }
            },
            {
                "box": {
                    "id": "obj-55",
                    "maxclass": "newobj",
                    "numinlets": 6,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 50.0, 389.6000043153763, 103.0, 22.0 ],
                    "text": "scale 0. 127. 0. 1."
                }
            },
            {
                "box": {
                    "id": "obj-53",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 81.20000046491623, 442.4000051021576, 31.0, 22.0 ],
                    "text": "sig~"
                }
            },
            {
                "box": {
                    "id": "obj-50",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 256.40000307559967, 173.60000109672546, 33.0, 22.0 ],
                    "text": "fill 0."
                }
            },
            {
                "box": {
                    "id": "obj-48",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 193.20000213384628, 194.40000140666962, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-11",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "float", "" ],
                    "patching_rect": [ 198.80000221729279, 270.40000253915787, 35.0, 22.0 ],
                    "text": "timer"
                }
            },
            {
                "box": {
                    "id": "obj-38",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "float", "bang" ],
                    "patching_rect": [ 353.2000045180321, 207.20000159740448, 99.0, 22.0 ],
                    "text": "buffer~ k1 20000"
                }
            },
            {
                "box": {
                    "checkedcolor": [ 0.796078431372549, 0.07058823529411765, 0.07058823529411765, 1.0 ],
                    "id": "obj-31",
                    "ignoreclick": 1,
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 125.20000112056732, 205.60000157356262, 25.59999942779541, 25.59999942779541 ],
                    "presentation": 1,
                    "presentation_rect": [ 508.8000075817108, 270.20000348985195, 19.600000649690628, 19.600000649690628 ]
                }
            },
            {
                "box": {
                    "id": "obj-29",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 434.5500058531761, 100.0, 46.0, 22.0 ],
                    "text": "route 0"
                }
            },
            {
                "box": {
                    "id": "obj-7",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 756.4000105261803, 578.4000071287155, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-4",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 852.4000119566917, 578.4000071287155, 29.5, 22.0 ],
                    "text": "1"
                }
            },
            {
                "box": {
                    "id": "obj-2",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 0,
                    "patching_rect": [ 790.8000110387802, 622.4000077843666, 153.0, 22.0 ],
                    "text": "ctlout \"Midi Fighter Twister\""
                }
            },
            {
                "box": {
                    "comment": "",
                    "id": "obj-154",
                    "index": 1,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 49.99997970303343, 39.99999307801437, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "comment": "",
                    "id": "obj-155",
                    "index": 2,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 434.5500287030335, 39.99999307801437, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "comment": "",
                    "id": "obj-156",
                    "index": 3,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 692.0000407030334, 39.99999307801437, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "comment": "",
                    "id": "obj-157",
                    "index": 1,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 329.19999170303345, 828.4000330780144, 30.0, 30.0 ]
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "obj-104", 0 ],
                    "source": [ "obj-100", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-106", 0 ],
                    "source": [ "obj-104", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-76", 0 ],
                    "source": [ "obj-106", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-100", 0 ],
                    "order": 0,
                    "source": [ "obj-11", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-58", 2 ],
                    "order": 1,
                    "source": [ "obj-11", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-97", 0 ],
                    "source": [ "obj-117", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-162", 0 ],
                    "source": [ "obj-12", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-127", 0 ],
                    "source": [ "obj-122", 0 ]
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
                    "destination": [ "obj-125", 0 ],
                    "source": [ "obj-124", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-117", 0 ],
                    "order": 0,
                    "source": [ "obj-125", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-123", 0 ],
                    "order": 2,
                    "source": [ "obj-125", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-150", 0 ],
                    "order": 1,
                    "source": [ "obj-125", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-157", 0 ],
                    "source": [ "obj-127", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-132", 2 ],
                    "source": [ "obj-131", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-132", 0 ],
                    "source": [ "obj-139", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-132", 0 ],
                    "source": [ "obj-143", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-132", 0 ],
                    "source": [ "obj-145", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-139", 0 ],
                    "source": [ "obj-149", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-149", 0 ],
                    "source": [ "obj-150", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-132", 1 ],
                    "source": [ "obj-151", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-55", 0 ],
                    "source": [ "obj-154", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-29", 0 ],
                    "source": [ "obj-155", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-151", 0 ],
                    "order": 1,
                    "source": [ "obj-156", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-2", 1 ],
                    "order": 0,
                    "source": [ "obj-156", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-5", 0 ],
                    "source": [ "obj-162", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-38", 0 ],
                    "order": 0,
                    "source": [ "obj-163", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-56", 0 ],
                    "order": 2,
                    "source": [ "obj-163", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-58", 0 ],
                    "order": 1,
                    "source": [ "obj-163", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-143", 0 ],
                    "order": 0,
                    "source": [ "obj-29", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-145", 0 ],
                    "order": 0,
                    "source": [ "obj-29", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-31", 0 ],
                    "order": 3,
                    "source": [ "obj-29", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-31", 0 ],
                    "order": 4,
                    "source": [ "obj-29", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-48", 0 ],
                    "order": 2,
                    "source": [ "obj-29", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-73", 0 ],
                    "order": 1,
                    "source": [ "obj-29", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-76", 0 ],
                    "order": 1,
                    "source": [ "obj-29", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-80", 0 ],
                    "order": 2,
                    "source": [ "obj-29", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-93", 0 ],
                    "order": 3,
                    "source": [ "obj-29", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-56", 0 ],
                    "source": [ "obj-31", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-2", 2 ],
                    "source": [ "obj-4", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-11", 0 ],
                    "order": 1,
                    "source": [ "obj-48", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-50", 0 ],
                    "order": 0,
                    "source": [ "obj-48", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-163", 0 ],
                    "source": [ "obj-5", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-38", 0 ],
                    "source": [ "obj-50", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-122", 1 ],
                    "order": 0,
                    "source": [ "obj-53", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-56", 0 ],
                    "order": 1,
                    "source": [ "obj-53", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-53", 0 ],
                    "source": [ "obj-55", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-122", 2 ],
                    "order": 2,
                    "source": [ "obj-58", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-124", 0 ],
                    "order": 0,
                    "source": [ "obj-58", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-96", 0 ],
                    "order": 1,
                    "source": [ "obj-58", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-2", 0 ],
                    "source": [ "obj-7", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-74", 0 ],
                    "source": [ "obj-73", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-58", 0 ],
                    "source": [ "obj-74", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-74", 0 ],
                    "source": [ "obj-76", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-58", 0 ],
                    "source": [ "obj-80", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-38", 0 ],
                    "source": [ "obj-90", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-11", 1 ],
                    "source": [ "obj-93", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-117", 1 ],
                    "source": [ "obj-96", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-7", 0 ],
                    "source": [ "obj-97", 0 ]
                }
            }
        ]
    }
}