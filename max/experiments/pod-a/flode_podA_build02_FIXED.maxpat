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
      40.0,
      40.0,
      1280.0,
      820.0
    ],
    "openinpresentation": 0,
    "default_fontname": "Arial",
    "default_fontsize": 11.0,
    "gridonopen": 1,
    "gridsize": [
      8.0,
      8.0
    ],
    "gridsnaponopen": 1,
    "boxes": [
      {
        "box": {
          "id": "title",
          "maxclass": "comment",
          "patching_rect": [
            34.0,
            28.0,
            160.0,
            24.0
          ],
          "text": "fl\u00f6de~  POD A",
          "textcolor": [
            0.82,
            0.83,
            0.81,
            1.0
          ],
          "fontsize": 16.0,
          "presentation": 1,
          "presentation_rect": [
            34,
            28,
            160,
            24
          ]
        }
      },
      {
        "box": {
          "id": "subtitle",
          "maxclass": "comment",
          "patching_rect": [
            200.0,
            31.0,
            330.0,
            20.0
          ],
          "text": "Jungulator-inspired sampler / Build 02 UI",
          "textcolor": [
            0.47,
            0.49,
            0.47,
            1.0
          ],
          "fontsize": 10.0,
          "presentation": 1,
          "presentation_rect": [
            200,
            31,
            330,
            20
          ]
        }
      },
      {
        "box": {
          "id": "status",
          "maxclass": "led",
          "patching_rect": [
            34.0,
            64.0,
            18.0,
            18.0
          ],
          "presentation": 1,
          "presentation_rect": [
            34,
            64,
            18,
            18
          ]
        }
      },
      {
        "box": {
          "id": "mute",
          "maxclass": "toggle",
          "patching_rect": [
            60.0,
            62.0,
            22.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            60,
            62,
            22,
            22
          ]
        }
      },
      {
        "box": {
          "id": "m_lbl",
          "maxclass": "comment",
          "patching_rect": [
            63.0,
            84.0,
            20.0,
            15.0
          ],
          "text": "M",
          "textcolor": [
            0.55,
            0.56,
            0.55,
            1.0
          ],
          "fontsize": 8.0,
          "presentation": 1,
          "presentation_rect": [
            63,
            84,
            20,
            15
          ]
        }
      },
      {
        "box": {
          "id": "solo",
          "maxclass": "toggle",
          "patching_rect": [
            90.0,
            62.0,
            22.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            90,
            62,
            22,
            22
          ]
        }
      },
      {
        "box": {
          "id": "s_lbl",
          "maxclass": "comment",
          "patching_rect": [
            94.0,
            84.0,
            20.0,
            15.0
          ],
          "text": "S",
          "textcolor": [
            0.55,
            0.56,
            0.55,
            1.0
          ],
          "fontsize": 8.0,
          "presentation": 1,
          "presentation_rect": [
            94,
            84,
            20,
            15
          ]
        }
      },
      {
        "box": {
          "id": "rec",
          "maxclass": "toggle",
          "patching_rect": [
            125.0,
            62.0,
            22.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            125,
            62,
            22,
            22
          ]
        }
      },
      {
        "box": {
          "id": "rec_lbl",
          "maxclass": "comment",
          "patching_rect": [
            151.0,
            65.0,
            40.0,
            18.0
          ],
          "text": "REC",
          "textcolor": [
            0.72,
            0.72,
            0.7,
            1.0
          ],
          "presentation": 1,
          "presentation_rect": [
            151,
            65,
            40,
            18
          ]
        }
      },
      {
        "box": {
          "id": "drop",
          "maxclass": "dropfile",
          "patching_rect": [
            206.0,
            61.0,
            180.0,
            28.0
          ],
          "presentation": 1,
          "presentation_rect": [
            206,
            61,
            180,
            28
          ]
        }
      },
      {
        "box": {
          "id": "sample_lbl",
          "maxclass": "comment",
          "patching_rect": [
            395.0,
            65.0,
            280.0,
            20.0
          ],
          "text": "drop audio / sample.wav",
          "textcolor": [
            0.64,
            0.66,
            0.64,
            1.0
          ],
          "presentation": 1,
          "presentation_rect": [
            395,
            65,
            280,
            20
          ]
        }
      },
      {
        "box": {
          "id": "prepend",
          "maxclass": "newobj",
          "patching_rect": [
            150.0,
            800.0,
            105.0,
            22.0
          ],
          "text": "prepend replace"
        }
      },
      {
        "box": {
          "id": "buffer",
          "maxclass": "newobj",
          "patching_rect": [
            270.0,
            800.0,
            145.0,
            22.0
          ],
          "text": "buffer~ podA_buffer"
        }
      },
      {
        "box": {
          "id": "groove",
          "maxclass": "newobj",
          "patching_rect": [
            430.0,
            800.0,
            150.0,
            22.0
          ],
          "text": "groove~ podA_buffer 2"
        }
      },
      {
        "box": {
          "id": "speed_sig",
          "maxclass": "newobj",
          "patching_rect": [
            595.0,
            800.0,
            45.0,
            22.0
          ],
          "text": "sig~ 1."
        }
      },
      {
        "box": {
          "id": "ampL",
          "maxclass": "newobj",
          "patching_rect": [
            655.0,
            800.0,
            35.0,
            22.0
          ],
          "text": "*~"
        }
      },
      {
        "box": {
          "id": "ampR",
          "maxclass": "newobj",
          "patching_rect": [
            700.0,
            800.0,
            35.0,
            22.0
          ],
          "text": "*~"
        }
      },
      {
        "box": {
          "id": "ez",
          "maxclass": "ezdac~",
          "patching_rect": [
            750.0,
            790.0,
            45.0,
            45.0
          ]
        }
      },
      {
        "box": {
          "id": "wave",
          "maxclass": "waveform~",
          "patching_rect": [
            34.0,
            106.0,
            1166.0,
            215.0
          ],
          "buffername": "podA_buffer",
          "presentation": 1,
          "presentation_rect": [
            34,
            106,
            1166,
            215
          ]
        }
      },
      {
        "box": {
          "id": "wave_hint",
          "maxclass": "comment",
          "patching_rect": [
            46.0,
            112.0,
            170.0,
            18.0
          ],
          "text": "CTRL + scroll = zoom",
          "textcolor": [
            0.38,
            0.39,
            0.38,
            1.0
          ],
          "fontsize": 8.0,
          "presentation": 1,
          "presentation_rect": [
            46,
            112,
            170,
            18
          ]
        }
      },
      {
        "box": {
          "id": "panic",
          "maxclass": "button",
          "patching_rect": [
            1132.0,
            328.0,
            22.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            1132,
            328,
            22,
            22
          ]
        }
      },
      {
        "box": {
          "id": "panic_lbl",
          "maxclass": "comment",
          "patching_rect": [
            1158.0,
            331.0,
            48.0,
            18.0
          ],
          "text": "PANIC",
          "textcolor": [
            0.85,
            0.3,
            0.24,
            1.0
          ],
          "fontsize": 9.0,
          "presentation": 1,
          "presentation_rect": [
            1158,
            331,
            48,
            18
          ]
        }
      },
      {
        "box": {
          "id": "start_lbl",
          "maxclass": "comment",
          "patching_rect": [
            34.0,
            334.0,
            80.0,
            16.0
          ],
          "text": "START ms",
          "textcolor": [
            0.52,
            0.54,
            0.52,
            1.0
          ],
          "fontsize": 8.0,
          "presentation": 1,
          "presentation_rect": [
            34,
            334,
            80,
            16
          ]
        }
      },
      {
        "box": {
          "id": "start",
          "maxclass": "flonum",
          "patching_rect": [
            34.0,
            352.0,
            95.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            34,
            352,
            95,
            22
          ]
        }
      },
      {
        "box": {
          "id": "end_lbl",
          "maxclass": "comment",
          "patching_rect": [
            170.0,
            334.0,
            80.0,
            16.0
          ],
          "text": "END ms",
          "textcolor": [
            0.52,
            0.54,
            0.52,
            1.0
          ],
          "fontsize": 8.0,
          "presentation": 1,
          "presentation_rect": [
            170,
            334,
            80,
            16
          ]
        }
      },
      {
        "box": {
          "id": "end",
          "maxclass": "flonum",
          "patching_rect": [
            170.0,
            352.0,
            95.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            170,
            352,
            95,
            22
          ]
        }
      },
      {
        "box": {
          "id": "fadein_lbl",
          "maxclass": "comment",
          "patching_rect": [
            306.0,
            334.0,
            80.0,
            16.0
          ],
          "text": "FADE IN",
          "textcolor": [
            0.52,
            0.54,
            0.52,
            1.0
          ],
          "fontsize": 8.0,
          "presentation": 1,
          "presentation_rect": [
            306,
            334,
            80,
            16
          ]
        }
      },
      {
        "box": {
          "id": "fadein",
          "maxclass": "flonum",
          "patching_rect": [
            306.0,
            352.0,
            95.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            306,
            352,
            95,
            22
          ]
        }
      },
      {
        "box": {
          "id": "fadeout_lbl",
          "maxclass": "comment",
          "patching_rect": [
            422.0,
            334.0,
            80.0,
            16.0
          ],
          "text": "FADE OUT",
          "textcolor": [
            0.52,
            0.54,
            0.52,
            1.0
          ],
          "fontsize": 8.0,
          "presentation": 1,
          "presentation_rect": [
            422,
            334,
            80,
            16
          ]
        }
      },
      {
        "box": {
          "id": "fadeout",
          "maxclass": "flonum",
          "patching_rect": [
            422.0,
            352.0,
            95.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            422,
            352,
            95,
            22
          ]
        }
      },
      {
        "box": {
          "id": "loop",
          "maxclass": "toggle",
          "patching_rect": [
            544.0,
            351.0,
            22.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            544,
            351,
            22,
            22
          ]
        }
      },
      {
        "box": {
          "id": "loop_lbl",
          "maxclass": "comment",
          "patching_rect": [
            571.0,
            354.0,
            48.0,
            18.0
          ],
          "text": "LOOP",
          "textcolor": [
            0.65,
            0.66,
            0.64,
            1.0
          ],
          "presentation": 1,
          "presentation_rect": [
            571,
            354,
            48,
            18
          ]
        }
      },
      {
        "box": {
          "id": "jung_panel",
          "maxclass": "panel",
          "patching_rect": [
            34.0,
            392.0,
            1166.0,
            95.0
          ],
          "bgcolor": [
            0.12,
            0.125,
            0.125,
            1.0
          ],
          "presentation": 1,
          "presentation_rect": [
            34,
            392,
            1166,
            95
          ]
        }
      },
      {
        "box": {
          "id": "jung_title",
          "maxclass": "comment",
          "patching_rect": [
            44.0,
            398.0,
            170.0,
            18.0
          ],
          "text": "JUNGULATOR CORE",
          "textcolor": [
            0.88,
            0.54,
            0.16,
            1.0
          ],
          "fontsize": 9.5,
          "presentation": 1,
          "presentation_rect": [
            44,
            398,
            170,
            18
          ]
        }
      },
      {
        "box": {
          "id": "prime_lbl",
          "maxclass": "comment",
          "patching_rect": [
            44.0,
            420.0,
            74.0,
            14.0
          ],
          "text": "PRIME",
          "textcolor": [
            0.49,
            0.5,
            0.49,
            1.0
          ],
          "fontsize": 6.8,
          "presentation": 1,
          "presentation_rect": [
            44,
            420,
            74,
            14
          ]
        }
      },
      {
        "box": {
          "id": "prime",
          "maxclass": "toggle",
          "patching_rect": [
            44.0,
            441.0,
            18.0,
            18.0
          ],
          "presentation": 1,
          "presentation_rect": [
            44,
            441,
            18,
            18
          ]
        }
      },
      {
        "box": {
          "id": "seq_lbl",
          "maxclass": "comment",
          "patching_rect": [
            125.0,
            420.0,
            74.0,
            14.0
          ],
          "text": "SEQ",
          "textcolor": [
            0.49,
            0.5,
            0.49,
            1.0
          ],
          "fontsize": 6.8,
          "presentation": 1,
          "presentation_rect": [
            125,
            420,
            74,
            14
          ]
        }
      },
      {
        "box": {
          "id": "seq",
          "maxclass": "flonum",
          "patching_rect": [
            125.0,
            438.0,
            66.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            125,
            438,
            66,
            22
          ]
        }
      },
      {
        "box": {
          "id": "seqspeed_lbl",
          "maxclass": "comment",
          "patching_rect": [
            206.0,
            420.0,
            88.0,
            14.0
          ],
          "text": "SEQ SPEED",
          "textcolor": [
            0.49,
            0.5,
            0.49,
            1.0
          ],
          "fontsize": 6.8,
          "presentation": 1,
          "presentation_rect": [
            206,
            420,
            88,
            14
          ]
        }
      },
      {
        "box": {
          "id": "seqspeed",
          "maxclass": "flonum",
          "patching_rect": [
            206.0,
            438.0,
            80.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            206,
            438,
            80,
            22
          ]
        }
      },
      {
        "box": {
          "id": "looper_lbl",
          "maxclass": "comment",
          "patching_rect": [
            301.0,
            420.0,
            74.0,
            14.0
          ],
          "text": "LOOPER",
          "textcolor": [
            0.49,
            0.5,
            0.49,
            1.0
          ],
          "fontsize": 6.8,
          "presentation": 1,
          "presentation_rect": [
            301,
            420,
            74,
            14
          ]
        }
      },
      {
        "box": {
          "id": "looper",
          "maxclass": "toggle",
          "patching_rect": [
            301.0,
            441.0,
            18.0,
            18.0
          ],
          "presentation": 1,
          "presentation_rect": [
            301,
            441,
            18,
            18
          ]
        }
      },
      {
        "box": {
          "id": "cutter_lbl",
          "maxclass": "comment",
          "patching_rect": [
            382.0,
            420.0,
            74.0,
            14.0
          ],
          "text": "CUTTER",
          "textcolor": [
            0.49,
            0.5,
            0.49,
            1.0
          ],
          "fontsize": 6.8,
          "presentation": 1,
          "presentation_rect": [
            382,
            420,
            74,
            14
          ]
        }
      },
      {
        "box": {
          "id": "cutter",
          "maxclass": "flonum",
          "patching_rect": [
            382.0,
            438.0,
            66.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            382,
            438,
            66,
            22
          ]
        }
      },
      {
        "box": {
          "id": "pattern_lbl",
          "maxclass": "comment",
          "patching_rect": [
            463.0,
            420.0,
            74.0,
            14.0
          ],
          "text": "PATTERN",
          "textcolor": [
            0.49,
            0.5,
            0.49,
            1.0
          ],
          "fontsize": 6.8,
          "presentation": 1,
          "presentation_rect": [
            463,
            420,
            74,
            14
          ]
        }
      },
      {
        "box": {
          "id": "pattern",
          "maxclass": "flonum",
          "patching_rect": [
            463.0,
            438.0,
            66.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            463,
            438,
            66,
            22
          ]
        }
      },
      {
        "box": {
          "id": "octaver_lbl",
          "maxclass": "comment",
          "patching_rect": [
            544.0,
            420.0,
            74.0,
            14.0
          ],
          "text": "OCTAVER",
          "textcolor": [
            0.49,
            0.5,
            0.49,
            1.0
          ],
          "fontsize": 6.8,
          "presentation": 1,
          "presentation_rect": [
            544,
            420,
            74,
            14
          ]
        }
      },
      {
        "box": {
          "id": "octaver",
          "maxclass": "flonum",
          "patching_rect": [
            544.0,
            438.0,
            66.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            544,
            438,
            66,
            22
          ]
        }
      },
      {
        "box": {
          "id": "random_lbl",
          "maxclass": "comment",
          "patching_rect": [
            625.0,
            420.0,
            74.0,
            14.0
          ],
          "text": "RANDOM",
          "textcolor": [
            0.49,
            0.5,
            0.49,
            1.0
          ],
          "fontsize": 6.8,
          "presentation": 1,
          "presentation_rect": [
            625,
            420,
            74,
            14
          ]
        }
      },
      {
        "box": {
          "id": "random",
          "maxclass": "flonum",
          "patching_rect": [
            625.0,
            438.0,
            66.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            625,
            438,
            66,
            22
          ]
        }
      },
      {
        "box": {
          "id": "pitch_lbl",
          "maxclass": "comment",
          "patching_rect": [
            706.0,
            420.0,
            74.0,
            14.0
          ],
          "text": "PITCH",
          "textcolor": [
            0.49,
            0.5,
            0.49,
            1.0
          ],
          "fontsize": 6.8,
          "presentation": 1,
          "presentation_rect": [
            706,
            420,
            74,
            14
          ]
        }
      },
      {
        "box": {
          "id": "pitch",
          "maxclass": "flonum",
          "patching_rect": [
            706.0,
            438.0,
            66.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            706,
            438,
            66,
            22
          ]
        }
      },
      {
        "box": {
          "id": "effectpod_lbl",
          "maxclass": "comment",
          "patching_rect": [
            787.0,
            420.0,
            88.0,
            14.0
          ],
          "text": "EFFECT POD",
          "textcolor": [
            0.49,
            0.5,
            0.49,
            1.0
          ],
          "fontsize": 6.8,
          "presentation": 1,
          "presentation_rect": [
            787,
            420,
            88,
            14
          ]
        }
      },
      {
        "box": {
          "id": "effectpod",
          "maxclass": "umenu",
          "patching_rect": [
            787.0,
            438.0,
            88.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            787,
            438,
            88,
            22
          ]
        }
      },
      {
        "box": {
          "id": "jung_on_lbl",
          "maxclass": "comment",
          "patching_rect": [
            882.0,
            420.0,
            88.0,
            14.0
          ],
          "text": "JUNG ON/OFF",
          "textcolor": [
            0.49,
            0.5,
            0.49,
            1.0
          ],
          "fontsize": 6.8,
          "presentation": 1,
          "presentation_rect": [
            882,
            420,
            88,
            14
          ]
        }
      },
      {
        "box": {
          "id": "jung_on",
          "maxclass": "toggle",
          "patching_rect": [
            882.0,
            441.0,
            18.0,
            18.0
          ],
          "presentation": 1,
          "presentation_rect": [
            882,
            441,
            18,
            18
          ]
        }
      },
      {
        "box": {
          "id": "jung_up_lbl",
          "maxclass": "comment",
          "patching_rect": [
            977.0,
            420.0,
            74.0,
            14.0
          ],
          "text": "JUNG UP",
          "textcolor": [
            0.49,
            0.5,
            0.49,
            1.0
          ],
          "fontsize": 6.8,
          "presentation": 1,
          "presentation_rect": [
            977,
            420,
            74,
            14
          ]
        }
      },
      {
        "box": {
          "id": "jung_up",
          "maxclass": "toggle",
          "patching_rect": [
            977.0,
            441.0,
            18.0,
            18.0
          ],
          "presentation": 1,
          "presentation_rect": [
            977,
            441,
            18,
            18
          ]
        }
      },
      {
        "box": {
          "id": "jung_down_lbl",
          "maxclass": "comment",
          "patching_rect": [
            1058.0,
            420.0,
            88.0,
            14.0
          ],
          "text": "JUNG DOWN",
          "textcolor": [
            0.49,
            0.5,
            0.49,
            1.0
          ],
          "fontsize": 6.8,
          "presentation": 1,
          "presentation_rect": [
            1058,
            420,
            88,
            14
          ]
        }
      },
      {
        "box": {
          "id": "jung_down",
          "maxclass": "toggle",
          "patching_rect": [
            1058.0,
            441.0,
            18.0,
            18.0
          ],
          "presentation": 1,
          "presentation_rect": [
            1058,
            441,
            18,
            18
          ]
        }
      },
      {
        "box": {
          "id": "play_panel",
          "maxclass": "panel",
          "patching_rect": [
            34.0,
            500.0,
            1166.0,
            105.0
          ],
          "bgcolor": [
            0.105,
            0.11,
            0.11,
            1.0
          ],
          "presentation": 1,
          "presentation_rect": [
            34,
            500,
            1166,
            105
          ]
        }
      },
      {
        "box": {
          "id": "play_title",
          "maxclass": "comment",
          "patching_rect": [
            44.0,
            506.0,
            150.0,
            18.0
          ],
          "text": "PLAYBACK & MOD",
          "textcolor": [
            0.88,
            0.54,
            0.16,
            1.0
          ],
          "fontsize": 9.5,
          "presentation": 1,
          "presentation_rect": [
            44,
            506,
            150,
            18
          ]
        }
      },
      {
        "box": {
          "id": "speed_lbl",
          "maxclass": "comment",
          "patching_rect": [
            44.0,
            527.0,
            98.0,
            14.0
          ],
          "text": "SPEED",
          "textcolor": [
            0.52,
            0.54,
            0.52,
            1.0
          ],
          "fontsize": 7.0,
          "presentation": 1,
          "presentation_rect": [
            44,
            527,
            98,
            14
          ]
        }
      },
      {
        "box": {
          "id": "speed",
          "maxclass": "slider",
          "patching_rect": [
            44.0,
            548.0,
            90.0,
            18.0
          ],
          "min": 0.25,
          "size": 3.75,
          "floatoutput": 1,
          "presentation": 1,
          "presentation_rect": [
            44,
            548,
            90,
            18
          ]
        }
      },
      {
        "box": {
          "id": "range_lbl",
          "maxclass": "comment",
          "patching_rect": [
            154.0,
            527.0,
            98.0,
            14.0
          ],
          "text": "RANGE ms",
          "textcolor": [
            0.52,
            0.54,
            0.52,
            1.0
          ],
          "fontsize": 7.0,
          "presentation": 1,
          "presentation_rect": [
            154,
            527,
            98,
            14
          ]
        }
      },
      {
        "box": {
          "id": "range",
          "maxclass": "slider",
          "patching_rect": [
            154.0,
            548.0,
            90.0,
            18.0
          ],
          "min": 1.0,
          "size": 1999.0,
          "floatoutput": 1,
          "presentation": 1,
          "presentation_rect": [
            154,
            548,
            90,
            18
          ]
        }
      },
      {
        "box": {
          "id": "rnd_lbl",
          "maxclass": "comment",
          "patching_rect": [
            264.0,
            527.0,
            98.0,
            14.0
          ],
          "text": "RND %",
          "textcolor": [
            0.52,
            0.54,
            0.52,
            1.0
          ],
          "fontsize": 7.0,
          "presentation": 1,
          "presentation_rect": [
            264,
            527,
            98,
            14
          ]
        }
      },
      {
        "box": {
          "id": "rnd",
          "maxclass": "slider",
          "patching_rect": [
            264.0,
            548.0,
            90.0,
            18.0
          ],
          "min": 0.0,
          "size": 100.0,
          "floatoutput": 1,
          "presentation": 1,
          "presentation_rect": [
            264,
            548,
            90,
            18
          ]
        }
      },
      {
        "box": {
          "id": "rnd2_lbl",
          "maxclass": "comment",
          "patching_rect": [
            374.0,
            527.0,
            98.0,
            14.0
          ],
          "text": "RND2 %",
          "textcolor": [
            0.52,
            0.54,
            0.52,
            1.0
          ],
          "fontsize": 7.0,
          "presentation": 1,
          "presentation_rect": [
            374,
            527,
            98,
            14
          ]
        }
      },
      {
        "box": {
          "id": "rnd2",
          "maxclass": "slider",
          "patching_rect": [
            374.0,
            548.0,
            90.0,
            18.0
          ],
          "min": 0.0,
          "size": 100.0,
          "floatoutput": 1,
          "presentation": 1,
          "presentation_rect": [
            374,
            548,
            90,
            18
          ]
        }
      },
      {
        "box": {
          "id": "jitter_lbl",
          "maxclass": "comment",
          "patching_rect": [
            484.0,
            527.0,
            98.0,
            14.0
          ],
          "text": "JITTER ms",
          "textcolor": [
            0.52,
            0.54,
            0.52,
            1.0
          ],
          "fontsize": 7.0,
          "presentation": 1,
          "presentation_rect": [
            484,
            527,
            98,
            14
          ]
        }
      },
      {
        "box": {
          "id": "jitter",
          "maxclass": "slider",
          "patching_rect": [
            484.0,
            548.0,
            90.0,
            18.0
          ],
          "min": 0.0,
          "size": 80.0,
          "floatoutput": 1,
          "presentation": 1,
          "presentation_rect": [
            484,
            548,
            90,
            18
          ]
        }
      },
      {
        "box": {
          "id": "pitch2_lbl",
          "maxclass": "comment",
          "patching_rect": [
            594.0,
            527.0,
            98.0,
            14.0
          ],
          "text": "PITCH st",
          "textcolor": [
            0.52,
            0.54,
            0.52,
            1.0
          ],
          "fontsize": 7.0,
          "presentation": 1,
          "presentation_rect": [
            594,
            527,
            98,
            14
          ]
        }
      },
      {
        "box": {
          "id": "pitch2",
          "maxclass": "slider",
          "patching_rect": [
            594.0,
            548.0,
            90.0,
            18.0
          ],
          "min": -24.0,
          "size": 48.0,
          "floatoutput": 1,
          "presentation": 1,
          "presentation_rect": [
            594,
            548,
            90,
            18
          ]
        }
      },
      {
        "box": {
          "id": "octave2_lbl",
          "maxclass": "comment",
          "patching_rect": [
            704.0,
            527.0,
            98.0,
            14.0
          ],
          "text": "OCTAVE",
          "textcolor": [
            0.52,
            0.54,
            0.52,
            1.0
          ],
          "fontsize": 7.0,
          "presentation": 1,
          "presentation_rect": [
            704,
            527,
            98,
            14
          ]
        }
      },
      {
        "box": {
          "id": "octave2",
          "maxclass": "slider",
          "patching_rect": [
            704.0,
            548.0,
            90.0,
            18.0
          ],
          "min": -4.0,
          "size": 8.0,
          "floatoutput": 1,
          "presentation": 1,
          "presentation_rect": [
            704,
            548,
            90,
            18
          ]
        }
      },
      {
        "box": {
          "id": "trans_lbl",
          "maxclass": "comment",
          "patching_rect": [
            814.0,
            527.0,
            116.0,
            14.0
          ],
          "text": "TRANSIENT %",
          "textcolor": [
            0.52,
            0.54,
            0.52,
            1.0
          ],
          "fontsize": 7.0,
          "presentation": 1,
          "presentation_rect": [
            814,
            527,
            116,
            14
          ]
        }
      },
      {
        "box": {
          "id": "trans",
          "maxclass": "slider",
          "patching_rect": [
            814.0,
            548.0,
            108.0,
            18.0
          ],
          "min": 0.0,
          "size": 100.0,
          "floatoutput": 1,
          "presentation": 1,
          "presentation_rect": [
            814,
            548,
            108,
            18
          ]
        }
      },
      {
        "box": {
          "id": "vol_lbl",
          "maxclass": "comment",
          "patching_rect": [
            942.0,
            527.0,
            98.0,
            14.0
          ],
          "text": "VOL",
          "textcolor": [
            0.52,
            0.54,
            0.52,
            1.0
          ],
          "fontsize": 7.0,
          "presentation": 1,
          "presentation_rect": [
            942,
            527,
            98,
            14
          ]
        }
      },
      {
        "box": {
          "id": "vol",
          "maxclass": "slider",
          "patching_rect": [
            942.0,
            548.0,
            90.0,
            18.0
          ],
          "min": 0.0,
          "size": 1.0,
          "floatoutput": 1,
          "presentation": 1,
          "presentation_rect": [
            942,
            548,
            90,
            18
          ]
        }
      },
      {
        "box": {
          "id": "pan_lbl",
          "maxclass": "comment",
          "patching_rect": [
            1052.0,
            527.0,
            98.0,
            14.0
          ],
          "text": "PAN",
          "textcolor": [
            0.52,
            0.54,
            0.52,
            1.0
          ],
          "fontsize": 7.0,
          "presentation": 1,
          "presentation_rect": [
            1052,
            527,
            98,
            14
          ]
        }
      },
      {
        "box": {
          "id": "pan",
          "maxclass": "dial",
          "patching_rect": [
            1072.0,
            546.0,
            44.0,
            44.0
          ],
          "min": -1.0,
          "size": 2.0,
          "floatoutput": 1,
          "presentation": 1,
          "presentation_rect": [
            1072,
            546,
            44,
            44
          ]
        }
      },
      {
        "box": {
          "id": "volsig",
          "maxclass": "newobj",
          "patching_rect": [
            815.0,
            800.0,
            45.0,
            22.0
          ],
          "text": "sig~"
        }
      },
      {
        "box": {
          "id": "randmode_lbl",
          "maxclass": "comment",
          "patching_rect": [
            44.0,
            614.0,
            145.0,
            14.0
          ],
          "text": "RANDOM MODE",
          "textcolor": [
            0.88,
            0.54,
            0.16,
            1.0
          ],
          "fontsize": 7.5,
          "presentation": 1,
          "presentation_rect": [
            44,
            614,
            145,
            14
          ]
        }
      },
      {
        "box": {
          "id": "randmode",
          "maxclass": "umenu",
          "patching_rect": [
            44.0,
            632.0,
            145.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            44,
            632,
            145,
            22
          ]
        }
      },
      {
        "box": {
          "id": "engine_lbl",
          "maxclass": "comment",
          "patching_rect": [
            201.0,
            614.0,
            145.0,
            14.0
          ],
          "text": "ENGINE",
          "textcolor": [
            0.88,
            0.54,
            0.16,
            1.0
          ],
          "fontsize": 7.5,
          "presentation": 1,
          "presentation_rect": [
            201,
            614,
            145,
            14
          ]
        }
      },
      {
        "box": {
          "id": "engine",
          "maxclass": "umenu",
          "patching_rect": [
            201.0,
            632.0,
            145.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            201,
            632,
            145,
            22
          ]
        }
      },
      {
        "box": {
          "id": "quality_lbl",
          "maxclass": "comment",
          "patching_rect": [
            358.0,
            614.0,
            145.0,
            14.0
          ],
          "text": "QUALITY",
          "textcolor": [
            0.88,
            0.54,
            0.16,
            1.0
          ],
          "fontsize": 7.5,
          "presentation": 1,
          "presentation_rect": [
            358,
            614,
            145,
            14
          ]
        }
      },
      {
        "box": {
          "id": "quality",
          "maxclass": "umenu",
          "patching_rect": [
            358.0,
            632.0,
            145.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            358,
            632,
            145,
            22
          ]
        }
      },
      {
        "box": {
          "id": "detect_lbl",
          "maxclass": "comment",
          "patching_rect": [
            515.0,
            614.0,
            145.0,
            14.0
          ],
          "text": "DETECT",
          "textcolor": [
            0.88,
            0.54,
            0.16,
            1.0
          ],
          "fontsize": 7.5,
          "presentation": 1,
          "presentation_rect": [
            515,
            614,
            145,
            14
          ]
        }
      },
      {
        "box": {
          "id": "detect",
          "maxclass": "umenu",
          "patching_rect": [
            515.0,
            632.0,
            145.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            515,
            632,
            145,
            22
          ]
        }
      },
      {
        "box": {
          "id": "quant_lbl",
          "maxclass": "comment",
          "patching_rect": [
            672.0,
            614.0,
            165.0,
            14.0
          ],
          "text": "TEMPO QUANTIZE",
          "textcolor": [
            0.88,
            0.54,
            0.16,
            1.0
          ],
          "fontsize": 7.5,
          "presentation": 1,
          "presentation_rect": [
            672,
            614,
            165,
            14
          ]
        }
      },
      {
        "box": {
          "id": "quant",
          "maxclass": "umenu",
          "patching_rect": [
            672.0,
            632.0,
            165.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            672,
            632,
            165,
            22
          ]
        }
      },
      {
        "box": {
          "id": "syncmode_lbl",
          "maxclass": "comment",
          "patching_rect": [
            849.0,
            614.0,
            145.0,
            14.0
          ],
          "text": "SYNC MODE",
          "textcolor": [
            0.88,
            0.54,
            0.16,
            1.0
          ],
          "fontsize": 7.5,
          "presentation": 1,
          "presentation_rect": [
            849,
            614,
            145,
            14
          ]
        }
      },
      {
        "box": {
          "id": "syncmode",
          "maxclass": "umenu",
          "patching_rect": [
            849.0,
            632.0,
            145.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            849,
            632,
            145,
            22
          ]
        }
      },
      {
        "box": {
          "id": "choke_lbl",
          "maxclass": "comment",
          "patching_rect": [
            1006.0,
            614.0,
            145.0,
            14.0
          ],
          "text": "CHOKE GROUP",
          "textcolor": [
            0.88,
            0.54,
            0.16,
            1.0
          ],
          "fontsize": 7.5,
          "presentation": 1,
          "presentation_rect": [
            1006,
            614,
            145,
            14
          ]
        }
      },
      {
        "box": {
          "id": "choke",
          "maxclass": "umenu",
          "patching_rect": [
            1006.0,
            632.0,
            145.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            1006,
            632,
            145,
            22
          ]
        }
      },
      {
        "box": {
          "id": "fx_panel",
          "maxclass": "panel",
          "patching_rect": [
            34.0,
            672.0,
            1166.0,
            82.0
          ],
          "bgcolor": [
            0.095,
            0.1,
            0.1,
            1.0
          ],
          "presentation": 1,
          "presentation_rect": [
            34,
            672,
            1166,
            82
          ]
        }
      },
      {
        "box": {
          "id": "fx_title",
          "maxclass": "comment",
          "patching_rect": [
            44.0,
            678.0,
            100.0,
            16.0
          ],
          "text": "POD FX",
          "textcolor": [
            0.88,
            0.54,
            0.16,
            1.0
          ],
          "fontsize": 9.0,
          "presentation": 1,
          "presentation_rect": [
            44,
            678,
            100,
            16
          ]
        }
      },
      {
        "box": {
          "id": "filtermode_lbl",
          "maxclass": "comment",
          "patching_rect": [
            44.0,
            700.0,
            105.0,
            14.0
          ],
          "text": "FILTER",
          "textcolor": [
            0.5,
            0.52,
            0.5,
            1.0
          ],
          "fontsize": 6.8,
          "presentation": 1,
          "presentation_rect": [
            44,
            700,
            105,
            14
          ]
        }
      },
      {
        "box": {
          "id": "filtermode",
          "maxclass": "umenu",
          "patching_rect": [
            44.0,
            716.0,
            97.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            44,
            716,
            97,
            22
          ]
        }
      },
      {
        "box": {
          "id": "cutoff_lbl",
          "maxclass": "comment",
          "patching_rect": [
            161.0,
            700.0,
            105.0,
            14.0
          ],
          "text": "CUTOFF",
          "textcolor": [
            0.5,
            0.52,
            0.5,
            1.0
          ],
          "fontsize": 6.8,
          "presentation": 1,
          "presentation_rect": [
            161,
            700,
            105,
            14
          ]
        }
      },
      {
        "box": {
          "id": "cutoff",
          "maxclass": "dial",
          "patching_rect": [
            179.0,
            713.0,
            38.0,
            38.0
          ],
          "presentation": 1,
          "presentation_rect": [
            179,
            713,
            38,
            38
          ]
        }
      },
      {
        "box": {
          "id": "res_lbl",
          "maxclass": "comment",
          "patching_rect": [
            278.0,
            700.0,
            105.0,
            14.0
          ],
          "text": "RES",
          "textcolor": [
            0.5,
            0.52,
            0.5,
            1.0
          ],
          "fontsize": 6.8,
          "presentation": 1,
          "presentation_rect": [
            278,
            700,
            105,
            14
          ]
        }
      },
      {
        "box": {
          "id": "res",
          "maxclass": "dial",
          "patching_rect": [
            296.0,
            713.0,
            38.0,
            38.0
          ],
          "presentation": 1,
          "presentation_rect": [
            296,
            713,
            38,
            38
          ]
        }
      },
      {
        "box": {
          "id": "sat_lbl",
          "maxclass": "comment",
          "patching_rect": [
            395.0,
            700.0,
            105.0,
            14.0
          ],
          "text": "TAPE/SAT",
          "textcolor": [
            0.5,
            0.52,
            0.5,
            1.0
          ],
          "fontsize": 6.8,
          "presentation": 1,
          "presentation_rect": [
            395,
            700,
            105,
            14
          ]
        }
      },
      {
        "box": {
          "id": "sat",
          "maxclass": "dial",
          "patching_rect": [
            413.0,
            713.0,
            38.0,
            38.0
          ],
          "presentation": 1,
          "presentation_rect": [
            413,
            713,
            38,
            38
          ]
        }
      },
      {
        "box": {
          "id": "comp_lbl",
          "maxclass": "comment",
          "patching_rect": [
            512.0,
            700.0,
            105.0,
            14.0
          ],
          "text": "COMP",
          "textcolor": [
            0.5,
            0.52,
            0.5,
            1.0
          ],
          "fontsize": 6.8,
          "presentation": 1,
          "presentation_rect": [
            512,
            700,
            105,
            14
          ]
        }
      },
      {
        "box": {
          "id": "comp",
          "maxclass": "dial",
          "patching_rect": [
            530.0,
            713.0,
            38.0,
            38.0
          ],
          "presentation": 1,
          "presentation_rect": [
            530,
            713,
            38,
            38
          ]
        }
      },
      {
        "box": {
          "id": "eql_lbl",
          "maxclass": "comment",
          "patching_rect": [
            629.0,
            700.0,
            105.0,
            14.0
          ],
          "text": "EQ LOW",
          "textcolor": [
            0.5,
            0.52,
            0.5,
            1.0
          ],
          "fontsize": 6.8,
          "presentation": 1,
          "presentation_rect": [
            629,
            700,
            105,
            14
          ]
        }
      },
      {
        "box": {
          "id": "eql",
          "maxclass": "dial",
          "patching_rect": [
            647.0,
            713.0,
            38.0,
            38.0
          ],
          "presentation": 1,
          "presentation_rect": [
            647,
            713,
            38,
            38
          ]
        }
      },
      {
        "box": {
          "id": "eqm_lbl",
          "maxclass": "comment",
          "patching_rect": [
            746.0,
            700.0,
            105.0,
            14.0
          ],
          "text": "EQ MID",
          "textcolor": [
            0.5,
            0.52,
            0.5,
            1.0
          ],
          "fontsize": 6.8,
          "presentation": 1,
          "presentation_rect": [
            746,
            700,
            105,
            14
          ]
        }
      },
      {
        "box": {
          "id": "eqm",
          "maxclass": "dial",
          "patching_rect": [
            764.0,
            713.0,
            38.0,
            38.0
          ],
          "presentation": 1,
          "presentation_rect": [
            764,
            713,
            38,
            38
          ]
        }
      },
      {
        "box": {
          "id": "eqh_lbl",
          "maxclass": "comment",
          "patching_rect": [
            863.0,
            700.0,
            105.0,
            14.0
          ],
          "text": "EQ HIGH",
          "textcolor": [
            0.5,
            0.52,
            0.5,
            1.0
          ],
          "fontsize": 6.8,
          "presentation": 1,
          "presentation_rect": [
            863,
            700,
            105,
            14
          ]
        }
      },
      {
        "box": {
          "id": "eqh",
          "maxclass": "dial",
          "patching_rect": [
            881.0,
            713.0,
            38.0,
            38.0
          ],
          "presentation": 1,
          "presentation_rect": [
            881,
            713,
            38,
            38
          ]
        }
      },
      {
        "box": {
          "id": "diag_note",
          "maxclass": "comment",
          "text": "fl\u00f6de~ BUILD 02 FIXED \u2014 test in patching mode first. Then press Cmd/Ctrl+Shift+E for Presentation Mode.",
          "patching_rect": [
            34.0,
            755.0,
            700.0,
            20.0
          ],
          "textcolor": [
            0.9,
            0.55,
            0.18,
            1.0
          ]
        }
      }
    ],
    "lines": [
      {
        "patchline": {
          "source": [
            "drop",
            0
          ],
          "destination": [
            "prepend",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "prepend",
            0
          ],
          "destination": [
            "buffer",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "speed_sig",
            0
          ],
          "destination": [
            "groove",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "groove",
            0
          ],
          "destination": [
            "ampL",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "groove",
            1
          ],
          "destination": [
            "ampR",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "ampL",
            0
          ],
          "destination": [
            "ez",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "ampR",
            0
          ],
          "destination": [
            "ez",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "speed",
            0
          ],
          "destination": [
            "speed_sig",
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
            "volsig",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "volsig",
            0
          ],
          "destination": [
            "ampL",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "volsig",
            0
          ],
          "destination": [
            "ampR",
            1
          ]
        }
      }
    ],
    "bgcolor": [
      0.1,
      0.105,
      0.105,
      1.0
    ]
  }
}