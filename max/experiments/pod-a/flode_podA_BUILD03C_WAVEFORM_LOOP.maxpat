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
      70.0,
      70.0,
      1030.0,
      900.0
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
            18.0,
            850.0,
            20.0
          ],
          "text": "fl\u00f6de~ POD A \u2014 BUILD 03C / WAVEFORM LOOP"
        }
      },
      {
        "box": {
          "id": "subtitle",
          "maxclass": "comment",
          "patching_rect": [
            30.0,
            42.0,
            920.0,
            20.0
          ],
          "text": "Verified 02B core + verified single-DAC architecture. waveform~ selection now controls groove~ loop start/end."
        }
      },
      {
        "box": {
          "id": "drop",
          "maxclass": "dropfile",
          "patching_rect": [
            30.0,
            78.0,
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
            83.0,
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
            83.0,
            135.0,
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
            125.0,
            940.0,
            250.0
          ],
          "buffername": "flodeA",
          "setmode": 1,
          "outmode": 4,
          "snapto": 2,
          "labels": 1
        }
      },
      {
        "box": {
          "id": "startlbl",
          "maxclass": "comment",
          "patching_rect": [
            30.0,
            392.0,
            90.0,
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
            412.0,
            100.0,
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
            392.0,
            90.0,
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
            412.0,
            100.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "lenlbl",
          "maxclass": "comment",
          "patching_rect": [
            270.0,
            392.0,
            100.0,
            18.0
          ],
          "text": "LOOP LENGTH"
        }
      },
      {
        "box": {
          "id": "sub",
          "maxclass": "newobj",
          "patching_rect": [
            270.0,
            412.0,
            45.0,
            22.0
          ],
          "text": "- 0."
        }
      },
      {
        "box": {
          "id": "length",
          "maxclass": "flonum",
          "patching_rect": [
            330.0,
            412.0,
            100.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "groove",
          "maxclass": "newobj",
          "patching_rect": [
            30.0,
            475.0,
            175.0,
            22.0
          ],
          "text": "groove~ flodeA 2 @loop 1"
        }
      },
      {
        "box": {
          "id": "speedlbl",
          "maxclass": "comment",
          "patching_rect": [
            225.0,
            455.0,
            70.0,
            18.0
          ],
          "text": "SPEED"
        }
      },
      {
        "box": {
          "id": "speed",
          "maxclass": "flonum",
          "patching_rect": [
            225.0,
            475.0,
            70.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "ss",
          "maxclass": "newobj",
          "patching_rect": [
            310.0,
            475.0,
            45.0,
            22.0
          ],
          "text": "sig~"
        }
      },
      {
        "box": {
          "id": "loop",
          "maxclass": "toggle",
          "patching_rect": [
            380.0,
            475.0,
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
            408.0,
            477.0,
            45.0,
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
            465.0,
            475.0,
            60.0,
            22.0
          ],
          "text": "loop $1"
        }
      },
      {
        "box": {
          "id": "startloop",
          "maxclass": "button",
          "patching_rect": [
            545.0,
            475.0,
            22.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "startlooplbl",
          "maxclass": "comment",
          "patching_rect": [
            572.0,
            477.0,
            80.0,
            18.0
          ],
          "text": "START LOOP"
        }
      },
      {
        "box": {
          "id": "startloopmsg",
          "maxclass": "message",
          "patching_rect": [
            660.0,
            475.0,
            65.0,
            22.0
          ],
          "text": "startloop"
        }
      },
      {
        "box": {
          "id": "vollbl",
          "maxclass": "comment",
          "patching_rect": [
            30.0,
            535.0,
            80.0,
            18.0
          ],
          "text": "VOLUME"
        }
      },
      {
        "box": {
          "id": "vol",
          "maxclass": "flonum",
          "patching_rect": [
            30.0,
            555.0,
            70.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "vc",
          "maxclass": "newobj",
          "patching_rect": [
            115.0,
            555.0,
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
            210.0,
            555.0,
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
            275.0,
            545.0,
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
            275.0,
            585.0,
            35.0,
            22.0
          ],
          "text": "*~"
        }
      },
      {
        "box": {
          "id": "panlbl",
          "maxclass": "comment",
          "patching_rect": [
            340.0,
            535.0,
            80.0,
            18.0
          ],
          "text": "PAN -1..1"
        }
      },
      {
        "box": {
          "id": "pan",
          "maxclass": "flonum",
          "patching_rect": [
            340.0,
            555.0,
            70.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "pc",
          "maxclass": "newobj",
          "patching_rect": [
            425.0,
            555.0,
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
            520.0,
            545.0,
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
            520.0,
            575.0,
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
            685.0,
            545.0,
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
            685.0,
            575.0,
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
            750.0,
            545.0,
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
            750.0,
            585.0,
            35.0,
            22.0
          ],
          "text": "*~"
        }
      },
      {
        "box": {
          "id": "dac",
          "maxclass": "ezdac~",
          "patching_rect": [
            825.0,
            545.0,
            50.0,
            50.0
          ]
        }
      },
      {
        "box": {
          "id": "info",
          "maxclass": "newobj",
          "patching_rect": [
            30.0,
            635.0,
            90.0,
            22.0
          ],
          "text": "info~ flodeA"
        }
      },
      {
        "box": {
          "id": "banginfo",
          "maxclass": "button",
          "patching_rect": [
            135.0,
            635.0,
            22.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "infolbl",
          "maxclass": "comment",
          "patching_rect": [
            165.0,
            637.0,
            250.0,
            18.0
          ],
          "text": "query buffer info after loading"
        }
      },
      {
        "box": {
          "id": "fullsel",
          "maxclass": "button",
          "patching_rect": [
            430.0,
            635.0,
            22.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "fullsellbl",
          "maxclass": "comment",
          "patching_rect": [
            458.0,
            637.0,
            150.0,
            18.0
          ],
          "text": "FULL BUFFER LOOP"
        }
      },
      {
        "box": {
          "id": "safety",
          "maxclass": "comment",
          "patching_rect": [
            30.0,
            680.0,
            930.0,
            42.0
          ],
          "text": "03C safety rule: START/END come ONLY from waveform~ selection outlets. No guessed 'start $1/end $1' messages. Selection values feed groove~ middle/right inlets directly, which Cycling '74 documents as loop start/end in ms."
        }
      },
      {
        "box": {
          "id": "interact",
          "maxclass": "comment",
          "patching_rect": [
            30.0,
            735.0,
            930.0,
            55.0
          ],
          "text": "INTERACTION: drag across waveform = select loop. Selection snaps to zero crossings to reduce clicks. START/END update continuously. START LOOP jumps playback to selected loop start. Numeric START/END displays are readouts in this build; direct editing comes after this passes."
        }
      },
      {
        "box": {
          "id": "lb",
          "maxclass": "newobj",
          "patching_rect": [
            30.0,
            815.0,
            60.0,
            22.0
          ],
          "text": "loadbang"
        }
      },
      {
        "box": {
          "id": "defs",
          "maxclass": "message",
          "patching_rect": [
            105.0,
            815.0,
            130.0,
            22.0
          ],
          "text": "1. 0.7 0. 1"
        }
      },
      {
        "box": {
          "id": "unp",
          "maxclass": "newobj",
          "patching_rect": [
            250.0,
            815.0,
            145.0,
            22.0
          ],
          "text": "unpack f f f i"
        }
      },
      {
        "box": {
          "id": "deflbl",
          "maxclass": "comment",
          "patching_rect": [
            415.0,
            817.0,
            400.0,
            18.0
          ],
          "text": "defaults: speed 1 / volume .7 / pan 0 / loop on"
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
            "wave",
            2
          ],
          "destination": [
            "start",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "wave",
            3
          ],
          "destination": [
            "end",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "wave",
            2
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
            "wave",
            3
          ],
          "destination": [
            "groove",
            2
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "wave",
            2
          ],
          "destination": [
            "sub",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "wave",
            3
          ],
          "destination": [
            "sub",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "sub",
            0
          ],
          "destination": [
            "length",
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
            "startloop",
            0
          ],
          "destination": [
            "startloopmsg",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "startloopmsg",
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
            "dac",
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
            "defs",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "defs",
            0
          ],
          "destination": [
            "unp",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "unp",
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
            "unp",
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
            "unp",
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
            "unp",
            3
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