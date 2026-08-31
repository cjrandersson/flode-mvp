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
      1030.0,
      880.0
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
            760.0,
            20.0
          ],
          "text": "fl\u00f6de~ POD A \u2014 BUILD 03B.1 / SINGLE DAC TEST"
        }
      },
      {
        "box": {
          "id": "note",
          "maxclass": "comment",
          "patching_rect": [
            30.0,
            43.0,
            900.0,
            20.0
          ],
          "text": "Built from the verified 02B signal path. New controls are kept OUT of the audio path unless safely initialized."
        }
      },
      {
        "box": {
          "id": "drop",
          "maxclass": "dropfile",
          "patching_rect": [
            30.0,
            80.0,
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
            85.0,
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
            85.0,
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
            130.0,
            920.0,
            235.0
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
            410.0,
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
            410.0,
            70.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "speedlbl",
          "maxclass": "comment",
          "patching_rect": [
            210.0,
            390.0,
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
            410.0,
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
            410.0,
            70.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "vollbl",
          "maxclass": "comment",
          "patching_rect": [
            370.0,
            390.0,
            80.0,
            18.0
          ],
          "text": "VOLUME"
        }
      },
      {
        "box": {
          "id": "vc",
          "maxclass": "newobj",
          "patching_rect": [
            455.0,
            410.0,
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
            410.0,
            45.0,
            22.0
          ],
          "text": "sig~"
        }
      },
      {
        "box": {
          "id": "mulL",
          "maxclass": "newobj",
          "patching_rect": [
            615.0,
            400.0,
            35.0,
            22.0
          ],
          "text": "*~"
        }
      },
      {
        "box": {
          "id": "mulR",
          "maxclass": "newobj",
          "patching_rect": [
            615.0,
            440.0,
            35.0,
            22.0
          ],
          "text": "*~"
        }
      },
      {
        "box": {
          "id": "loop",
          "maxclass": "toggle",
          "patching_rect": [
            30.0,
            490.0,
            22.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "looplbl",
          "maxclass": "comment",
          "patching_rect": [
            58.0,
            492.0,
            50.0,
            18.0
          ],
          "text": "LOOP"
        }
      },
      {
        "box": {
          "id": "loopmsg",
          "maxclass": "message",
          "patching_rect": [
            115.0,
            490.0,
            60.0,
            22.0
          ],
          "text": "loop $1"
        }
      },
      {
        "box": {
          "id": "pan",
          "maxclass": "flonum",
          "patching_rect": [
            210.0,
            490.0,
            70.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "panlbl",
          "maxclass": "comment",
          "patching_rect": [
            210.0,
            470.0,
            90.0,
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
            295.0,
            490.0,
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
            390.0,
            480.0,
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
            390.0,
            510.0,
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
            555.0,
            480.0,
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
            555.0,
            510.0,
            45.0,
            22.0
          ],
          "text": "sig~"
        }
      },
      {
        "box": {
          "id": "panMulL",
          "maxclass": "newobj",
          "patching_rect": [
            615.0,
            480.0,
            35.0,
            22.0
          ],
          "text": "*~"
        }
      },
      {
        "box": {
          "id": "panMulR",
          "maxclass": "newobj",
          "patching_rect": [
            615.0,
            520.0,
            35.0,
            22.0
          ],
          "text": "*~"
        }
      },
      {
        "box": {
          "id": "stage",
          "maxclass": "comment",
          "patching_rect": [
            30.0,
            575.0,
            900.0,
            20.0
          ],
          "text": "STAGED CONTROLS \u2014 visible for UX testing, intentionally NOT connected to groove~/audio yet"
        }
      },
      {
        "box": {
          "id": "startlbl",
          "maxclass": "comment",
          "patching_rect": [
            30.0,
            605.0,
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
            625.0,
            90.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "endlbl",
          "maxclass": "comment",
          "patching_rect": [
            150.0,
            605.0,
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
            625.0,
            90.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "fadeinlbl",
          "maxclass": "comment",
          "patching_rect": [
            270.0,
            605.0,
            100.0,
            18.0
          ],
          "text": "FADE IN ms"
        }
      },
      {
        "box": {
          "id": "fadein",
          "maxclass": "flonum",
          "patching_rect": [
            270.0,
            625.0,
            90.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "fadeoutlbl",
          "maxclass": "comment",
          "patching_rect": [
            390.0,
            605.0,
            100.0,
            18.0
          ],
          "text": "FADE OUT ms"
        }
      },
      {
        "box": {
          "id": "fadeout",
          "maxclass": "flonum",
          "patching_rect": [
            390.0,
            625.0,
            90.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "mute",
          "maxclass": "toggle",
          "patching_rect": [
            540.0,
            625.0,
            22.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "mutelbl",
          "maxclass": "comment",
          "patching_rect": [
            567.0,
            627.0,
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
            635.0,
            625.0,
            22.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "sololbl",
          "maxclass": "comment",
          "patching_rect": [
            662.0,
            627.0,
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
            730.0,
            625.0,
            22.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "reclbl",
          "maxclass": "comment",
          "patching_rect": [
            757.0,
            627.0,
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
            825.0,
            625.0,
            22.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "paniclbl",
          "maxclass": "comment",
          "patching_rect": [
            852.0,
            627.0,
            55.0,
            18.0
          ],
          "text": "PANIC"
        }
      },
      {
        "box": {
          "id": "jungtitle",
          "maxclass": "comment",
          "patching_rect": [
            30.0,
            690.0,
            900.0,
            20.0
          ],
          "text": "JUNGULATOR / RANDOM \u2014 placeholders only until sampler core passes this build"
        }
      },
      {
        "box": {
          "id": "primelbl",
          "maxclass": "comment",
          "patching_rect": [
            30.0,
            720.0,
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
            742.0,
            75.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "seqlbl",
          "maxclass": "comment",
          "patching_rect": [
            125.0,
            720.0,
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
            125.0,
            742.0,
            75.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "seqspeedlbl",
          "maxclass": "comment",
          "patching_rect": [
            220.0,
            720.0,
            90.0,
            18.0
          ],
          "text": "SEQ SPEED"
        }
      },
      {
        "box": {
          "id": "seqspeed",
          "maxclass": "flonum",
          "patching_rect": [
            220.0,
            742.0,
            75.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "cutterlbl",
          "maxclass": "comment",
          "patching_rect": [
            315.0,
            720.0,
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
            315.0,
            742.0,
            75.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "patternlbl",
          "maxclass": "comment",
          "patching_rect": [
            410.0,
            720.0,
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
            410.0,
            742.0,
            75.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "rndlbl",
          "maxclass": "comment",
          "patching_rect": [
            505.0,
            720.0,
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
            505.0,
            742.0,
            75.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "rnd2lbl",
          "maxclass": "comment",
          "patching_rect": [
            600.0,
            720.0,
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
            600.0,
            742.0,
            75.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "jitterlbl",
          "maxclass": "comment",
          "patching_rect": [
            695.0,
            720.0,
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
            695.0,
            742.0,
            75.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "pitchlbl",
          "maxclass": "comment",
          "patching_rect": [
            790.0,
            720.0,
            90.0,
            18.0
          ],
          "text": "PITCH"
        }
      },
      {
        "box": {
          "id": "pitch",
          "maxclass": "flonum",
          "patching_rect": [
            790.0,
            742.0,
            75.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "translbl",
          "maxclass": "comment",
          "patching_rect": [
            885.0,
            720.0,
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
            885.0,
            742.0,
            75.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "lb",
          "maxclass": "newobj",
          "patching_rect": [
            30.0,
            805.0,
            60.0,
            22.0
          ],
          "text": "loadbang"
        }
      },
      {
        "box": {
          "id": "defaults",
          "maxclass": "message",
          "patching_rect": [
            105.0,
            805.0,
            160.0,
            22.0
          ],
          "text": "1. 0.7 0. 1"
        }
      },
      {
        "box": {
          "id": "unpack",
          "maxclass": "newobj",
          "patching_rect": [
            280.0,
            805.0,
            145.0,
            22.0
          ],
          "text": "unpack f f f i"
        }
      },
      {
        "box": {
          "id": "defaultnote",
          "maxclass": "comment",
          "patching_rect": [
            445.0,
            807.0,
            450.0,
            18.0
          ],
          "text": "defaults: speed 1.0 / volume 0.7 / pan center / loop on"
        }
      },
      {
        "box": {
          "id": "route_title",
          "maxclass": "comment",
          "patching_rect": [
            700.0,
            380.0,
            280.0,
            18.0
          ],
          "text": "OUTPUT TEST ROUTING"
        }
      },
      {
        "box": {
          "id": "testmode",
          "maxclass": "toggle",
          "patching_rect": [
            700.0,
            405.0,
            22.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "testmodelbl",
          "maxclass": "comment",
          "patching_rect": [
            728.0,
            407.0,
            225.0,
            18.0
          ],
          "text": "0 = DIRECT / 1 = PAN PATH"
        }
      },
      {
        "box": {
          "id": "selL",
          "maxclass": "newobj",
          "patching_rect": [
            700.0,
            445.0,
            85.0,
            22.0
          ],
          "text": "selector~ 2"
        }
      },
      {
        "box": {
          "id": "selR",
          "maxclass": "newobj",
          "patching_rect": [
            700.0,
            480.0,
            85.0,
            22.0
          ],
          "text": "selector~ 2"
        }
      },
      {
        "box": {
          "id": "modeplus",
          "maxclass": "newobj",
          "patching_rect": [
            805.0,
            405.0,
            45.0,
            22.0
          ],
          "text": "+ 1"
        }
      },
      {
        "box": {
          "id": "dac",
          "maxclass": "ezdac~",
          "patching_rect": [
            825.0,
            450.0,
            50.0,
            50.0
          ]
        }
      },
      {
        "box": {
          "id": "dacnote",
          "maxclass": "comment",
          "patching_rect": [
            885.0,
            457.0,
            90.0,
            36.0
          ],
          "text": "ONE shared\nDSP switch"
        }
      },
      {
        "box": {
          "id": "globaldspnote",
          "maxclass": "comment",
          "patching_rect": [
            30.0,
            540.0,
            900.0,
            38.0
          ],
          "text": "NOTE: ezdac~ controls Max's GLOBAL DSP state. Multiple ezdac~ objects turn on/off together. Build 03B.1 therefore uses ONE ezdac~ and switches the signal path before it."
        }
      },
      {
        "box": {
          "id": "testmode_default",
          "maxclass": "message",
          "patching_rect": [
            445.0,
            835.0,
            35.0,
            22.0
          ],
          "text": "0"
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
            "mulL",
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
            "mulR",
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
            "mulL",
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
            "mulR",
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
            "mulL",
            0
          ],
          "destination": [
            "panMulL",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "mulR",
            0
          ],
          "destination": [
            "panMulR",
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
            "panMulL",
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
            "panMulR",
            1
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
            "loopmsg",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "loopmsg",
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
            "lb",
            0
          ],
          "destination": [
            "defaults",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "defaults",
            0
          ],
          "destination": [
            "unpack",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "unpack",
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
            "unpack",
            1
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
            "unpack",
            2
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
            "unpack",
            3
          ],
          "destination": [
            "loop",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "testmode",
            0
          ],
          "destination": [
            "modeplus",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "modeplus",
            0
          ],
          "destination": [
            "selL",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "modeplus",
            0
          ],
          "destination": [
            "selR",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "mulL",
            0
          ],
          "destination": [
            "selL",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "mulR",
            0
          ],
          "destination": [
            "selR",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "panMulL",
            0
          ],
          "destination": [
            "selL",
            2
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "panMulR",
            0
          ],
          "destination": [
            "selR",
            2
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "selL",
            0
          ],
          "destination": [
            "dac",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "selR",
            0
          ],
          "destination": [
            "dac",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "lb",
            0
          ],
          "destination": [
            "testmode_default",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "testmode_default",
            0
          ],
          "destination": [
            "testmode",
            0
          ]
        }
      }
    ]
  }
}