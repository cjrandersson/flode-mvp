{
	"patcher": {
		"fileversion": 1,
		"appversion": {
			"major": 9,
			"minor": 0,
			"revision": 7,
			"architecture": "x64",
			"modernui": 1
		},
		"classnamespace": "box",
		"rect": [
			40,
			80,
			740,
			650
		],
		"bglocked": 0,
		"openinpresentation": 1,
		"default_fontsize": 12,
		"default_fontface": 0,
		"default_fontname": "Arial",
		"gridonopen": 1,
		"gridsize": [
			15,
			15
		],
		"toolbarvisible": 1,
		"boxanimatetime": 200,
		"enablehscroll": 1,
		"enablevscroll": 1,
		"devicewidth": 0,
		"description": "",
		"digest": "",
		"tags": "",
		"style": "",
		"subpatcher_template": "",
		"assistshowspatchername": 0,
		"boxes": [
			{
				"box": {
					"id": "bg",
					"maxclass": "panel",
					"patching_rect": [
						8,
						8,
						304,
						184
					],
					"bgcolor": [
						0.105,
						0.11,
						0.105,
						1
					],
					"bordercolor": [
						0.27,
						0.29,
						0.27,
						1
					],
					"rounded": 14,
					"presentation": 1,
					"presentation_rect": [
						0,
						0,
						304,
						184
					]
				}
			},
			{
				"box": {
					"id": "title",
					"maxclass": "comment",
					"patching_rect": [
						18,
						14,
						120,
						20
					],
					"text": "POD #1",
					"textcolor": [
						0.78,
						0.82,
						0.76,
						1
					],
					"fontsize": 14,
					"presentation": 1,
					"presentation_rect": [
						12,
						8,
						100,
						20
					]
				}
			},
			{
				"box": {
					"id": "drop",
					"maxclass": "dropfile",
					"patching_rect": [
						272,
						14,
						24,
						24
					],
					"presentation": 1,
					"presentation_rect": [
						266,
						9,
						24,
						24
					]
				}
			},
			{
				"box": {
					"id": "prependReplace",
					"maxclass": "newobj",
					"patching_rect": [
						340,
						18,
						98,
						22
					],
					"text": "prepend replace"
				}
			},
			{
				"box": {
					"id": "buffer",
					"maxclass": "newobj",
					"patching_rect": [
						340,
						48,
						142,
						22
					],
					"text": "buffer~ flode.buf.#1 4000"
				}
			},
			{
				"box": {
					"id": "wave",
					"maxclass": "waveform~",
					"patching_rect": [
						18,
						42,
						278,
						54
					],
					"buffername": "flode.buf.#1",
					"setmode": 0,
					"bgcolor": [
						0.07,
						0.075,
						0.07,
						1
					],
					"wavecolor": [
						0.62,
						0.7,
						0.58,
						1
					],
					"selectioncolor": [
						0.34,
						0.42,
						0.32,
						0.45
					],
					"presentation": 1,
					"presentation_rect": [
						12,
						36,
						278,
						54
					]
				}
			},
			{
				"box": {
					"id": "stepRecv",
					"maxclass": "newobj",
					"patching_rect": [
						340,
						88,
						76,
						22
					],
					"text": "r flode.step"
				}
			},
			{
				"box": {
					"id": "stepSel",
					"maxclass": "newobj",
					"patching_rect": [
						340,
						118,
						316,
						22
					],
					"text": "sel 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15"
				}
			},
			{
				"box": {
					"id": "step0",
					"maxclass": "toggle",
					"patching_rect": [
						14,
						104,
						14,
						14
					],
					"bgcolor": [
						0.18,
						0.19,
						0.18,
						1
					],
					"checkedcolor": [
						0.69,
						0.75,
						0.6,
						1
					],
					"presentation": 1,
					"presentation_rect": [
						12,
						98,
						14,
						14
					]
				}
			},
			{
				"box": {
					"id": "store0",
					"maxclass": "newobj",
					"patching_rect": [
						340,
						154,
						30,
						22
					],
					"text": "int 0"
				}
			},
			{
				"box": {
					"id": "active0",
					"maxclass": "newobj",
					"patching_rect": [
						374,
						154,
						34,
						22
					],
					"text": "sel 1"
				}
			},
			{
				"box": {
					"id": "step1",
					"maxclass": "toggle",
					"patching_rect": [
						31,
						104,
						14,
						14
					],
					"bgcolor": [
						0.18,
						0.19,
						0.18,
						1
					],
					"checkedcolor": [
						0.69,
						0.75,
						0.6,
						1
					],
					"presentation": 1,
					"presentation_rect": [
						29,
						98,
						14,
						14
					]
				}
			},
			{
				"box": {
					"id": "store1",
					"maxclass": "newobj",
					"patching_rect": [
						398,
						154,
						30,
						22
					],
					"text": "int 0"
				}
			},
			{
				"box": {
					"id": "active1",
					"maxclass": "newobj",
					"patching_rect": [
						432,
						154,
						34,
						22
					],
					"text": "sel 1"
				}
			},
			{
				"box": {
					"id": "step2",
					"maxclass": "toggle",
					"patching_rect": [
						48,
						104,
						14,
						14
					],
					"bgcolor": [
						0.18,
						0.19,
						0.18,
						1
					],
					"checkedcolor": [
						0.69,
						0.75,
						0.6,
						1
					],
					"presentation": 1,
					"presentation_rect": [
						46,
						98,
						14,
						14
					]
				}
			},
			{
				"box": {
					"id": "store2",
					"maxclass": "newobj",
					"patching_rect": [
						456,
						154,
						30,
						22
					],
					"text": "int 0"
				}
			},
			{
				"box": {
					"id": "active2",
					"maxclass": "newobj",
					"patching_rect": [
						490,
						154,
						34,
						22
					],
					"text": "sel 1"
				}
			},
			{
				"box": {
					"id": "step3",
					"maxclass": "toggle",
					"patching_rect": [
						65,
						104,
						14,
						14
					],
					"bgcolor": [
						0.18,
						0.19,
						0.18,
						1
					],
					"checkedcolor": [
						0.69,
						0.75,
						0.6,
						1
					],
					"presentation": 1,
					"presentation_rect": [
						63,
						98,
						14,
						14
					]
				}
			},
			{
				"box": {
					"id": "store3",
					"maxclass": "newobj",
					"patching_rect": [
						514,
						154,
						30,
						22
					],
					"text": "int 0"
				}
			},
			{
				"box": {
					"id": "active3",
					"maxclass": "newobj",
					"patching_rect": [
						548,
						154,
						34,
						22
					],
					"text": "sel 1"
				}
			},
			{
				"box": {
					"id": "step4",
					"maxclass": "toggle",
					"patching_rect": [
						82,
						104,
						14,
						14
					],
					"bgcolor": [
						0.18,
						0.19,
						0.18,
						1
					],
					"checkedcolor": [
						0.69,
						0.75,
						0.6,
						1
					],
					"presentation": 1,
					"presentation_rect": [
						80,
						98,
						14,
						14
					]
				}
			},
			{
				"box": {
					"id": "store4",
					"maxclass": "newobj",
					"patching_rect": [
						340,
						180,
						30,
						22
					],
					"text": "int 0"
				}
			},
			{
				"box": {
					"id": "active4",
					"maxclass": "newobj",
					"patching_rect": [
						374,
						180,
						34,
						22
					],
					"text": "sel 1"
				}
			},
			{
				"box": {
					"id": "step5",
					"maxclass": "toggle",
					"patching_rect": [
						99,
						104,
						14,
						14
					],
					"bgcolor": [
						0.18,
						0.19,
						0.18,
						1
					],
					"checkedcolor": [
						0.69,
						0.75,
						0.6,
						1
					],
					"presentation": 1,
					"presentation_rect": [
						97,
						98,
						14,
						14
					]
				}
			},
			{
				"box": {
					"id": "store5",
					"maxclass": "newobj",
					"patching_rect": [
						398,
						180,
						30,
						22
					],
					"text": "int 0"
				}
			},
			{
				"box": {
					"id": "active5",
					"maxclass": "newobj",
					"patching_rect": [
						432,
						180,
						34,
						22
					],
					"text": "sel 1"
				}
			},
			{
				"box": {
					"id": "step6",
					"maxclass": "toggle",
					"patching_rect": [
						116,
						104,
						14,
						14
					],
					"bgcolor": [
						0.18,
						0.19,
						0.18,
						1
					],
					"checkedcolor": [
						0.69,
						0.75,
						0.6,
						1
					],
					"presentation": 1,
					"presentation_rect": [
						114,
						98,
						14,
						14
					]
				}
			},
			{
				"box": {
					"id": "store6",
					"maxclass": "newobj",
					"patching_rect": [
						456,
						180,
						30,
						22
					],
					"text": "int 0"
				}
			},
			{
				"box": {
					"id": "active6",
					"maxclass": "newobj",
					"patching_rect": [
						490,
						180,
						34,
						22
					],
					"text": "sel 1"
				}
			},
			{
				"box": {
					"id": "step7",
					"maxclass": "toggle",
					"patching_rect": [
						133,
						104,
						14,
						14
					],
					"bgcolor": [
						0.18,
						0.19,
						0.18,
						1
					],
					"checkedcolor": [
						0.69,
						0.75,
						0.6,
						1
					],
					"presentation": 1,
					"presentation_rect": [
						131,
						98,
						14,
						14
					]
				}
			},
			{
				"box": {
					"id": "store7",
					"maxclass": "newobj",
					"patching_rect": [
						514,
						180,
						30,
						22
					],
					"text": "int 0"
				}
			},
			{
				"box": {
					"id": "active7",
					"maxclass": "newobj",
					"patching_rect": [
						548,
						180,
						34,
						22
					],
					"text": "sel 1"
				}
			},
			{
				"box": {
					"id": "step8",
					"maxclass": "toggle",
					"patching_rect": [
						150,
						104,
						14,
						14
					],
					"bgcolor": [
						0.18,
						0.19,
						0.18,
						1
					],
					"checkedcolor": [
						0.69,
						0.75,
						0.6,
						1
					],
					"presentation": 1,
					"presentation_rect": [
						148,
						98,
						14,
						14
					]
				}
			},
			{
				"box": {
					"id": "store8",
					"maxclass": "newobj",
					"patching_rect": [
						340,
						206,
						30,
						22
					],
					"text": "int 0"
				}
			},
			{
				"box": {
					"id": "active8",
					"maxclass": "newobj",
					"patching_rect": [
						374,
						206,
						34,
						22
					],
					"text": "sel 1"
				}
			},
			{
				"box": {
					"id": "step9",
					"maxclass": "toggle",
					"patching_rect": [
						167,
						104,
						14,
						14
					],
					"bgcolor": [
						0.18,
						0.19,
						0.18,
						1
					],
					"checkedcolor": [
						0.69,
						0.75,
						0.6,
						1
					],
					"presentation": 1,
					"presentation_rect": [
						165,
						98,
						14,
						14
					]
				}
			},
			{
				"box": {
					"id": "store9",
					"maxclass": "newobj",
					"patching_rect": [
						398,
						206,
						30,
						22
					],
					"text": "int 0"
				}
			},
			{
				"box": {
					"id": "active9",
					"maxclass": "newobj",
					"patching_rect": [
						432,
						206,
						34,
						22
					],
					"text": "sel 1"
				}
			},
			{
				"box": {
					"id": "step10",
					"maxclass": "toggle",
					"patching_rect": [
						184,
						104,
						14,
						14
					],
					"bgcolor": [
						0.18,
						0.19,
						0.18,
						1
					],
					"checkedcolor": [
						0.69,
						0.75,
						0.6,
						1
					],
					"presentation": 1,
					"presentation_rect": [
						182,
						98,
						14,
						14
					]
				}
			},
			{
				"box": {
					"id": "store10",
					"maxclass": "newobj",
					"patching_rect": [
						456,
						206,
						30,
						22
					],
					"text": "int 0"
				}
			},
			{
				"box": {
					"id": "active10",
					"maxclass": "newobj",
					"patching_rect": [
						490,
						206,
						34,
						22
					],
					"text": "sel 1"
				}
			},
			{
				"box": {
					"id": "step11",
					"maxclass": "toggle",
					"patching_rect": [
						201,
						104,
						14,
						14
					],
					"bgcolor": [
						0.18,
						0.19,
						0.18,
						1
					],
					"checkedcolor": [
						0.69,
						0.75,
						0.6,
						1
					],
					"presentation": 1,
					"presentation_rect": [
						199,
						98,
						14,
						14
					]
				}
			},
			{
				"box": {
					"id": "store11",
					"maxclass": "newobj",
					"patching_rect": [
						514,
						206,
						30,
						22
					],
					"text": "int 0"
				}
			},
			{
				"box": {
					"id": "active11",
					"maxclass": "newobj",
					"patching_rect": [
						548,
						206,
						34,
						22
					],
					"text": "sel 1"
				}
			},
			{
				"box": {
					"id": "step12",
					"maxclass": "toggle",
					"patching_rect": [
						218,
						104,
						14,
						14
					],
					"bgcolor": [
						0.18,
						0.19,
						0.18,
						1
					],
					"checkedcolor": [
						0.69,
						0.75,
						0.6,
						1
					],
					"presentation": 1,
					"presentation_rect": [
						216,
						98,
						14,
						14
					]
				}
			},
			{
				"box": {
					"id": "store12",
					"maxclass": "newobj",
					"patching_rect": [
						340,
						232,
						30,
						22
					],
					"text": "int 0"
				}
			},
			{
				"box": {
					"id": "active12",
					"maxclass": "newobj",
					"patching_rect": [
						374,
						232,
						34,
						22
					],
					"text": "sel 1"
				}
			},
			{
				"box": {
					"id": "step13",
					"maxclass": "toggle",
					"patching_rect": [
						235,
						104,
						14,
						14
					],
					"bgcolor": [
						0.18,
						0.19,
						0.18,
						1
					],
					"checkedcolor": [
						0.69,
						0.75,
						0.6,
						1
					],
					"presentation": 1,
					"presentation_rect": [
						233,
						98,
						14,
						14
					]
				}
			},
			{
				"box": {
					"id": "store13",
					"maxclass": "newobj",
					"patching_rect": [
						398,
						232,
						30,
						22
					],
					"text": "int 0"
				}
			},
			{
				"box": {
					"id": "active13",
					"maxclass": "newobj",
					"patching_rect": [
						432,
						232,
						34,
						22
					],
					"text": "sel 1"
				}
			},
			{
				"box": {
					"id": "step14",
					"maxclass": "toggle",
					"patching_rect": [
						252,
						104,
						14,
						14
					],
					"bgcolor": [
						0.18,
						0.19,
						0.18,
						1
					],
					"checkedcolor": [
						0.69,
						0.75,
						0.6,
						1
					],
					"presentation": 1,
					"presentation_rect": [
						250,
						98,
						14,
						14
					]
				}
			},
			{
				"box": {
					"id": "store14",
					"maxclass": "newobj",
					"patching_rect": [
						456,
						232,
						30,
						22
					],
					"text": "int 0"
				}
			},
			{
				"box": {
					"id": "active14",
					"maxclass": "newobj",
					"patching_rect": [
						490,
						232,
						34,
						22
					],
					"text": "sel 1"
				}
			},
			{
				"box": {
					"id": "step15",
					"maxclass": "toggle",
					"patching_rect": [
						269,
						104,
						14,
						14
					],
					"bgcolor": [
						0.18,
						0.19,
						0.18,
						1
					],
					"checkedcolor": [
						0.69,
						0.75,
						0.6,
						1
					],
					"presentation": 1,
					"presentation_rect": [
						267,
						98,
						14,
						14
					]
				}
			},
			{
				"box": {
					"id": "store15",
					"maxclass": "newobj",
					"patching_rect": [
						514,
						232,
						30,
						22
					],
					"text": "int 0"
				}
			},
			{
				"box": {
					"id": "active15",
					"maxclass": "newobj",
					"patching_rect": [
						548,
						232,
						34,
						22
					],
					"text": "sel 1"
				}
			},
			{
				"box": {
					"id": "rand",
					"maxclass": "newobj",
					"patching_rect": [
						340,
						274,
						72,
						22
					],
					"text": "random 100"
				}
			},
			{
				"box": {
					"id": "probCompare",
					"maxclass": "newobj",
					"patching_rect": [
						420,
						274,
						46,
						22
					],
					"text": "< 100"
				}
			},
			{
				"box": {
					"id": "probSel",
					"maxclass": "newobj",
					"patching_rect": [
						474,
						274,
						34,
						22
					],
					"text": "sel 1"
				}
			},
			{
				"box": {
					"id": "probLabel",
					"maxclass": "comment",
					"patching_rect": [
						18,
						124,
						42,
						18
					],
					"text": "PROB",
					"textcolor": [
						0.52,
						0.55,
						0.5,
						1
					],
					"fontsize": 9,
					"presentation": 1,
					"presentation_rect": [
						12,
						120,
						40,
						16
					]
				}
			},
			{
				"box": {
					"id": "prob",
					"maxclass": "number",
					"patching_rect": [
						18,
						142,
						42,
						20
					],
					"minimum": 0,
					"maximum": 100,
					"presentation": 1,
					"presentation_rect": [
						12,
						137,
						42,
						20
					]
				}
			},
			{
				"box": {
					"id": "probLoad",
					"maxclass": "newobj",
					"patching_rect": [
						520,
						274,
						83,
						22
					],
					"text": "loadmess 100"
				}
			},
			{
				"box": {
					"id": "playMsg",
					"maxclass": "message",
					"patching_rect": [
						340,
						392,
						38,
						22
					],
					"text": "start"
				}
			},
			{
				"box": {
					"id": "stopMsg",
					"maxclass": "message",
					"patching_rect": [
						384,
						392,
						35,
						22
					],
					"text": "stop"
				}
			},
			{
				"box": {
					"id": "stopButton",
					"maxclass": "button",
					"patching_rect": [
						268,
						139,
						18,
						18
					],
					"presentation": 1,
					"presentation_rect": [
						270,
						138,
						18,
						18
					]
				}
			},
			{
				"box": {
					"id": "stopLabel",
					"maxclass": "comment",
					"patching_rect": [
						255,
						159,
						42,
						15
					],
					"text": "STOP",
					"textcolor": [
						0.52,
						0.55,
						0.5,
						1
					],
					"fontsize": 8,
					"presentation": 1,
					"presentation_rect": [
						260,
						158,
						38,
						14
					]
				}
			},
			{
				"box": {
					"id": "player",
					"maxclass": "newobj",
					"patching_rect": [
						340,
						424,
						116,
						22
					],
					"text": "play~ flode.buf.#1 2"
				}
			},
			{
				"box": {
					"id": "volLabel",
					"maxclass": "comment",
					"patching_rect": [
						78,
						124,
						36,
						18
					],
					"text": "VOL",
					"textcolor": [
						0.52,
						0.55,
						0.5,
						1
					],
					"fontsize": 9,
					"presentation": 1,
					"presentation_rect": [
						72,
						120,
						34,
						16
					]
				}
			},
			{
				"box": {
					"id": "vol",
					"maxclass": "flonum",
					"patching_rect": [
						78,
						142,
						46,
						20
					],
					"minimum": 0,
					"maximum": 1,
					"presentation": 1,
					"presentation_rect": [
						70,
						137,
						46,
						20
					]
				}
			},
			{
				"box": {
					"id": "volLoad",
					"maxclass": "newobj",
					"patching_rect": [
						468,
						424,
						76,
						22
					],
					"text": "loadmess 0.7"
				}
			},
			{
				"box": {
					"id": "panLabel",
					"maxclass": "comment",
					"patching_rect": [
						140,
						124,
						36,
						18
					],
					"text": "PAN",
					"textcolor": [
						0.52,
						0.55,
						0.5,
						1
					],
					"fontsize": 9,
					"presentation": 1,
					"presentation_rect": [
						132,
						120,
						34,
						16
					]
				}
			},
			{
				"box": {
					"id": "pan",
					"maxclass": "flonum",
					"patching_rect": [
						140,
						142,
						46,
						20
					],
					"minimum": -1,
					"maximum": 1,
					"presentation": 1,
					"presentation_rect": [
						130,
						137,
						46,
						20
					]
				}
			},
			{
				"box": {
					"id": "panLoad",
					"maxclass": "newobj",
					"patching_rect": [
						552,
						424,
						70,
						22
					],
					"text": "loadmess 0."
				}
			},
			{
				"box": {
					"id": "panL",
					"maxclass": "newobj",
					"patching_rect": [
						340,
						458,
						148,
						22
					],
					"text": "expr min(1., 1.-max(0.,$f1))"
				}
			},
			{
				"box": {
					"id": "panR",
					"maxclass": "newobj",
					"patching_rect": [
						496,
						458,
						148,
						22
					],
					"text": "expr min(1., 1.+min(0.,$f1))"
				}
			},
			{
				"box": {
					"id": "muteLabel",
					"maxclass": "comment",
					"patching_rect": [
						205,
						124,
						38,
						18
					],
					"text": "MUTE",
					"textcolor": [
						0.52,
						0.55,
						0.5,
						1
					],
					"fontsize": 9,
					"presentation": 1,
					"presentation_rect": [
						194,
						120,
						40,
						16
					]
				}
			},
			{
				"box": {
					"id": "mute",
					"maxclass": "toggle",
					"patching_rect": [
						214,
						143,
						18,
						18
					],
					"presentation": 1,
					"presentation_rect": [
						205,
						138,
						18,
						18
					]
				}
			},
			{
				"box": {
					"id": "muteInvert",
					"maxclass": "newobj",
					"patching_rect": [
						652,
						424,
						36,
						22
					],
					"text": "!- 1"
				}
			},
			{
				"box": {
					"id": "gainL",
					"maxclass": "newobj",
					"patching_rect": [
						340,
						492,
						36,
						22
					],
					"text": "*~ 1."
				}
			},
			{
				"box": {
					"id": "gainR",
					"maxclass": "newobj",
					"patching_rect": [
						430,
						492,
						36,
						22
					],
					"text": "*~ 1."
				}
			},
			{
				"box": {
					"id": "volL",
					"maxclass": "newobj",
					"patching_rect": [
						340,
						522,
						36,
						22
					],
					"text": "*~ 1."
				}
			},
			{
				"box": {
					"id": "volR",
					"maxclass": "newobj",
					"patching_rect": [
						430,
						522,
						36,
						22
					],
					"text": "*~ 1."
				}
			},
			{
				"box": {
					"id": "muteL",
					"maxclass": "newobj",
					"patching_rect": [
						340,
						552,
						36,
						22
					],
					"text": "*~ 1."
				}
			},
			{
				"box": {
					"id": "muteR",
					"maxclass": "newobj",
					"patching_rect": [
						430,
						552,
						36,
						22
					],
					"text": "*~ 1."
				}
			},
			{
				"box": {
					"id": "outL",
					"maxclass": "outlet",
					"patching_rect": [
						340,
						586,
						24,
						24
					],
					"outlettype": [
						"signal"
					]
				}
			},
			{
				"box": {
					"id": "outR",
					"maxclass": "outlet",
					"patching_rect": [
						430,
						586,
						24,
						24
					],
					"outlettype": [
						"signal"
					]
				}
			},
			{
				"box": {
					"id": "seedLoad",
					"maxclass": "newobj",
					"patching_rect": [
						618,
						274,
						55,
						22
					],
					"text": "loadbang"
				}
			},
			{
				"box": {
					"id": "seed0",
					"maxclass": "message",
					"patching_rect": [
						618,
						306,
						24,
						22
					],
					"text": "1"
				}
			},
			{
				"box": {
					"id": "seed4",
					"maxclass": "message",
					"patching_rect": [
						648,
						306,
						24,
						22
					],
					"text": "1"
				}
			},
			{
				"box": {
					"id": "seed8",
					"maxclass": "message",
					"patching_rect": [
						678,
						306,
						24,
						22
					],
					"text": "1"
				}
			},
			{
				"box": {
					"id": "seed12",
					"maxclass": "message",
					"patching_rect": [
						708,
						306,
						24,
						22
					],
					"text": "1"
				}
			}
		],
		"lines": [
			{
				"patchline": {
					"source": [
						"step0",
						0
					],
					"destination": [
						"store0",
						1
					]
				}
			},
			{
				"patchline": {
					"source": [
						"stepSel",
						0
					],
					"destination": [
						"store0",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"store0",
						0
					],
					"destination": [
						"active0",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"step1",
						0
					],
					"destination": [
						"store1",
						1
					]
				}
			},
			{
				"patchline": {
					"source": [
						"stepSel",
						1
					],
					"destination": [
						"store1",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"store1",
						0
					],
					"destination": [
						"active1",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"step2",
						0
					],
					"destination": [
						"store2",
						1
					]
				}
			},
			{
				"patchline": {
					"source": [
						"stepSel",
						2
					],
					"destination": [
						"store2",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"store2",
						0
					],
					"destination": [
						"active2",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"step3",
						0
					],
					"destination": [
						"store3",
						1
					]
				}
			},
			{
				"patchline": {
					"source": [
						"stepSel",
						3
					],
					"destination": [
						"store3",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"store3",
						0
					],
					"destination": [
						"active3",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"step4",
						0
					],
					"destination": [
						"store4",
						1
					]
				}
			},
			{
				"patchline": {
					"source": [
						"stepSel",
						4
					],
					"destination": [
						"store4",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"store4",
						0
					],
					"destination": [
						"active4",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"step5",
						0
					],
					"destination": [
						"store5",
						1
					]
				}
			},
			{
				"patchline": {
					"source": [
						"stepSel",
						5
					],
					"destination": [
						"store5",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"store5",
						0
					],
					"destination": [
						"active5",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"step6",
						0
					],
					"destination": [
						"store6",
						1
					]
				}
			},
			{
				"patchline": {
					"source": [
						"stepSel",
						6
					],
					"destination": [
						"store6",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"store6",
						0
					],
					"destination": [
						"active6",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"step7",
						0
					],
					"destination": [
						"store7",
						1
					]
				}
			},
			{
				"patchline": {
					"source": [
						"stepSel",
						7
					],
					"destination": [
						"store7",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"store7",
						0
					],
					"destination": [
						"active7",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"step8",
						0
					],
					"destination": [
						"store8",
						1
					]
				}
			},
			{
				"patchline": {
					"source": [
						"stepSel",
						8
					],
					"destination": [
						"store8",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"store8",
						0
					],
					"destination": [
						"active8",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"step9",
						0
					],
					"destination": [
						"store9",
						1
					]
				}
			},
			{
				"patchline": {
					"source": [
						"stepSel",
						9
					],
					"destination": [
						"store9",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"store9",
						0
					],
					"destination": [
						"active9",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"step10",
						0
					],
					"destination": [
						"store10",
						1
					]
				}
			},
			{
				"patchline": {
					"source": [
						"stepSel",
						10
					],
					"destination": [
						"store10",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"store10",
						0
					],
					"destination": [
						"active10",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"step11",
						0
					],
					"destination": [
						"store11",
						1
					]
				}
			},
			{
				"patchline": {
					"source": [
						"stepSel",
						11
					],
					"destination": [
						"store11",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"store11",
						0
					],
					"destination": [
						"active11",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"step12",
						0
					],
					"destination": [
						"store12",
						1
					]
				}
			},
			{
				"patchline": {
					"source": [
						"stepSel",
						12
					],
					"destination": [
						"store12",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"store12",
						0
					],
					"destination": [
						"active12",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"step13",
						0
					],
					"destination": [
						"store13",
						1
					]
				}
			},
			{
				"patchline": {
					"source": [
						"stepSel",
						13
					],
					"destination": [
						"store13",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"store13",
						0
					],
					"destination": [
						"active13",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"step14",
						0
					],
					"destination": [
						"store14",
						1
					]
				}
			},
			{
				"patchline": {
					"source": [
						"stepSel",
						14
					],
					"destination": [
						"store14",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"store14",
						0
					],
					"destination": [
						"active14",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"step15",
						0
					],
					"destination": [
						"store15",
						1
					]
				}
			},
			{
				"patchline": {
					"source": [
						"stepSel",
						15
					],
					"destination": [
						"store15",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"store15",
						0
					],
					"destination": [
						"active15",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"active0",
						0
					],
					"destination": [
						"rand",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"active1",
						0
					],
					"destination": [
						"rand",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"active2",
						0
					],
					"destination": [
						"rand",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"active3",
						0
					],
					"destination": [
						"rand",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"active4",
						0
					],
					"destination": [
						"rand",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"active5",
						0
					],
					"destination": [
						"rand",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"active6",
						0
					],
					"destination": [
						"rand",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"active7",
						0
					],
					"destination": [
						"rand",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"active8",
						0
					],
					"destination": [
						"rand",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"active9",
						0
					],
					"destination": [
						"rand",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"active10",
						0
					],
					"destination": [
						"rand",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"active11",
						0
					],
					"destination": [
						"rand",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"active12",
						0
					],
					"destination": [
						"rand",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"active13",
						0
					],
					"destination": [
						"rand",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"active14",
						0
					],
					"destination": [
						"rand",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"active15",
						0
					],
					"destination": [
						"rand",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"rand",
						0
					],
					"destination": [
						"probCompare",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"probCompare",
						0
					],
					"destination": [
						"probSel",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"prob",
						0
					],
					"destination": [
						"probCompare",
						1
					]
				}
			},
			{
				"patchline": {
					"source": [
						"probLoad",
						0
					],
					"destination": [
						"prob",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"probSel",
						0
					],
					"destination": [
						"playMsg",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"playMsg",
						0
					],
					"destination": [
						"player",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"stopButton",
						0
					],
					"destination": [
						"stopMsg",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"stopMsg",
						0
					],
					"destination": [
						"player",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"volLoad",
						0
					],
					"destination": [
						"vol",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"panLoad",
						0
					],
					"destination": [
						"pan",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"pan",
						0
					],
					"destination": [
						"panL",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"pan",
						0
					],
					"destination": [
						"panR",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"mute",
						0
					],
					"destination": [
						"muteInvert",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"player",
						0
					],
					"destination": [
						"gainL",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"player",
						1
					],
					"destination": [
						"gainR",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"panL",
						0
					],
					"destination": [
						"gainL",
						1
					]
				}
			},
			{
				"patchline": {
					"source": [
						"panR",
						0
					],
					"destination": [
						"gainR",
						1
					]
				}
			},
			{
				"patchline": {
					"source": [
						"gainL",
						0
					],
					"destination": [
						"volL",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"gainR",
						0
					],
					"destination": [
						"volR",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"vol",
						0
					],
					"destination": [
						"volL",
						1
					]
				}
			},
			{
				"patchline": {
					"source": [
						"vol",
						0
					],
					"destination": [
						"volR",
						1
					]
				}
			},
			{
				"patchline": {
					"source": [
						"volL",
						0
					],
					"destination": [
						"muteL",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"volR",
						0
					],
					"destination": [
						"muteR",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"muteInvert",
						0
					],
					"destination": [
						"muteL",
						1
					]
				}
			},
			{
				"patchline": {
					"source": [
						"muteInvert",
						0
					],
					"destination": [
						"muteR",
						1
					]
				}
			},
			{
				"patchline": {
					"source": [
						"muteL",
						0
					],
					"destination": [
						"outL",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"muteR",
						0
					],
					"destination": [
						"outR",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"seedLoad",
						0
					],
					"destination": [
						"seed0",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"seed0",
						0
					],
					"destination": [
						"step0",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"seedLoad",
						0
					],
					"destination": [
						"seed4",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"seed4",
						0
					],
					"destination": [
						"step4",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"seedLoad",
						0
					],
					"destination": [
						"seed8",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"seed8",
						0
					],
					"destination": [
						"step8",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"seedLoad",
						0
					],
					"destination": [
						"seed12",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"seed12",
						0
					],
					"destination": [
						"step12",
						0
					]
				}
			}
		],
		"dependency_cache": [],
		"autosave": 0,
		"saved_object_attributes": {
			"globalpatchername": ""
		}
	}
}
