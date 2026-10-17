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
					"id": "obj-3",
					"linecount": 3,
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						51.0,
						235.0,
						150.0,
						47.0
					],
					"presentation": 1,
					"presentation_rect": [
						383.0,
						570.0,
						316.0,
						20.0
					],
					"text": "USE bpatcher dingus.gatesSeq.maxpat @args NAME"
				}
			},
			{
				"box": {
					"annotation": "clock phasor",
					"comment": "clock phasor",
					"hint": "clock phasor",
					"id": "in-clock",
					"index": 0,
					"maxclass": "inlet",
					"numinlets": 0,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						50.0,
						30.0,
						30.0,
						30.0
					]
				}
			},
			{
				"box": {
					"annotation": "step reset (bang)",
					"comment": "step reset (bang)",
					"hint": "step reset (bang)",
					"id": "in-reset",
					"index": 0,
					"maxclass": "inlet",
					"numinlets": 0,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						200.0,
						30.0,
						30.0,
						30.0
					]
				}
			},
			{
				"box": {
					"annotation": "rate~ reset (bang)",
					"comment": "rate~ reset (bang)",
					"hint": "rate~ reset (bang)",
					"id": "in-rreset",
					"index": 0,
					"maxclass": "inlet",
					"numinlets": 0,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						330.0,
						30.0,
						30.0,
						30.0
					]
				}
			},
			{
				"box": {
					"annotation": "play (1) / pause (0)",
					"comment": "play (1) / pause (0)",
					"hint": "play (1) / pause (0)",
					"id": "in-play",
					"index": 0,
					"maxclass": "inlet",
					"numinlets": 0,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						450.0,
						30.0,
						30.0,
						30.0
					]
				}
			},
			{
				"box": {
					"annotation": "length mod (signal -1..1)",
					"comment": "length mod (signal -1..1)",
					"hint": "length mod (signal -1..1)",
					"id": "in-lmod",
					"index": 0,
					"maxclass": "inlet",
					"numinlets": 0,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						560.0,
						30.0,
						30.0,
						30.0
					]
				}
			},
			{
				"box": {
					"annotation": "direction mod (signal -1..1)",
					"comment": "direction mod (signal -1..1)",
					"hint": "direction mod (signal -1..1)",
					"id": "in-dmod",
					"index": 0,
					"maxclass": "inlet",
					"numinlets": 0,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						670.0,
						30.0,
						30.0,
						30.0
					]
				}
			},
			{
				"box": {
					"annotation": "rate mod (signal, added)",
					"comment": "rate mod (signal, added)",
					"hint": "rate mod (signal, added)",
					"id": "in-rmod",
					"index": 0,
					"maxclass": "inlet",
					"numinlets": 0,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						780.0,
						30.0,
						30.0,
						30.0
					]
				}
			},
			{
				"box": {
					"comment": "gate (signal, level = velocity)",
					"id": "out-gate",
					"index": 0,
					"maxclass": "outlet",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						50.0,
						640.0,
						30.0,
						30.0
					]
				}
			},
			{
				"box": {
					"comment": "envelope (signal, peak = velocity)",
					"id": "out-env",
					"index": 0,
					"maxclass": "outlet",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						780.0,
						640.0,
						30.0,
						30.0
					]
				}
			},
			{
				"box": {
					"fontface": 1,
					"id": "c-clock",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						50.0,
						80.0,
						60.0,
						20.0
					],
					"text": "CLOCK"
				}
			},
			{
				"box": {
					"fontsize": 16.0,
					"format": 6,
					"id": "rate",
					"maxclass": "flonum",
					"minimum": 0.0625,
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						"bang"
					],
					"parameter_enable": 0,
					"patching_rect": [
						130.0,
						100.0,
						60.0,
						26.0
					],
					"presentation": 1,
					"presentation_rect": [
						4.0,
						74.0,
						60.0,
						26.0
					],
					"varname": "rate"
				}
			},
			{
				"box": {
					"id": "c-rate",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						195.0,
						100.0,
						40.0,
						20.0
					],
					"presentation": 1,
					"presentation_rect": [
						66.0,
						76.0,
						40.0,
						20.0
					],
					"text": "rate"
				}
			},
			{
				"box": {
					"id": "ratesig",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						"signal"
					],
					"patching_rect": [
						130.0,
						140.0,
						54.0,
						22.0
					],
					"text": "sig~ 1"
				}
			},
			{
				"box": {
					"id": "rateadd",
					"maxclass": "newobj",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						"signal"
					],
					"patching_rect": [
						130.0,
						175.0,
						30.0,
						22.0
					],
					"text": "+~"
				}
			},
			{
				"box": {
					"id": "ratereset_t",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						"bang"
					],
					"patching_rect": [
						330.0,
						100.0,
						33.0,
						22.0
					],
					"text": "t b"
				}
			},
			{
				"box": {
					"id": "ratereset",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						330.0,
						135.0,
						40.0,
						22.0
					],
					"text": "reset"
				}
			},
			{
				"box": {
					"id": "ratetilde",
					"maxclass": "newobj",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						"signal"
					],
					"patching_rect": [
						50.0,
						210.0,
						86.0,
						22.0
					],
					"text": "rate~ @sync 1"
				}
			},
			{
				"box": {
					"id": "scope-rate",
					"maxclass": "live.scope~",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						"bang"
					],
					"patching_rect": [
						160.0,
						210.0,
						95.0,
						40.0
					],
					"presentation": 1,
					"presentation_rect": [
						4.0,
						100.0,
						175.0,
						24.0
					]
				}
			},
			{
				"box": {
					"id": "stepreset_t",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						"bang"
					],
					"patching_rect": [
						200.0,
						250.0,
						33.0,
						22.0
					],
					"text": "t b"
				}
			},
			{
				"box": {
					"id": "click",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						"signal"
					],
					"patching_rect": [
						200.0,
						280.0,
						54.0,
						22.0
					],
					"text": "click~"
				}
			},
			{
				"box": {
					"id": "playmsg",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						450.0,
						280.0,
						55.0,
						22.0
					],
					"text": "play $1"
				}
			},
			{
				"box": {
					"id": "triggers",
					"maxclass": "toggle",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						"int"
					],
					"parameter_enable": 0,
					"patching_rect": [
						520.0,
						250.0,
						24.0,
						24.0
					],
					"presentation": 1,
					"presentation_rect": [
						4.0,
						156.0,
						20.0,
						20.0
					],
					"varname": "triggers"
				}
			},
			{
				"box": {
					"id": "c-trig",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						548.0,
						252.0,
						60.0,
						20.0
					],
					"presentation": 1,
					"presentation_rect": [
						28.0,
						156.0,
						60.0,
						20.0
					],
					"text": "triggers"
				}
			},
			{
				"box": {
					"id": "trigmsg",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						520.0,
						280.0,
						50.0,
						22.0
					],
					"text": "trig $1"
				}
			},
			{
				"box": {
					"fontface": 1,
					"id": "c-steps",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						880.0,
						80.0,
						140.0,
						20.0
					],
					"text": "STEPS / DIRECTION"
				}
			},
			{
				"box": {
					"id": "number",
					"maxclass": "number",
					"maximum": 64,
					"minimum": 1,
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						"bang"
					],
					"parameter_enable": 0,
					"patching_rect": [
						880.0,
						100.0,
						50.0,
						22.0
					],
					"presentation": 1,
					"presentation_rect": [
						4.0,
						30.0,
						50.0,
						22.0
					],
					"varname": "number"
				}
			},
			{
				"box": {
					"id": "c-stepsl",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						935.0,
						100.0,
						45.0,
						20.0
					],
					"presentation": 1,
					"presentation_rect": [
						56.0,
						30.0,
						45.0,
						20.0
					],
					"text": "steps"
				}
			},
			{
				"box": {
					"id": "stepsmsg",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						880.0,
						140.0,
						60.0,
						22.0
					],
					"text": "steps $1"
				}
			},
			{
				"box": {
					"id": "direction",
					"items": [
						"->",
						",",
						"<-",
						",",
						"rand"
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
						1000.0,
						100.0,
						74.0,
						22.0
					],
					"presentation": 1,
					"presentation_rect": [
						4.0,
						52.0,
						60.0,
						22.0
					],
					"varname": "direction"
				}
			},
			{
				"box": {
					"id": "dirmsg",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						1000.0,
						140.0,
						45.0,
						22.0
					],
					"text": "dir $1"
				}
			},
			{
				"box": {
					"fontface": 1,
					"id": "c-eng",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						50.0,
						320.0,
						300.0,
						20.0
					],
					"text": "GATE TABLE (buffer per instance) + ENGINE"
				}
			},
			{
				"box": {
					"id": "buf",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"float",
						"bang"
					],
					"patching_rect": [
						600.0,
						350.0,
						140.0,
						22.0
					],
					"text": "buffer~ #0-gates @samps 256 @chans 10"
				}
			},
			{
				"box": {
					"id": "init_lb",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						"bang"
					],
					"patching_rect": [
						880.0,
						350.0,
						68.0,
						22.0
					],
					"text": "loadbang"
				}
			},
			{
				"box": {
					"id": "init_def",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						880.0,
						380.0,
						68.0,
						22.0
					],
					"text": "deferlow"
				}
			},
			{
				"box": {
					"id": "bufui",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						880.0,
						410.0,
						100.0,
						22.0
					],
					"text": "buffer #0-gates, seqname #1"
				}
			},
			{
				"box": {
					"id": "bufgen",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						1000.0,
						410.0,
						80.0,
						22.0
					],
					"text": "gb #0-gates"
				}
			},
			{
				"box": {
					"id": "gen",
					"maxclass": "newobj",
					"numinlets": 4,
					"numoutlets": 5,
					"outlettype": [
						"signal",
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
										140.0,
										14.0,
										40.0,
										22.0
									],
									"text": "in 2"
								}
							},
							{
								"box": {
									"id": "gin3",
									"maxclass": "newobj",
									"numinlets": 0,
									"numoutlets": 1,
									"outlettype": [
										""
									],
									"patching_rect": [
										260.0,
										14.0,
										40.0,
										22.0
									],
									"text": "in 3"
								}
							},
							{
								"box": {
									"id": "gin4",
									"maxclass": "newobj",
									"numinlets": 0,
									"numoutlets": 1,
									"outlettype": [
										""
									],
									"patching_rect": [
										380.0,
										14.0,
										40.0,
										22.0
									],
									"text": "in 4"
								}
							},
							{
								"box": {
									"code": "// dingusGate engine: steps from the phasor, gates from the gate table buffer\n// in1 phasor (one cycle = whole loop)  in2 step reset (click)\n// in3 length mod (-1..1, x steps)      in4 direction mod (-1..1, x 3 modes)\n// out1 gate or trigger (level = velocity of the current hit)  out2 velocity of the current hit (held)\n// out3 current step\n// out4 envelope gate (every ratchet, or whole gate)  out5 the bank that plays (0 / 1)\n// two banks of gate tables, one per sequence: bank b at frames b * 64 .. b * 64 + 63; its meta at\n//   frame 128 + b: ch 0 steps, ch 1 range start, ch 2 range end, ch 3 swing (50..75; 0 = straight). pendbank = the bank of a waiting\n//   sequence (-1 none): it takes over at the phasor wrap, at once when the clock stands still (0.1 s)\n//   or play is off, or when swapnow changes. The new sequence starts at its first step.\nBuffer gb(\"dingus-gate-none\");\nParam steps(16, min=1, max=64);\nParam dir(0, min=0, max=2);\nParam play(1, min=0, max=1);\nParam trig(0, min=0, max=1);\nParam rstart(0, min=0, max=63);\nParam rend(63, min=0, max=63);\nParam everyr(1, min=0, max=1);\nParam pendbank(-1, min=-1, max=1);\nParam swapnow(0);\n\nHistory prevsub(0);\nHistory cur(-1);\nHistory rst(0);\nHistory act(0);\nHistory el(0);\nHistory glen(1);\nHistory grat(1);\nHistory gvel(0);\nHistory gduty(0.5);\nHistory pend(0);\nHistory pidx(0);\nHistory poff(0);\nHistory pcut(64);\nHistory gapc(0);\nHistory lastout(0);\nHistory gfill(1);\nHistory hitprev(-1);\nHistory tc(0);\nHistory gfade(0);\nHistory hvel(0);\nHistory bk(0);\nHistory pph(0);\nHistory still(0);\nHistory lastsw(0);\n\n// bank swap, before anything reads the tables of this sample\nwrapped = (in1 - pph) < -0.5;\nif (in1 != pph) {\n\tstill = 0;\n} else {\n\tstill = min(still + 1, 100000000);\n}\npph = in1;\nif (pendbank >= 0 && pendbank != bk && (wrapped || still > samplerate * 0.1 || swapnow != lastsw || play <= 0)) {\n\tbk = pendbank;\n\trst = 1;\n}\nlastsw = swapnow;\nnb = bk * 64;\nmb = 128 + bk;\nmsteps = max(peek(gb, mb, 0), 1);\nmsw = clamp(peek(gb, mb, 3), 50, 75) / 100;\n\nn = clamp(floor(msteps + in3 * msteps + 0.5), 1, 64);\nd = wrap(floor(dir + in4 * 3 + 0.5), 0, 3);\nrunning = play > 0;\nnxt = 0;\ns1 = 0;\nl = 0;\np = 0;\nrp = 0;\nfire = 0;\nfidx = 0;\nflen = 0;\ng = 0;\ni = 0;\nlo = 0;\nhi = 0;\nok = 0;\nhit = 0;\nlraw = 0;\neg = 0;\nhn = 0;\nfm = 0;\nfa = 0;\n\nif (in2 > 0) {\n\trst = 1;\n}\n\n// position inside the current step\n// swing: in each pair of steps the first takes msw of the pair's time (0.5 = straight, 0.75 = dotted);\n// an unpaired last step plays straight. Everything timed in steps follows the warped position.\npos0 = in1 * n;\npos = pos0;\npp = floor(pos0 / 2);\npu = pos0 - pp * 2;\nif (pp * 2 + 1 < n) {\n\tpos = pp * 2 + ((pu < 2 * msw) ? pu / (2 * msw) : 1 + (pu - 2 * msw) / (2 - 2 * msw));\n}\n\nsub = pos - floor(pos);\nds = sub - prevsub;\nnewstep = ds < -0.5;\nadv = ds;\nif (newstep) {\n\tadv = ds + 1;\n}\nadv = max(adv, 0);\nprevsub = sub;\n\n// advance the running gate (time counted in steps, straight from the phasor)\nif (act > 0) {\n\tel = el + adv;\n\tif (el >= glen || running == 0) {\n\t\tact = 0;\n\t}\n}\n\n// play range (sub-loop) from the editor's range strip\nlo = clamp(peek(gb, mb, 1), 0, n - 1);\nhi = clamp(peek(gb, mb, 2), lo, n - 1);\n\nif (newstep && running) {\n\tif (rst > 0) {\n\t\tnxt = (d == 1) ? hi : lo;\n\t\trst = 0;\n\t} else if (d == 0) {\n\t\tnxt = (cur + 1 > hi || cur + 1 < lo) ? lo : cur + 1;\n\t} else if (d == 1) {\n\t\tnxt = (cur - 1 < lo || cur - 1 > hi) ? hi : cur - 1;\n\t} else {\n\t\tnxt = lo + min(floor((noise() * 0.5 + 0.5) * (hi - lo + 1)), hi - lo);\n\t}\n\t// skip: jump over steps whose skip roll fails (channel 8 = chance the step plays)\n\tfor (i = 0; i < n; i += 1) {\n\t\tif (noise() * 0.5 + 0.5 < peek(gb, nb + nxt, 7)) {\n\t\t\tok = 1;\n\t\t\tbreak;\n\t\t}\n\t\tif (d == 0) {\n\t\t\tnxt = (nxt + 1 > hi) ? lo : nxt + 1;\n\t\t} else if (d == 1) {\n\t\t\tnxt = (nxt - 1 < lo) ? hi : nxt - 1;\n\t\t} else {\n\t\t\tnxt = lo + min(floor((noise() * 0.5 + 0.5) * (hi - lo + 1)), hi - lo);\n\t\t}\n\t}\n\tcur = nxt;\n\tpend = 0;\n\tif (ok == 0) {\n\t\t// every step skipped: nothing plays\n\t} else if (d == 1) {\n\t\t// reverse: the gate whose played end falls in this step, mirrored\n\t\ts1 = peek(gb, nb + nxt, 5);\n\t\tif (s1 > 0) {\n\t\t\tpidx = nb + s1 - 1;\n\t\t\tpoff = peek(gb, nb + nxt, 6);\n\t\t\tpcut = 64;\n\t\t\tpend = 1;\n\t\t}\n\t} else {\n\t\t// forward / random: the gate starting here, after its delay (channel 9)\n\t\tl = peek(gb, nb + nxt, 0);\n\t\tif (l > 0) {\n\t\t\tpidx = nb + nxt;\n\t\t\tpoff = peek(gb, nb + nxt, 8);\n\t\t\tpcut = (d == 0) ? hi + 1 - nxt - poff : 64;\n\t\t\tpend = 1;\n\t\t}\n\t}\n}\n\n// pending gate: starts part-way into the step (delay forward, mirrored offset in reverse)\nif (pend > 0 && running && sub >= poff) {\n\tpend = 0;\n\tfire = 1;\n\tfidx = pidx;\n\tflen = min(peek(gb, pidx, 0), pcut);\n}\n\n// probability is rolled once, when the gate starts\nif (fire > 0 && flen > 0) {\n\tp = peek(gb, fidx, 1);\n\tif (noise() * 0.5 + 0.5 < p) {\n\t\tif (lastout > 0 && trig == 0) {\n\t\t\tgapc = floor(samplerate * 0.003);\n\t\t}\n\t\tact = 1;\n\t\tel = 0;\n\t\tglen = flen;\n\t\tgrat = max(peek(gb, fidx, 2), 1);\n\t\tgvel = peek(gb, fidx, 3);\n\t\tgduty = peek(gb, fidx, 4);\n\t\tgfade = peek(gb, fidx, 9);\n\t\tlraw = peek(gb, fidx, 0);\n\t\tgfill = lraw - ceil(lraw) + 1;\n\t\thitprev = -1;\n\t}\n}\n\n// FADE: velocity per ratchet hit, exponential; < 0 rises to VEL, > 0 falls from VEL;\n// at +-50 the quietest hit is 1% of VEL (only with 2+ ratchets)\nif (act > 0) {\n\thvel = gvel;\n\tif (grat > 1 && gfade != 0) {\n\t\thn = min(floor(el / glen * grat), grat - 1) / (grat - 1);\n\t\tfm = pow(0.01, abs(gfade) / 50);\n\t\tfa = (gfade < 0) ? pow(fm, 1 - hn) : pow(fm, hn);\n\t\thvel = gvel * fa;\n\t}\n}\n\nif (trig > 0) {\n\t// trigger mode: one pulse per gate / ratchet hit, 1..10 ms\n\t// pulse length from LEN (fill 0.05..1), or from DUTY (0.05..0.95) when ratcheted\n\tif (act > 0) {\n\t\thit = floor(el / glen * grat);\n\t\tif (hit != hitprev) {\n\t\t\thitprev = hit;\n\t\t\tif (grat > 1) {\n\t\t\t\ttc = floor(samplerate * (1 + (gduty - 0.05) / 0.9 * 9) * 0.001);\n\t\t\t} else {\n\t\t\t\ttc = floor(samplerate * (1 + (gfill - 0.05) / 0.95 * 9) * 0.001);\n\t\t\t}\n\t\t}\n\t}\n\tif (tc > 0) {\n\t\ttc = tc - 1;\n\t\tg = hvel;\n\t}\n} else if (act > 0) {\n\t// ratchets split the whole gate evenly; duty only applies with 2+ ratchets\n\tif (grat <= 1) {\n\t\tg = hvel;\n\t} else {\n\t\trp = el / glen * grat;\n\t\tif (rp - floor(rp) < gduty) {\n\t\t\tg = hvel;\n\t\t}\n\t}\n}\n// 3 ms low gap when a new gate follows a high one, so it retriggers\n// envelope gate: every ratchet hit, or the whole gate (first hit only)\neg = g;\nif (everyr == 0) {\n\teg = (act > 0) ? gvel : 0;\n}\nif (gapc > 0) {\n\tgapc = gapc - 1;\n\tg = 0;\n\teg = 0;\n}\nlastout = g;\n\nout1 = g;\nout2 = hvel;\nout3 = cur;\nout4 = eg;\nout5 = bk;\n",
									"fontface": 0,
									"fontname": "<Monospaced>",
									"fontsize": 12.0,
									"id": "gcode",
									"maxclass": "codebox",
									"numinlets": 4,
									"numoutlets": 5,
									"outlettype": [
										"",
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
									]
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
							},
							{
								"box": {
									"id": "gout5",
									"maxclass": "newobj",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										500.0,
										630.0,
										45.0,
										22.0
									],
									"text": "out 5"
								}
							}
						],
						"lines": [
							{
								"patchline": {
									"destination": [
										"gout1",
										0
									],
									"source": [
										"gcode",
										0
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"gout2",
										0
									],
									"source": [
										"gcode",
										1
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"gout3",
										0
									],
									"source": [
										"gcode",
										2
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"gout4",
										0
									],
									"source": [
										"gcode",
										3
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"gcode",
										0
									],
									"source": [
										"gin1",
										0
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"gcode",
										1
									],
									"source": [
										"gin2",
										0
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"gcode",
										2
									],
									"source": [
										"gin3",
										0
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"gcode",
										3
									],
									"source": [
										"gin4",
										0
									]
								}
							},
							{
								"patchline": {
									"source": [
										"gcode",
										4
									],
									"destination": [
										"gout5",
										0
									]
								}
							}
						]
					},
					"patching_rect": [
						50.0,
						470.0,
						400.0,
						22.0
					],
					"text": "gen~"
				}
			},
			{
				"box": {
					"id": "snap",
					"maxclass": "newobj",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						"float"
					],
					"patching_rect": [
						450.0,
						510.0,
						96.0,
						22.0
					],
					"text": "snapshot~ 20"
				}
			},
			{
				"box": {
					"id": "chg",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 3,
					"outlettype": [
						"",
						"int",
						"int"
					],
					"patching_rect": [
						450.0,
						540.0,
						54.0,
						22.0
					],
					"text": "change"
				}
			},
			{
				"box": {
					"embed": 0,
					"filename": "dingus.gateRoll.js",
					"id": "gateroll",
					"maxclass": "v8ui",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"parameter_enable": 0,
					"patching_rect": [
						880.0,
						450.0,
						389.0,
						160.0
					],
					"presentation": 1,
					"presentation_rect": [
						183.0,
						2.0,
						764.0,
						424.0
					],
					"textfile": {
						"filename": "dingus.gateRoll.js",
						"flags": 0,
						"embed": 0,
						"autowatch": 1
					},
					"varname": "gateroll"
				}
			},
			{
				"box": {
					"id": "needbuf",
					"maxclass": "newobj",
					"numinlets": 2,
					"numoutlets": 3,
					"outlettype": [
						"",
						"",
						""
					],
					"patching_rect": [
						1000.0,
						620.0,
						124.0,
						22.0
					],
					"text": "route needbuffer range"
				}
			},
			{
				"box": {
					"id": "scope-gate",
					"maxclass": "live.scope~",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						"bang"
					],
					"patching_rect": [
						160.0,
						520.0,
						233.0,
						40.0
					],
					"presentation": 1,
					"presentation_rect": [
						630.0,
						434.0,
						313.0,
						55.0
					],
					"range": [
						0.0,
						1.0
					]
				}
			},
			{
				"box": {
					"fontface": 1,
					"id": "c-env",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						50.0,
						680.0,
						480.0,
						20.0
					],
					"text": "ENVELOPE (optional 2nd outlet): gate edges -> function -> curve~ x velocity"
				}
			},
			{
				"box": {
					"id": "env-obj-8",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"bang",
						"bang"
					],
					"patching_rect": [
						50.0,
						710.0,
						42.0,
						22.0
					],
					"text": "edge~"
				}
			},
			{
				"box": {
					"id": "env-obj-7",
					"maxclass": "button",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						"bang"
					],
					"parameter_enable": 0,
					"patching_rect": [
						50.0,
						745.0,
						24.0,
						24.0
					],
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
					"id": "env-obj-2",
					"linethickness": 2.0,
					"maxclass": "function",
					"mode": 1,
					"numinlets": 1,
					"numoutlets": 4,
					"outlettype": [
						"float",
						"",
						"",
						"bang"
					],
					"parameter_enable": 1,
					"patching_rect": [
						230.0,
						780.0,
						212.0,
						98.0
					],
					"pointsize": 5.0,
					"presentation": 1,
					"presentation_rect": [
						183.0,
						434.0,
						440.0,
						115.0
					],
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
					"id": "env-obj-242",
					"maxclass": "slider",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"parameter_enable": 1,
					"patching_rect": [
						230.0,
						885.0,
						212.0,
						10.0
					],
					"presentation": 1,
					"presentation_rect": [
						183.0,
						554.0,
						440.0,
						10.0
					],
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
					"id": "env-obj-15",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						470.0,
						745.0,
						81.0,
						22.0
					],
					"text": "setdomain $1"
				}
			},
			{
				"box": {
					"id": "env-obj-11",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						170.0,
						745.0,
						35.0,
						22.0
					],
					"presentation": 1,
					"presentation_rect": [
						183.0,
						569.0,
						40.0,
						22.0
					],
					"text": "clear"
				}
			},
			{
				"box": {
					"id": "env-obj-3",
					"maxclass": "newobj",
					"numinlets": 3,
					"numoutlets": 2,
					"outlettype": [
						"signal",
						"bang"
					],
					"patching_rect": [
						230.0,
						910.0,
						45.0,
						22.0
					],
					"text": "curve~"
				}
			},
			{
				"box": {
					"id": "env-next",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						110.0,
						745.0,
						208.0,
						22.0
					],
					"saved_object_attributes": {
						"filename": "dingus.envNext.js",
						"parameter_enable": 0
					},
					"text": "v8 dingus.envNext.js function"
				}
			},
			{
				"box": {
					"id": "envvel",
					"maxclass": "newobj",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						"signal"
					],
					"patching_rect": [
						230.0,
						945.0,
						30.0,
						22.0
					],
					"text": "*~"
				}
			},
			{
				"box": {
					"id": "everyr",
					"maxclass": "toggle",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						"int"
					],
					"parameter_enable": 0,
					"patching_rect": [
						560.0,
						710.0,
						24.0,
						24.0
					],
					"presentation": 1,
					"presentation_rect": [
						240.0,
						570.0,
						20.0,
						20.0
					],
					"varname": "everyratchet"
				}
			},
			{
				"box": {
					"id": "c-everyr",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						588.0,
						712.0,
						90.0,
						20.0
					],
					"presentation": 1,
					"presentation_rect": [
						264.0,
						570.0,
						100.0,
						20.0
					],
					"text": "every ratchet"
				}
			},
			{
				"box": {
					"id": "everyrmsg",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						560.0,
						745.0,
						60.0,
						22.0
					],
					"text": "everyr $1"
				}
			},
			{
				"box": {
					"id": "everyr_lb",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						560.0,
						680.0,
						82.0,
						22.0
					],
					"text": "loadmess 1"
				}
			},
			{
				"box": {
					"id": "scope-env",
					"maxclass": "live.scope~",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						"bang"
					],
					"patching_rect": [
						300.0,
						945.0,
						233.0,
						60.0
					],
					"presentation": 1,
					"presentation_rect": [
						630.0,
						494.0,
						313.0,
						70.0
					],
					"range": [
						0.0,
						1.0
					]
				}
			},
			{
				"box": {
					"fontface": 1,
					"id": "c-pre",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						880.0,
						680.0,
						344.0,
						20.0
					],
					"text": "PRESETS: <this folder>/uGATE_<bpatcher argument>.json"
				}
			},
			{
				"box": {
					"id": "autopattr",
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
						880.0,
						710.0,
						56.0,
						22.0
					],
					"text": "autopattr @autorestore 0",
					"varname": "u610013519"
				}
			},
			{
				"box": {
					"id": "pre",
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
						880.0,
						740.0,
						100.0,
						20.0
					],
					"pattrstorage": "#1_uGATE",
					"presentation": 1,
					"presentation_rect": [
						4.0,
						130.0,
						175.0,
						18.0
					]
				}
			},
			{
				"box": {
					"id": "prelogic",
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
							640.0,
							360.0
						],
						"integercoordinates": 1,
						"boxes": [
							{
								"box": {
									"id": "lb",
									"maxclass": "newobj",
									"numinlets": 1,
									"numoutlets": 1,
									"outlettype": [
										"bang"
									],
									"patching_rect": [
										30.0,
										60.0,
										58.0,
										22.0
									],
									"text": "loadbang"
								}
							},
							{
								"box": {
									"id": "pri",
									"maxclass": "message",
									"numinlets": 2,
									"numoutlets": 1,
									"outlettype": [
										""
									],
									"patching_rect": [
										30.0,
										110.0,
										420.0,
										22.0
									],
									"text": "priority number -4, priority direction -3, priority rate -2, priority gateroll -1"
								}
							},
							{
								"box": {
									"id": "bind",
									"maxclass": "message",
									"numinlets": 2,
									"numoutlets": 1,
									"outlettype": [
										""
									],
									"patching_rect": [
										250.0,
										150.0,
										140.0,
										22.0
									],
									"text": "pattrstorage #1_uGATE"
								}
							},
							{
								"box": {
									"id": "load",
									"maxclass": "message",
									"numinlets": 2,
									"numoutlets": 1,
									"outlettype": [
										""
									],
									"patching_rect": [
										420.0,
										190.0,
										78.0,
										22.0
									],
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
									"outlettype": [
										"int"
									],
									"patching_rect": [
										500.0,
										20.0,
										30.0,
										30.0
									]
								}
							},
							{
								"box": {
									"id": "tb",
									"maxclass": "newobj",
									"numinlets": 1,
									"numoutlets": 1,
									"outlettype": [
										"bang"
									],
									"patching_rect": [
										500.0,
										110.0,
										24.0,
										22.0
									],
									"text": "t b"
								}
							},
							{
								"box": {
									"id": "def",
									"maxclass": "newobj",
									"numinlets": 1,
									"numoutlets": 1,
									"outlettype": [
										""
									],
									"patching_rect": [
										500.0,
										150.0,
										58.0,
										22.0
									],
									"text": "deferlow"
								}
							},
							{
								"box": {
									"id": "save",
									"maxclass": "message",
									"numinlets": 2,
									"numoutlets": 1,
									"outlettype": [
										""
									],
									"patching_rect": [
										500.0,
										190.0,
										35.0,
										22.0
									],
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
									"patching_rect": [
										30.0,
										280.0,
										30.0,
										30.0
									]
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
									"patching_rect": [
										250.0,
										280.0,
										30.0,
										30.0
									]
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
									"patching_rect": [
										450.0,
										280.0,
										30.0,
										30.0
									]
								}
							},
							{
								"box": {
									"id": "cm",
									"linecount": 2,
									"maxclass": "comment",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										30.0,
										20.0,
										440.0,
										20.0
									],
									"text": "presets: file <this folder>/uGATE_<bpatcher argument>.json, read at load, written on every store"
								}
							}
						],
						"lines": [
							{
								"patchline": {
									"destination": [
										"o2",
										0
									],
									"source": [
										"bind",
										0
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"save",
										0
									],
									"source": [
										"def",
										0
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"tb",
										0
									],
									"source": [
										"in1",
										0
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"bind",
										0
									],
									"order": 1,
									"source": [
										"lb",
										0
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"load",
										0
									],
									"order": 0,
									"source": [
										"lb",
										0
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"pri",
										0
									],
									"order": 2,
									"source": [
										"lb",
										0
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"o3",
										0
									],
									"source": [
										"load",
										0
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"o1",
										0
									],
									"source": [
										"pri",
										0
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"o3",
										0
									],
									"source": [
										"save",
										0
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"def",
										0
									],
									"source": [
										"tb",
										0
									]
								}
							}
						]
					},
					"patching_rect": [
						880.0,
						770.0,
						101.0,
						22.0
					],
					"text": "p presetLogic"
				}
			},
			{
				"box": {
					"id": "prestore",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						880.0,
						830.0,
						301.0,
						22.0
					],
					"priority": {
						"number": -4,
						"direction": -3,
						"rate": -2,
						"gateroll": -1
					},
					"saved_object_attributes": {
						"client_rect": [
							580,
							87,
							949,
							304
						],
						"parameter_enable": 0,
						"parameter_mappable": 0,
						"storage_rect": [
							583,
							69,
							1034,
							197
						]
					},
					"text": "pattrstorage #1_uGATE @savemode 0 @autorestore 0",
					"varname": "#1_uGATE"
				}
			},
			{
				"box": {
					"id": "prejs",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						880.0,
						800.0,
						190.0,
						22.0
					],
					"saved_object_attributes": {
						"filename": "dingus.presetFile.js",
						"parameter_enable": 0
					},
					"text": "v8 dingus.presetFile.js uGATE #1"
				}
			},
			{
				"box": {
					"id": "c-init",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						1100.0,
						350.0,
						120.0,
						20.0
					],
					"text": "defaults at load"
				}
			},
			{
				"box": {
					"id": "def_lb",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						"bang"
					],
					"patching_rect": [
						1100.0,
						380.0,
						68.0,
						22.0
					],
					"text": "loadbang"
				}
			},
			{
				"box": {
					"id": "def_rate",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						1100.0,
						410.0,
						30.0,
						22.0
					],
					"text": "1."
				}
			},
			{
				"box": {
					"id": "def_steps",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						1140.0,
						410.0,
						30.0,
						22.0
					],
					"text": "5"
				}
			},
			{
				"box": {
					"id": "def_dir",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						1180.0,
						410.0,
						30.0,
						22.0
					],
					"text": "0"
				}
			},
			{
				"box": {
					"fontsize": 16.0,
					"id": "c-title",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						20.0,
						600.0,
						62.0,
						24.0
					],
					"presentation": 1,
					"presentation_rect": [
						4.0,
						2.0,
						80.0,
						24.0
					],
					"text": "GATES"
				}
			},
			{
				"box": {
					"id": "rg-unp",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"int",
						"int"
					],
					"patching_rect": [
						1140.0,
						650.0,
						60,
						22
					],
					"text": "unpack 0 0"
				}
			},
			{
				"box": {
					"id": "rg-ps",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						1140.0,
						680.0,
						85,
						22
					],
					"text": "prepend rstart"
				}
			},
			{
				"box": {
					"id": "rg-pe",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						1235.0,
						680.0,
						80,
						22
					],
					"text": "prepend rend"
				}
			},
			{
				"box": {
					"id": "prejs_slotfilter",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						""
					],
					"patching_rect": [
						1090.0,
						800.0,
						120.0,
						22.0
					],
					"text": "routepass slotlist"
				}
			},
			{
				"box": {
					"id": "sq_bsnap",
					"maxclass": "newobj",
					"text": "snapshot~ 20",
					"patching_rect": [
						1100.0,
						1040.0,
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
					"id": "sq_bchg",
					"maxclass": "newobj",
					"text": "change",
					"patching_rect": [
						1100.0,
						1070.0,
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
					"id": "sq_bpp",
					"maxclass": "newobj",
					"text": "prepend bankis",
					"patching_rect": [
						1100.0,
						1100.0,
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
					"id": "sq_dsp",
					"maxclass": "newobj",
					"text": "dspstate~",
					"patching_rect": [
						1230.0,
						1040.0,
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
					"id": "sq_dsppp",
					"maxclass": "newobj",
					"text": "prepend dsp",
					"patching_rect": [
						1230.0,
						1070.0,
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
					"id": "sq_rt",
					"maxclass": "newobj",
					"text": "route engine stepsis seqis swingis",
					"patching_rect": [
						830.0,
						1040.0,
						170.0,
						22.0
					],
					"numinlets": 1,
					"numoutlets": 5,
					"outlettype": [
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
					"id": "sq_setst",
					"maxclass": "newobj",
					"text": "prepend set",
					"patching_rect": [
						830.0,
						1080.0,
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
					"id": "sq_setsq",
					"maxclass": "newobj",
					"text": "prepend set",
					"patching_rect": [
						930.0,
						1080.0,
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
					"id": "sq_cmt",
					"maxclass": "comment",
					"text": "seq",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						40.0,
						1040.0,
						40.0,
						20.0
					],
					"presentation": 1,
					"presentation_rect": [
						4.0,
						182.0,
						30.0,
						20.0
					]
				}
			},
			{
				"box": {
					"id": "sq_box",
					"maxclass": "number",
					"maximum": 32,
					"minimum": 1,
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						"bang"
					],
					"parameter_enable": 0,
					"patching_rect": [
						40.0,
						1064.0,
						50.0,
						22.0
					],
					"presentation": 1,
					"presentation_rect": [
						34.0,
						182.0,
						40.0,
						22.0
					],
					"varname": "gs_seq"
				}
			},
			{
				"box": {
					"id": "sq_m1",
					"maxclass": "newobj",
					"text": "- 1",
					"patching_rect": [
						40.0,
						1100.0,
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
					"id": "sq_pseq",
					"maxclass": "newobj",
					"text": "prepend seq",
					"patching_rect": [
						40.0,
						1130.0,
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
					"id": "sq_minus",
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
						130.0,
						1064.0,
						50.0,
						20.0
					],
					"presentation": 1,
					"presentation_rect": [
						78.0,
						182.0,
						22.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "sq_minus_m",
					"maxclass": "message",
					"text": "seqstep -1",
					"patching_rect": [
						130.0,
						1100.0,
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
					"id": "sq_plus",
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
						200.0,
						1064.0,
						50.0,
						20.0
					],
					"presentation": 1,
					"presentation_rect": [
						102.0,
						182.0,
						22.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "sq_plus_m",
					"maxclass": "message",
					"text": "seqstep 1",
					"patching_rect": [
						200.0,
						1100.0,
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
					"id": "sq_copy",
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
						270.0,
						1064.0,
						50.0,
						20.0
					],
					"presentation": 1,
					"presentation_rect": [
						4.0,
						208.0,
						50.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "sq_copy_m",
					"maxclass": "message",
					"text": "copyseq",
					"patching_rect": [
						270.0,
						1100.0,
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
					"id": "sq_paste",
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
						340.0,
						1064.0,
						50.0,
						20.0
					],
					"presentation": 1,
					"presentation_rect": [
						58.0,
						208.0,
						54.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "sq_paste_m",
					"maxclass": "message",
					"text": "pasteseq",
					"patching_rect": [
						340.0,
						1100.0,
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
					"id": "sq_clear",
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
						410.0,
						1064.0,
						50.0,
						20.0
					],
					"presentation": 1,
					"presentation_rect": [
						116.0,
						208.0,
						50.0,
						22.0
					]
				}
			},
			{
				"box": {
					"id": "sq_clear_m",
					"maxclass": "message",
					"text": "clear",
					"patching_rect": [
						410.0,
						1100.0,
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
					"id": "sq_clearall",
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
						500.0,
						1064.0,
						70.0,
						20.0
					],
					"presentation": 1,
					"presentation_rect": [
						4.0,
						234.0,
						80.0,
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
					"id": "sq_dlg",
					"maxclass": "newobj",
					"text": "dialog @mode 2 @label \"Empty all 32 sequences?\"",
					"patching_rect": [
						500.0,
						1100.0,
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
					"id": "sq_clearall_m",
					"maxclass": "message",
					"text": "clearall",
					"patching_rect": [
						500.0,
						1130.0,
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
					"id": "sq_in",
					"maxclass": "inlet",
					"comment": "sequence 1-32 (takes over at the phasor wrap)",
					"index": 0,
					"numinlets": 0,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						900.0,
						30.0,
						30.0,
						30.0
					]
				}
			},
			{
				"box": {
					"id": "sw_box",
					"maxclass": "number",
					"maximum": 75,
					"minimum": 50,
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						"bang"
					],
					"parameter_enable": 0,
					"patching_rect": [
						1350.0,
						1040.0,
						50.0,
						22.0
					],
					"presentation": 1,
					"presentation_rect": [
						50.0,
						258.0,
						40.0,
						22.0
					],
					"varname": "gatesSeq_swing"
				}
			},
			{
				"box": {
					"id": "sw_cmt",
					"maxclass": "comment",
					"text": "swing",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						1410.0,
						1040.0,
						50.0,
						20.0
					],
					"presentation": 1,
					"presentation_rect": [
						4.0,
						260.0,
						45.0,
						20.0
					]
				}
			},
			{
				"box": {
					"id": "sw_pp",
					"maxclass": "newobj",
					"text": "prepend swing",
					"patching_rect": [
						1350.0,
						1070.0,
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
					"id": "sw_set",
					"maxclass": "newobj",
					"text": "prepend set",
					"patching_rect": [
						1450.0,
						1070.0,
						75.0,
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
						"gen",
						0
					],
					"source": [
						"bufgen",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"gateroll",
						0
					],
					"source": [
						"bufui",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"gateroll",
						1
					],
					"source": [
						"chg",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"gen",
						1
					],
					"source": [
						"click",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"direction",
						0
					],
					"source": [
						"def_dir",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"def_dir",
						0
					],
					"order": 0,
					"source": [
						"def_lb",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"def_rate",
						0
					],
					"order": 2,
					"source": [
						"def_lb",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"def_steps",
						0
					],
					"order": 1,
					"source": [
						"def_lb",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"rate",
						0
					],
					"source": [
						"def_rate",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"number",
						0
					],
					"source": [
						"def_steps",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"dirmsg",
						0
					],
					"source": [
						"direction",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"gen",
						0
					],
					"source": [
						"dirmsg",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"env-obj-2",
						0
					],
					"source": [
						"env-next",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"env-obj-2",
						0
					],
					"source": [
						"env-obj-11",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"env-obj-2",
						0
					],
					"source": [
						"env-obj-15",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"env-obj-3",
						0
					],
					"source": [
						"env-obj-2",
						1
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"env-obj-7",
						0
					],
					"source": [
						"env-obj-2",
						3
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"env-obj-15",
						0
					],
					"source": [
						"env-obj-242",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"envvel",
						0
					],
					"source": [
						"env-obj-3",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"env-obj-2",
						0
					],
					"source": [
						"env-obj-7",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"env-next",
						0
					],
					"source": [
						"env-obj-8",
						1
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"env-obj-7",
						0
					],
					"source": [
						"env-obj-8",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"out-env",
						0
					],
					"order": 0,
					"source": [
						"envvel",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"scope-env",
						0
					],
					"order": 1,
					"source": [
						"envvel",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"everyrmsg",
						0
					],
					"source": [
						"everyr",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"everyr",
						0
					],
					"source": [
						"everyr_lb",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"gen",
						0
					],
					"source": [
						"everyrmsg",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"needbuf",
						0
					],
					"source": [
						"gateroll",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"env-obj-8",
						0
					],
					"source": [
						"gen",
						3
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"envvel",
						1
					],
					"source": [
						"gen",
						1
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"out-gate",
						0
					],
					"order": 1,
					"source": [
						"gen",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"scope-gate",
						0
					],
					"order": 0,
					"source": [
						"gen",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"snap",
						0
					],
					"source": [
						"gen",
						2
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"ratetilde",
						0
					],
					"source": [
						"in-clock",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"gen",
						3
					],
					"source": [
						"in-dmod",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"gen",
						2
					],
					"source": [
						"in-lmod",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"playmsg",
						0
					],
					"source": [
						"in-play",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"stepreset_t",
						0
					],
					"source": [
						"in-reset",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"rateadd",
						1
					],
					"source": [
						"in-rmod",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"ratereset_t",
						0
					],
					"source": [
						"in-rreset",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"bufgen",
						0
					],
					"order": 0,
					"source": [
						"init_def",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"bufui",
						0
					],
					"order": 1,
					"source": [
						"init_def",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"init_def",
						0
					],
					"source": [
						"init_lb",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"bufui",
						0
					],
					"source": [
						"needbuf",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"stepsmsg",
						0
					],
					"source": [
						"number",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"gen",
						0
					],
					"source": [
						"playmsg",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"prelogic",
						0
					],
					"source": [
						"pre",
						3
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"prestore",
						0
					],
					"source": [
						"prejs",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"pre",
						0
					],
					"source": [
						"prelogic",
						1
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"prejs",
						0
					],
					"source": [
						"prelogic",
						2
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"prestore",
						0
					],
					"source": [
						"prelogic",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"ratesig",
						0
					],
					"source": [
						"rate",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"ratetilde",
						1
					],
					"source": [
						"rateadd",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"ratetilde",
						0
					],
					"source": [
						"ratereset",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"ratereset",
						0
					],
					"source": [
						"ratereset_t",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"rateadd",
						0
					],
					"source": [
						"ratesig",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"gen",
						0
					],
					"source": [
						"ratetilde",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"chg",
						0
					],
					"source": [
						"snap",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"click",
						0
					],
					"source": [
						"stepreset_t",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"gateroll",
						0
					],
					"order": 0,
					"source": [
						"stepsmsg",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"gen",
						0
					],
					"order": 1,
					"source": [
						"stepsmsg",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"trigmsg",
						0
					],
					"source": [
						"triggers",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"gen",
						0
					],
					"source": [
						"trigmsg",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"needbuf",
						1
					],
					"destination": [
						"rg-unp",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"rg-unp",
						0
					],
					"destination": [
						"rg-ps",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"rg-unp",
						1
					],
					"destination": [
						"rg-pe",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"rg-ps",
						0
					],
					"destination": [
						"gen",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"rg-pe",
						0
					],
					"destination": [
						"gen",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"prejs_slotfilter",
						0
					],
					"source": [
						"prestore",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"prejs",
						0
					],
					"source": [
						"prejs_slotfilter",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"gen",
						4
					],
					"destination": [
						"sq_bsnap",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"sq_bsnap",
						0
					],
					"destination": [
						"sq_bchg",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"sq_bchg",
						0
					],
					"destination": [
						"sq_bpp",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"sq_bpp",
						0
					],
					"destination": [
						"gateroll",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"sq_dsp",
						0
					],
					"destination": [
						"sq_dsppp",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"sq_dsppp",
						0
					],
					"destination": [
						"gateroll",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"gateroll",
						0
					],
					"destination": [
						"sq_rt",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"sq_rt",
						0
					],
					"destination": [
						"gen",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"sq_rt",
						1
					],
					"destination": [
						"sq_setst",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"sq_setst",
						0
					],
					"destination": [
						"number",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"sq_rt",
						2
					],
					"destination": [
						"sq_setsq",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"sq_setsq",
						0
					],
					"destination": [
						"sq_box",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"sq_box",
						0
					],
					"destination": [
						"sq_m1",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"sq_m1",
						0
					],
					"destination": [
						"sq_pseq",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"sq_pseq",
						0
					],
					"destination": [
						"gateroll",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"sq_minus",
						0
					],
					"destination": [
						"sq_minus_m",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"sq_minus_m",
						0
					],
					"destination": [
						"gateroll",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"sq_plus",
						0
					],
					"destination": [
						"sq_plus_m",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"sq_plus_m",
						0
					],
					"destination": [
						"gateroll",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"sq_copy",
						0
					],
					"destination": [
						"sq_copy_m",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"sq_copy_m",
						0
					],
					"destination": [
						"gateroll",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"sq_paste",
						0
					],
					"destination": [
						"sq_paste_m",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"sq_paste_m",
						0
					],
					"destination": [
						"gateroll",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"sq_clear",
						0
					],
					"destination": [
						"sq_clear_m",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"sq_clear_m",
						0
					],
					"destination": [
						"gateroll",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"sq_clearall",
						0
					],
					"destination": [
						"sq_dlg",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"sq_dlg",
						0
					],
					"destination": [
						"sq_clearall_m",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"sq_clearall_m",
						0
					],
					"destination": [
						"gateroll",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"sq_in",
						0
					],
					"destination": [
						"sq_m1",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"autopattr",
						1
					],
					"destination": [
						"sq_box",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"autopattr",
						1
					],
					"destination": [
						"number",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"sw_box",
						0
					],
					"destination": [
						"sw_pp",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"sw_pp",
						0
					],
					"destination": [
						"gateroll",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"sq_rt",
						3
					],
					"destination": [
						"sw_set",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"sw_set",
						0
					],
					"destination": [
						"sw_box",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"autopattr",
						1
					],
					"destination": [
						"sw_box",
						0
					]
				}
			}
		],
		"parameters": {
			"env-obj-2": [
				"function",
				"function",
				0
			],
			"env-obj-242": [
				"slider[13]",
				"slider[8]",
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
			}
		],
		"bgcolor": [
			0.08627450980392157,
			0.1411764705882353,
			0.08627450980392157,
			1.0
		]
	}
}