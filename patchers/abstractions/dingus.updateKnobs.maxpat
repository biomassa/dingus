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
        "rect": [ 59.0, 114.0, 1000.0, 780.0 ],
        "boxes": [
            {
                "box": {
                    "id": "obj-72",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "float" ],
                    "patching_rect": [ 98.4566732430458, 100.0, 81.0, 22.0 ],
                    "text": "snapshot~ 20"
                }
            },
            {
                "box": {
                    "id": "obj-71",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 52.94, 188.23664958000188, 72.0, 22.0 ],
                    "text": "prepend set"
                }
            },
            {
                "box": {
                    "id": "obj-70",
                    "maxclass": "newobj",
                    "numinlets": 6,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 50.0, 135.15664958000184, 97.0, 22.0 ],
                    "text": "scale 0. 1. 0 127"
                }
            },
            {
                "box": {
                    "comment": "",
                    "id": "obj-73",
                    "index": 1,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 98.456672, 40.00002358000188, 30.0, 30.0 ]
                }
            },
            {
                "box": {
                    "comment": "",
                    "id": "obj-74",
                    "index": 1,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 52.939993999999984, 270.23665658000186, 30.0, 30.0 ]
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "obj-71", 0 ],
                    "source": [ "obj-70", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-74", 0 ],
                    "source": [ "obj-71", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-70", 0 ],
                    "source": [ "obj-72", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-72", 0 ],
                    "source": [ "obj-73", 0 ]
                }
            }
        ]
    }
}