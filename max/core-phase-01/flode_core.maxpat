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
			50,
			1040,
			720
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
					"id": "background",
					"maxclass": "panel",
					"patching_rect": [
						0,
						0,
						1024,
						680
					],
					"bgcolor": [
						0.075,
						0.08,
						0.075,
						1
					],
					"bordercolor": [
						0.075,
						0.08,
						0.075,
						1
					],
					"presentation": 1,
					"presentation_rect": [
						0,
						0,
						1024,
						680
					]
				}
			},
			{
				"box": {
					"id": "brand",
					"maxclass": "comment",
					"patching_rect": [
						28,
						20,
						180,
						34
					],
					"text": "flöde~ core",
					"fontsize": 24,
					"textcolor": [
						0.76,
						0.81,
						0.72,
						1
					],
					"presentation": 1,
					"presentation_rect": [
						24,
						18,
						200,
						34
					]
				}
			},
			{
				"box": {
					"id": "phase",
					"maxclass": "comment",
					"patching_rect": [
						28,
						52,
						240,
						20
					],
					"text": "six-pod sampler · phase 01",
					"fontsize": 11,
					"textcolor": [
						0.44,
						0.48,
						0.43,
						1
					],
					"presentation": 1,
					"presentation_rect": [
						26,
						50,
						240,
						20
					]
				}
			},
			{
				"box": {
					"id": "playLabel",
					"maxclass": "comment",
					"patching_rect": [
						350,
						18,
						42,
						18
					],
					"text": "PLAY",
					"fontsize": 9,
					"textcolor": [
						0.48,
						0.52,
						0.47,
						1
					],
					"presentation": 1,
					"presentation_rect": [
						350,
						17,
						42,
						18
					]
				}
			},
			{
				"box": {
					"id": "play",
					"maxclass": "toggle",
					"patching_rect": [
						358,
						40,
						24,
						24
					],
					"checkedcolor": [
						0.69,
						0.75,
						0.6,
						1
					],
					"presentation": 1,
					"presentation_rect": [
						356,
						38,
						24,
						24
					]
				}
			},
			{
				"box": {
					"id": "bpmLabel",
					"maxclass": "comment",
					"patching_rect": [
						416,
						18,
						36,
						18
					],
					"text": "BPM",
					"fontsize": 9,
					"textcolor": [
						0.48,
						0.52,
						0.47,
						1
					],
					"presentation": 1,
					"presentation_rect": [
						416,
						17,
						36,
						18
					]
				}
			},
			{
				"box": {
					"id": "bpm",
					"maxclass": "flonum",
					"patching_rect": [
						410,
						40,
						62,
						24
					],
					"minimum": 30,
					"maximum": 300,
					"presentation": 1,
					"presentation_rect": [
						408,
						38,
						62,
						24
					]
				}
			},
			{
				"box": {
					"id": "bpmLoad",
					"maxclass": "newobj",
					"patching_rect": [
						750,
						18,
						85,
						22
					],
					"text": "loadmess 120."
				}
			},
			{
				"box": {
					"id": "interval",
					"maxclass": "newobj",
					"patching_rect": [
						750,
						46,
						100,
						22
					],
					"text": "expr 60000./$f1/4."
				}
			},
			{
				"box": {
					"id": "metro",
					"maxclass": "newobj",
					"patching_rect": [
						750,
						76,
						70,
						22
					],
					"text": "metro 125"
				}
			},
			{
				"box": {
					"id": "counter",
					"maxclass": "newobj",
					"patching_rect": [
						750,
						106,
						78,
						22
					],
					"text": "counter 0 15"
				}
			},
			{
				"box": {
					"id": "stepSend",
					"maxclass": "newobj",
					"patching_rect": [
						750,
						136,
						76,
						22
					],
					"text": "s flode.step"
				}
			},
			{
				"box": {
					"id": "stepView",
					"maxclass": "number",
					"patching_rect": [
						494,
						40,
						42,
						24
					],
					"presentation": 1,
					"presentation_rect": [
						494,
						38,
						42,
						24
					]
				}
			},
			{
				"box": {
					"id": "stepLabel",
					"maxclass": "comment",
					"patching_rect": [
						492,
						18,
						42,
						18
					],
					"text": "STEP",
					"fontsize": 9,
					"textcolor": [
						0.48,
						0.52,
						0.47,
						1
					],
					"presentation": 1,
					"presentation_rect": [
						492,
						17,
						42,
						18
					]
				}
			},
			{
				"box": {
					"id": "masterLabel",
					"maxclass": "comment",
					"patching_rect": [
						580,
						18,
						70,
						18
					],
					"text": "MASTER",
					"fontsize": 9,
					"textcolor": [
						0.48,
						0.52,
						0.47,
						1
					],
					"presentation": 1,
					"presentation_rect": [
						580,
						17,
						70,
						18
					]
				}
			},
			{
				"box": {
					"id": "master",
					"maxclass": "flonum",
					"patching_rect": [
						580,
						40,
						58,
						24
					],
					"minimum": 0,
					"maximum": 1,
					"presentation": 1,
					"presentation_rect": [
						580,
						38,
						58,
						24
					]
				}
			},
			{
				"box": {
					"id": "masterLoad",
					"maxclass": "newobj",
					"patching_rect": [
						858,
						18,
						79,
						22
					],
					"text": "loadmess 0.7"
				}
			},
			{
				"box": {
					"id": "audioLabel",
					"maxclass": "comment",
					"patching_rect": [
						680,
						18,
						48,
						18
					],
					"text": "AUDIO",
					"fontsize": 9,
					"textcolor": [
						0.48,
						0.52,
						0.47,
						1
					],
					"presentation": 1,
					"presentation_rect": [
						680,
						17,
						48,
						18
					]
				}
			},
			{
				"box": {
					"id": "audio",
					"maxclass": "ezdac~",
					"patching_rect": [
						684,
						39,
						45,
						25
					],
					"presentation": 1,
					"presentation_rect": [
						682,
						38,
						45,
						25
					]
				}
			},
			{
				"box": {
					"id": "pod1",
					"maxclass": "bpatcher",
					"patching_rect": [
						24,
						92,
						304,
						184
					],
					"name": "flode_pod.maxpat",
					"args": [
						1
					],
					"numinlets": 0,
					"numoutlets": 2,
					"outlettype": [
						"signal",
						"signal"
					],
					"border": 0,
					"clickthrough": 0,
					"enablehscroll": 0,
					"enablevscroll": 0,
					"offset": [
						0,
						0
					],
					"lockeddragscroll": 0,
					"viewvisibility": 1,
					"presentation": 1,
					"presentation_rect": [
						24,
						92,
						304,
						184
					]
				}
			},
			{
				"box": {
					"id": "pod2",
					"maxclass": "bpatcher",
					"patching_rect": [
						348,
						92,
						304,
						184
					],
					"name": "flode_pod.maxpat",
					"args": [
						2
					],
					"numinlets": 0,
					"numoutlets": 2,
					"outlettype": [
						"signal",
						"signal"
					],
					"border": 0,
					"clickthrough": 0,
					"enablehscroll": 0,
					"enablevscroll": 0,
					"offset": [
						0,
						0
					],
					"lockeddragscroll": 0,
					"viewvisibility": 1,
					"presentation": 1,
					"presentation_rect": [
						348,
						92,
						304,
						184
					]
				}
			},
			{
				"box": {
					"id": "pod3",
					"maxclass": "bpatcher",
					"patching_rect": [
						672,
						92,
						304,
						184
					],
					"name": "flode_pod.maxpat",
					"args": [
						3
					],
					"numinlets": 0,
					"numoutlets": 2,
					"outlettype": [
						"signal",
						"signal"
					],
					"border": 0,
					"clickthrough": 0,
					"enablehscroll": 0,
					"enablevscroll": 0,
					"offset": [
						0,
						0
					],
					"lockeddragscroll": 0,
					"viewvisibility": 1,
					"presentation": 1,
					"presentation_rect": [
						672,
						92,
						304,
						184
					]
				}
			},
			{
				"box": {
					"id": "pod4",
					"maxclass": "bpatcher",
					"patching_rect": [
						24,
						294,
						304,
						184
					],
					"name": "flode_pod.maxpat",
					"args": [
						4
					],
					"numinlets": 0,
					"numoutlets": 2,
					"outlettype": [
						"signal",
						"signal"
					],
					"border": 0,
					"clickthrough": 0,
					"enablehscroll": 0,
					"enablevscroll": 0,
					"offset": [
						0,
						0
					],
					"lockeddragscroll": 0,
					"viewvisibility": 1,
					"presentation": 1,
					"presentation_rect": [
						24,
						294,
						304,
						184
					]
				}
			},
			{
				"box": {
					"id": "pod5",
					"maxclass": "bpatcher",
					"patching_rect": [
						348,
						294,
						304,
						184
					],
					"name": "flode_pod.maxpat",
					"args": [
						5
					],
					"numinlets": 0,
					"numoutlets": 2,
					"outlettype": [
						"signal",
						"signal"
					],
					"border": 0,
					"clickthrough": 0,
					"enablehscroll": 0,
					"enablevscroll": 0,
					"offset": [
						0,
						0
					],
					"lockeddragscroll": 0,
					"viewvisibility": 1,
					"presentation": 1,
					"presentation_rect": [
						348,
						294,
						304,
						184
					]
				}
			},
			{
				"box": {
					"id": "pod6",
					"maxclass": "bpatcher",
					"patching_rect": [
						672,
						294,
						304,
						184
					],
					"name": "flode_pod.maxpat",
					"args": [
						6
					],
					"numinlets": 0,
					"numoutlets": 2,
					"outlettype": [
						"signal",
						"signal"
					],
					"border": 0,
					"clickthrough": 0,
					"enablehscroll": 0,
					"enablevscroll": 0,
					"offset": [
						0,
						0
					],
					"lockeddragscroll": 0,
					"viewvisibility": 1,
					"presentation": 1,
					"presentation_rect": [
						672,
						294,
						304,
						184
					]
				}
			},
			{
				"box": {
					"id": "masterL",
					"maxclass": "newobj",
					"patching_rect": [
						790,
						520,
						42,
						22
					],
					"text": "*~ 0.7"
				}
			},
			{
				"box": {
					"id": "masterR",
					"maxclass": "newobj",
					"patching_rect": [
						850,
						520,
						42,
						22
					],
					"text": "*~ 0.7"
				}
			},
			{
				"box": {
					"id": "clipL",
					"maxclass": "newobj",
					"patching_rect": [
						790,
						552,
						72,
						22
					],
					"text": "clip~ -1. 1."
				}
			},
			{
				"box": {
					"id": "clipR",
					"maxclass": "newobj",
					"patching_rect": [
						870,
						552,
						72,
						22
					],
					"text": "clip~ -1. 1."
				}
			},
			{
				"box": {
					"id": "meterL",
					"maxclass": "meter~",
					"patching_rect": [
						790,
						586,
						150,
						12
					],
					"presentation": 1,
					"presentation_rect": [
						24,
						620,
						470,
						12
					]
				}
			},
			{
				"box": {
					"id": "meterR",
					"maxclass": "meter~",
					"patching_rect": [
						790,
						606,
						150,
						12
					],
					"presentation": 1,
					"presentation_rect": [
						506,
						620,
						470,
						12
					]
				}
			},
			{
				"box": {
					"id": "hint",
					"maxclass": "comment",
					"patching_rect": [
						24,
						650,
						500,
						18
					],
					"text": "Drop a sample into each pod · set steps · press PLAY · enable AUDIO",
					"fontsize": 10,
					"textcolor": [
						0.43,
						0.47,
						0.42,
						1
					],
					"presentation": 1,
					"presentation_rect": [
						24,
						645,
						520,
						18
					]
				}
			}
		],
		"lines": [
			{
				"patchline": {
					"source": [
						"bpmLoad",
						0
					],
					"destination": [
						"bpm",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"bpm",
						0
					],
					"destination": [
						"interval",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"interval",
						0
					],
					"destination": [
						"metro",
						1
					]
				}
			},
			{
				"patchline": {
					"source": [
						"play",
						0
					],
					"destination": [
						"metro",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"metro",
						0
					],
					"destination": [
						"counter",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"counter",
						0
					],
					"destination": [
						"stepSend",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"counter",
						0
					],
					"destination": [
						"stepView",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"masterLoad",
						0
					],
					"destination": [
						"master",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"pod1",
						0
					],
					"destination": [
						"masterL",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"pod1",
						1
					],
					"destination": [
						"masterR",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"pod2",
						0
					],
					"destination": [
						"masterL",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"pod2",
						1
					],
					"destination": [
						"masterR",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"pod3",
						0
					],
					"destination": [
						"masterL",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"pod3",
						1
					],
					"destination": [
						"masterR",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"pod4",
						0
					],
					"destination": [
						"masterL",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"pod4",
						1
					],
					"destination": [
						"masterR",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"pod5",
						0
					],
					"destination": [
						"masterL",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"pod5",
						1
					],
					"destination": [
						"masterR",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"pod6",
						0
					],
					"destination": [
						"masterL",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"pod6",
						1
					],
					"destination": [
						"masterR",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"master",
						0
					],
					"destination": [
						"masterL",
						1
					]
				}
			},
			{
				"patchline": {
					"source": [
						"master",
						0
					],
					"destination": [
						"masterR",
						1
					]
				}
			},
			{
				"patchline": {
					"source": [
						"masterL",
						0
					],
					"destination": [
						"clipL",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"masterR",
						0
					],
					"destination": [
						"clipR",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"clipL",
						0
					],
					"destination": [
						"meterL",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"clipR",
						0
					],
					"destination": [
						"meterR",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"clipL",
						0
					],
					"destination": [
						"audio",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"clipR",
						0
					],
					"destination": [
						"audio",
						1
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
