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
		"rect": [
			745.0,
			175.0,
			1293.0,
			988.0
		],
		"openinpresentation": 1,
		"integercoordinates": 1,
		"boxes": [
			{
				"box": {
					"id": "obj-9",
					"linecount": 2,
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						1250.0,
						380.0,
						100.0,
						35.0
					],
					"presentation": 1,
					"presentation_rect": [
						126.0,
						235.0,
						102.0,
						22.0
					],
					"saved_object_attributes": {
						"alias": "",
						"group": ""
					},
					"text": "maxmcp voltages"
				}
			},
			{
				"box": {
					"id": "obj-10",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						330.0,
						90.0,
						35.0,
						22.0
					],
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
					"outlettype": [
						""
					],
					"patching_rect": [
						330.0,
						40.0,
						30.0,
						30.0
					]
				}
			},
			{
				"box": {
					"id": "obj-3",
					"maxclass": "newobj",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						"signal"
					],
					"patching_rect": [
						1250.0,
						80.0,
						29.5,
						22.0
					],
					"text": "*~"
				}
			},
			{
				"box": {
					"id": "obj-6",
					"int": 1,
					"maxclass": "gswitch",
					"numinlets": 3,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"parameter_enable": 0,
					"patching_rect": [
						1330.0,
						80.0,
						41.0,
						32.0
					]
				}
			},
			{
				"box": {
					"id": "obj-11",
					"maxclass": "newobj",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						"int"
					],
					"patching_rect": [
						740.0,
						255.0,
						29.5,
						22.0
					],
					"text": "+ 1"
				}
			},
			{
				"box": {
					"annotation": "frequency",
					"comment": "",
					"hint": "frequency",
					"id": "obj-2",
					"index": 0,
					"maxclass": "outlet",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						1330.0,
						130.0,
						30.0,
						30.0
					]
				}
			},
			{
				"box": {
					"fontsize": 20.0,
					"id": "obj-85",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						90.0,
						0.0,
						121.0,
						29.0
					],
					"presentation": 1,
					"presentation_rect": [
						2.0,
						0.0,
						117.0,
						29.0
					],
					"text": "VOLTAGES",
					"textcolor": [
						1.0,
						0.8509803921568627,
						0.22745098039215686,
						0.46
					]
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
					"patching_rect": [
						1380.0,
						40.0,
						78.0,
						22.0
					],
					"presentation": 1,
					"presentation_rect": [
						46.0,
						146.5,
						60.0,
						22.0
					],
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
					"checkedcolor": [
						0.03529411764705882,
						1.0,
						0.09803921568627451,
						1.0
					],
					"id": "obj-7",
					"maxclass": "toggle",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						"int"
					],
					"parameter_enable": 1,
					"patching_rect": [
						1350.0,
						40.0,
						24.0,
						24.0
					],
					"presentation": 1,
					"presentation_rect": [
						110.0,
						124.0,
						45.0,
						45.0
					],
					"prototypename": "muteButton",
					"saved_attribute_attributes": {
						"valueof": {
							"parameter_enum": [
								"off",
								"on"
							],
							"parameter_longname": "toggle",
							"parameter_mmax": 1,
							"parameter_modmode": 0,
							"parameter_shortname": "toggle",
							"parameter_type": 2
						}
					},
					"uncheckedcolor": [
						0.8,
						0.14901960784313725,
						0.14901960784313725,
						1.0
					],
					"varname": "toggle"
				}
			},
			{
				"box": {
					"id": "obj-1",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 4,
					"outlettype": [
						"",
						"",
						"",
						""
					],
					"patching_rect": [
						1250.0,
						350.0,
						56.0,
						22.0
					],
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
					"patching_rect": [
						175.0,
						130.0,
						45.0,
						22.0
					],
					"presentation": 1,
					"presentation_rect": [
						67.0,
						102.0,
						41.0,
						22.0
					],
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
					"patching_rect": [
						420.0,
						40.0,
						58.0,
						22.0
					],
					"presentation": 1,
					"presentation_rect": [
						257.0,
						0.0,
						59.0,
						22.0
					],
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
					"outlettype": [
						""
					],
					"patching_rect": [
						1010.0,
						635.0,
						48.0,
						22.0
					],
					"text": "0 7"
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
					"patching_rect": [
						1010.0,
						575.0,
						212.0,
						51.0
					],
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
					"outlettype": [
						""
					],
					"patching_rect": [
						950.0,
						575.0,
						29.5,
						22.0
					],
					"text": "join"
				}
			},
			{
				"box": {
					"id": "obj-40",
					"maxclass": "rslider",
					"numinlets": 2,
					"numoutlets": 2,
					"outlettype": [
						"",
						""
					],
					"parameter_enable": 1,
					"patching_rect": [
						950.0,
						445.0,
						241.0,
						123.0
					],
					"presentation": 1,
					"presentation_rect": [
						160.0,
						148.0,
						238.0,
						19.0
					],
					"saved_attribute_attributes": {
						"valueof": {
							"parameter_initial": [
								0,
								16
							],
							"parameter_initial_enable": 1,
							"parameter_invisible": 1,
							"parameter_longname": "rslider[4]",
							"parameter_modmode": 0,
							"parameter_shortname": "rslider",
							"parameter_type": 3
						}
					},
					"size": 8.0,
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
					"patching_rect": [
						950.0,
						420.0,
						52.0,
						22.0
					],
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
					"outlettype": [
						""
					],
					"patching_rect": [
						950.0,
						665.0,
						87.0,
						22.0
					],
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
					"patching_rect": [
						950.0,
						230.0,
						127.0,
						22.0
					],
					"presentation": 1,
					"presentation_rect": [
						461.0,
						168.0,
						127.0,
						22.0
					],
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
					"outlettype": [
						"",
						""
					],
					"parameter_enable": 1,
					"patching_rect": [
						950.0,
						255.0,
						241.0,
						123.0
					],
					"presentation": 1,
					"presentation_rect": [
						400.0,
						99.0,
						238.0,
						69.0
					],
					"saved_attribute_attributes": {
						"valueof": {
							"parameter_initial": [
								1.0,
								1.0,
								1.0,
								1.0,
								1.0,
								1.0,
								1.0,
								1.0,
								1.0,
								1.0,
								1.0,
								1.0,
								1.0,
								1.0,
								1.0,
								1.0
							],
							"parameter_invisible": 1,
							"parameter_longname": "multislider[2]",
							"parameter_modmode": 0,
							"parameter_shortname": "multislider[8]",
							"parameter_type": 3
						}
					},
					"setminmax": [
						0.0,
						1.0
					],
					"setstyle": 1,
					"shadowalpha": 1.0,
					"size": 7,
					"slidercolor": [
						0.498,
						0.5561,
						0.7451,
						1.0
					],
					"varname": "multislider[2]"
				}
			},
			{
				"box": {
					"id": "obj-204",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						950.0,
						385.0,
						101.0,
						22.0
					],
					"text": "prepend skipprob"
				}
			},
			{
				"box": {
					"id": "obj-70",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						"bang"
					],
					"patching_rect": [
						260.0,
						90.0,
						22.0,
						22.0
					],
					"text": "t b"
				}
			},
			{
				"box": {
					"id": "obj-66",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						260.0,
						120.0,
						29.5,
						22.0
					],
					"text": "0"
				}
			},
			{
				"box": {
					"activebgcolor": [
						0.156862745098039,
						0.156862745098039,
						0.156862745098039,
						0.0
					],
					"activelinecolor": [
						0.3607843137254902,
						1.0,
						0.19607843137254902,
						1.0
					],
					"id": "obj-62",
					"maxclass": "live.scope~",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						"bang"
					],
					"patching_rect": [
						160.0,
						245.0,
						95.0,
						21.600000321865082
					],
					"presentation": 1,
					"presentation_rect": [
						0.0,
						36.0,
						155.0,
						64.0
					],
					"range": [
						-0.10000000149011612,
						1.1
					]
				}
			},
			{
				"box": {
					"format": 6,
					"id": "obj-61",
					"maxclass": "flonum",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						"bang"
					],
					"parameter_enable": 1,
					"patching_rect": [
						120.0,
						130.0,
						50.0,
						22.0
					],
					"presentation": 1,
					"presentation_rect": [
						110.0,
						102.0,
						45.0,
						22.0
					],
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
					"outlettype": [
						"signal"
					],
					"patching_rect": [
						20.0,
						130.0,
						36.0,
						22.0
					],
					"text": "rate~",
					"varname": "tmp_rate"
				}
			},
			{
				"box": {
					"id": "obj-55",
					"maxclass": "button",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						"bang"
					],
					"parameter_enable": 0,
					"patching_rect": [
						620.0,
						40.0,
						24.0,
						24.0
					],
					"presentation": 1,
					"presentation_rect": [
						0.0,
						143.0,
						24.0,
						24.0
					]
				}
			},
			{
				"box": {
					"id": "obj-33",
					"maxclass": "number",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						"bang"
					],
					"parameter_enable": 1,
					"patching_rect": [
						480.0,
						40.0,
						50.0,
						22.0
					],
					"presentation": 1,
					"presentation_rect": [
						321.0,
						0.0,
						50.0,
						22.0
					],
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
					"id": "obj-86",
					"ignoreclick": 1,
					"maxclass": "number",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						"bang"
					],
					"parameter_enable": 0,
					"patching_rect": [
						100.0,
						370.0,
						50.0,
						22.0
					],
					"presentation": 1,
					"presentation_rect": [
						2.0,
						102.0,
						50.0,
						22.0
					]
				}
			},
			{
				"box": {
					"amountcolor": [
						0.427450980392157,
						0.843137254901961,
						1.0,
						0.0
					],
					"bgstepcolor": [
						0.427450980392157,
						0.843137254901961,
						1.0,
						0.0
					],
					"bgstepcolor2": [
						0.427450980392157,
						0.843137254901961,
						1.0,
						0.0
					],
					"bordercolor": [
						0.427450980392157,
						0.843137254901961,
						1.0,
						0.0
					],
					"bordercolor2": [
						0.427450980392157,
						0.843137254901961,
						1.0,
						0.0
					],
					"columns": 7,
					"direction": 0,
					"directioncolor": [
						0.427450980392157,
						0.843137254901961,
						1.0,
						0.0
					],
					"freezecolor": [
						0.427450980392157,
						0.843137254901961,
						1.0,
						0.0
					],
					"id": "obj-87",
					"ignoreclick": 1,
					"marker_horizontal": 0,
					"marker_vertical": 0,
					"matrixmode": 1,
					"maxclass": "live.grid",
					"numinlets": 2,
					"numoutlets": 6,
					"outlettype": [
						"",
						"",
						"",
						"",
						"",
						""
					],
					"parameter_enable": 1,
					"patching_rect": [
						420.0,
						120.0,
						241.0,
						123.0
					],
					"presentation": 1,
					"presentation_rect": [
						163.0,
						23.0,
						232.0,
						123.0
					],
					"rows": 1,
					"saved_attribute_attributes": {
						"bgstepcolor": {
							"expression": ""
						},
						"bgstepcolor2": {
							"expression": ""
						},
						"bordercolor": {
							"expression": ""
						},
						"bordercolor2": {
							"expression": ""
						},
						"directioncolor": {
							"expression": ""
						},
						"stepcolor": {
							"expression": ""
						},
						"valueof": {
							"parameter_invisible": 1,
							"parameter_longname": "live.grid[8]",
							"parameter_modmode": 0,
							"parameter_order": 1,
							"parameter_shortname": "live.grid",
							"parameter_type": 3
						}
					},
					"stepcolor": [
						0.427450980392157,
						0.843137254901961,
						1.0,
						0.0
					],
					"varname": "live.grid[2]"
				}
			},
			{
				"box": {
					"ghostbar": 50,
					"id": "obj-89",
					"maxclass": "multislider",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						""
					],
					"parameter_enable": 1,
					"patching_rect": [
						420.0,
						120.0,
						241.0,
						123.0
					],
					"presentation": 1,
					"presentation_rect": [
						160.0,
						23.0,
						238.0,
						123.0
					],
					"saved_attribute_attributes": {
						"valueof": {
							"parameter_initial": [
								64,
								77,
								79,
								65,
								72,
								72,
								81,
								76,
								65,
								77,
								69,
								79,
								74,
								69,
								67,
								64
							],
							"parameter_initial_enable": 1,
							"parameter_invisible": 1,
							"parameter_longname": "multislider[1]",
							"parameter_modmode": 0,
							"parameter_shortname": "multislider",
							"parameter_type": 3
						}
					},
					"setminmax": [
						0.0,
						1.0
					],
					"setstyle": 1,
					"size": 7,
					"slidercolor": [
						0.0784313725490196,
						0.6784313725490196,
						0.08235294117647059,
						1.0
					],
					"style": "rnbodefault",
					"varname": "multislider"
				}
			},
			{
				"box": {
					"id": "obj-164",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						260.0,
						195.0,
						71.0,
						22.0
					],
					"text": "direction $1"
				}
			},
			{
				"box": {
					"id": "obj-39",
					"items": [
						"forward",
						",",
						"reverse",
						",",
						"random"
					],
					"maxclass": "umenu",
					"numinlets": 1,
					"numoutlets": 3,
					"outlettype": [
						"int",
						"",
						""
					],
					"parameter_enable": 0,
					"patching_rect": [
						260.0,
						165.0,
						74.0,
						22.0
					],
					"presentation": 1,
					"presentation_rect": [
						0.0,
						124.0,
						74.0,
						22.0
					]
				}
			},
			{
				"box": {
					"hidden": 1,
					"id": "obj-90",
					"maxclass": "newobj",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						"int"
					],
					"patching_rect": [
						680.0,
						255.0,
						29.5,
						22.0
					],
					"text": "+ 1"
				}
			},
			{
				"box": {
					"id": "obj-205",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						950.0,
						195.0,
						100.0,
						22.0
					],
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
					"patching_rect": [
						950.0,
						40.0,
						127.0,
						22.0
					],
					"presentation": 1,
					"presentation_rect": [
						461.0,
						0.0,
						127.0,
						22.0
					],
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
					"outlettype": [
						"",
						""
					],
					"parameter_enable": 1,
					"patching_rect": [
						950.0,
						65.0,
						241.0,
						123.0
					],
					"presentation": 1,
					"presentation_rect": [
						400.0,
						25.0,
						238.0,
						72.0
					],
					"prototypename": "skip-temp-1",
					"saved_attribute_attributes": {
						"valueof": {
							"parameter_initial": [
								1.0,
								1.0,
								1.0,
								1.0,
								1.0,
								1.0,
								1.0,
								1.0,
								1.0,
								1.0,
								1.0,
								1.0,
								1.0,
								1.0,
								1.0,
								1.0
							],
							"parameter_invisible": 1,
							"parameter_longname": "multislider[3]",
							"parameter_modmode": 0,
							"parameter_shortname": "multislider[7]",
							"parameter_type": 3
						}
					},
					"setminmax": [
						0.0,
						1.0
					],
					"setstyle": 1,
					"shadowalpha": 1.0,
					"shadowblend": 0.12,
					"size": 7,
					"style": "rnbohighcontrast",
					"varname": "multislider[1]"
				}
			},
			{
				"box": {
					"id": "obj-67",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"signal",
						"int"
					],
					"patching_rect": [
						20.0,
						245.0,
						41.0,
						22.0
					],
					"text": "what~",
					"varname": "tmp_what"
				}
			},
			{
				"box": {
					"activelinecolor": [
						1.0,
						0.709803921568627,
						0.196078431372549,
						0.65
					],
					"id": "obj-45",
					"maxclass": "live.scope~",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						"bang"
					],
					"patching_rect": [
						20.0,
						165.0,
						95.0,
						57.0
					],
					"presentation": 1,
					"presentation_rect": [
						0.0,
						29.0,
						155.0,
						64.0
					],
					"range": [
						-0.10000000149011612,
						1.1
					]
				}
			},
			{
				"box": {
					"comment": "phasorInput",
					"id": "obj-46",
					"index": 0,
					"maxclass": "inlet",
					"numinlets": 0,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						20.0,
						40.0,
						30.0,
						30.0
					]
				}
			},
			{
				"box": {
					"comment": "isRunning: 1 = run (from the first step), 0 = stop",
					"id": "obj-47",
					"index": 0,
					"maxclass": "inlet",
					"numinlets": 0,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						260.0,
						40.0,
						30.0,
						30.0
					]
				}
			},
			{
				"box": {
					"annotation": "to sig~ for voltage",
					"comment": "",
					"hint": "to sig~ for voltage",
					"id": "obj-49",
					"index": 0,
					"maxclass": "outlet",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						1250.0,
						130.0,
						30.0,
						30.0
					]
				}
			},
			{
				"box": {
					"comment": "play (1) / pause (0)",
					"id": "obj-vpp",
					"index": 0,
					"maxclass": "inlet",
					"numinlets": 0,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						395.0,
						40.0,
						30.0,
						30.0
					]
				}
			},
			{
				"box": {
					"id": "obj-vtbl",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"bang",
						""
					],
					"patching_rect": [
						950.0,
						605.0,
						40.0,
						22.0
					],
					"text": "t b l"
				}
			},
			{
				"box": {
					"id": "obj-vord",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 3,
					"outlettype": [
						"bang",
						"bang",
						"bang"
					],
					"patching_rect": [
						620.0,
						75.0,
						50.0,
						22.0
					],
					"text": "t b b b"
				}
			},
			{
				"box": {
					"id": "obj-vlb",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						"bang"
					],
					"patching_rect": [
						20.0,
						440.0,
						58.0,
						22.0
					],
					"text": "loadbang"
				}
			},
			{
				"box": {
					"id": "obj-vd50",
					"maxclass": "newobj",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						"bang"
					],
					"patching_rect": [
						20.0,
						470.0,
						60.0,
						22.0
					],
					"text": "delay 50"
				}
			},
			{
				"box": {
					"id": "obj-vd100",
					"maxclass": "newobj",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						"bang"
					],
					"patching_rect": [
						100.0,
						470.0,
						65.0,
						22.0
					],
					"text": "delay 100"
				}
			},
			{
				"box": {
					"id": "obj-vd150",
					"maxclass": "newobj",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						"bang"
					],
					"patching_rect": [
						180.0,
						470.0,
						65.0,
						22.0
					],
					"text": "delay 150"
				}
			},
			{
				"box": {
					"id": "obj-vps",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						1250.0,
						280.0,
						300.0,
						22.0
					],
					"priority": {
						"multislider": -2,
						"number": -3,
						"rslider": -1
					},
					"saved_object_attributes": {
						"parameter_enable": 0,
						"parameter_mappable": 0
					},
					"text": "pattrstorage #1_uVOLT @savemode 0 @autorestore 0",
					"varname": "#1_uVOLT"
				}
			},
			{
				"box": {
					"id": "obj-vpr",
					"maxclass": "preset",
					"numinlets": 1,
					"numoutlets": 5,
					"outlettype": [
						"preset",
						"int",
						"preset",
						"int",
						""
					],
					"patching_rect": [
						1250.0,
						220.0,
						100.0,
						20.0
					],
					"pattrstorage": "#1_uVOLT",
					"presentation": 1,
					"presentation_rect": [
						376.0,
						2.0,
						80.0,
						18.0
					]
				}
			},
			{
				"box": {
					"id": "obj-vjs",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						1250.0,
						310.0,
						190.0,
						22.0
					],
					"saved_object_attributes": {
						"filename": "dingus.presetFile.js",
						"parameter_enable": 0
					},
					"text": "v8 dingus.presetFile.js uVOLT #1"
				}
			},
			{
				"box": {
					"id": "obj-PstepsChange",
					"maxclass": "newobj",
					"numinlets": 4,
					"numoutlets": 7,
					"outlettype": [
						"",
						"",
						"",
						"",
						"",
						"",
						"bang"
					],
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
						"rect": [
							100.0,
							100.0,
							800.0,
							500.0
						],
						"integercoordinates": 1,
						"boxes": [
							{
								"box": {
									"id": "obj-63",
									"maxclass": "newobj",
									"numinlets": 2,
									"numoutlets": 1,
									"outlettype": [
										"int"
									],
									"patching_rect": [
										30.0,
										290.0,
										29.5,
										22.0
									],
									"text": "+ 1"
								}
							},
							{
								"box": {
									"id": "obj-60",
									"maxclass": "message",
									"numinlets": 2,
									"numoutlets": 1,
									"outlettype": [
										""
									],
									"patching_rect": [
										30.0,
										320.0,
										47.0,
										22.0
									],
									"text": "size $1"
								}
							},
							{
								"box": {
									"id": "obj-50",
									"maxclass": "message",
									"numinlets": 2,
									"numoutlets": 1,
									"outlettype": [
										""
									],
									"patching_rect": [
										30.0,
										260.0,
										70.0,
										22.0
									],
									"text": "columns $1"
								}
							},
							{
								"box": {
									"id": "obj-48",
									"maxclass": "message",
									"numinlets": 2,
									"numoutlets": 1,
									"outlettype": [
										""
									],
									"patching_rect": [
										30.0,
										230.0,
										47.0,
										22.0
									],
									"text": "size $1"
								}
							},
							{
								"box": {
									"id": "obj-vs1",
									"maxclass": "newobj",
									"numinlets": 1,
									"numoutlets": 3,
									"outlettype": [
										"int",
										"int",
										"bang"
									],
									"patching_rect": [
										30.0,
										80.0,
										60.0,
										22.0
									],
									"text": "t i i b"
								}
							},
							{
								"box": {
									"id": "obj-vt1",
									"maxclass": "newobj",
									"numinlets": 1,
									"numoutlets": 2,
									"outlettype": [
										"int",
										"int"
									],
									"patching_rect": [
										30.0,
										110.0,
										40.0,
										22.0
									],
									"text": "t i i"
								}
							},
							{
								"box": {
									"id": "obj-vt2",
									"maxclass": "newobj",
									"numinlets": 2,
									"numoutlets": 3,
									"outlettype": [
										"bang",
										"bang",
										"int"
									],
									"patching_rect": [
										30.0,
										140.0,
										50.0,
										22.0
									],
									"text": "uzi 1 0"
								}
							},
							{
								"box": {
									"id": "obj-vt3",
									"maxclass": "newobj",
									"numinlets": 2,
									"numoutlets": 1,
									"outlettype": [
										"float"
									],
									"patching_rect": [
										30.0,
										170.0,
										35.0,
										22.0
									],
									"text": "/ 1."
								}
							},
							{
								"box": {
									"id": "obj-vt4",
									"maxclass": "newobj",
									"numinlets": 2,
									"numoutlets": 2,
									"outlettype": [
										"",
										""
									],
									"patching_rect": [
										30.0,
										200.0,
										80.0,
										22.0
									],
									"text": "zl.group 256"
								}
							},
							{
								"box": {
									"id": "obj-vdef",
									"maxclass": "newobj",
									"numinlets": 1,
									"numoutlets": 1,
									"outlettype": [
										""
									],
									"patching_rect": [
										180.0,
										80.0,
										55.0,
										22.0
									],
									"text": "deferlow"
								}
							},
							{
								"box": {
									"id": "obj-vs6",
									"maxclass": "newobj",
									"numinlets": 1,
									"numoutlets": 3,
									"outlettype": [
										"bang",
										"bang",
										"int"
									],
									"patching_rect": [
										180.0,
										110.0,
										50.0,
										22.0
									],
									"text": "t b b i"
								}
							},
							{
								"box": {
									"id": "obj-vs2",
									"maxclass": "message",
									"numinlets": 2,
									"numoutlets": 1,
									"outlettype": [
										""
									],
									"patching_rect": [
										180.0,
										140.0,
										55.0,
										22.0
									],
									"text": "set 0 $1"
								}
							},
							{
								"box": {
									"id": "obj-vpr0",
									"maxclass": "newobj",
									"numinlets": 2,
									"numoutlets": 2,
									"outlettype": [
										"",
										""
									],
									"patching_rect": [
										180.0,
										170.0,
										130.0,
										22.0
									],
									"text": "zl.reg @zlmaxsize 256"
								}
							},
							{
								"box": {
									"id": "obj-vpr1",
									"maxclass": "newobj",
									"numinlets": 2,
									"numoutlets": 2,
									"outlettype": [
										"",
										""
									],
									"patching_rect": [
										180.0,
										200.0,
										130.0,
										22.0
									],
									"text": "zl.reg @zlmaxsize 256"
								}
							},
							{
								"box": {
									"id": "obj-vpr2",
									"linecount": 7,
									"maxclass": "newobj",
									"numinlets": 2,
									"numoutlets": 2,
									"outlettype": [
										"",
										""
									],
									"patching_rect": [
										180.0,
										230.0,
										130.0,
										22.0
									],
									"text": "zl.join 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 @zlmaxsize 256"
								}
							},
							{
								"box": {
									"id": "obj-vpr3",
									"linecount": 2,
									"maxclass": "newobj",
									"numinlets": 2,
									"numoutlets": 2,
									"outlettype": [
										"",
										""
									],
									"patching_rect": [
										180.0,
										260.0,
										130.0,
										22.0
									],
									"text": "zl.slice @zlmaxsize 256"
								}
							},
							{
								"box": {
									"id": "obj-vpr4",
									"maxclass": "newobj",
									"numinlets": 1,
									"numoutlets": 1,
									"outlettype": [
										""
									],
									"patching_rect": [
										180.0,
										290.0,
										90.0,
										22.0
									],
									"text": "prepend setlist"
								}
							},
							{
								"box": {
									"id": "obj-vps0",
									"maxclass": "newobj",
									"numinlets": 2,
									"numoutlets": 2,
									"outlettype": [
										"",
										""
									],
									"patching_rect": [
										180.0,
										320.0,
										130.0,
										22.0
									],
									"text": "zl.reg @zlmaxsize 256"
								}
							},
							{
								"box": {
									"id": "obj-vps1",
									"maxclass": "newobj",
									"numinlets": 2,
									"numoutlets": 2,
									"outlettype": [
										"",
										""
									],
									"patching_rect": [
										330.0,
										80.0,
										130.0,
										22.0
									],
									"text": "zl.reg @zlmaxsize 256"
								}
							},
							{
								"box": {
									"id": "obj-vps2",
									"linecount": 7,
									"maxclass": "newobj",
									"numinlets": 2,
									"numoutlets": 2,
									"outlettype": [
										"",
										""
									],
									"patching_rect": [
										330.0,
										110.0,
										130.0,
										22.0
									],
									"text": "zl.join 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 @zlmaxsize 256"
								}
							},
							{
								"box": {
									"id": "obj-vps3",
									"linecount": 2,
									"maxclass": "newobj",
									"numinlets": 2,
									"numoutlets": 2,
									"outlettype": [
										"",
										""
									],
									"patching_rect": [
										330.0,
										140.0,
										130.0,
										22.0
									],
									"text": "zl.slice @zlmaxsize 256"
								}
							},
							{
								"box": {
									"id": "obj-vps4",
									"maxclass": "newobj",
									"numinlets": 1,
									"numoutlets": 1,
									"outlettype": [
										""
									],
									"patching_rect": [
										330.0,
										170.0,
										90.0,
										22.0
									],
									"text": "prepend setlist"
								}
							},
							{
								"box": {
									"id": "obj-vpv0",
									"maxclass": "newobj",
									"numinlets": 2,
									"numoutlets": 2,
									"outlettype": [
										"",
										""
									],
									"patching_rect": [
										330.0,
										200.0,
										130.0,
										22.0
									],
									"text": "zl.reg @zlmaxsize 256"
								}
							},
							{
								"box": {
									"id": "obj-vpv1",
									"maxclass": "newobj",
									"numinlets": 2,
									"numoutlets": 2,
									"outlettype": [
										"",
										""
									],
									"patching_rect": [
										330.0,
										230.0,
										130.0,
										22.0
									],
									"text": "zl.reg @zlmaxsize 256"
								}
							},
							{
								"box": {
									"id": "obj-vpv2",
									"linecount": 2,
									"maxclass": "newobj",
									"numinlets": 2,
									"numoutlets": 2,
									"outlettype": [
										"",
										""
									],
									"patching_rect": [
										330.0,
										260.0,
										130.0,
										22.0
									],
									"text": "zl.join @zlmaxsize 256"
								}
							},
							{
								"box": {
									"id": "obj-vpv3",
									"linecount": 2,
									"maxclass": "newobj",
									"numinlets": 2,
									"numoutlets": 2,
									"outlettype": [
										"",
										""
									],
									"patching_rect": [
										330.0,
										290.0,
										130.0,
										22.0
									],
									"text": "zl.slice @zlmaxsize 256"
								}
							},
							{
								"box": {
									"id": "obj-vpv4",
									"maxclass": "newobj",
									"numinlets": 1,
									"numoutlets": 1,
									"outlettype": [
										""
									],
									"patching_rect": [
										330.0,
										320.0,
										90.0,
										22.0
									],
									"text": "prepend setlist"
								}
							},
							{
								"box": {
									"id": "obj-vv1",
									"maxclass": "newobj",
									"numinlets": 1,
									"numoutlets": 2,
									"outlettype": [
										"",
										""
									],
									"patching_rect": [
										480.0,
										80.0,
										40.0,
										22.0
									],
									"text": "t l l"
								}
							},
							{
								"box": {
									"id": "obj-vv2",
									"maxclass": "newobj",
									"numinlets": 2,
									"numoutlets": 2,
									"outlettype": [
										"",
										""
									],
									"patching_rect": [
										480.0,
										110.0,
										130.0,
										22.0
									],
									"text": "zl.rev @zlmaxsize 256"
								}
							},
							{
								"box": {
									"id": "obj-vv3",
									"maxclass": "newobj",
									"numinlets": 2,
									"numoutlets": 2,
									"outlettype": [
										"",
										""
									],
									"patching_rect": [
										480.0,
										140.0,
										55.0,
										22.0
									],
									"text": "zl.nth 1"
								}
							},
							{
								"box": {
									"id": "obj-vv4",
									"maxclass": "newobj",
									"numinlets": 1,
									"numoutlets": 2,
									"outlettype": [
										"bang",
										"float"
									],
									"patching_rect": [
										480.0,
										170.0,
										40.0,
										22.0
									],
									"text": "t b f"
								}
							},
							{
								"box": {
									"id": "obj-vv5",
									"maxclass": "newobj",
									"numinlets": 2,
									"numoutlets": 1,
									"outlettype": [
										"float"
									],
									"patching_rect": [
										480.0,
										200.0,
										30.0,
										22.0
									],
									"text": "f"
								}
							},
							{
								"box": {
									"id": "obj-vv6",
									"maxclass": "newobj",
									"numinlets": 2,
									"numoutlets": 3,
									"outlettype": [
										"bang",
										"bang",
										"int"
									],
									"patching_rect": [
										480.0,
										230.0,
										50.0,
										22.0
									],
									"text": "uzi 64"
								}
							},
							{
								"box": {
									"id": "obj-vv7",
									"maxclass": "newobj",
									"numinlets": 2,
									"numoutlets": 2,
									"outlettype": [
										"",
										""
									],
									"patching_rect": [
										480.0,
										260.0,
										80.0,
										22.0
									],
									"text": "zl.group 256"
								}
							},
							{
								"box": {
									"id": "obj-vsc",
									"linecount": 3,
									"maxclass": "comment",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										480.0,
										290.0,
										300.0,
										22.0
									],
									"text": "steps change: thresholds + resize, capture lists, then (deferred) reset range, pad (rest/skip with 1, voltages with the last value), re-send in order"
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
									"outlettype": [
										""
									],
									"patching_rect": [
										30.0,
										20.0,
										30.0,
										30.0
									]
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
									"outlettype": [
										""
									],
									"patching_rect": [
										100.0,
										20.0,
										30.0,
										30.0
									]
								}
							},
							{
								"box": {
									"comment": "",
									"id": "obj-in3",
									"index": 3,
									"maxclass": "inlet",
									"numinlets": 0,
									"numoutlets": 1,
									"outlettype": [
										""
									],
									"patching_rect": [
										170.0,
										20.0,
										30.0,
										30.0
									]
								}
							},
							{
								"box": {
									"comment": "",
									"id": "obj-in4",
									"index": 4,
									"maxclass": "inlet",
									"numinlets": 0,
									"numoutlets": 1,
									"outlettype": [
										""
									],
									"patching_rect": [
										240.0,
										20.0,
										30.0,
										30.0
									]
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
									"patching_rect": [
										30.0,
										382.0,
										30.0,
										30.0
									]
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
									"patching_rect": [
										100.0,
										382.0,
										30.0,
										30.0
									]
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
									"patching_rect": [
										170.0,
										382.0,
										30.0,
										30.0
									]
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
									"patching_rect": [
										240.0,
										382.0,
										30.0,
										30.0
									]
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
									"patching_rect": [
										310.0,
										382.0,
										30.0,
										30.0
									]
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
									"patching_rect": [
										380.0,
										382.0,
										30.0,
										30.0
									]
								}
							},
							{
								"box": {
									"comment": "",
									"id": "obj-out7",
									"index": 7,
									"maxclass": "outlet",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										450.0,
										382.0,
										30.0,
										30.0
									]
								}
							}
						],
						"lines": [
							{
								"patchline": {
									"destination": [
										"obj-out1",
										0
									],
									"order": 2,
									"source": [
										"obj-48",
										0
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"obj-out2",
										0
									],
									"order": 1,
									"source": [
										"obj-48",
										0
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"obj-out3",
										0
									],
									"order": 0,
									"source": [
										"obj-48",
										0
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"obj-out4",
										0
									],
									"source": [
										"obj-50",
										0
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"obj-out5",
										0
									],
									"source": [
										"obj-60",
										0
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"obj-60",
										0
									],
									"source": [
										"obj-63",
										0
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"obj-vps0",
										1
									],
									"source": [
										"obj-in1",
										0
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"obj-vpr0",
										1
									],
									"source": [
										"obj-in2",
										0
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"obj-vpv0",
										1
									],
									"source": [
										"obj-in3",
										0
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"obj-vs1",
										0
									],
									"source": [
										"obj-in4",
										0
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"obj-vs6",
										0
									],
									"source": [
										"obj-vdef",
										0
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"obj-vpr1",
										1
									],
									"source": [
										"obj-vpr0",
										0
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"obj-vpr2",
										0
									],
									"source": [
										"obj-vpr1",
										0
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"obj-vpr3",
										0
									],
									"source": [
										"obj-vpr2",
										0
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"obj-vpr4",
										0
									],
									"source": [
										"obj-vpr3",
										0
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"obj-out2",
										0
									],
									"source": [
										"obj-vpr4",
										0
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"obj-vps1",
										1
									],
									"source": [
										"obj-vps0",
										0
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"obj-vps2",
										0
									],
									"source": [
										"obj-vps1",
										0
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"obj-vps3",
										0
									],
									"source": [
										"obj-vps2",
										0
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"obj-vps4",
										0
									],
									"source": [
										"obj-vps3",
										0
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"obj-out1",
										0
									],
									"source": [
										"obj-vps4",
										0
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"obj-vpv1",
										1
									],
									"source": [
										"obj-vpv0",
										0
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"obj-vv1",
										0
									],
									"source": [
										"obj-vpv1",
										0
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"obj-vpv3",
										0
									],
									"source": [
										"obj-vpv2",
										0
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"obj-vpv4",
										0
									],
									"source": [
										"obj-vpv3",
										0
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"obj-out3",
										0
									],
									"source": [
										"obj-vpv4",
										0
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"obj-48",
										0
									],
									"order": 5,
									"source": [
										"obj-vs1",
										1
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"obj-50",
										0
									],
									"order": 4,
									"source": [
										"obj-vs1",
										1
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"obj-63",
										0
									],
									"order": 3,
									"source": [
										"obj-vs1",
										1
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"obj-vdef",
										0
									],
									"source": [
										"obj-vs1",
										0
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"obj-vpr0",
										0
									],
									"order": 2,
									"source": [
										"obj-vs1",
										2
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"obj-vpr3",
										1
									],
									"order": 2,
									"source": [
										"obj-vs1",
										1
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"obj-vps0",
										0
									],
									"order": 1,
									"source": [
										"obj-vs1",
										2
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"obj-vps3",
										1
									],
									"order": 1,
									"source": [
										"obj-vs1",
										1
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"obj-vpv0",
										0
									],
									"order": 0,
									"source": [
										"obj-vs1",
										2
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"obj-vpv3",
										1
									],
									"order": 0,
									"source": [
										"obj-vs1",
										1
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"obj-vt1",
										0
									],
									"order": 6,
									"source": [
										"obj-vs1",
										1
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"obj-out5",
										0
									],
									"source": [
										"obj-vs2",
										0
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"obj-out7",
										0
									],
									"source": [
										"obj-vs6",
										0
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"obj-vpr1",
										0
									],
									"order": 2,
									"source": [
										"obj-vs6",
										1
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"obj-vps1",
										0
									],
									"order": 1,
									"source": [
										"obj-vs6",
										1
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"obj-vpv1",
										0
									],
									"order": 0,
									"source": [
										"obj-vs6",
										1
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"obj-vs2",
										0
									],
									"source": [
										"obj-vs6",
										2
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"obj-vt2",
										0
									],
									"source": [
										"obj-vt1",
										0
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"obj-vt3",
										1
									],
									"source": [
										"obj-vt1",
										1
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"obj-vt3",
										0
									],
									"source": [
										"obj-vt2",
										2
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"obj-vt4",
										0
									],
									"source": [
										"obj-vt2",
										1
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"obj-vt4",
										0
									],
									"source": [
										"obj-vt3",
										0
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"obj-out6",
										0
									],
									"source": [
										"obj-vt4",
										0
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"obj-vpv2",
										0
									],
									"source": [
										"obj-vv1",
										0
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"obj-vv2",
										0
									],
									"source": [
										"obj-vv1",
										1
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"obj-vv3",
										0
									],
									"source": [
										"obj-vv2",
										0
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"obj-vv4",
										0
									],
									"source": [
										"obj-vv3",
										0
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"obj-vv5",
										1
									],
									"source": [
										"obj-vv4",
										1
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"obj-vv6",
										0
									],
									"source": [
										"obj-vv4",
										0
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"obj-vv7",
										0
									],
									"source": [
										"obj-vv5",
										0
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"obj-vv5",
										0
									],
									"source": [
										"obj-vv6",
										0
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"obj-vv7",
										0
									],
									"source": [
										"obj-vv6",
										1
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"obj-vpv2",
										1
									],
									"source": [
										"obj-vv7",
										0
									]
								}
							}
						]
					},
					"patching_rect": [
						420.0,
						75.0,
						175.0,
						22.0
					],
					"text": "p stepsChange"
				}
			},
			{
				"box": {
					"id": "obj-PpresetLogic",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 3,
					"outlettype": [
						"",
						"",
						""
					],
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
						"rect": [
							100.0,
							100.0,
							800.0,
							500.0
						],
						"integercoordinates": 1,
						"boxes": [
							{
								"box": {
									"id": "obj-vplb",
									"maxclass": "newobj",
									"numinlets": 1,
									"numoutlets": 1,
									"outlettype": [
										"bang"
									],
									"patching_rect": [
										30.0,
										80.0,
										58.0,
										22.0
									],
									"text": "loadbang"
								}
							},
							{
								"box": {
									"id": "obj-vpri",
									"maxclass": "message",
									"numinlets": 2,
									"numoutlets": 1,
									"outlettype": [
										""
									],
									"patching_rect": [
										30.0,
										110.0,
										330.0,
										22.0
									],
									"text": "priority number -3, priority multislider -2, priority rslider -1"
								}
							},
							{
								"box": {
									"id": "obj-vpbind",
									"maxclass": "message",
									"numinlets": 2,
									"numoutlets": 1,
									"outlettype": [
										""
									],
									"patching_rect": [
										30.0,
										140.0,
										140.0,
										22.0
									],
									"text": "pattrstorage #1_uVOLT"
								}
							},
							{
								"box": {
									"id": "obj-vpload",
									"maxclass": "message",
									"numinlets": 2,
									"numoutlets": 1,
									"outlettype": [
										""
									],
									"patching_rect": [
										30.0,
										170.0,
										78,
										22.0
									],
									"text": "readpresets"
								}
							},
							{
								"box": {
									"id": "obj-vptb",
									"maxclass": "newobj",
									"numinlets": 1,
									"numoutlets": 1,
									"outlettype": [
										"bang"
									],
									"patching_rect": [
										30.0,
										200.0,
										25.0,
										22.0
									],
									"text": "t b"
								}
							},
							{
								"box": {
									"id": "obj-vpdef",
									"maxclass": "newobj",
									"numinlets": 1,
									"numoutlets": 1,
									"outlettype": [
										""
									],
									"patching_rect": [
										30.0,
										230.0,
										55.0,
										22.0
									],
									"text": "deferlow"
								}
							},
							{
								"box": {
									"id": "obj-vpsave",
									"maxclass": "message",
									"numinlets": 2,
									"numoutlets": 1,
									"outlettype": [
										""
									],
									"patching_rect": [
										30.0,
										260.0,
										35.0,
										22.0
									],
									"text": "save"
								}
							},
							{
								"box": {
									"id": "obj-vpc",
									"linecount": 2,
									"maxclass": "comment",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										30.0,
										290.0,
										300.0,
										22.0
									],
									"text": "presets: file <this folder>/uVOLT_<bpatcher argument>.json, read at load, written on every store"
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
									"outlettype": [
										"int"
									],
									"patching_rect": [
										30.0,
										20.0,
										30.0,
										30.0
									]
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
									"patching_rect": [
										30.0,
										352.0,
										30.0,
										30.0
									]
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
									"patching_rect": [
										100.0,
										352.0,
										30.0,
										30.0
									]
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
									"patching_rect": [
										170.0,
										352.0,
										30.0,
										30.0
									]
								}
							}
						],
						"lines": [
							{
								"patchline": {
									"destination": [
										"obj-vptb",
										0
									],
									"source": [
										"obj-in1",
										0
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"obj-out2",
										0
									],
									"source": [
										"obj-vpbind",
										0
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"obj-vpsave",
										0
									],
									"source": [
										"obj-vpdef",
										0
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"obj-vpbind",
										0
									],
									"order": 1,
									"source": [
										"obj-vplb",
										0
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"obj-vpload",
										0
									],
									"order": 0,
									"source": [
										"obj-vplb",
										0
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"obj-vpri",
										0
									],
									"order": 2,
									"source": [
										"obj-vplb",
										0
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"obj-out3",
										0
									],
									"source": [
										"obj-vpload",
										0
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"obj-out1",
										0
									],
									"source": [
										"obj-vpri",
										0
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"obj-out3",
										0
									],
									"source": [
										"obj-vpsave",
										0
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"obj-vpdef",
										0
									],
									"source": [
										"obj-vptb",
										0
									]
								}
							}
						]
					},
					"patching_rect": [
						1250.0,
						250.0,
						101.0,
						22.0
					],
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
					"patching_rect": [
						20.0,
						22.0,
						200.0,
						20.0
					],
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
					"patching_rect": [
						20.0,
						420.0,
						200.0,
						20.0
					],
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
					"patching_rect": [
						420.0,
						18.0,
						200.0,
						20.0
					],
					"text": "STEPS / VOLTAGES"
				}
			},
			{
				"box": {
					"fontface": 1,
					"id": "obj-hdr3",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						950.0,
						18.0,
						200.0,
						20.0
					],
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
					"patching_rect": [
						1250.0,
						18.0,
						200.0,
						20.0
					],
					"text": "OUTPUT"
				}
			},
			{
				"box": {
					"fontface": 1,
					"id": "obj-hdr5",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						1250.0,
						200.0,
						200.0,
						20.0
					],
					"text": "PRESETS"
				}
			},
			{
				"box": {
					"id": "def-cm",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						20,
						380,
						200,
						20
					],
					"text": "defaults at load (presets override)"
				}
			},
			{
				"box": {
					"id": "def-lb",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						"bang"
					],
					"patching_rect": [
						20,
						405,
						58,
						22
					],
					"text": "loadbang"
				}
			},
			{
				"box": {
					"id": "def-m0",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						110,
						435,
						40,
						22
					],
					"text": "5"
				}
			},
			{
				"box": {
					"id": "def-m1",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						65,
						435,
						40,
						22
					],
					"text": "1."
				}
			},
			{
				"box": {
					"id": "def-m2",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						20,
						435,
						40,
						22
					],
					"text": "1"
				}
			},
			{
				"box": {
					"id": "obj-vjs_slotfilter",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						""
					],
					"patching_rect": [
						1460.0,
						310.0,
						120.0,
						22.0
					],
					"text": "routepass slotlist"
				}
			},
			{
				"box": {
					"id": "vm_buf",
					"maxclass": "newobj",
					"text": "buffer~ #0-volt @samps 256 @chans 3",
					"patching_rect": [
						1700.0,
						40.0,
						240.0,
						22.0
					],
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"float",
						"bang"
					]
				}
			},
			{
				"box": {
					"id": "vm_gen",
					"maxclass": "newobj",
					"text": "gen~",
					"varname": "vmgen",
					"patching_rect": [
						1700.0,
						300.0,
						300.0,
						22.0
					],
					"numinlets": 2,
					"numoutlets": 4,
					"outlettype": [
						"signal",
						"signal",
						"signal",
						"signal"
					],
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
						"rect": [
							100.0,
							100.0,
							700.0,
							700.0
						],
						"integercoordinates": 1,
						"boxes": [
							{
								"box": {
									"id": "gin1",
									"maxclass": "newobj",
									"numinlets": 0,
									"numoutlets": 1,
									"outlettype": [
										""
									],
									"patching_rect": [
										20.0,
										14.0,
										40.0,
										22.0
									],
									"text": "in 1"
								}
							},
							{
								"box": {
									"id": "gin2",
									"maxclass": "newobj",
									"numinlets": 0,
									"numoutlets": 1,
									"outlettype": [
										""
									],
									"patching_rect": [
										130.0,
										14.0,
										40.0,
										22.0
									],
									"text": "in 2"
								}
							},
							{
								"box": {
									"id": "gcode",
									"maxclass": "codebox",
									"fontface": 0,
									"fontname": "<Monospaced>",
									"fontsize": 12.0,
									"numinlets": 2,
									"numoutlets": 4,
									"outlettype": [
										"",
										"",
										"",
										""
									],
									"patching_rect": [
										20.0,
										50.0,
										640.0,
										560.0
									],
									"code": "// voltages engine: steps from the phasor, values from the tables (dingus.voltBank.js)\n// in1 phasor (one cycle = whole loop)  in2 step reset (click)\n// run 0|1 (the isRunning inlet): 0 stops the steps (the value holds); 1 runs again from the first step\n// out1 value (held between steps)  out2 current step  out3 the bank that plays (0 / 1)\n// out4 1 for one sample when a step sends its value (for the message outlet)\n// tables: frame = bank * 64 + step: ch 0 value, ch 1 skip (chance the step plays; 0 outside the range,\n//   raised so the highest in the range is 1), ch 2 rest (chance the step sends its value);\n//   meta at frame 128 + bank: ch 0 steps, ch 1 range start, ch 2 range end.\n// skip: a step that fails is passed over on the same pulse; rest: the step counts but the value holds.\n// pendbank = the bank of a waiting sequence (-1 none): it takes over at the phasor wrap, at once when the\n//   clock stands still (0.1 s) or play is off, or when swapnow changes. It starts at its first step.\nBuffer vb(\"dingus-volt-none\");\nParam dir(0, min=0, max=2);\nParam play(1, min=0, max=1);\nParam run(1, min=0, max=1);\nParam pendbank(-1, min=-1, max=1);\nParam swapnow(0);\n\nHistory prevsub(0);\nHistory cur(-1);\nHistory rst(0);\nHistory val(0);\nHistory bk(0);\nHistory pph(0);\nHistory still(0);\nHistory lastsw(0);\nHistory prevrun(1);\n\nemit = 0;\nnxt = 0;\nok = 0;\ni = 0;\ntries = 0;\nrunning = play > 0 && run > 0;\n\nif (in2 > 0 || (run > 0 && prevrun <= 0)) {\n\trst = 1;\n}\nprevrun = run;\n\n// bank swap, before anything reads the tables of this sample\nwrapped = (in1 - pph) < -0.5;\nif (in1 != pph) {\n\tstill = 0;\n} else {\n\tstill = min(still + 1, 100000000);\n}\npph = in1;\nif (pendbank >= 0 && pendbank != bk && (wrapped || still > samplerate * 0.1 || swapnow != lastsw || running == 0)) {\n\tbk = pendbank;\n\trst = 1;\n}\nlastsw = swapnow;\nnb = bk * 64;\nmb = 128 + bk;\nn = clamp(peek(vb, mb, 0), 1, 64);\nlo = clamp(peek(vb, mb, 1), 0, n - 1);\nhi = clamp(peek(vb, mb, 2), lo, n - 1);\nspan = hi - lo + 1;\n\n// position inside the current step\npos = in1 * n;\nsub = pos - floor(pos);\nnewstep = (sub - prevsub) < -0.5;\nprevsub = sub;\n\nif (newstep && running) {\n\t// the next step by direction, then its skip roll; a failed roll moves on (same pulse)\n\tif (rst > 0) {\n\t\tnxt = (dir == 1) ? hi : lo;\n\t\trst = 0;\n\t} else if (dir == 0) {\n\t\tnxt = (cur + 1 > hi || cur + 1 < lo) ? lo : cur + 1;\n\t} else if (dir == 1) {\n\t\tnxt = (cur - 1 < lo || cur - 1 > hi) ? hi : cur - 1;\n\t} else {\n\t\tnxt = lo + min(floor((noise() * 0.5 + 0.5) * span), span - 1);\n\t}\n\tfor (i = 0; i < 4 * n; i += 1) {\n\t\tif (noise() * 0.5 + 0.5 < peek(vb, nb + nxt, 1)) {\n\t\t\tok = 1;\n\t\t\tbreak;\n\t\t}\n\t\tif (dir == 0) {\n\t\t\tnxt = (nxt + 1 > hi) ? lo : nxt + 1;\n\t\t} else if (dir == 1) {\n\t\t\tnxt = (nxt - 1 < lo) ? hi : nxt - 1;\n\t\t} else {\n\t\t\tnxt = lo + min(floor((noise() * 0.5 + 0.5) * span), span - 1);\n\t\t}\n\t}\n\tif (ok > 0) {\n\t\tcur = nxt;\n\t\t// rest roll: the step counts, the value holds when it fails\n\t\tif (noise() * 0.5 + 0.5 < peek(vb, nb + nxt, 2)) {\n\t\t\tval = peek(vb, nb + nxt, 0);\n\t\t\temit = 1;\n\t\t}\n\t}\n}\n\nout1 = val;\nout2 = cur;\nout3 = bk;\nout4 = emit;\n"
								}
							},
							{
								"box": {
									"id": "gout1",
									"maxclass": "newobj",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										20.0,
										630.0,
										45.0,
										22.0
									],
									"text": "out 1"
								}
							},
							{
								"box": {
									"id": "gout2",
									"maxclass": "newobj",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										140.0,
										630.0,
										45.0,
										22.0
									],
									"text": "out 2"
								}
							},
							{
								"box": {
									"id": "gout3",
									"maxclass": "newobj",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										260.0,
										630.0,
										45.0,
										22.0
									],
									"text": "out 3"
								}
							},
							{
								"box": {
									"id": "gout4",
									"maxclass": "newobj",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										380.0,
										630.0,
										45.0,
										22.0
									],
									"text": "out 4"
								}
							}
						],
						"lines": [
							{
								"patchline": {
									"source": [
										"gin1",
										0
									],
									"destination": [
										"gcode",
										0
									]
								}
							},
							{
								"patchline": {
									"source": [
										"gin2",
										0
									],
									"destination": [
										"gcode",
										1
									]
								}
							},
							{
								"patchline": {
									"source": [
										"gcode",
										0
									],
									"destination": [
										"gout1",
										0
									]
								}
							},
							{
								"patchline": {
									"source": [
										"gcode",
										1
									],
									"destination": [
										"gout2",
										0
									]
								}
							},
							{
								"patchline": {
									"source": [
										"gcode",
										2
									],
									"destination": [
										"gout3",
										0
									]
								}
							},
							{
								"patchline": {
									"source": [
										"gcode",
										3
									],
									"destination": [
										"gout4",
										0
									]
								}
							}
						]
					}
				}
			},
			{
				"box": {
					"id": "vm_click",
					"maxclass": "newobj",
					"text": "click~",
					"patching_rect": [
						1800.0,
						240.0,
						50.0,
						22.0
					],
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						"signal"
					]
				}
			},
			{
				"box": {
					"id": "vm_bufm",
					"maxclass": "message",
					"text": "vb #0-volt",
					"patching_rect": [
						1960.0,
						70.0,
						80.0,
						22.0
					],
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "vm_pplay",
					"maxclass": "newobj",
					"text": "prepend play",
					"patching_rect": [
						1700.0,
						240.0,
						80.0,
						22.0
					],
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "vm_pdir",
					"maxclass": "newobj",
					"text": "prepend dir",
					"patching_rect": [
						1870.0,
						240.0,
						75.0,
						22.0
					],
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "vm_edge",
					"maxclass": "newobj",
					"text": "edge~",
					"patching_rect": [
						1700.0,
						360.0,
						45.0,
						22.0
					],
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"bang",
						"bang"
					]
				}
			},
			{
				"box": {
					"id": "vm_vsnap",
					"maxclass": "newobj",
					"text": "snapshot~",
					"patching_rect": [
						1700.0,
						390.0,
						70.0,
						22.0
					],
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						"float"
					]
				}
			},
			{
				"box": {
					"id": "vm_ssnap",
					"maxclass": "newobj",
					"text": "snapshot~ 20",
					"patching_rect": [
						1800.0,
						360.0,
						80.0,
						22.0
					],
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						"float"
					]
				}
			},
			{
				"box": {
					"id": "vm_schg",
					"maxclass": "newobj",
					"text": "change",
					"patching_rect": [
						1800.0,
						390.0,
						50.0,
						22.0
					],
					"numinlets": 1,
					"numoutlets": 3,
					"outlettype": [
						"",
						"int",
						"int"
					]
				}
			},
			{
				"box": {
					"id": "vm_sint",
					"maxclass": "newobj",
					"text": "i",
					"patching_rect": [
						1800.0,
						420.0,
						30.0,
						22.0
					],
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						"int"
					]
				}
			},
			{
				"box": {
					"id": "vm_bsnap",
					"maxclass": "newobj",
					"text": "snapshot~ 20",
					"patching_rect": [
						1900.0,
						360.0,
						80.0,
						22.0
					],
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						"float"
					]
				}
			},
			{
				"box": {
					"id": "vm_bchg",
					"maxclass": "newobj",
					"text": "change",
					"patching_rect": [
						1900.0,
						390.0,
						50.0,
						22.0
					],
					"numinlets": 1,
					"numoutlets": 3,
					"outlettype": [
						"",
						"int",
						"int"
					]
				}
			},
			{
				"box": {
					"id": "vm_bpp",
					"maxclass": "newobj",
					"text": "prepend bankis",
					"patching_rect": [
						1900.0,
						420.0,
						100.0,
						22.0
					],
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "vm_bank",
					"maxclass": "newobj",
					"text": "v8 dingus.voltBank.js",
					"patching_rect": [
						1700.0,
						480.0,
						150.0,
						22.0
					],
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "vm_dsp",
					"maxclass": "newobj",
					"text": "dspstate~",
					"patching_rect": [
						2020.0,
						420.0,
						70.0,
						22.0
					],
					"numinlets": 1,
					"numoutlets": 4,
					"outlettype": [
						"int",
						"float",
						"int",
						"int"
					]
				}
			},
			{
				"box": {
					"id": "vm_dsppp",
					"maxclass": "newobj",
					"text": "prepend dsp",
					"patching_rect": [
						2020.0,
						450.0,
						80.0,
						22.0
					],
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "vm_pvals",
					"maxclass": "newobj",
					"text": "prepend vals",
					"patching_rect": [
						2100.0,
						120.0,
						80.0,
						22.0
					],
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "vm_prest",
					"maxclass": "newobj",
					"text": "prepend rest",
					"patching_rect": [
						2190.0,
						120.0,
						80.0,
						22.0
					],
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "vm_pskip",
					"maxclass": "newobj",
					"text": "prepend skip",
					"patching_rect": [
						2280.0,
						120.0,
						80.0,
						22.0
					],
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "vm_psteps",
					"maxclass": "newobj",
					"text": "prepend steps",
					"patching_rect": [
						2100.0,
						160.0,
						90.0,
						22.0
					],
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "vm_rt",
					"maxclass": "newobj",
					"text": "route needbuffer engine msv msr mss rsl grid stepsis seqis",
					"patching_rect": [
						1700.0,
						520.0,
						400.0,
						22.0
					],
					"numinlets": 1,
					"numoutlets": 10,
					"outlettype": [
						"",
						"",
						"",
						"",
						"",
						"",
						"",
						"",
						"",
						""
					]
				}
			},
			{
				"box": {
					"id": "vm_bufui",
					"maxclass": "message",
					"text": "buffer #0-volt, seqname #1",
					"patching_rect": [
						1700.0,
						560.0,
						180.0,
						22.0
					],
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "vm_setst",
					"maxclass": "newobj",
					"text": "prepend set",
					"patching_rect": [
						1900.0,
						560.0,
						75.0,
						22.0
					],
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "vm_setsq",
					"maxclass": "newobj",
					"text": "prepend set",
					"patching_rect": [
						1990.0,
						560.0,
						75.0,
						22.0
					],
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "vm_seqc",
					"maxclass": "comment",
					"text": "seq",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						1700.0,
						620.0,
						30.0,
						20.0
					],
					"presentation": 1,
					"presentation_rect": [
						0.0,
						172.0,
						30.0,
						20.0
					]
				}
			},
			{
				"box": {
					"id": "vm_seqbox",
					"maxclass": "number",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						"bang"
					],
					"parameter_enable": 0,
					"patching_rect": [
						1700.0,
						644.0,
						50.0,
						22.0
					],
					"presentation": 1,
					"presentation_rect": [
						32.0,
						172.0,
						40.0,
						22.0
					],
					"varname": "vm_seq",
					"minimum": 1,
					"maximum": 32
				}
			},
			{
				"box": {
					"id": "vm_m1",
					"maxclass": "newobj",
					"text": "- 1",
					"patching_rect": [
						1700.0,
						680.0,
						40.0,
						22.0
					],
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						"int"
					]
				}
			},
			{
				"box": {
					"id": "vm_pseq",
					"maxclass": "newobj",
					"text": "prepend seq",
					"patching_rect": [
						1700.0,
						710.0,
						80.0,
						22.0
					],
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "vm_minus",
					"maxclass": "textbutton",
					"text": "-",
					"numinlets": 1,
					"numoutlets": 3,
					"outlettype": [
						"",
						"",
						"int"
					],
					"parameter_enable": 0,
					"patching_rect": [
						1790.0,
						644.0,
						50.0,
						20.0
					],
					"presentation": 1,
					"presentation_rect": [
						76.0,
						172.0,
						22.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "vm_minus_m",
					"maxclass": "message",
					"text": "seqstep -1",
					"patching_rect": [
						1790.0,
						680.0,
						66.0,
						22.0
					],
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "vm_plus",
					"maxclass": "textbutton",
					"text": "+",
					"numinlets": 1,
					"numoutlets": 3,
					"outlettype": [
						"",
						"",
						"int"
					],
					"parameter_enable": 0,
					"patching_rect": [
						1860.0,
						644.0,
						50.0,
						20.0
					],
					"presentation": 1,
					"presentation_rect": [
						100.0,
						172.0,
						22.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "vm_plus_m",
					"maxclass": "message",
					"text": "seqstep 1",
					"patching_rect": [
						1860.0,
						680.0,
						66.0,
						22.0
					],
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "vm_copy",
					"maxclass": "textbutton",
					"text": "copy",
					"numinlets": 1,
					"numoutlets": 3,
					"outlettype": [
						"",
						"",
						"int"
					],
					"parameter_enable": 0,
					"patching_rect": [
						1930.0,
						644.0,
						50.0,
						20.0
					],
					"presentation": 1,
					"presentation_rect": [
						128.0,
						172.0,
						52.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "vm_copy_m",
					"maxclass": "message",
					"text": "copyseq",
					"patching_rect": [
						1930.0,
						680.0,
						66.0,
						22.0
					],
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "vm_paste",
					"maxclass": "textbutton",
					"text": "paste",
					"numinlets": 1,
					"numoutlets": 3,
					"outlettype": [
						"",
						"",
						"int"
					],
					"parameter_enable": 0,
					"patching_rect": [
						2000.0,
						644.0,
						50.0,
						20.0
					],
					"presentation": 1,
					"presentation_rect": [
						184.0,
						172.0,
						54.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "vm_paste_m",
					"maxclass": "message",
					"text": "pasteseq",
					"patching_rect": [
						2000.0,
						680.0,
						66.0,
						22.0
					],
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "vm_clear",
					"maxclass": "textbutton",
					"text": "clear",
					"numinlets": 1,
					"numoutlets": 3,
					"outlettype": [
						"",
						"",
						"int"
					],
					"parameter_enable": 0,
					"patching_rect": [
						2070.0,
						644.0,
						50.0,
						20.0
					],
					"presentation": 1,
					"presentation_rect": [
						242.0,
						172.0,
						50.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "vm_clear_m",
					"maxclass": "message",
					"text": "clear",
					"patching_rect": [
						2070.0,
						680.0,
						66.0,
						22.0
					],
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "vm_clearall",
					"maxclass": "textbutton",
					"text": "clear all",
					"numinlets": 1,
					"numoutlets": 3,
					"outlettype": [
						"",
						"",
						"int"
					],
					"parameter_enable": 0,
					"patching_rect": [
						2160.0,
						644.0,
						70.0,
						20.0
					],
					"presentation": 1,
					"presentation_rect": [
						296.0,
						172.0,
						70.0,
						22.0
					],
					"textoncolor": [
						1.0,
						0.345,
						0.345,
						1.0
					]
				}
			},
			{
				"box": {
					"id": "vm_dlg",
					"maxclass": "newobj",
					"text": "dialog @mode 2 @label \"Empty all 32 sequences?\"",
					"patching_rect": [
						2160.0,
						680.0,
						300.0,
						22.0
					],
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "vm_clearall_m",
					"maxclass": "message",
					"text": "clearall",
					"patching_rect": [
						2160.0,
						710.0,
						60.0,
						22.0
					],
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					]
				}
			},
			{
				"box": {
					"id": "vm_in",
					"maxclass": "inlet",
					"comment": "sequence 1-32 (takes over at the phasor wrap)",
					"index": 0,
					"numinlets": 0,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						700.0,
						40.0,
						30.0,
						30.0
					]
				}
			},
			{
				"box": {
					"id": "vm_prun",
					"maxclass": "newobj",
					"text": "prepend run",
					"patching_rect": [
						1960.0,
						240.0,
						80.0,
						22.0
					],
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						""
					]
				}
			}
		],
		"lines": [
			{
				"patchline": {
					"destination": [
						"obj-56",
						0
					],
					"source": [
						"obj-10",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"obj-87",
						0
					],
					"source": [
						"obj-11",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"obj-49",
						0
					],
					"source": [
						"obj-3",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"obj-204",
						0
					],
					"order": 0,
					"source": [
						"obj-32",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"obj-PstepsChange",
						0
					],
					"order": 1,
					"source": [
						"obj-32",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"obj-PstepsChange",
						3
					],
					"source": [
						"obj-33",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"obj-42",
						0
					],
					"source": [
						"obj-36",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"obj-36",
						1
					],
					"order": 0,
					"source": [
						"obj-38",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"obj-vtbl",
						0
					],
					"order": 1,
					"source": [
						"obj-38",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"obj-164",
						0
					],
					"source": [
						"obj-39",
						1
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"obj-38",
						1
					],
					"source": [
						"obj-40",
						1
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"obj-38",
						0
					],
					"source": [
						"obj-40",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"obj-56",
						0
					],
					"source": [
						"obj-46",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"obj-70",
						0
					],
					"source": [
						"obj-47",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"obj-10",
						0
					],
					"source": [
						"obj-5",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"obj-vord",
						0
					],
					"source": [
						"obj-55",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"obj-45",
						0
					],
					"order": 1,
					"source": [
						"obj-56",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"obj-67",
						0
					],
					"order": 0,
					"source": [
						"obj-56",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"obj-2",
						0
					],
					"source": [
						"obj-6",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"obj-56",
						1
					],
					"source": [
						"obj-61",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"obj-62",
						0
					],
					"order": 0,
					"source": [
						"obj-67",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"obj-3",
						1
					],
					"order": 1,
					"source": [
						"obj-7",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"obj-6",
						0
					],
					"order": 0,
					"source": [
						"obj-7",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"obj-205",
						0
					],
					"order": 0,
					"source": [
						"obj-75",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"obj-PstepsChange",
						1
					],
					"order": 1,
					"source": [
						"obj-75",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"obj-PstepsChange",
						2
					],
					"order": 0,
					"source": [
						"obj-89",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"obj-87",
						0
					],
					"source": [
						"obj-90",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"obj-vjs",
						0
					],
					"source": [
						"obj-PpresetLogic",
						2
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"obj-vpr",
						0
					],
					"source": [
						"obj-PpresetLogic",
						1
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"obj-vps",
						0
					],
					"source": [
						"obj-PpresetLogic",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"obj-32",
						0
					],
					"source": [
						"obj-PstepsChange",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"obj-40",
						0
					],
					"source": [
						"obj-PstepsChange",
						4
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"obj-55",
						0
					],
					"source": [
						"obj-PstepsChange",
						6
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"obj-67",
						0
					],
					"source": [
						"obj-PstepsChange",
						5
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"obj-75",
						0
					],
					"source": [
						"obj-PstepsChange",
						1
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"obj-87",
						0
					],
					"source": [
						"obj-PstepsChange",
						3
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"obj-89",
						0
					],
					"source": [
						"obj-PstepsChange",
						2
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"obj-55",
						0
					],
					"source": [
						"obj-vd100",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"obj-36",
						0
					],
					"source": [
						"obj-vd150",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"obj-33",
						0
					],
					"source": [
						"obj-vd50",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"obj-vps",
						0
					],
					"source": [
						"obj-vjs",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"obj-40",
						0
					],
					"source": [
						"obj-vord",
						1
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"obj-75",
						0
					],
					"source": [
						"obj-vord",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"obj-89",
						0
					],
					"order": 1,
					"source": [
						"obj-vord",
						2
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"obj-90",
						0
					],
					"order": 0,
					"source": [
						"obj-vord",
						2
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"obj-PpresetLogic",
						0
					],
					"source": [
						"obj-vpr",
						3
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"obj-32",
						0
					],
					"source": [
						"obj-vtbl",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"obj-42",
						0
					],
					"source": [
						"obj-vtbl",
						1
					]
				}
			},
			{
				"patchline": {
					"source": [
						"def-lb",
						0
					],
					"destination": [
						"def-m0",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"def-lb",
						0
					],
					"destination": [
						"def-m1",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"def-m1",
						0
					],
					"destination": [
						"obj-61",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"def-lb",
						0
					],
					"destination": [
						"def-m2",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"def-m2",
						0
					],
					"destination": [
						"obj-7",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"obj-vjs_slotfilter",
						0
					],
					"source": [
						"obj-vps",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"obj-vjs",
						0
					],
					"source": [
						"obj-vjs_slotfilter",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-56",
						0
					],
					"destination": [
						"vm_gen",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"vm_click",
						0
					],
					"destination": [
						"vm_gen",
						1
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-vlb",
						0
					],
					"destination": [
						"vm_bufm",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"vm_bufm",
						0
					],
					"destination": [
						"vm_gen",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-vpp",
						0
					],
					"destination": [
						"vm_pplay",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"vm_pplay",
						0
					],
					"destination": [
						"vm_gen",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-39",
						0
					],
					"destination": [
						"vm_pdir",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"vm_pdir",
						0
					],
					"destination": [
						"vm_gen",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"vm_gen",
						0
					],
					"destination": [
						"obj-3",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"vm_gen",
						3
					],
					"destination": [
						"vm_edge",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"vm_gen",
						0
					],
					"destination": [
						"vm_vsnap",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"vm_edge",
						0
					],
					"destination": [
						"vm_vsnap",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"vm_vsnap",
						0
					],
					"destination": [
						"obj-6",
						2
					]
				}
			},
			{
				"patchline": {
					"source": [
						"vm_gen",
						1
					],
					"destination": [
						"vm_ssnap",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"vm_ssnap",
						0
					],
					"destination": [
						"vm_schg",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"vm_schg",
						0
					],
					"destination": [
						"vm_sint",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"vm_sint",
						0
					],
					"destination": [
						"obj-90",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"vm_sint",
						0
					],
					"destination": [
						"obj-86",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"vm_gen",
						2
					],
					"destination": [
						"vm_bsnap",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"vm_bsnap",
						0
					],
					"destination": [
						"vm_bchg",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"vm_bchg",
						0
					],
					"destination": [
						"vm_bpp",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"vm_bpp",
						0
					],
					"destination": [
						"vm_bank",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"vm_dsp",
						0
					],
					"destination": [
						"vm_dsppp",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"vm_dsppp",
						0
					],
					"destination": [
						"vm_bank",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-89",
						0
					],
					"destination": [
						"vm_pvals",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"vm_pvals",
						0
					],
					"destination": [
						"vm_bank",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-75",
						0
					],
					"destination": [
						"vm_prest",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"vm_prest",
						0
					],
					"destination": [
						"vm_bank",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-32",
						0
					],
					"destination": [
						"vm_pskip",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"vm_pskip",
						0
					],
					"destination": [
						"vm_bank",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-42",
						0
					],
					"destination": [
						"vm_bank",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-33",
						0
					],
					"destination": [
						"vm_psteps",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"vm_psteps",
						0
					],
					"destination": [
						"vm_bank",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"vm_bank",
						0
					],
					"destination": [
						"vm_rt",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"vm_rt",
						0
					],
					"destination": [
						"vm_bufui",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"vm_bufui",
						0
					],
					"destination": [
						"vm_bank",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"vm_rt",
						1
					],
					"destination": [
						"vm_gen",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"vm_rt",
						2
					],
					"destination": [
						"obj-89",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"vm_rt",
						3
					],
					"destination": [
						"obj-75",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"vm_rt",
						4
					],
					"destination": [
						"obj-32",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"vm_rt",
						5
					],
					"destination": [
						"obj-40",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"vm_rt",
						6
					],
					"destination": [
						"obj-87",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"vm_rt",
						7
					],
					"destination": [
						"vm_setst",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"vm_setst",
						0
					],
					"destination": [
						"obj-33",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"vm_rt",
						8
					],
					"destination": [
						"vm_setsq",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"vm_setsq",
						0
					],
					"destination": [
						"vm_seqbox",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"vm_seqbox",
						0
					],
					"destination": [
						"vm_m1",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"vm_m1",
						0
					],
					"destination": [
						"vm_pseq",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"vm_pseq",
						0
					],
					"destination": [
						"vm_bank",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"vm_minus",
						0
					],
					"destination": [
						"vm_minus_m",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"vm_minus_m",
						0
					],
					"destination": [
						"vm_bank",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"vm_plus",
						0
					],
					"destination": [
						"vm_plus_m",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"vm_plus_m",
						0
					],
					"destination": [
						"vm_bank",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"vm_copy",
						0
					],
					"destination": [
						"vm_copy_m",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"vm_copy_m",
						0
					],
					"destination": [
						"vm_bank",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"vm_paste",
						0
					],
					"destination": [
						"vm_paste_m",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"vm_paste_m",
						0
					],
					"destination": [
						"vm_bank",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"vm_clear",
						0
					],
					"destination": [
						"vm_clear_m",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"vm_clear_m",
						0
					],
					"destination": [
						"vm_bank",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"vm_clearall",
						0
					],
					"destination": [
						"vm_dlg",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"vm_dlg",
						0
					],
					"destination": [
						"vm_clearall_m",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"vm_clearall_m",
						0
					],
					"destination": [
						"vm_bank",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"vm_in",
						0
					],
					"destination": [
						"vm_m1",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-1",
						1
					],
					"destination": [
						"obj-89",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-1",
						1
					],
					"destination": [
						"obj-75",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-1",
						1
					],
					"destination": [
						"obj-32",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-1",
						1
					],
					"destination": [
						"obj-40",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-1",
						1
					],
					"destination": [
						"obj-33",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-47",
						0
					],
					"destination": [
						"vm_prun",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"vm_prun",
						0
					],
					"destination": [
						"vm_gen",
						0
					]
				}
			}
		],
		"parameters": {
			"obj-32": [
				"multislider[2]",
				"multislider[8]",
				0
			],
			"obj-33": [
				"number",
				"number",
				0
			],
			"obj-40": [
				"rslider[4]",
				"rslider",
				0
			],
			"obj-61": [
				"number[10]",
				"number[10]",
				0
			],
			"obj-7": [
				"toggle",
				"toggle",
				0
			],
			"obj-75": [
				"multislider[3]",
				"multislider[7]",
				0
			],
			"obj-87": [
				"live.grid[8]",
				"live.grid",
				1
			],
			"obj-89": [
				"multislider[1]",
				"multislider",
				0
			],
			"parameterbanks": {
				"0": {
					"index": 0,
					"name": "",
					"parameters": [
						"-",
						"-",
						"-",
						"-",
						"-",
						"-",
						"-",
						"-"
					],
					"buttons": [
						"-",
						"-",
						"-",
						"-",
						"-",
						"-",
						"-",
						"-"
					]
				}
			},
			"inherited_shortname": 1
		},
		"autosave": 0,
		"styles": [
			{
				"name": "rnbodefault",
				"default": {
					"accentcolor": [
						0.343034118413925,
						0.506230533123016,
						0.86220508813858,
						1.0
					],
					"bgcolor": [
						0.031372549019608,
						0.125490196078431,
						0.211764705882353,
						1.0
					],
					"bgfillcolor": {
						"angle": 270.0,
						"autogradient": 0.0,
						"color": [
							0.031372549019608,
							0.125490196078431,
							0.211764705882353,
							1.0
						],
						"color1": [
							0.031372549019608,
							0.125490196078431,
							0.211764705882353,
							1.0
						],
						"color2": [
							0.263682,
							0.004541,
							0.038797,
							1.0
						],
						"proportion": 0.39,
						"type": "color"
					},
					"color": [
						0.929412,
						0.929412,
						0.352941,
						1.0
					],
					"elementcolor": [
						0.357540726661682,
						0.515565991401672,
						0.861786782741547,
						1.0
					],
					"fontname": [
						"Lato"
					],
					"fontsize": [
						12.0
					],
					"stripecolor": [
						0.258338063955307,
						0.352425158023834,
						0.511919498443604,
						1.0
					],
					"textcolor_inverse": [
						0.968627,
						0.968627,
						0.968627,
						1
					]
				},
				"parentstyle": "",
				"multi": 0
			},
			{
				"name": "rnbohighcontrast",
				"default": {
					"accentcolor": [
						0.666666666666667,
						0.666666666666667,
						0.666666666666667,
						1.0
					],
					"bgcolor": [
						0.0,
						0.0,
						0.0,
						1.0
					],
					"bgfillcolor": {
						"angle": 270.0,
						"autogradient": 0.0,
						"color": [
							0.0,
							0.0,
							0.0,
							1.0
						],
						"color1": [
							0.090196078431373,
							0.090196078431373,
							0.090196078431373,
							1.0
						],
						"color2": [
							0.156862745098039,
							0.168627450980392,
							0.164705882352941,
							1.0
						],
						"proportion": 0.5,
						"type": "color"
					},
					"clearcolor": [
						1.0,
						1.0,
						1.0,
						0.0
					],
					"color": [
						1.0,
						0.874509803921569,
						0.141176470588235,
						1.0
					],
					"editing_bgcolor": [
						0.258823529411765,
						0.258823529411765,
						0.258823529411765,
						1.0
					],
					"elementcolor": [
						0.223386004567146,
						0.254748553037643,
						0.998085916042328,
						1.0
					],
					"fontsize": [
						13.0
					],
					"locked_bgcolor": [
						0.258823529411765,
						0.258823529411765,
						0.258823529411765,
						1.0
					],
					"selectioncolor": [
						0.301960784313725,
						0.694117647058824,
						0.949019607843137,
						1.0
					],
					"stripecolor": [
						0.258823529411765,
						0.258823529411765,
						0.258823529411765,
						1.0
					],
					"textcolor": [
						1.0,
						1.0,
						1.0,
						1.0
					],
					"textcolor_inverse": [
						1.0,
						1.0,
						1.0,
						1.0
					]
				},
				"parentstyle": "",
				"multi": 0
			}
		],
		"color": [
			0.7019607843137254,
			0.6549019607843137,
			0.24705882352941178,
			1.0
		],
		"bgcolor": [
			0.027450980392156862,
			0.08627450980392157,
			0.1411764705882353,
			1.0
		]
	}
}