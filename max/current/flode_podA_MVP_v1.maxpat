{
  "patcher": {
    "fileversion": 1,
    "appversion": {
      "major": 9,
      "minor": 0,
      "revision": 0,
      "architecture": "x64",
      "modernui": 1
    },
    "classnamespace": "box",
    "rect": [
      50,
      50,
      900,
      520
    ],
    "bglocked": 0,
    "openinpresentation": 1,
    "default_fontsize": 11.0,
    "default_fontface": 0,
    "default_fontname": "Arial",
    "gridonopen": 0,
    "gridsize": [
      10.0,
      10.0
    ],
    "toolbarvisible": 1,
    "bgcolor": [
      0.047,
      0.055,
      0.063,
      1
    ],
    "boxes": [
      {
        "box": {
          "id": "obj-1",
          "maxclass": "panel",
          "patching_rect": [
            0,
            0,
            900,
            520
          ],
          "presentation": 1,
          "presentation_rect": [
            0,
            0,
            900,
            520
          ],
          "bgcolor": [
            0.047,
            0.055,
            0.063,
            1
          ],
          "bordercolor": [
            0.047,
            0.055,
            0.063,
            1
          ]
        }
      },
      {
        "box": {
          "id": "obj-2",
          "maxclass": "panel",
          "patching_rect": [
            18,
            18,
            864,
            70
          ],
          "presentation": 1,
          "presentation_rect": [
            18,
            18,
            864,
            70
          ],
          "bgcolor": [
            0.075,
            0.086,
            0.098,
            1
          ],
          "bordercolor": [
            0.16,
            0.18,
            0.2,
            1
          ],
          "rounded": 12
        }
      },
      {
        "box": {
          "id": "obj-3",
          "maxclass": "comment",
          "patching_rect": [
            36,
            32,
            270,
            28
          ],
          "presentation": 1,
          "presentation_rect": [
            36,
            32,
            270,
            28
          ],
          "text": "fl\u00f6de~ / SIGNAL POD A",
          "fontsize": 20,
          "fontface": 1,
          "textcolor": [
            0.88,
            0.89,
            0.87,
            1
          ]
        }
      },
      {
        "box": {
          "id": "obj-4",
          "maxclass": "comment",
          "patching_rect": [
            36,
            59,
            340,
            16
          ],
          "presentation": 1,
          "presentation_rect": [
            36,
            59,
            340,
            16
          ],
          "text": "MVP v1 \u00b7 generative sample engine",
          "fontsize": 11,
          "textcolor": [
            0.5,
            0.53,
            0.54,
            1
          ]
        }
      },
      {
        "box": {
          "id": "obj-5",
          "maxclass": "comment",
          "patching_rect": [
            690,
            38,
            170,
            18
          ],
          "presentation": 1,
          "presentation_rect": [
            690,
            38,
            170,
            18
          ],
          "text": "120 BPM \u00b7 1/16 GEN",
          "fontsize": 11,
          "textcolor": [
            0.5,
            0.53,
            0.54,
            1
          ],
          "align": 2
        }
      },
      {
        "box": {
          "id": "obj-6",
          "maxclass": "panel",
          "patching_rect": [
            18,
            104,
            864,
            394
          ],
          "presentation": 1,
          "presentation_rect": [
            18,
            104,
            864,
            394
          ],
          "bgcolor": [
            0.075,
            0.086,
            0.098,
            1
          ],
          "bordercolor": [
            0.16,
            0.18,
            0.2,
            1
          ],
          "rounded": 14
        }
      },
      {
        "box": {
          "id": "obj-7",
          "maxclass": "comment",
          "patching_rect": [
            38,
            120,
            60,
            28
          ],
          "presentation": 1,
          "presentation_rect": [
            38,
            120,
            60,
            28
          ],
          "text": "A",
          "fontsize": 24,
          "fontface": 1,
          "textcolor": [
            0.25,
            0.5,
            0.95,
            1
          ]
        }
      },
      {
        "box": {
          "id": "obj-8",
          "maxclass": "comment",
          "patching_rect": [
            78,
            125,
            130,
            20
          ],
          "presentation": 1,
          "presentation_rect": [
            78,
            125,
            130,
            20
          ],
          "text": "SIGNAL POD",
          "fontsize": 12,
          "fontface": 1,
          "textcolor": [
            0.88,
            0.89,
            0.87,
            1
          ]
        }
      },
      {
        "box": {
          "id": "obj-9",
          "maxclass": "waveform~",
          "patching_rect": [
            38,
            154,
            824,
            128
          ],
          "presentation": 1,
          "presentation_rect": [
            38,
            154,
            824,
            128
          ],
          "buffername": "podA",
          "bgcolor": [
            0.035,
            0.04,
            0.046,
            1
          ],
          "bordercolor": [
            0.16,
            0.18,
            0.2,
            1
          ],
          "waveformcolor": [
            0.25,
            0.5,
            0.95,
            1
          ],
          "selectioncolor": [
            0.25,
            0.5,
            0.95,
            0.18
          ]
        }
      },
      {
        "box": {
          "id": "obj-10",
          "maxclass": "dropfile",
          "patching_rect": [
            38,
            154,
            824,
            128
          ],
          "presentation": 1,
          "presentation_rect": [
            38,
            154,
            824,
            128
          ],
          "types": [
            "AIFF",
            "WAVE",
            "MP3"
          ],
          "border": 0
        }
      },
      {
        "box": {
          "id": "obj-11",
          "maxclass": "newobj",
          "patching_rect": [
            50,
            545,
            110,
            22
          ],
          "text": "prepend replace"
        }
      },
      {
        "box": {
          "id": "obj-12",
          "maxclass": "newobj",
          "patching_rect": [
            175,
            545,
            145,
            22
          ],
          "text": "buffer~ podA"
        }
      },
      {
        "box": {
          "id": "obj-13",
          "maxclass": "newobj",
          "patching_rect": [
            350,
            610,
            80,
            22
          ],
          "text": "sig~ 1."
        }
      },
      {
        "box": {
          "id": "obj-14",
          "maxclass": "newobj",
          "patching_rect": [
            445,
            610,
            150,
            22
          ],
          "text": "groove~ podA 2 @loop 1"
        }
      },
      {
        "box": {
          "id": "obj-15",
          "maxclass": "live.slider",
          "patching_rect": [
            38,
            316,
            250,
            26
          ],
          "presentation": 1,
          "presentation_rect": [
            38,
            316,
            250,
            26
          ],
          "orientation": 1,
          "parameter_enable": 1,
          "activebgcolor": [
            0.25,
            0.82,
            0.72,
            1
          ],
          "bgcolor": [
            0.04,
            0.05,
            0.06,
            1
          ],
          "bordercolor": [
            0.16,
            0.18,
            0.2,
            1
          ],
          "textcolor": [
            0.88,
            0.89,
            0.87,
            1
          ],
          "varname": "podA_volume",
          "saved_attribute_attributes": {
            "valueof": {
              "parameter_longname": "Pod A Volume",
              "parameter_shortname": "VOL",
              "parameter_type": 0,
              "parameter_mmin": 0.0,
              "parameter_mmax": 1.0,
              "parameter_initial_enable": 1,
              "parameter_initial": [
                0.78
              ]
            }
          }
        }
      },
      {
        "box": {
          "id": "obj-16",
          "maxclass": "comment",
          "patching_rect": [
            38,
            294,
            80,
            16
          ],
          "presentation": 1,
          "presentation_rect": [
            38,
            294,
            80,
            16
          ],
          "text": "VOLUME",
          "fontsize": 10,
          "fontface": 1,
          "textcolor": [
            0.5,
            0.53,
            0.54,
            1
          ]
        }
      },
      {
        "box": {
          "id": "obj-17",
          "maxclass": "newobj",
          "patching_rect": [
            620,
            610,
            80,
            22
          ],
          "text": "pack 0. 20"
        }
      },
      {
        "box": {
          "id": "obj-18",
          "maxclass": "newobj",
          "patching_rect": [
            715,
            610,
            55,
            22
          ],
          "text": "line~"
        }
      },
      {
        "box": {
          "id": "obj-19",
          "maxclass": "newobj",
          "patching_rect": [
            445,
            650,
            55,
            22
          ],
          "text": "*~"
        }
      },
      {
        "box": {
          "id": "obj-20",
          "maxclass": "newobj",
          "patching_rect": [
            520,
            650,
            55,
            22
          ],
          "text": "*~"
        }
      },
      {
        "box": {
          "id": "obj-21",
          "maxclass": "live.slider",
          "patching_rect": [
            310,
            316,
            190,
            26
          ],
          "presentation": 1,
          "presentation_rect": [
            310,
            316,
            190,
            26
          ],
          "orientation": 1,
          "parameter_enable": 1,
          "activebgcolor": [
            0.25,
            0.5,
            0.95,
            1
          ],
          "bgcolor": [
            0.04,
            0.05,
            0.06,
            1
          ],
          "bordercolor": [
            0.16,
            0.18,
            0.2,
            1
          ],
          "textcolor": [
            0.88,
            0.89,
            0.87,
            1
          ],
          "varname": "podA_pan",
          "saved_attribute_attributes": {
            "valueof": {
              "parameter_longname": "Pod A Pan",
              "parameter_shortname": "PAN",
              "parameter_type": 0,
              "parameter_mmin": -1.0,
              "parameter_mmax": 1.0,
              "parameter_initial_enable": 1,
              "parameter_initial": [
                0.0
              ]
            }
          }
        }
      },
      {
        "box": {
          "id": "obj-22",
          "maxclass": "comment",
          "patching_rect": [
            310,
            294,
            80,
            16
          ],
          "presentation": 1,
          "presentation_rect": [
            310,
            294,
            80,
            16
          ],
          "text": "PAN",
          "fontsize": 10,
          "fontface": 1,
          "textcolor": [
            0.5,
            0.53,
            0.54,
            1
          ]
        }
      },
      {
        "box": {
          "id": "obj-23",
          "maxclass": "newobj",
          "patching_rect": [
            445,
            695,
            90,
            22
          ],
          "text": "dac~ 1 2"
        }
      },
      {
        "box": {
          "id": "obj-24",
          "maxclass": "newobj",
          "patching_rect": [
            555,
            695,
            90,
            22
          ],
          "text": "plugout~"
        }
      },
      {
        "box": {
          "id": "obj-25",
          "maxclass": "comment",
          "patching_rect": [
            530,
            294,
            110,
            16
          ],
          "presentation": 1,
          "presentation_rect": [
            530,
            294,
            110,
            16
          ],
          "text": "GEN MODE",
          "fontsize": 10,
          "fontface": 1,
          "textcolor": [
            0.5,
            0.53,
            0.54,
            1
          ]
        }
      },
      {
        "box": {
          "id": "obj-26",
          "maxclass": "umenu",
          "patching_rect": [
            530,
            316,
            150,
            26
          ],
          "presentation": 1,
          "presentation_rect": [
            530,
            316,
            150,
            26
          ],
          "items": [
            "PURE",
            ",",
            "JUNG",
            ",",
            "WEIGHTED",
            ",",
            "WALK",
            ",",
            "MEMORY",
            ",",
            "CHAOS"
          ],
          "bgcolor": [
            0.04,
            0.05,
            0.06,
            1
          ],
          "textcolor": [
            0.88,
            0.89,
            0.87,
            1
          ],
          "varname": "podA_gen_mode"
        }
      },
      {
        "box": {
          "id": "obj-27",
          "maxclass": "comment",
          "patching_rect": [
            38,
            362,
            150,
            16
          ],
          "presentation": 1,
          "presentation_rect": [
            38,
            362,
            150,
            16
          ],
          "text": "RANDOM / JUNG",
          "fontsize": 10,
          "fontface": 1,
          "textcolor": [
            0.5,
            0.53,
            0.54,
            1
          ]
        }
      },
      {
        "box": {
          "id": "obj-28",
          "maxclass": "live.slider",
          "patching_rect": [
            38,
            383,
            380,
            26
          ],
          "presentation": 1,
          "presentation_rect": [
            38,
            383,
            380,
            26
          ],
          "orientation": 1,
          "parameter_enable": 1,
          "activebgcolor": [
            0.25,
            0.82,
            0.72,
            1
          ],
          "bgcolor": [
            0.04,
            0.05,
            0.06,
            1
          ],
          "bordercolor": [
            0.16,
            0.18,
            0.2,
            1
          ],
          "textcolor": [
            0.88,
            0.89,
            0.87,
            1
          ],
          "varname": "podA_gen_amount",
          "saved_attribute_attributes": {
            "valueof": {
              "parameter_longname": "Pod A Generative Amount",
              "parameter_shortname": "GEN",
              "parameter_type": 0,
              "parameter_mmin": 0.0,
              "parameter_mmax": 1.0,
              "parameter_initial_enable": 1,
              "parameter_initial": [
                0.55
              ]
            }
          }
        }
      },
      {
        "box": {
          "id": "obj-29",
          "maxclass": "comment",
          "patching_rect": [
            448,
            362,
            90,
            16
          ],
          "presentation": 1,
          "presentation_rect": [
            448,
            362,
            90,
            16
          ],
          "text": "JITTER",
          "fontsize": 10,
          "fontface": 1,
          "textcolor": [
            0.5,
            0.53,
            0.54,
            1
          ]
        }
      },
      {
        "box": {
          "id": "obj-30",
          "maxclass": "live.slider",
          "patching_rect": [
            448,
            383,
            230,
            26
          ],
          "presentation": 1,
          "presentation_rect": [
            448,
            383,
            230,
            26
          ],
          "orientation": 1,
          "parameter_enable": 1,
          "activebgcolor": [
            0.63,
            0.78,
            0.3,
            1
          ],
          "bgcolor": [
            0.04,
            0.05,
            0.06,
            1
          ],
          "bordercolor": [
            0.16,
            0.18,
            0.2,
            1
          ],
          "textcolor": [
            0.88,
            0.89,
            0.87,
            1
          ],
          "varname": "podA_jitter",
          "saved_attribute_attributes": {
            "valueof": {
              "parameter_longname": "Pod A Jitter",
              "parameter_shortname": "JIT",
              "parameter_type": 0,
              "parameter_mmin": 0.0,
              "parameter_mmax": 1.0,
              "parameter_initial_enable": 1,
              "parameter_initial": [
                0.18
              ]
            }
          }
        }
      },
      {
        "box": {
          "id": "obj-31",
          "maxclass": "live.text",
          "patching_rect": [
            708,
            383,
            154,
            26
          ],
          "presentation": 1,
          "presentation_rect": [
            708,
            383,
            154,
            26
          ],
          "text": "GEN RUN",
          "texton": "GEN RUN",
          "mode": 1,
          "parameter_enable": 1,
          "bgcolor": [
            0.04,
            0.05,
            0.06,
            1
          ],
          "bgoncolor": [
            0.25,
            0.82,
            0.72,
            1
          ],
          "textcolor": [
            0.88,
            0.89,
            0.87,
            1
          ],
          "textoncolor": [
            0.047,
            0.055,
            0.063,
            1
          ],
          "varname": "podA_gen_run"
        }
      },
      {
        "box": {
          "id": "obj-32",
          "maxclass": "live.text",
          "patching_rect": [
            38,
            446,
            92,
            28
          ],
          "presentation": 1,
          "presentation_rect": [
            38,
            446,
            92,
            28
          ],
          "text": "MUTE",
          "texton": "MUTE",
          "mode": 1,
          "parameter_enable": 1,
          "bgcolor": [
            0.04,
            0.05,
            0.06,
            1
          ],
          "bgoncolor": [
            0.7,
            0.25,
            0.25,
            1
          ],
          "textcolor": [
            0.88,
            0.89,
            0.87,
            1
          ],
          "textoncolor": [
            0.88,
            0.89,
            0.87,
            1
          ],
          "varname": "podA_mute"
        }
      },
      {
        "box": {
          "id": "obj-33",
          "maxclass": "live.text",
          "patching_rect": [
            140,
            446,
            92,
            28
          ],
          "presentation": 1,
          "presentation_rect": [
            140,
            446,
            92,
            28
          ],
          "text": "SOLO",
          "texton": "SOLO",
          "mode": 1,
          "parameter_enable": 1,
          "bgcolor": [
            0.04,
            0.05,
            0.06,
            1
          ],
          "bgoncolor": [
            0.85,
            0.7,
            0.2,
            1
          ],
          "textcolor": [
            0.88,
            0.89,
            0.87,
            1
          ],
          "textoncolor": [
            0.047,
            0.055,
            0.063,
            1
          ],
          "varname": "podA_solo"
        }
      },
      {
        "box": {
          "id": "obj-34",
          "maxclass": "live.text",
          "patching_rect": [
            242,
            446,
            92,
            28
          ],
          "presentation": 1,
          "presentation_rect": [
            242,
            446,
            92,
            28
          ],
          "text": "LOOP",
          "texton": "LOOP",
          "mode": 1,
          "parameter_enable": 1,
          "bgcolor": [
            0.04,
            0.05,
            0.06,
            1
          ],
          "bgoncolor": [
            0.25,
            0.5,
            0.95,
            1
          ],
          "textcolor": [
            0.88,
            0.89,
            0.87,
            1
          ],
          "textoncolor": [
            0.88,
            0.89,
            0.87,
            1
          ],
          "varname": "podA_loop"
        }
      },
      {
        "box": {
          "id": "obj-35",
          "maxclass": "comment",
          "patching_rect": [
            570,
            451,
            292,
            18
          ],
          "presentation": 1,
          "presentation_rect": [
            570,
            451,
            292,
            18
          ],
          "text": "drop audio on waveform \u00b7 SHIFT = precision",
          "fontsize": 10,
          "textcolor": [
            0.5,
            0.53,
            0.54,
            1
          ],
          "align": 2
        }
      },
      {
        "box": {
          "id": "obj-36",
          "maxclass": "newobj",
          "patching_rect": [
            50,
            610,
            150,
            22
          ],
          "text": "js js/flode_gen.js"
        }
      },
      {
        "box": {
          "id": "obj-37",
          "maxclass": "newobj",
          "patching_rect": [
            50,
            650,
            80,
            22
          ],
          "text": "metro 125"
        }
      },
      {
        "box": {
          "id": "obj-38",
          "maxclass": "newobj",
          "patching_rect": [
            215,
            610,
            110,
            22
          ],
          "text": "clip 0.25 2."
        }
      },
      {
        "box": {
          "id": "obj-39",
          "maxclass": "flonum",
          "patching_rect": [
            215,
            650,
            70,
            22
          ]
        }
      },
      {
        "box": {
          "id": "obj-40",
          "maxclass": "flonum",
          "patching_rect": [
            300,
            650,
            70,
            22
          ]
        }
      },
      {
        "box": {
          "id": "obj-41",
          "maxclass": "newobj",
          "patching_rect": [
            50,
            735,
            60,
            22
          ],
          "text": "loadbang"
        }
      },
      {
        "box": {
          "id": "obj-42",
          "maxclass": "message",
          "patching_rect": [
            120,
            735,
            120,
            22
          ],
          "text": "1, 0.55, 0.18"
        }
      },
      {
        "box": {
          "id": "obj-43",
          "maxclass": "newobj",
          "patching_rect": [
            250,
            735,
            100,
            22
          ],
          "text": "unpack i f f"
        }
      }
    ],
    "lines": [
      {
        "patchline": {
          "source": [
            "obj-10",
            0
          ],
          "destination": [
            "obj-11",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-11",
            0
          ],
          "destination": [
            "obj-12",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-13",
            0
          ],
          "destination": [
            "obj-14",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-15",
            0
          ],
          "destination": [
            "obj-17",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-17",
            0
          ],
          "destination": [
            "obj-18",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-14",
            0
          ],
          "destination": [
            "obj-19",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-14",
            1
          ],
          "destination": [
            "obj-20",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-18",
            0
          ],
          "destination": [
            "obj-19",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-18",
            0
          ],
          "destination": [
            "obj-20",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-19",
            0
          ],
          "destination": [
            "obj-23",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-20",
            0
          ],
          "destination": [
            "obj-23",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-19",
            0
          ],
          "destination": [
            "obj-24",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-20",
            0
          ],
          "destination": [
            "obj-24",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-31",
            0
          ],
          "destination": [
            "obj-37",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-37",
            0
          ],
          "destination": [
            "obj-36",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-26",
            0
          ],
          "destination": [
            "obj-36",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-28",
            0
          ],
          "destination": [
            "obj-36",
            2
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-30",
            0
          ],
          "destination": [
            "obj-36",
            3
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-36",
            0
          ],
          "destination": [
            "obj-38",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-38",
            0
          ],
          "destination": [
            "obj-13",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-36",
            1
          ],
          "destination": [
            "obj-39",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-36",
            2
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
            "obj-41",
            0
          ],
          "destination": [
            "obj-42",
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
            "obj-43",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-43",
            0
          ],
          "destination": [
            "obj-26",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-43",
            1
          ],
          "destination": [
            "obj-28",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-43",
            2
          ],
          "destination": [
            "obj-30",
            0
          ]
        }
      }
    ]
  }
}