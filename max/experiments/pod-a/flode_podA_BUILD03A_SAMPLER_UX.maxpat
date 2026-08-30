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
      80.0,
      80.0,
      1020.0,
      860.0
    ],
    "openinpresentation": 0,
    "default_fontname": "Arial",
    "default_fontsize": 11.0,
    "gridonopen": 1,
    "gridsize": [
      15.0,
      15.0
    ],
    "boxes": [
      {
        "box": {
          "id": "title",
          "maxclass": "comment",
          "patching_rect": [
            30.0,
            20.0,
            700.0,
            20.0
          ],
          "text": "fl\u00f6de~ POD A \u2014 BUILD 03A / SAMPLER UX"
        }
      },
      {
        "box": {
          "id": "drop",
          "maxclass": "dropfile",
          "patching_rect": [
            30.0,
            60.0,
            220.0,
            30.0
          ]
        }
      },
      {
        "box": {
          "id": "prep",
          "maxclass": "newobj",
          "patching_rect": [
            270.0,
            65.0,
            100.0,
            22.0
          ],
          "text": "prepend replace"
        }
      },
      {
        "box": {
          "id": "buf",
          "maxclass": "newobj",
          "patching_rect": [
            390.0,
            65.0,
            130.0,
            22.0
          ],
          "text": "buffer~ flodeA"
        }
      },
      {
        "box": {
          "id": "wave",
          "maxclass": "waveform~",
          "patching_rect": [
            30.0,
            110.0,
            920.0,
            240.0
          ],
          "buffername": "flodeA"
        }
      },
      {
        "box": {
          "id": "groove",
          "maxclass": "newobj",
          "patching_rect": [
            30.0,
            390.0,
            155.0,
            22.0
          ],
          "text": "groove~ flodeA 2 @loop 1"
        }
      },
      {
        "box": {
          "id": "speed",
          "maxclass": "flonum",
          "patching_rect": [
            210.0,
            390.0,
            70.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "sl",
          "maxclass": "comment",
          "patching_rect": [
            210.0,
            370.0,
            70.0,
            18.0
          ],
          "text": "SPEED"
        }
      },
      {
        "box": {
          "id": "ss",
          "maxclass": "newobj",
          "patching_rect": [
            295.0,
            390.0,
            45.0,
            22.0
          ],
          "text": "sig~"
        }
      },
      {
        "box": {
          "id": "vol",
          "maxclass": "flonum",
          "patching_rect": [
            370.0,
            390.0,
            70.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "vl",
          "maxclass": "comment",
          "patching_rect": [
            370.0,
            370.0,
            80.0,
            18.0
          ],
          "text": "VOL 0..1"
        }
      },
      {
        "box": {
          "id": "vc",
          "maxclass": "newobj",
          "patching_rect": [
            455.0,
            390.0,
            80.0,
            22.0
          ],
          "text": "clip 0. 1."
        }
      },
      {
        "box": {
          "id": "vs",
          "maxclass": "newobj",
          "patching_rect": [
            550.0,
            390.0,
            45.0,
            22.0
          ],
          "text": "sig~"
        }
      },
      {
        "box": {
          "id": "vL",
          "maxclass": "newobj",
          "patching_rect": [
            610.0,
            380.0,
            35.0,
            22.0
          ],
          "text": "*~"
        }
      },
      {
        "box": {
          "id": "vR",
          "maxclass": "newobj",
          "patching_rect": [
            610.0,
            420.0,
            35.0,
            22.0
          ],
          "text": "*~"
        }
      },
      {
        "box": {
          "id": "pan",
          "maxclass": "flonum",
          "patching_rect": [
            30.0,
            465.0,
            70.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "pl",
          "maxclass": "comment",
          "patching_rect": [
            30.0,
            445.0,
            80.0,
            18.0
          ],
          "text": "PAN -1..1"
        }
      },
      {
        "box": {
          "id": "pc",
          "maxclass": "newobj",
          "patching_rect": [
            115.0,
            465.0,
            80.0,
            22.0
          ],
          "text": "clip -1. 1."
        }
      },
      {
        "box": {
          "id": "pLe",
          "maxclass": "newobj",
          "patching_rect": [
            210.0,
            455.0,
            150.0,
            22.0
          ],
          "text": "expr sqrt((1.-$f1)*0.5)"
        }
      },
      {
        "box": {
          "id": "pRe",
          "maxclass": "newobj",
          "patching_rect": [
            210.0,
            485.0,
            150.0,
            22.0
          ],
          "text": "expr sqrt((1.+$f1)*0.5)"
        }
      },
      {
        "box": {
          "id": "pLs",
          "maxclass": "newobj",
          "patching_rect": [
            375.0,
            455.0,
            45.0,
            22.0
          ],
          "text": "sig~"
        }
      },
      {
        "box": {
          "id": "pRs",
          "maxclass": "newobj",
          "patching_rect": [
            375.0,
            485.0,
            45.0,
            22.0
          ],
          "text": "sig~"
        }
      },
      {
        "box": {
          "id": "pLm",
          "maxclass": "newobj",
          "patching_rect": [
            440.0,
            455.0,
            35.0,
            22.0
          ],
          "text": "*~"
        }
      },
      {
        "box": {
          "id": "pRm",
          "maxclass": "newobj",
          "patching_rect": [
            440.0,
            485.0,
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
            510.0,
            450.0,
            50.0,
            50.0
          ]
        }
      },
      {
        "box": {
          "id": "startl",
          "maxclass": "comment",
          "patching_rect": [
            30.0,
            535.0,
            100.0,
            18.0
          ],
          "text": "START ms"
        }
      },
      {
        "box": {
          "id": "start",
          "maxclass": "flonum",
          "patching_rect": [
            30.0,
            555.0,
            90.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "endl",
          "maxclass": "comment",
          "patching_rect": [
            150.0,
            535.0,
            100.0,
            18.0
          ],
          "text": "END ms"
        }
      },
      {
        "box": {
          "id": "end",
          "maxclass": "flonum",
          "patching_rect": [
            150.0,
            555.0,
            90.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "fil",
          "maxclass": "comment",
          "patching_rect": [
            270.0,
            535.0,
            100.0,
            18.0
          ],
          "text": "FADE IN ms"
        }
      },
      {
        "box": {
          "id": "fi",
          "maxclass": "flonum",
          "patching_rect": [
            270.0,
            555.0,
            90.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "fol",
          "maxclass": "comment",
          "patching_rect": [
            390.0,
            535.0,
            100.0,
            18.0
          ],
          "text": "FADE OUT ms"
        }
      },
      {
        "box": {
          "id": "fo",
          "maxclass": "flonum",
          "patching_rect": [
            390.0,
            555.0,
            90.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "startm",
          "maxclass": "message",
          "patching_rect": [
            30.0,
            585.0,
            90.0,
            22.0
          ],
          "text": "start $1"
        }
      },
      {
        "box": {
          "id": "endm",
          "maxclass": "message",
          "patching_rect": [
            150.0,
            585.0,
            90.0,
            22.0
          ],
          "text": "end $1"
        }
      },
      {
        "box": {
          "id": "loop",
          "maxclass": "toggle",
          "patching_rect": [
            520.0,
            555.0,
            22.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "loopl",
          "maxclass": "comment",
          "patching_rect": [
            548.0,
            557.0,
            50.0,
            18.0
          ],
          "text": "LOOP"
        }
      },
      {
        "box": {
          "id": "loopm",
          "maxclass": "message",
          "patching_rect": [
            610.0,
            555.0,
            60.0,
            22.0
          ],
          "text": "loop $1"
        }
      },
      {
        "box": {
          "id": "perf",
          "maxclass": "comment",
          "patching_rect": [
            30.0,
            635.0,
            600.0,
            18.0
          ],
          "text": "PERFORMANCE \u2014 native controls first"
        }
      },
      {
        "box": {
          "id": "mute",
          "maxclass": "toggle",
          "patching_rect": [
            30.0,
            665.0,
            22.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "mutel",
          "maxclass": "comment",
          "patching_rect": [
            58.0,
            667.0,
            55.0,
            18.0
          ],
          "text": "MUTE"
        }
      },
      {
        "box": {
          "id": "solo",
          "maxclass": "toggle",
          "patching_rect": [
            135.0,
            665.0,
            22.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "solol",
          "maxclass": "comment",
          "patching_rect": [
            163.0,
            667.0,
            55.0,
            18.0
          ],
          "text": "SOLO"
        }
      },
      {
        "box": {
          "id": "rec",
          "maxclass": "toggle",
          "patching_rect": [
            240.0,
            665.0,
            22.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "recl",
          "maxclass": "comment",
          "patching_rect": [
            268.0,
            667.0,
            55.0,
            18.0
          ],
          "text": "REC"
        }
      },
      {
        "box": {
          "id": "panic",
          "maxclass": "toggle",
          "patching_rect": [
            345.0,
            665.0,
            22.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "panicl",
          "maxclass": "comment",
          "patching_rect": [
            373.0,
            667.0,
            55.0,
            18.0
          ],
          "text": "PANIC"
        }
      },
      {
        "box": {
          "id": "ptrig",
          "maxclass": "newobj",
          "patching_rect": [
            455.0,
            665.0,
            55.0,
            22.0
          ],
          "text": "sel 1"
        }
      },
      {
        "box": {
          "id": "pmsg",
          "maxclass": "message",
          "patching_rect": [
            525.0,
            665.0,
            190.0,
            22.0
          ],
          "text": "1., 0., 0., 0., 1"
        }
      },
      {
        "box": {
          "id": "pun",
          "maxclass": "newobj",
          "patching_rect": [
            730.0,
            665.0,
            170.0,
            22.0
          ],
          "text": "unpack f f f f i"
        }
      },
      {
        "box": {
          "id": "next",
          "maxclass": "comment",
          "patching_rect": [
            30.0,
            725.0,
            900.0,
            18.0
          ],
          "text": "NEXT LAYER (not DSP-connected yet): PRIME \u00b7 SEQ \u00b7 CUTTER \u00b7 PATTERN \u00b7 RND \u00b7 RND2 \u00b7 JITTER \u00b7 TRANSIENT %"
        }
      },
      {
        "box": {
          "id": "primel",
          "maxclass": "comment",
          "patching_rect": [
            30.0,
            755.0,
            90.0,
            18.0
          ],
          "text": "PRIME"
        }
      },
      {
        "box": {
          "id": "prime",
          "maxclass": "flonum",
          "patching_rect": [
            30.0,
            777.0,
            75.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "seql",
          "maxclass": "comment",
          "patching_rect": [
            140.0,
            755.0,
            90.0,
            18.0
          ],
          "text": "SEQ"
        }
      },
      {
        "box": {
          "id": "seq",
          "maxclass": "flonum",
          "patching_rect": [
            140.0,
            777.0,
            75.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "cutterl",
          "maxclass": "comment",
          "patching_rect": [
            250.0,
            755.0,
            90.0,
            18.0
          ],
          "text": "CUTTER"
        }
      },
      {
        "box": {
          "id": "cutter",
          "maxclass": "flonum",
          "patching_rect": [
            250.0,
            777.0,
            75.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "patternl",
          "maxclass": "comment",
          "patching_rect": [
            360.0,
            755.0,
            90.0,
            18.0
          ],
          "text": "PATTERN"
        }
      },
      {
        "box": {
          "id": "pattern",
          "maxclass": "flonum",
          "patching_rect": [
            360.0,
            777.0,
            75.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "rndl",
          "maxclass": "comment",
          "patching_rect": [
            470.0,
            755.0,
            90.0,
            18.0
          ],
          "text": "RND %"
        }
      },
      {
        "box": {
          "id": "rnd",
          "maxclass": "flonum",
          "patching_rect": [
            470.0,
            777.0,
            75.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "rnd2l",
          "maxclass": "comment",
          "patching_rect": [
            580.0,
            755.0,
            90.0,
            18.0
          ],
          "text": "RND2 %"
        }
      },
      {
        "box": {
          "id": "rnd2",
          "maxclass": "flonum",
          "patching_rect": [
            580.0,
            777.0,
            75.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "jitterl",
          "maxclass": "comment",
          "patching_rect": [
            690.0,
            755.0,
            90.0,
            18.0
          ],
          "text": "JITTER"
        }
      },
      {
        "box": {
          "id": "jitter",
          "maxclass": "flonum",
          "patching_rect": [
            690.0,
            777.0,
            75.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "transl",
          "maxclass": "comment",
          "patching_rect": [
            800.0,
            755.0,
            90.0,
            18.0
          ],
          "text": "TRANSIENT %"
        }
      },
      {
        "box": {
          "id": "trans",
          "maxclass": "flonum",
          "patching_rect": [
            800.0,
            777.0,
            75.0,
            22.0
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
            "prep",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "prep",
            0
          ],
          "destination": [
            "buf",
            0
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
            "ss",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "ss",
            0
          ],
          "destination": [
            "groove",
            0
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
            "vL",
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
            "vR",
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
            "vc",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "vc",
            0
          ],
          "destination": [
            "vs",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "vs",
            0
          ],
          "destination": [
            "vL",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "vs",
            0
          ],
          "destination": [
            "vR",
            1
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
            "pc",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "pc",
            0
          ],
          "destination": [
            "pLe",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "pc",
            0
          ],
          "destination": [
            "pRe",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "pLe",
            0
          ],
          "destination": [
            "pLs",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "pRe",
            0
          ],
          "destination": [
            "pRs",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "vL",
            0
          ],
          "destination": [
            "pLm",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "vR",
            0
          ],
          "destination": [
            "pRm",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "pLs",
            0
          ],
          "destination": [
            "pLm",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "pRs",
            0
          ],
          "destination": [
            "pRm",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "pLm",
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
            "pRm",
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
            "start",
            0
          ],
          "destination": [
            "startm",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "startm",
            0
          ],
          "destination": [
            "groove",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "end",
            0
          ],
          "destination": [
            "endm",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "endm",
            0
          ],
          "destination": [
            "groove",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "loop",
            0
          ],
          "destination": [
            "loopm",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "loopm",
            0
          ],
          "destination": [
            "groove",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "panic",
            0
          ],
          "destination": [
            "ptrig",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "ptrig",
            0
          ],
          "destination": [
            "pmsg",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "pmsg",
            0
          ],
          "destination": [
            "pun",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "pun",
            0
          ],
          "destination": [
            "speed",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "pun",
            1
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
            "pun",
            2
          ],
          "destination": [
            "fi",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "pun",
            3
          ],
          "destination": [
            "fo",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "pun",
            4
          ],
          "destination": [
            "loop",
            0
          ]
        }
      }
    ]
  }
}