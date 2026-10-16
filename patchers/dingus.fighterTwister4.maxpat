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
        "rect": [ 34.0, 92.0, 2236.0, 1170.0 ],
        "openinpresentation": 1,
        "integercoordinates": 1,
        "boxes": [
            {
                "box": {
                    "id": "obj-140",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 2,
                    "outlettype": [ "int", "int" ],
                    "patching_rect": [ 321.0000006854534, 148.0, 63.0, 22.0 ],
                    "text": "split 33 64"
                }
            },
            {
                "box": {
                    "id": "obj-96",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "patching_rect": [ 305.0000006854534, 176.0, 29.5, 22.0 ],
                    "text": "- 32"
                }
            },
            {
                "box": {
                    "id": "obj-95",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 701.8000118136406, 159.0, 32.0, 22.0 ],
                    "text": "gate"
                }
            },
            {
                "box": {
                    "id": "obj-94",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "patching_rect": [ 700.8000118136406, 114.40000170469284, 33.0, 22.0 ],
                    "text": "== 1"
                }
            },
            {
                "box": {
                    "id": "obj-88",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 473.40000957250595, 129.5, 175.0, 22.0 ],
                    "text": "expr ($f1 >= 33) && ($f1 <= 64)"
                }
            },
            {
                "box": {
                    "id": "obj-307",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 444.40000957250595, 165.0, 32.0, 22.0 ],
                    "text": "gate"
                }
            },
            {
                "box": {
                    "fontsize": 10.0,
                    "id": "obj-92",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 864.8000128865242, 137.0, 161.0, 29.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 11.0, 181.0, 183.40000295639038, 18.0 ],
                    "text": "13              14              15               16"
                }
            },
            {
                "box": {
                    "fontsize": 10.0,
                    "id": "obj-91",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 864.8000128865242, 82.0, 159.0, 29.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 15.0, 132.0, 183.40000295639038, 18.0 ],
                    "text": "9               10              11              12"
                }
            },
            {
                "box": {
                    "fontsize": 10.0,
                    "id": "obj-90",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 864.8000128865242, 40.0, 159.0, 29.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 15.0, 83.0, 183.40000295639038, 18.0 ],
                    "text": "5               6                 7                8"
                }
            },
            {
                "box": {
                    "fontsize": 10.0,
                    "id": "obj-89",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 862.5000135302544, 3.0, 159.0, 29.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 15.0, 34.0, 183.40000295639038, 18.0 ],
                    "text": "1               2                 3                4"
                }
            },
            {
                "box": {
                    "comment": "16",
                    "id": "obj-158",
                    "index": 32,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1726.0, 1014.0, 30.0, 30.0 ],
                    "tricolor": [ 0.21568627450980393, 0.30980392156862746, 1.0, 1.0 ]
                }
            },
            {
                "box": {
                    "comment": "15",
                    "id": "obj-159",
                    "index": 31,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1687.0, 1014.0, 30.0, 30.0 ],
                    "tricolor": [ 0.21568627450980393, 0.30980392156862746, 1.0, 1.0 ]
                }
            },
            {
                "box": {
                    "comment": "14",
                    "id": "obj-160",
                    "index": 30,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1647.0, 1014.0, 30.0, 30.0 ],
                    "tricolor": [ 0.21568627450980393, 0.30980392156862746, 1.0, 1.0 ]
                }
            },
            {
                "box": {
                    "comment": "13",
                    "id": "obj-161",
                    "index": 29,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1608.0, 1014.0, 30.0, 30.0 ],
                    "tricolor": [ 0.21568627450980393, 0.30980392156862746, 1.0, 1.0 ]
                }
            },
            {
                "box": {
                    "comment": "12",
                    "id": "obj-162",
                    "index": 28,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1568.0, 1014.0, 30.0, 30.0 ],
                    "tricolor": [ 0.21568627450980393, 0.30980392156862746, 1.0, 1.0 ]
                }
            },
            {
                "box": {
                    "comment": "11",
                    "id": "obj-163",
                    "index": 27,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1529.0, 1014.0, 30.0, 30.0 ],
                    "tricolor": [ 0.21568627450980393, 0.30980392156862746, 1.0, 1.0 ]
                }
            },
            {
                "box": {
                    "comment": "10",
                    "id": "obj-164",
                    "index": 26,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1490.0, 1014.0, 30.0, 30.0 ],
                    "tricolor": [ 0.21568627450980393, 0.30980392156862746, 1.0, 1.0 ]
                }
            },
            {
                "box": {
                    "comment": "9",
                    "id": "obj-165",
                    "index": 25,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1450.0, 1014.0, 30.0, 30.0 ],
                    "tricolor": [ 0.21568627450980393, 0.30980392156862746, 1.0, 1.0 ]
                }
            },
            {
                "box": {
                    "comment": "8",
                    "id": "obj-166",
                    "index": 24,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1411.0, 1014.0, 30.0, 30.0 ],
                    "tricolor": [ 0.21568627450980393, 0.30980392156862746, 1.0, 1.0 ]
                }
            },
            {
                "box": {
                    "comment": "7",
                    "id": "obj-167",
                    "index": 23,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1371.0, 1014.0, 30.0, 30.0 ],
                    "tricolor": [ 0.21568627450980393, 0.30980392156862746, 1.0, 1.0 ]
                }
            },
            {
                "box": {
                    "comment": "6",
                    "id": "obj-168",
                    "index": 22,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1332.0, 1014.0, 30.0, 30.0 ],
                    "tricolor": [ 0.21568627450980393, 0.30980392156862746, 1.0, 1.0 ]
                }
            },
            {
                "box": {
                    "comment": "5",
                    "id": "obj-169",
                    "index": 21,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1293.0, 1014.0, 30.0, 30.0 ],
                    "tricolor": [ 0.21568627450980393, 0.30980392156862746, 1.0, 1.0 ]
                }
            },
            {
                "box": {
                    "comment": "4",
                    "id": "obj-170",
                    "index": 20,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1253.0, 1014.0, 30.0, 30.0 ],
                    "tricolor": [ 0.21568627450980393, 0.30980392156862746, 1.0, 1.0 ]
                }
            },
            {
                "box": {
                    "comment": "3",
                    "id": "obj-171",
                    "index": 19,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1214.0, 1014.0, 30.0, 30.0 ],
                    "tricolor": [ 0.21568627450980393, 0.30980392156862746, 1.0, 1.0 ]
                }
            },
            {
                "box": {
                    "comment": "2",
                    "id": "obj-172",
                    "index": 18,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1174.0, 1014.0, 30.0, 30.0 ],
                    "tricolor": [ 0.21568627450980393, 0.30980392156862746, 1.0, 1.0 ]
                }
            },
            {
                "box": {
                    "comment": "1",
                    "id": "obj-173",
                    "index": 17,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1140.0, 1014.0, 30.0, 30.0 ],
                    "tricolor": [ 0.21568627450980393, 0.30980392156862746, 1.0, 1.0 ]
                }
            },
            {
                "box": {
                    "comment": "SIG 16",
                    "id": "obj-150",
                    "index": 16,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 884.9999999999997, 1014.0, 30.0, 30.0 ],
                    "tricolor": [ 0.21568627450980393, 1.0, 0.3176470588235294, 1.0 ]
                }
            },
            {
                "box": {
                    "comment": "SIG 15",
                    "id": "obj-151",
                    "index": 15,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 845.5999999999997, 1014.0, 30.0, 30.0 ],
                    "tricolor": [ 0.21568627450980393, 1.0, 0.3176470588235294, 1.0 ]
                }
            },
            {
                "box": {
                    "comment": "SIG 14",
                    "id": "obj-152",
                    "index": 14,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 806.1999999999997, 1014.0, 30.0, 30.0 ],
                    "tricolor": [ 0.21568627450980393, 1.0, 0.3176470588235294, 1.0 ]
                }
            },
            {
                "box": {
                    "comment": "SIG 13",
                    "id": "obj-153",
                    "index": 13,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 766.7999999999997, 1014.0, 30.0, 30.0 ],
                    "tricolor": [ 0.21568627450980393, 1.0, 0.3176470588235294, 1.0 ]
                }
            },
            {
                "box": {
                    "comment": "SIG 12",
                    "id": "obj-154",
                    "index": 12,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 727.3999999999997, 1014.0, 30.0, 30.0 ],
                    "tricolor": [ 0.21568627450980393, 1.0, 0.3176470588235294, 1.0 ]
                }
            },
            {
                "box": {
                    "comment": "SIG 11",
                    "id": "obj-155",
                    "index": 11,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 687.9999999999998, 1014.0, 30.0, 30.0 ],
                    "tricolor": [ 0.21568627450980393, 1.0, 0.3176470588235294, 1.0 ]
                }
            },
            {
                "box": {
                    "comment": "SIG 10",
                    "id": "obj-156",
                    "index": 10,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 648.5999999999998, 1014.0, 30.0, 30.0 ],
                    "tricolor": [ 0.21568627450980393, 1.0, 0.3176470588235294, 1.0 ]
                }
            },
            {
                "box": {
                    "comment": "SIG 9",
                    "id": "obj-157",
                    "index": 9,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 609.1999999999998, 1014.0, 30.0, 30.0 ],
                    "tricolor": [ 0.21568627450980393, 1.0, 0.3176470588235294, 1.0 ]
                }
            },
            {
                "box": {
                    "comment": "SIG 8",
                    "id": "obj-146",
                    "index": 8,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 569.7999999999998, 1014.0, 30.0, 30.0 ],
                    "tricolor": [ 0.21568627450980393, 1.0, 0.3176470588235294, 1.0 ]
                }
            },
            {
                "box": {
                    "comment": "SIG 7",
                    "id": "obj-147",
                    "index": 7,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 530.3999999999999, 1014.0, 30.0, 30.0 ],
                    "tricolor": [ 0.21568627450980393, 1.0, 0.3176470588235294, 1.0 ]
                }
            },
            {
                "box": {
                    "comment": "SIG 6",
                    "id": "obj-148",
                    "index": 6,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 490.9999999999999, 1014.0, 30.0, 30.0 ],
                    "tricolor": [ 0.21568627450980393, 1.0, 0.3176470588235294, 1.0 ]
                }
            },
            {
                "box": {
                    "comment": "SIG 5",
                    "id": "obj-149",
                    "index": 5,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 451.5999999999999, 1014.0, 30.0, 30.0 ],
                    "tricolor": [ 0.21568627450980393, 1.0, 0.3176470588235294, 1.0 ]
                }
            },
            {
                "box": {
                    "comment": "SIG 4",
                    "id": "obj-145",
                    "index": 4,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 412.19999999999993, 1014.0, 30.0, 30.0 ],
                    "tricolor": [ 0.21568627450980393, 1.0, 0.3176470588235294, 1.0 ]
                }
            },
            {
                "box": {
                    "comment": "SIG 3",
                    "id": "obj-144",
                    "index": 3,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 372.79999999999995, 1014.0, 30.0, 30.0 ],
                    "tricolor": [ 0.21568627450980393, 1.0, 0.3176470588235294, 1.0 ]
                }
            },
            {
                "box": {
                    "comment": "SIG 2",
                    "id": "obj-143",
                    "index": 2,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 333.4, 1014.0, 30.0, 30.0 ],
                    "tricolor": [ 0.21568627450980393, 1.0, 0.3176470588235294, 1.0 ]
                }
            },
            {
                "box": {
                    "comment": "SIG 1",
                    "id": "obj-142",
                    "index": 1,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 294.0, 1014.0, 30.0, 30.0 ],
                    "tricolor": [ 0.21568627450980393, 1.0, 0.3176470588235294, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-134",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 1153.0, 911.0, 67.0, 22.0 ],
                    "text": "route voice"
                }
            },
            {
                "box": {
                    "id": "obj-133",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 16,
                    "outlettype": [ "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "" ],
                    "patching_rect": [ 1152.8571428571427, 959.6000146269798, 576.1428571428573, 22.0 ],
                    "text": "gate 16"
                }
            },
            {
                "box": {
                    "id": "obj-131",
                    "maxclass": "newobj",
                    "numinlets": 16,
                    "numoutlets": 1,
                    "outlettype": [ "multichannelsignal" ],
                    "patching_rect": [ 1153.0, 815.0, 341.0, 22.0 ],
                    "text": "mc.pack~ 16"
                }
            },
            {
                "box": {
                    "id": "obj-93",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 1153.0, 863.0, 100.0, 22.0 ],
                    "text": "mc.snapshot~ 10"
                }
            },
            {
                "box": {
                    "id": "obj-87",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 953.2000086903572, 318.0, 58.0, 22.0 ],
                    "text": "loadbang"
                }
            },
            {
                "box": {
                    "id": "obj-83",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 347.80000281333923, 687.200008392334, 88.0, 22.0 ],
                    "text": "dingus.updateKnobs"
                }
            },
            {
                "box": {
                    "id": "obj-84",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 252.80000281333923, 687.200008392334, 88.0, 22.0 ],
                    "text": "dingus.updateKnobs"
                }
            },
            {
                "box": {
                    "id": "obj-85",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 155.80000281333923, 687.200008392334, 88.0, 22.0 ],
                    "text": "dingus.updateKnobs"
                }
            },
            {
                "box": {
                    "id": "obj-86",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 58.80000281333923, 687.200008392334, 88.0, 22.0 ],
                    "text": "dingus.updateKnobs"
                }
            },
            {
                "box": {
                    "id": "obj-79",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 347.80000281333923, 647.200008392334, 88.0, 22.0 ],
                    "text": "dingus.updateKnobs"
                }
            },
            {
                "box": {
                    "id": "obj-80",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 252.80000281333923, 647.200008392334, 88.0, 22.0 ],
                    "text": "dingus.updateKnobs"
                }
            },
            {
                "box": {
                    "id": "obj-81",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 155.80000281333923, 647.200008392334, 88.0, 22.0 ],
                    "text": "dingus.updateKnobs"
                }
            },
            {
                "box": {
                    "id": "obj-82",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 58.80000281333923, 647.200008392334, 88.0, 22.0 ],
                    "text": "dingus.updateKnobs"
                }
            },
            {
                "box": {
                    "id": "obj-75",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 347.80000281333923, 604.200008392334, 88.0, 22.0 ],
                    "text": "dingus.updateKnobs"
                }
            },
            {
                "box": {
                    "id": "obj-76",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 252.80000281333923, 604.200008392334, 88.0, 22.0 ],
                    "text": "dingus.updateKnobs"
                }
            },
            {
                "box": {
                    "id": "obj-77",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 155.80000281333923, 604.200008392334, 88.0, 22.0 ],
                    "text": "dingus.updateKnobs"
                }
            },
            {
                "box": {
                    "id": "obj-78",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 58.80000281333923, 604.200008392334, 88.0, 22.0 ],
                    "text": "dingus.updateKnobs"
                }
            },
            {
                "box": {
                    "id": "obj-74",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 347.80000281333923, 563.200008392334, 88.0, 22.0 ],
                    "text": "dingus.updateKnobs"
                }
            },
            {
                "box": {
                    "id": "obj-73",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 252.80000281333923, 563.200008392334, 88.0, 22.0 ],
                    "text": "dingus.updateKnobs"
                }
            },
            {
                "box": {
                    "id": "obj-72",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 155.80000281333923, 563.200008392334, 88.0, 22.0 ],
                    "text": "dingus.updateKnobs"
                }
            },
            {
                "box": {
                    "id": "obj-71",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 58.80000281333923, 563.200008392334, 88.0, 22.0 ],
                    "text": "dingus.updateKnobs"
                }
            },
            {
                "box": {
                    "id": "obj-49",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 783.2000086903572, 901.0, 125.0, 22.0 ],
                    "text": "dingus.twisterLooperBank4"
                }
            },
            {
                "box": {
                    "id": "obj-52",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 920.2000086903572, 901.0, 125.0, 22.0 ],
                    "text": "dingus.twisterLooperBank4"
                }
            },
            {
                "box": {
                    "id": "obj-55",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 492.2000086903572, 897.0, 125.0, 22.0 ],
                    "text": "dingus.twisterLooperBank4"
                }
            },
            {
                "box": {
                    "id": "obj-58",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 629.2000086903572, 897.0, 125.0, 22.0 ],
                    "text": "dingus.twisterLooperBank4"
                }
            },
            {
                "box": {
                    "id": "obj-61",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 783.2000086903572, 755.0, 125.0, 22.0 ],
                    "text": "dingus.twisterLooperBank4"
                }
            },
            {
                "box": {
                    "id": "obj-64",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 920.2000086903572, 755.0, 125.0, 22.0 ],
                    "text": "dingus.twisterLooperBank4"
                }
            },
            {
                "box": {
                    "id": "obj-67",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 492.2000086903572, 751.0, 125.0, 22.0 ],
                    "text": "dingus.twisterLooperBank4"
                }
            },
            {
                "box": {
                    "id": "obj-70",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 629.2000086903572, 751.0, 125.0, 22.0 ],
                    "text": "dingus.twisterLooperBank4"
                }
            },
            {
                "box": {
                    "id": "obj-32",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 791.0, 605.0, 125.0, 22.0 ],
                    "text": "dingus.twisterLooperBank4"
                }
            },
            {
                "box": {
                    "id": "obj-38",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 928.0, 605.0, 125.0, 22.0 ],
                    "text": "dingus.twisterLooperBank4"
                }
            },
            {
                "box": {
                    "id": "obj-43",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 500.0, 601.0, 125.0, 22.0 ],
                    "text": "dingus.twisterLooperBank4"
                }
            },
            {
                "box": {
                    "id": "obj-46",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 637.0, 601.0, 125.0, 22.0 ],
                    "text": "dingus.twisterLooperBank4"
                }
            },
            {
                "box": {
                    "id": "obj-10",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 790.5000124573708, 459.0, 125.0, 22.0 ],
                    "text": "dingus.twisterLooperBank4"
                }
            },
            {
                "box": {
                    "id": "obj-29",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 927.5000124573708, 459.0, 125.0, 22.0 ],
                    "text": "dingus.twisterLooperBank4"
                }
            },
            {
                "box": {
                    "id": "obj-5",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 500.0, 455.0, 125.0, 22.0 ],
                    "text": "dingus.twisterLooperBank4"
                }
            },
            {
                "box": {
                    "id": "obj-1",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 637.0, 455.0, 125.0, 22.0 ],
                    "text": "dingus.twisterLooperBank4"
                }
            },
            {
                "box": {
                    "id": "obj-47",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 997.8000162243843, 857.6000127792358, 50.0, 22.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_invisible": 1,
                            "parameter_longname": "number[126]",
                            "parameter_modmode": 0,
                            "parameter_shortname": "number",
                            "parameter_type": 3
                        }
                    },
                    "varname": "number[8]"
                }
            },
            {
                "box": {
                    "activebgcolor": [ 0.058823529411764705, 0.058823529411764705, 0.058823529411764705, 1.0 ],
                    "activelinecolor": [ 0.49019607843137253, 1.0, 0.7607843137254902, 1.0 ],
                    "id": "obj-48",
                    "maxclass": "live.scope~",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 925.8000151515007, 936.8000139594078, 86.40000128746033, 44.80000066757202 ],
                    "presentation": 1,
                    "presentation_rect": [ 345.6000051498413, 134.40000200271606, 42.400000631809235, 41.600000619888306 ],
                    "range": [ -0.1, 1.1 ]
                }
            },
            {
                "box": {
                    "id": "obj-50",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 857.8000141382217, 857.6000127792358, 50.0, 22.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_invisible": 1,
                            "parameter_longname": "number[127]",
                            "parameter_modmode": 0,
                            "parameter_shortname": "number",
                            "parameter_type": 3
                        }
                    },
                    "varname": "number[9]"
                }
            },
            {
                "box": {
                    "activebgcolor": [ 0.058823529411764705, 0.058823529411764705, 0.058823529411764705, 1.0 ],
                    "activelinecolor": [ 0.49019607843137253, 1.0, 0.7607843137254902, 1.0 ],
                    "id": "obj-51",
                    "maxclass": "live.scope~",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 785.8000130653381, 936.8000139594078, 86.40000128746033, 44.80000066757202 ],
                    "presentation": 1,
                    "presentation_rect": [ 297.60000443458557, 134.40000200271606, 42.400000631809235, 41.600000619888306 ],
                    "range": [ -0.1, 1.1 ]
                }
            },
            {
                "box": {
                    "id": "obj-53",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 701.8000118136406, 857.6000127792358, 50.0, 22.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_invisible": 1,
                            "parameter_longname": "number[123]",
                            "parameter_modmode": 0,
                            "parameter_shortname": "number",
                            "parameter_type": 3
                        }
                    },
                    "varname": "number[10]"
                }
            },
            {
                "box": {
                    "activebgcolor": [ 0.058823529411764705, 0.058823529411764705, 0.058823529411764705, 1.0 ],
                    "activelinecolor": [ 0.49019607843137253, 1.0, 0.7607843137254902, 1.0 ],
                    "id": "obj-54",
                    "maxclass": "live.scope~",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 629.800010740757, 936.0000139474869, 86.40000128746033, 44.80000066757202 ],
                    "presentation": 1,
                    "presentation_rect": [ 249.60000371932983, 134.40000200271606, 42.400000631809235, 41.600000619888306 ],
                    "range": [ -0.1, 1.1 ]
                }
            },
            {
                "box": {
                    "id": "obj-56",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 561.800009727478, 856.8000127673149, 50.0, 22.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_invisible": 1,
                            "parameter_longname": "number[114]",
                            "parameter_modmode": 0,
                            "parameter_shortname": "number",
                            "parameter_type": 3
                        }
                    },
                    "varname": "number[11]"
                }
            },
            {
                "box": {
                    "activebgcolor": [ 0.058823529411764705, 0.058823529411764705, 0.058823529411764705, 1.0 ],
                    "activelinecolor": [ 0.49019607843137253, 1.0, 0.7607843137254902, 1.0 ],
                    "id": "obj-57",
                    "maxclass": "live.scope~",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 489.8000086545944, 936.0000139474869, 86.40000128746033, 44.80000066757202 ],
                    "presentation": 1,
                    "presentation_rect": [ 202.40000301599503, 134.40000200271606, 42.400000631809235, 41.600000619888306 ],
                    "range": [ -0.1, 1.1 ]
                }
            },
            {
                "box": {
                    "id": "obj-59",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 1000.2000162601471, 712.8000106215477, 50.0, 22.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_invisible": 1,
                            "parameter_longname": "number[119]",
                            "parameter_modmode": 0,
                            "parameter_shortname": "number",
                            "parameter_type": 3
                        }
                    },
                    "varname": "number[12]"
                }
            },
            {
                "box": {
                    "activebgcolor": [ 0.058823529411764705, 0.058823529411764705, 0.058823529411764705, 1.0 ],
                    "activelinecolor": [ 0.49019607843137253, 1.0, 0.7607843137254902, 1.0 ],
                    "id": "obj-60",
                    "maxclass": "live.scope~",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 928.2000151872635, 792.0000118017197, 86.40000128746033, 44.80000066757202 ],
                    "presentation": 1,
                    "presentation_rect": [ 345.6000051498413, 91.2000013589859, 42.400000631809235, 41.600000619888306 ],
                    "range": [ -0.1, 1.1 ]
                }
            },
            {
                "box": {
                    "id": "obj-62",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 860.2000141739845, 712.8000106215477, 50.0, 22.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_invisible": 1,
                            "parameter_longname": "number[120]",
                            "parameter_modmode": 0,
                            "parameter_shortname": "number",
                            "parameter_type": 3
                        }
                    },
                    "varname": "number[13]"
                }
            },
            {
                "box": {
                    "activebgcolor": [ 0.058823529411764705, 0.058823529411764705, 0.058823529411764705, 1.0 ],
                    "activelinecolor": [ 0.49019607843137253, 1.0, 0.7607843137254902, 1.0 ],
                    "id": "obj-63",
                    "maxclass": "live.scope~",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 788.2000131011009, 792.0000118017197, 86.40000128746033, 44.80000066757202 ],
                    "presentation": 1,
                    "presentation_rect": [ 297.60000443458557, 91.2000013589859, 42.400000631809235, 41.600000619888306 ],
                    "range": [ -0.1, 1.1 ]
                }
            },
            {
                "box": {
                    "id": "obj-65",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 704.2000118494034, 712.0000106096268, 50.0, 22.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_invisible": 1,
                            "parameter_longname": "number[115]",
                            "parameter_modmode": 0,
                            "parameter_shortname": "number",
                            "parameter_type": 3
                        }
                    },
                    "varname": "number[14]"
                }
            },
            {
                "box": {
                    "activebgcolor": [ 0.058823529411764705, 0.058823529411764705, 0.058823529411764705, 1.0 ],
                    "activelinecolor": [ 0.49019607843137253, 1.0, 0.7607843137254902, 1.0 ],
                    "id": "obj-66",
                    "maxclass": "live.scope~",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 632.2000107765198, 791.2000117897987, 86.40000128746033, 44.80000066757202 ],
                    "presentation": 1,
                    "presentation_rect": [ 249.60000371932983, 91.2000013589859, 42.400000631809235, 41.600000619888306 ],
                    "range": [ -0.1, 1.1 ]
                }
            },
            {
                "box": {
                    "id": "obj-68",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 564.2000097632408, 712.0000106096268, 50.0, 22.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_invisible": 1,
                            "parameter_longname": "number[112]",
                            "parameter_modmode": 0,
                            "parameter_shortname": "number",
                            "parameter_type": 3
                        }
                    },
                    "varname": "number[15]"
                }
            },
            {
                "box": {
                    "activebgcolor": [ 0.058823529411764705, 0.058823529411764705, 0.058823529411764705, 1.0 ],
                    "activelinecolor": [ 0.49019607843137253, 1.0, 0.7607843137254902, 1.0 ],
                    "id": "obj-69",
                    "maxclass": "live.scope~",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 492.2000086903572, 791.2000117897987, 86.40000128746033, 44.80000066757202 ],
                    "presentation": 1,
                    "presentation_rect": [ 202.40000301599503, 91.2000013589859, 42.400000631809235, 41.600000619888306 ],
                    "range": [ -0.1, 1.1 ]
                }
            },
            {
                "box": {
                    "id": "obj-30",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 1002.5000156164169, 564.0000084042549, 50.0, 22.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_invisible": 1,
                            "parameter_longname": "number[125]",
                            "parameter_modmode": 0,
                            "parameter_shortname": "number",
                            "parameter_type": 3
                        }
                    },
                    "varname": "number[4]"
                }
            },
            {
                "box": {
                    "activebgcolor": [ 0.058823529411764705, 0.058823529411764705, 0.058823529411764705, 1.0 ],
                    "activelinecolor": [ 0.49019607843137253, 1.0, 0.7607843137254902, 1.0 ],
                    "id": "obj-31",
                    "maxclass": "live.scope~",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 930.5000145435333, 643.2000095844269, 86.40000128746033, 44.80000066757202 ],
                    "presentation": 1,
                    "presentation_rect": [ 345.6000051498413, 47.20000070333481, 42.400000631809235, 41.600000619888306 ],
                    "range": [ -0.1, 1.1 ]
                }
            },
            {
                "box": {
                    "id": "obj-34",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 862.5000135302544, 564.0000084042549, 50.0, 22.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_invisible": 1,
                            "parameter_longname": "number[121]",
                            "parameter_modmode": 0,
                            "parameter_shortname": "number",
                            "parameter_type": 3
                        }
                    },
                    "varname": "number[5]"
                }
            },
            {
                "box": {
                    "activebgcolor": [ 0.058823529411764705, 0.058823529411764705, 0.058823529411764705, 1.0 ],
                    "activelinecolor": [ 0.49019607843137253, 1.0, 0.7607843137254902, 1.0 ],
                    "id": "obj-36",
                    "maxclass": "live.scope~",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 790.5000124573708, 643.2000095844269, 86.40000128746033, 44.80000066757202 ],
                    "presentation": 1,
                    "presentation_rect": [ 297.60000443458557, 47.20000070333481, 42.400000631809235, 41.600000619888306 ],
                    "range": [ -0.1, 1.1 ]
                }
            },
            {
                "box": {
                    "id": "obj-40",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 706.5000112056732, 564.0000084042549, 50.0, 22.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_invisible": 1,
                            "parameter_longname": "number[117]",
                            "parameter_modmode": 0,
                            "parameter_shortname": "number",
                            "parameter_type": 3
                        }
                    },
                    "varname": "number[6]"
                }
            },
            {
                "box": {
                    "activebgcolor": [ 0.058823529411764705, 0.058823529411764705, 0.058823529411764705, 1.0 ],
                    "activelinecolor": [ 0.49019607843137253, 1.0, 0.7607843137254902, 1.0 ],
                    "id": "obj-42",
                    "maxclass": "live.scope~",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 634.5000101327896, 642.400009572506, 86.40000128746033, 44.80000066757202 ],
                    "presentation": 1,
                    "presentation_rect": [ 249.60000371932983, 47.20000070333481, 42.400000631809235, 41.600000619888306 ],
                    "range": [ -0.1, 1.1 ]
                }
            },
            {
                "box": {
                    "id": "obj-44",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 566.5000091195107, 563.200008392334, 50.0, 22.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_invisible": 1,
                            "parameter_longname": "number[124]",
                            "parameter_modmode": 0,
                            "parameter_shortname": "number",
                            "parameter_type": 3
                        }
                    },
                    "varname": "number[7]"
                }
            },
            {
                "box": {
                    "activebgcolor": [ 0.058823529411764705, 0.058823529411764705, 0.058823529411764705, 1.0 ],
                    "activelinecolor": [ 0.49019607843137253, 1.0, 0.7607843137254902, 1.0 ],
                    "id": "obj-45",
                    "maxclass": "live.scope~",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 494.50000804662704, 642.400009572506, 86.40000128746033, 44.80000066757202 ],
                    "presentation": 1,
                    "presentation_rect": [ 202.40000301599503, 47.20000070333481, 42.400000631809235, 41.600000619888306 ],
                    "range": [ -0.1, 1.1 ]
                }
            },
            {
                "box": {
                    "id": "obj-6",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 1004.8000149726868, 419.2000062465668, 50.0, 22.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_invisible": 1,
                            "parameter_longname": "number[122]",
                            "parameter_modmode": 0,
                            "parameter_shortname": "number",
                            "parameter_type": 3
                        }
                    },
                    "varname": "number[2]"
                }
            },
            {
                "box": {
                    "activebgcolor": [ 0.058823529411764705, 0.058823529411764705, 0.058823529411764705, 1.0 ],
                    "activelinecolor": [ 0.49019607843137253, 1.0, 0.7607843137254902, 1.0 ],
                    "id": "obj-7",
                    "maxclass": "live.scope~",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 932.8000138998032, 498.40000742673874, 86.40000128746033, 44.80000066757202 ],
                    "presentation": 1,
                    "presentation_rect": [ 345.6000051498413, 4.000000059604645, 42.400000631809235, 41.600000619888306 ],
                    "range": [ -0.1, 1.1 ]
                }
            },
            {
                "box": {
                    "id": "obj-11",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 864.8000128865242, 419.2000062465668, 50.0, 22.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_invisible": 1,
                            "parameter_longname": "number[113]",
                            "parameter_modmode": 0,
                            "parameter_shortname": "number",
                            "parameter_type": 3
                        }
                    },
                    "varname": "number[3]"
                }
            },
            {
                "box": {
                    "activebgcolor": [ 0.058823529411764705, 0.058823529411764705, 0.058823529411764705, 1.0 ],
                    "activelinecolor": [ 0.49019607843137253, 1.0, 0.7607843137254902, 1.0 ],
                    "id": "obj-14",
                    "maxclass": "live.scope~",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 792.8000118136406, 498.40000742673874, 86.40000128746033, 44.80000066757202 ],
                    "presentation": 1,
                    "presentation_rect": [ 297.60000443458557, 4.000000059604645, 42.400000631809235, 41.600000619888306 ],
                    "range": [ -0.1, 1.1 ]
                }
            },
            {
                "box": {
                    "id": "obj-2",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 709.0, 418.6000074148178, 50.0, 22.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_invisible": 1,
                            "parameter_longname": "number[116]",
                            "parameter_modmode": 0,
                            "parameter_shortname": "number",
                            "parameter_type": 3
                        }
                    },
                    "varname": "number[1]"
                }
            },
            {
                "box": {
                    "activebgcolor": [ 0.058823529411764705, 0.058823529411764705, 0.058823529411764705, 1.0 ],
                    "activelinecolor": [ 0.49019607843137253, 1.0, 0.7607843137254902, 1.0 ],
                    "id": "obj-3",
                    "maxclass": "live.scope~",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 637.0, 497.6000074148178, 86.40000128746033, 44.80000066757202 ],
                    "presentation": 1,
                    "presentation_rect": [ 249.60000371932983, 4.000000059604645, 42.400000631809235, 41.600000619888306 ],
                    "range": [ -0.1, 1.1 ]
                }
            },
            {
                "box": {
                    "id": "obj-129",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 568.8000074028969, 418.4000047445297, 50.0, 22.0 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_invisible": 1,
                            "parameter_longname": "number[118]",
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
                    "activebgcolor": [ 0.058823529411764705, 0.058823529411764705, 0.058823529411764705, 1.0 ],
                    "activelinecolor": [ 0.49019607843137253, 1.0, 0.7607843137254902, 1.0 ],
                    "id": "obj-121",
                    "maxclass": "live.scope~",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 496.8000074028969, 497.6000074148178, 86.40000128746033, 44.80000066757202 ],
                    "presentation": 1,
                    "presentation_rect": [ 202.40000301599503, 4.000000059604645, 42.400000631809235, 41.600000619888306 ],
                    "range": [ -0.1, 1.1 ]
                }
            },
            {
                "box": {
                    "activedialcolor": [ 1.0, 0.490196078431373, 0.262745098039216, 1.0 ],
                    "activeneedlecolor": [ 0.7449800372123718, 0.5960335731506348, 0.9997496008872986, 1.0 ],
                    "id": "obj-21",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 386.4000007212162, 446.0, 50.400000751018524, 48.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 148.00000220537186, 142.40000212192535, 50.400000751018524, 48.0 ],
                    "saved_attribute_attributes": {
                        "activedialcolor": {
                            "expression": "themecolor.live_alert"
                        },
                        "activeneedlecolor": {
                            "expression": ""
                        },
                        "textcolor": {
                            "expression": "themecolor.live_contrast_frame"
                        },
                        "valueof": {
                            "parameter_longname": "live.dial[46]",
                            "parameter_modmode": 3,
                            "parameter_shortname": "live.dial",
                            "parameter_type": 0,
                            "parameter_unitstyle": 0
                        }
                    },
                    "textcolor": [ 0.085986146707648, 0.111866603132643, 0.137126436129282, 1.0 ],
                    "varname": "live.dial[8]"
                }
            },
            {
                "box": {
                    "activedialcolor": [ 1.0, 0.490196078431373, 0.262745098039216, 1.0 ],
                    "activeneedlecolor": [ 0.7449800372123718, 0.5960335731506348, 0.9997496008872986, 1.0 ],
                    "id": "obj-22",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 340.4000007212162, 446.0, 50.400000751018524, 48.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 97.60000145435333, 142.40000212192535, 50.400000751018524, 48.0 ],
                    "saved_attribute_attributes": {
                        "activedialcolor": {
                            "expression": "themecolor.live_alert"
                        },
                        "activeneedlecolor": {
                            "expression": ""
                        },
                        "textcolor": {
                            "expression": "themecolor.live_contrast_frame"
                        },
                        "valueof": {
                            "parameter_longname": "live.dial[41]",
                            "parameter_modmode": 3,
                            "parameter_shortname": "live.dial",
                            "parameter_type": 0,
                            "parameter_unitstyle": 0
                        }
                    },
                    "textcolor": [ 0.085986146707648, 0.111866603132643, 0.137126436129282, 1.0 ],
                    "varname": "live.dial[9]"
                }
            },
            {
                "box": {
                    "activedialcolor": [ 1.0, 0.490196078431373, 0.262745098039216, 1.0 ],
                    "activeneedlecolor": [ 0.7449800372123718, 0.5960335731506348, 0.9997496008872986, 1.0 ],
                    "id": "obj-23",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 288.4000007212162, 446.0, 50.400000751018524, 48.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 46.40000069141388, 142.40000212192535, 50.400000751018524, 48.0 ],
                    "saved_attribute_attributes": {
                        "activedialcolor": {
                            "expression": "themecolor.live_alert"
                        },
                        "activeneedlecolor": {
                            "expression": ""
                        },
                        "textcolor": {
                            "expression": "themecolor.live_contrast_frame"
                        },
                        "valueof": {
                            "parameter_longname": "live.dial[38]",
                            "parameter_modmode": 3,
                            "parameter_shortname": "live.dial",
                            "parameter_type": 0,
                            "parameter_unitstyle": 0
                        }
                    },
                    "textcolor": [ 0.085986146707648, 0.111866603132643, 0.137126436129282, 1.0 ],
                    "varname": "live.dial[10]"
                }
            },
            {
                "box": {
                    "activedialcolor": [ 1.0, 0.490196078431373, 0.262745098039216, 1.0 ],
                    "activeneedlecolor": [ 0.7449800372123718, 0.5960335731506348, 0.9997496008872986, 1.0 ],
                    "id": "obj-24",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 248.4000007212162, 446.0, 50.400000751018524, 48.0 ],
                    "presentation": 1,
                    "presentation_rect": [ -3.200000047683716, 142.40000212192535, 50.400000751018524, 48.0 ],
                    "saved_attribute_attributes": {
                        "activedialcolor": {
                            "expression": "themecolor.live_alert"
                        },
                        "activeneedlecolor": {
                            "expression": ""
                        },
                        "textcolor": {
                            "expression": "themecolor.live_contrast_frame"
                        },
                        "valueof": {
                            "parameter_longname": "live.dial[39]",
                            "parameter_modmode": 3,
                            "parameter_shortname": "live.dial",
                            "parameter_type": 0,
                            "parameter_unitstyle": 0
                        }
                    },
                    "textcolor": [ 0.085986146707648, 0.111866603132643, 0.137126436129282, 1.0 ],
                    "varname": "live.dial[11]"
                }
            },
            {
                "box": {
                    "activedialcolor": [ 1.0, 0.490196078431373, 0.262745098039216, 1.0 ],
                    "activeneedlecolor": [ 0.7449800372123718, 0.5960335731506348, 0.9997496008872986, 1.0 ],
                    "id": "obj-25",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 387.4000007212162, 388.0, 50.400000751018524, 48.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 148.00000220537186, 94.40000140666962, 50.400000751018524, 48.0 ],
                    "saved_attribute_attributes": {
                        "activedialcolor": {
                            "expression": "themecolor.live_alert"
                        },
                        "activeneedlecolor": {
                            "expression": ""
                        },
                        "textcolor": {
                            "expression": "themecolor.live_contrast_frame"
                        },
                        "valueof": {
                            "parameter_longname": "live.dial[33]",
                            "parameter_modmode": 3,
                            "parameter_shortname": "live.dial",
                            "parameter_type": 0,
                            "parameter_unitstyle": 0
                        }
                    },
                    "textcolor": [ 0.085986146707648, 0.111866603132643, 0.137126436129282, 1.0 ],
                    "varname": "live.dial[12]"
                }
            },
            {
                "box": {
                    "activedialcolor": [ 1.0, 0.490196078431373, 0.262745098039216, 1.0 ],
                    "activeneedlecolor": [ 0.7449800372123718, 0.5960335731506348, 0.9997496008872986, 1.0 ],
                    "id": "obj-26",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 334.4000007212162, 388.0, 50.400000751018524, 48.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 97.60000145435333, 94.40000140666962, 50.400000751018524, 48.0 ],
                    "saved_attribute_attributes": {
                        "activedialcolor": {
                            "expression": "themecolor.live_alert"
                        },
                        "activeneedlecolor": {
                            "expression": ""
                        },
                        "textcolor": {
                            "expression": "themecolor.live_contrast_frame"
                        },
                        "valueof": {
                            "parameter_longname": "live.dial[47]",
                            "parameter_modmode": 3,
                            "parameter_shortname": "live.dial",
                            "parameter_type": 0,
                            "parameter_unitstyle": 0
                        }
                    },
                    "textcolor": [ 0.085986146707648, 0.111866603132643, 0.137126436129282, 1.0 ],
                    "varname": "live.dial[13]"
                }
            },
            {
                "box": {
                    "activedialcolor": [ 1.0, 0.490196078431373, 0.262745098039216, 1.0 ],
                    "activeneedlecolor": [ 0.7449800372123718, 0.5960335731506348, 0.9997496008872986, 1.0 ],
                    "id": "obj-27",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 288.4000007212162, 388.0, 50.400000751018524, 48.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 46.40000069141388, 94.40000140666962, 50.400000751018524, 48.0 ],
                    "saved_attribute_attributes": {
                        "activedialcolor": {
                            "expression": "themecolor.live_alert"
                        },
                        "activeneedlecolor": {
                            "expression": ""
                        },
                        "textcolor": {
                            "expression": "themecolor.live_contrast_frame"
                        },
                        "valueof": {
                            "parameter_longname": "live.dial[44]",
                            "parameter_modmode": 3,
                            "parameter_shortname": "live.dial",
                            "parameter_type": 0,
                            "parameter_unitstyle": 0
                        }
                    },
                    "textcolor": [ 0.085986146707648, 0.111866603132643, 0.137126436129282, 1.0 ],
                    "varname": "live.dial[14]"
                }
            },
            {
                "box": {
                    "activedialcolor": [ 1.0, 0.490196078431373, 0.262745098039216, 1.0 ],
                    "activeneedlecolor": [ 0.7449800372123718, 0.5960335731506348, 0.9997496008872986, 1.0 ],
                    "id": "obj-28",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 248.4000007212162, 388.0, 50.400000751018524, 48.0 ],
                    "presentation": 1,
                    "presentation_rect": [ -3.200000047683716, 94.40000140666962, 50.400000751018524, 48.0 ],
                    "saved_attribute_attributes": {
                        "activedialcolor": {
                            "expression": "themecolor.live_alert"
                        },
                        "activeneedlecolor": {
                            "expression": ""
                        },
                        "textcolor": {
                            "expression": "themecolor.live_contrast_frame"
                        },
                        "valueof": {
                            "parameter_longname": "live.dial[42]",
                            "parameter_modmode": 3,
                            "parameter_shortname": "live.dial",
                            "parameter_type": 0,
                            "parameter_unitstyle": 0
                        }
                    },
                    "textcolor": [ 0.085986146707648, 0.111866603132643, 0.137126436129282, 1.0 ],
                    "varname": "live.dial[15]"
                }
            },
            {
                "box": {
                    "activedialcolor": [ 1.0, 0.490196078431373, 0.262745098039216, 1.0 ],
                    "activeneedlecolor": [ 0.7449800372123718, 0.5960335731506348, 0.9997496008872986, 1.0 ],
                    "id": "obj-17",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 386.4000007212162, 327.0, 50.400000751018524, 48.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 148.00000220537186, 46.40000069141388, 50.400000751018524, 48.0 ],
                    "saved_attribute_attributes": {
                        "activedialcolor": {
                            "expression": "themecolor.live_alert"
                        },
                        "activeneedlecolor": {
                            "expression": ""
                        },
                        "textcolor": {
                            "expression": "themecolor.live_contrast_frame"
                        },
                        "valueof": {
                            "parameter_longname": "live.dial[45]",
                            "parameter_modmode": 3,
                            "parameter_shortname": "live.dial",
                            "parameter_type": 0,
                            "parameter_unitstyle": 0
                        }
                    },
                    "textcolor": [ 0.085986146707648, 0.111866603132643, 0.137126436129282, 1.0 ],
                    "varname": "live.dial[4]"
                }
            },
            {
                "box": {
                    "activedialcolor": [ 1.0, 0.490196078431373, 0.262745098039216, 1.0 ],
                    "activeneedlecolor": [ 0.7449800372123718, 0.5960335731506348, 0.9997496008872986, 1.0 ],
                    "id": "obj-18",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 340.4000007212162, 327.0, 50.400000751018524, 48.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 97.60000145435333, 46.40000069141388, 50.400000751018524, 48.0 ],
                    "saved_attribute_attributes": {
                        "activedialcolor": {
                            "expression": "themecolor.live_alert"
                        },
                        "activeneedlecolor": {
                            "expression": ""
                        },
                        "textcolor": {
                            "expression": "themecolor.live_contrast_frame"
                        },
                        "valueof": {
                            "parameter_longname": "live.dial[32]",
                            "parameter_modmode": 3,
                            "parameter_shortname": "live.dial",
                            "parameter_type": 0,
                            "parameter_unitstyle": 0
                        }
                    },
                    "textcolor": [ 0.085986146707648, 0.111866603132643, 0.137126436129282, 1.0 ],
                    "varname": "live.dial[5]"
                }
            },
            {
                "box": {
                    "activedialcolor": [ 1.0, 0.490196078431373, 0.262745098039216, 1.0 ],
                    "activeneedlecolor": [ 0.7449800372123718, 0.5960335731506348, 0.9997496008872986, 1.0 ],
                    "id": "obj-19",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 288.4000007212162, 327.0, 50.400000751018524, 48.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 46.40000069141388, 46.40000069141388, 50.400000751018524, 48.0 ],
                    "saved_attribute_attributes": {
                        "activedialcolor": {
                            "expression": "themecolor.live_alert"
                        },
                        "activeneedlecolor": {
                            "expression": ""
                        },
                        "textcolor": {
                            "expression": "themecolor.live_contrast_frame"
                        },
                        "valueof": {
                            "parameter_longname": "live.dial[40]",
                            "parameter_modmode": 3,
                            "parameter_shortname": "live.dial",
                            "parameter_type": 0,
                            "parameter_unitstyle": 0
                        }
                    },
                    "textcolor": [ 0.085986146707648, 0.111866603132643, 0.137126436129282, 1.0 ],
                    "varname": "live.dial[6]"
                }
            },
            {
                "box": {
                    "activedialcolor": [ 1.0, 0.490196078431373, 0.262745098039216, 1.0 ],
                    "activeneedlecolor": [ 0.7449800372123718, 0.5960335731506348, 0.9997496008872986, 1.0 ],
                    "id": "obj-20",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 248.4000007212162, 327.0, 50.400000751018524, 48.0 ],
                    "presentation": 1,
                    "presentation_rect": [ -3.200000047683716, 46.40000069141388, 50.400000751018524, 48.0 ],
                    "saved_attribute_attributes": {
                        "activedialcolor": {
                            "expression": "themecolor.live_alert"
                        },
                        "activeneedlecolor": {
                            "expression": ""
                        },
                        "textcolor": {
                            "expression": "themecolor.live_contrast_frame"
                        },
                        "valueof": {
                            "parameter_longname": "live.dial[43]",
                            "parameter_modmode": 3,
                            "parameter_shortname": "live.dial",
                            "parameter_type": 0,
                            "parameter_unitstyle": 0
                        }
                    },
                    "textcolor": [ 0.085986146707648, 0.111866603132643, 0.137126436129282, 1.0 ],
                    "varname": "live.dial[7]"
                }
            },
            {
                "box": {
                    "activedialcolor": [ 1.0, 0.490196078431373, 0.262745098039216, 1.0 ],
                    "activeneedlecolor": [ 0.7449800372123718, 0.5960335731506348, 0.9997496008872986, 1.0 ],
                    "id": "obj-15",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 386.4000007212162, 268.80000400543213, 50.400000751018524, 48.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 148.00000220537186, -1.600000023841858, 50.400000751018524, 48.0 ],
                    "saved_attribute_attributes": {
                        "activedialcolor": {
                            "expression": "themecolor.live_alert"
                        },
                        "activeneedlecolor": {
                            "expression": ""
                        },
                        "textcolor": {
                            "expression": "themecolor.live_contrast_frame"
                        },
                        "valueof": {
                            "parameter_longname": "live.dial[36]",
                            "parameter_modmode": 3,
                            "parameter_shortname": "live.dial",
                            "parameter_type": 0,
                            "parameter_unitstyle": 0
                        }
                    },
                    "textcolor": [ 0.085986146707648, 0.111866603132643, 0.137126436129282, 1.0 ],
                    "varname": "live.dial[2]"
                }
            },
            {
                "box": {
                    "activedialcolor": [ 1.0, 0.490196078431373, 0.262745098039216, 1.0 ],
                    "activeneedlecolor": [ 0.7449800372123718, 0.5960335731506348, 0.9997496008872986, 1.0 ],
                    "id": "obj-16",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 333.5999999344349, 268.80000400543213, 50.400000751018524, 48.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 97.60000145435333, -1.600000023841858, 50.400000751018524, 48.0 ],
                    "saved_attribute_attributes": {
                        "activedialcolor": {
                            "expression": "themecolor.live_alert"
                        },
                        "activeneedlecolor": {
                            "expression": ""
                        },
                        "textcolor": {
                            "expression": "themecolor.live_contrast_frame"
                        },
                        "valueof": {
                            "parameter_longname": "live.dial[35]",
                            "parameter_modmode": 3,
                            "parameter_shortname": "live.dial",
                            "parameter_type": 0,
                            "parameter_unitstyle": 0
                        }
                    },
                    "textcolor": [ 0.085986146707648, 0.111866603132643, 0.137126436129282, 1.0 ],
                    "varname": "live.dial[3]"
                }
            },
            {
                "box": {
                    "id": "obj-13",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 4,
                    "outlettype": [ "", "", "", "" ],
                    "patching_rect": [ 46.0, 90.0, 56.0, 22.0 ],
                    "restore": {
                        "live.dial": [ 0.0 ],
                        "live.dial[10]": [ 127.0 ],
                        "live.dial[11]": [ 47.0 ],
                        "live.dial[12]": [ 0.0 ],
                        "live.dial[13]": [ 4.0 ],
                        "live.dial[14]": [ 60.0 ],
                        "live.dial[15]": [ 18.0 ],
                        "live.dial[1]": [ 0.0 ],
                        "live.dial[2]": [ 0.0 ],
                        "live.dial[3]": [ 0.0 ],
                        "live.dial[4]": [ 0.0 ],
                        "live.dial[5]": [ 0.0 ],
                        "live.dial[6]": [ 0.0 ],
                        "live.dial[7]": [ 0.0 ],
                        "live.dial[8]": [ 0.0 ],
                        "live.dial[9]": [ 0.0 ],
                        "number": [ 33 ],
                        "number[10]": [ 46 ],
                        "number[11]": [ 45 ],
                        "number[12]": [ 44 ],
                        "number[13]": [ 43 ],
                        "number[14]": [ 42 ],
                        "number[15]": [ 41 ],
                        "number[1]": [ 34 ],
                        "number[2]": [ 36 ],
                        "number[3]": [ 35 ],
                        "number[4]": [ 40 ],
                        "number[5]": [ 39 ],
                        "number[6]": [ 38 ],
                        "number[7]": [ 37 ],
                        "number[8]": [ 48 ],
                        "number[9]": [ 47 ]
                    },
                    "text": "autopattr",
                    "varname": "u839006053"
                }
            },
            {
                "box": {
                    "activedialcolor": [ 1.0, 0.490196078431373, 0.262745098039216, 1.0 ],
                    "activeneedlecolor": [ 0.7449800372123718, 0.5960335731506348, 0.9997496008872986, 1.0 ],
                    "id": "obj-12",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 287.199999243021, 268.80000400543213, 50.400000751018524, 48.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 46.40000069141388, -1.600000023841858, 50.400000751018524, 48.0 ],
                    "saved_attribute_attributes": {
                        "activedialcolor": {
                            "expression": "themecolor.live_alert"
                        },
                        "activeneedlecolor": {
                            "expression": ""
                        },
                        "textcolor": {
                            "expression": "themecolor.live_contrast_frame"
                        },
                        "valueof": {
                            "parameter_longname": "live.dial[34]",
                            "parameter_modmode": 3,
                            "parameter_shortname": "live.dial",
                            "parameter_type": 0,
                            "parameter_unitstyle": 0
                        }
                    },
                    "textcolor": [ 0.085986146707648, 0.111866603132643, 0.137126436129282, 1.0 ],
                    "varname": "live.dial[1]"
                }
            },
            {
                "box": {
                    "id": "obj-9",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 32,
                    "outlettype": [ "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "" ],
                    "patching_rect": [ 247.20000368356705, 211.20000314712524, 395.2000058889389, 22.0 ],
                    "text": "gate 32"
                }
            },
            {
                "box": {
                    "activedialcolor": [ 1.0, 0.490196078431373, 0.262745098039216, 1.0 ],
                    "activeneedlecolor": [ 0.7449800372123718, 0.5960335731506348, 0.9997496008872986, 1.0 ],
                    "id": "obj-8",
                    "maxclass": "live.dial",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "float" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 247.20000368356705, 268.80000400543213, 50.400000751018524, 48.0 ],
                    "presentation": 1,
                    "presentation_rect": [ -3.200000047683716, -1.600000023841858, 50.400000751018524, 48.0 ],
                    "saved_attribute_attributes": {
                        "activedialcolor": {
                            "expression": "themecolor.live_alert"
                        },
                        "activeneedlecolor": {
                            "expression": ""
                        },
                        "textcolor": {
                            "expression": "themecolor.live_contrast_frame"
                        },
                        "valueof": {
                            "parameter_longname": "live.dial[37]",
                            "parameter_modmode": 3,
                            "parameter_shortname": "live.dial",
                            "parameter_type": 0,
                            "parameter_unitstyle": 0
                        }
                    },
                    "textcolor": [ 0.085986146707648, 0.111866603132643, 0.137126436129282, 1.0 ],
                    "varname": "live.dial"
                }
            },
            {
                "box": {
                    "id": "obj-41",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 247.39999902248383, 114.40000170469284, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-39",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 378.79999631643295, 97.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-37",
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 313.0, 114.40000170469284, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-35",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "int", "int" ],
                    "patching_rect": [ 247.20000368356705, 55.0, 150.5999926328659, 22.0 ],
                    "text": "ctlin \"Midi Fighter Twister\""
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "obj-131", 1 ],
                    "order": 0,
                    "source": [ "obj-1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-143", 0 ],
                    "order": 2,
                    "source": [ "obj-1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-3", 0 ],
                    "order": 1,
                    "source": [ "obj-1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-72", 0 ],
                    "order": 3,
                    "source": [ "obj-1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-131", 2 ],
                    "order": 0,
                    "source": [ "obj-10", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-14", 0 ],
                    "order": 1,
                    "source": [ "obj-10", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-144", 0 ],
                    "order": 2,
                    "source": [ "obj-10", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-73", 0 ],
                    "order": 3,
                    "source": [ "obj-10", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-10", 2 ],
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
                    "destination": [ "obj-5", 2 ],
                    "source": [ "obj-129", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-93", 0 ],
                    "source": [ "obj-131", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-158", 0 ],
                    "source": [ "obj-133", 15 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-159", 0 ],
                    "source": [ "obj-133", 14 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-160", 0 ],
                    "source": [ "obj-133", 13 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-161", 0 ],
                    "source": [ "obj-133", 12 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-162", 0 ],
                    "source": [ "obj-133", 11 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-163", 0 ],
                    "source": [ "obj-133", 10 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-164", 0 ],
                    "source": [ "obj-133", 9 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-165", 0 ],
                    "source": [ "obj-133", 8 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-166", 0 ],
                    "source": [ "obj-133", 7 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-167", 0 ],
                    "source": [ "obj-133", 6 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-168", 0 ],
                    "source": [ "obj-133", 5 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-169", 0 ],
                    "source": [ "obj-133", 4 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-170", 0 ],
                    "source": [ "obj-133", 3 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-171", 0 ],
                    "source": [ "obj-133", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-172", 0 ],
                    "source": [ "obj-133", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-173", 0 ],
                    "source": [ "obj-133", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-133", 0 ],
                    "source": [ "obj-134", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-96", 0 ],
                    "source": [ "obj-140", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-29", 0 ],
                    "source": [ "obj-15", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-10", 0 ],
                    "source": [ "obj-16", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-38", 0 ],
                    "source": [ "obj-17", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-32", 0 ],
                    "source": [ "obj-18", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-46", 0 ],
                    "source": [ "obj-19", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 2 ],
                    "source": [ "obj-2", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-43", 0 ],
                    "source": [ "obj-20", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-52", 0 ],
                    "source": [ "obj-21", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-49", 0 ],
                    "source": [ "obj-22", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-58", 0 ],
                    "source": [ "obj-23", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-55", 0 ],
                    "source": [ "obj-24", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-64", 0 ],
                    "source": [ "obj-25", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-61", 0 ],
                    "source": [ "obj-26", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-70", 0 ],
                    "source": [ "obj-27", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-67", 0 ],
                    "source": [ "obj-28", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-131", 3 ],
                    "order": 0,
                    "source": [ "obj-29", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-145", 0 ],
                    "order": 2,
                    "source": [ "obj-29", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-7", 0 ],
                    "order": 1,
                    "source": [ "obj-29", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-74", 0 ],
                    "order": 3,
                    "source": [ "obj-29", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-38", 2 ],
                    "source": [ "obj-30", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-95", 1 ],
                    "source": [ "obj-307", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-131", 6 ],
                    "order": 0,
                    "source": [ "obj-32", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-147", 0 ],
                    "order": 2,
                    "source": [ "obj-32", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-36", 0 ],
                    "order": 1,
                    "source": [ "obj-32", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-76", 0 ],
                    "order": 3,
                    "source": [ "obj-32", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-32", 2 ],
                    "source": [ "obj-34", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-37", 0 ],
                    "source": [ "obj-35", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-39", 0 ],
                    "source": [ "obj-35", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-41", 0 ],
                    "source": [ "obj-35", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-140", 0 ],
                    "order": 1,
                    "source": [ "obj-37", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-88", 0 ],
                    "order": 0,
                    "source": [ "obj-37", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-131", 7 ],
                    "order": 0,
                    "source": [ "obj-38", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-146", 0 ],
                    "order": 2,
                    "source": [ "obj-38", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-31", 0 ],
                    "order": 1,
                    "source": [ "obj-38", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-75", 0 ],
                    "order": 3,
                    "source": [ "obj-38", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-94", 0 ],
                    "source": [ "obj-39", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-46", 2 ],
                    "source": [ "obj-40", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-307", 1 ],
                    "source": [ "obj-41", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-131", 4 ],
                    "order": 0,
                    "source": [ "obj-43", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-149", 0 ],
                    "order": 2,
                    "source": [ "obj-43", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-45", 0 ],
                    "order": 1,
                    "source": [ "obj-43", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-78", 0 ],
                    "order": 3,
                    "source": [ "obj-43", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-43", 2 ],
                    "source": [ "obj-44", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-131", 5 ],
                    "order": 0,
                    "source": [ "obj-46", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-148", 0 ],
                    "order": 2,
                    "source": [ "obj-46", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-42", 0 ],
                    "order": 1,
                    "source": [ "obj-46", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-77", 0 ],
                    "order": 3,
                    "source": [ "obj-46", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-52", 2 ],
                    "source": [ "obj-47", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-131", 14 ],
                    "order": 0,
                    "source": [ "obj-49", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-151", 0 ],
                    "order": 1,
                    "source": [ "obj-49", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-51", 0 ],
                    "order": 2,
                    "source": [ "obj-49", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-84", 0 ],
                    "order": 3,
                    "source": [ "obj-49", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-121", 0 ],
                    "order": 1,
                    "source": [ "obj-5", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-131", 0 ],
                    "order": 0,
                    "source": [ "obj-5", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-142", 0 ],
                    "order": 2,
                    "source": [ "obj-5", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-71", 0 ],
                    "order": 3,
                    "source": [ "obj-5", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-49", 2 ],
                    "source": [ "obj-50", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-131", 15 ],
                    "order": 0,
                    "source": [ "obj-52", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-150", 0 ],
                    "order": 2,
                    "source": [ "obj-52", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-48", 0 ],
                    "order": 1,
                    "source": [ "obj-52", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-83", 0 ],
                    "order": 3,
                    "source": [ "obj-52", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-58", 2 ],
                    "source": [ "obj-53", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-131", 12 ],
                    "order": 0,
                    "source": [ "obj-55", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-153", 0 ],
                    "order": 1,
                    "source": [ "obj-55", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-57", 0 ],
                    "order": 2,
                    "source": [ "obj-55", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-86", 0 ],
                    "order": 3,
                    "source": [ "obj-55", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-55", 2 ],
                    "source": [ "obj-56", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-131", 13 ],
                    "order": 0,
                    "source": [ "obj-58", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-152", 0 ],
                    "order": 1,
                    "source": [ "obj-58", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-54", 0 ],
                    "order": 2,
                    "source": [ "obj-58", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-85", 0 ],
                    "order": 3,
                    "source": [ "obj-58", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-64", 2 ],
                    "source": [ "obj-59", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-29", 2 ],
                    "source": [ "obj-6", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-131", 10 ],
                    "order": 0,
                    "source": [ "obj-61", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-155", 0 ],
                    "order": 2,
                    "source": [ "obj-61", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-63", 0 ],
                    "order": 1,
                    "source": [ "obj-61", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-80", 0 ],
                    "order": 3,
                    "source": [ "obj-61", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-61", 2 ],
                    "source": [ "obj-62", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-131", 11 ],
                    "order": 0,
                    "source": [ "obj-64", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-154", 0 ],
                    "order": 2,
                    "source": [ "obj-64", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-60", 0 ],
                    "order": 1,
                    "source": [ "obj-64", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-79", 0 ],
                    "order": 3,
                    "source": [ "obj-64", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-70", 2 ],
                    "source": [ "obj-65", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-131", 8 ],
                    "order": 0,
                    "source": [ "obj-67", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-157", 0 ],
                    "order": 1,
                    "source": [ "obj-67", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-69", 0 ],
                    "order": 2,
                    "source": [ "obj-67", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-82", 0 ],
                    "order": 3,
                    "source": [ "obj-67", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-67", 2 ],
                    "source": [ "obj-68", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-131", 9 ],
                    "order": 0,
                    "source": [ "obj-70", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-156", 0 ],
                    "order": 1,
                    "source": [ "obj-70", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-66", 0 ],
                    "order": 2,
                    "source": [ "obj-70", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-81", 0 ],
                    "order": 3,
                    "source": [ "obj-70", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-8", 0 ],
                    "source": [ "obj-71", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-12", 0 ],
                    "source": [ "obj-72", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-16", 0 ],
                    "source": [ "obj-73", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-15", 0 ],
                    "source": [ "obj-74", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-17", 0 ],
                    "source": [ "obj-75", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-18", 0 ],
                    "source": [ "obj-76", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-19", 0 ],
                    "source": [ "obj-77", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-20", 0 ],
                    "source": [ "obj-78", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-25", 0 ],
                    "source": [ "obj-79", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-5", 0 ],
                    "source": [ "obj-8", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-26", 0 ],
                    "source": [ "obj-80", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-27", 0 ],
                    "source": [ "obj-81", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-28", 0 ],
                    "source": [ "obj-82", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-21", 0 ],
                    "source": [ "obj-83", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-22", 0 ],
                    "source": [ "obj-84", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-23", 0 ],
                    "source": [ "obj-85", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-24", 0 ],
                    "source": [ "obj-86", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-11", 0 ],
                    "order": 4,
                    "source": [ "obj-87", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-129", 0 ],
                    "order": 12,
                    "source": [ "obj-87", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-2", 0 ],
                    "order": 8,
                    "source": [ "obj-87", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-30", 0 ],
                    "order": 1,
                    "source": [ "obj-87", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-34", 0 ],
                    "order": 5,
                    "source": [ "obj-87", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-40", 0 ],
                    "order": 9,
                    "source": [ "obj-87", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-44", 0 ],
                    "order": 13,
                    "source": [ "obj-87", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-47", 0 ],
                    "order": 3,
                    "source": [ "obj-87", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-50", 0 ],
                    "order": 7,
                    "source": [ "obj-87", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-53", 0 ],
                    "order": 11,
                    "source": [ "obj-87", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-56", 0 ],
                    "order": 15,
                    "source": [ "obj-87", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-59", 0 ],
                    "order": 2,
                    "source": [ "obj-87", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-6", 0 ],
                    "order": 0,
                    "source": [ "obj-87", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-62", 0 ],
                    "order": 6,
                    "source": [ "obj-87", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-65", 0 ],
                    "order": 10,
                    "source": [ "obj-87", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-68", 0 ],
                    "order": 14,
                    "source": [ "obj-87", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-307", 0 ],
                    "source": [ "obj-88", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 1 ],
                    "source": [ "obj-9", 17 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-10", 1 ],
                    "source": [ "obj-9", 18 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-12", 0 ],
                    "source": [ "obj-9", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-15", 0 ],
                    "source": [ "obj-9", 3 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-16", 0 ],
                    "source": [ "obj-9", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-17", 0 ],
                    "source": [ "obj-9", 7 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-18", 0 ],
                    "source": [ "obj-9", 6 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-19", 0 ],
                    "source": [ "obj-9", 5 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-20", 0 ],
                    "source": [ "obj-9", 4 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-21", 0 ],
                    "source": [ "obj-9", 15 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-22", 0 ],
                    "source": [ "obj-9", 14 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-23", 0 ],
                    "source": [ "obj-9", 13 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-24", 0 ],
                    "source": [ "obj-9", 12 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-25", 0 ],
                    "source": [ "obj-9", 11 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-26", 0 ],
                    "source": [ "obj-9", 10 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-27", 0 ],
                    "source": [ "obj-9", 9 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-28", 0 ],
                    "source": [ "obj-9", 8 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-29", 1 ],
                    "source": [ "obj-9", 19 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-32", 1 ],
                    "source": [ "obj-9", 22 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-38", 1 ],
                    "source": [ "obj-9", 23 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-43", 1 ],
                    "source": [ "obj-9", 20 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-46", 1 ],
                    "source": [ "obj-9", 21 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-49", 1 ],
                    "source": [ "obj-9", 30 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-5", 1 ],
                    "source": [ "obj-9", 16 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-52", 1 ],
                    "source": [ "obj-9", 31 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-55", 1 ],
                    "source": [ "obj-9", 28 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-58", 1 ],
                    "source": [ "obj-9", 29 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-61", 1 ],
                    "source": [ "obj-9", 26 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-64", 1 ],
                    "source": [ "obj-9", 27 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-67", 1 ],
                    "source": [ "obj-9", 24 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-70", 1 ],
                    "source": [ "obj-9", 25 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-8", 0 ],
                    "source": [ "obj-9", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-133", 1 ],
                    "order": 0,
                    "source": [ "obj-93", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-134", 0 ],
                    "source": [ "obj-93", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-134", 0 ],
                    "order": 1,
                    "source": [ "obj-93", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-95", 0 ],
                    "source": [ "obj-94", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-9", 1 ],
                    "source": [ "obj-95", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-9", 0 ],
                    "source": [ "obj-96", 0 ]
                }
            }
        ]
    }
}