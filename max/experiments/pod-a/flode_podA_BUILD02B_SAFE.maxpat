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
      1000.0,
      780.0
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
            500.0,
            20.0
          ],
          "text": "fl\u00f6de~ POD A \u2014 BUILD 02B SAFE / NATIVE"
        }
      },
      {
        "box": {
          "id": "note",
          "maxclass": "comment",
          "patching_rect": [
            30.0,
            45.0,
            700.0,
            20.0
          ],
          "text": "Functional checkpoint first: drop audio \u2192 buffer~ \u2192 waveform~ \u2192 groove~ \u2192 gain \u2192 ezdac~"
        }
      },
      {
        "box": {
          "id": "drop",
          "maxclass": "dropfile",
          "patching_rect": [
            30.0,
            85.0,
            220.0,
            30.0
          ]
        }
      },
      {
        "box": {
          "id": "dropnote",
          "maxclass": "comment",
          "patching_rect": [
            260.0,
            90.0,
            260.0,
            20.0
          ],
          "text": "Drop an audio file here"
        }
      },
      {
        "box": {
          "id": "prepend",
          "maxclass": "newobj",
          "patching_rect": [
            30.0,
            130.0,
            100.0,
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
            150.0,
            130.0,
            150.0,
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
            175.0,
            900.0,
            220.0
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
            440.0,
            150.0,
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
            205.0,
            440.0,
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
            205.0,
            420.0,
            70.0,
            18.0
          ],
          "text": "SPEED"
        }
      },
      {
        "box": {
          "id": "sigspd",
          "maxclass": "newobj",
          "patching_rect": [
            290.0,
            440.0,
            45.0,
            22.0
          ],
          "text": "sig~"
        }
      },
      {
        "box": {
          "id": "start",
          "maxclass": "flonum",
          "patching_rect": [
            360.0,
            440.0,
            90.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "startlbl",
          "maxclass": "comment",
          "patching_rect": [
            360.0,
            420.0,
            90.0,
            18.0
          ],
          "text": "START ms"
        }
      },
      {
        "box": {
          "id": "end",
          "maxclass": "flonum",
          "patching_rect": [
            470.0,
            440.0,
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
            470.0,
            420.0,
            90.0,
            18.0
          ],
          "text": "END ms"
        }
      },
      {
        "box": {
          "id": "loop",
          "maxclass": "toggle",
          "patching_rect": [
            585.0,
            440.0,
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
            612.0,
            442.0,
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
            665.0,
            440.0,
            55.0,
            22.0
          ],
          "text": "loop $1"
        }
      },
      {
        "box": {
          "id": "vol",
          "maxclass": "flonum",
          "patching_rect": [
            30.0,
            510.0,
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
            30.0,
            490.0,
            90.0,
            18.0
          ],
          "text": "VOLUME 0\u20131"
        }
      },
      {
        "box": {
          "id": "clipvol",
          "maxclass": "newobj",
          "patching_rect": [
            115.0,
            510.0,
            80.0,
            22.0
          ],
          "text": "clip 0. 1."
        }
      },
      {
        "box": {
          "id": "sigvol",
          "maxclass": "newobj",
          "patching_rect": [
            210.0,
            510.0,
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
            280.0,
            500.0,
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
            280.0,
            540.0,
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
            355.0,
            500.0,
            50.0,
            50.0
          ]
        }
      },
      {
        "box": {
          "id": "zero",
          "maxclass": "message",
          "patching_rect": [
            205.0,
            475.0,
            35.0,
            22.0
          ],
          "text": "0."
        }
      },
      {
        "box": {
          "id": "one",
          "maxclass": "message",
          "patching_rect": [
            245.0,
            475.0,
            35.0,
            22.0
          ],
          "text": "1."
        }
      },
      {
        "box": {
          "id": "transportnote",
          "maxclass": "comment",
          "patching_rect": [
            430.0,
            500.0,
            430.0,
            45.0
          ],
          "text": "Test: click ezdac~, set SPEED = 1.0, VOLUME = 0.7.\nIf audio plays, the core engine is healthy."
        }
      },
      {
        "box": {
          "id": "future",
          "maxclass": "comment",
          "patching_rect": [
            30.0,
            590.0,
            900.0,
            20.0
          ],
          "text": "NEXT AFTER CORE TEST \u2014 Jungulator controls (plain/native placeholders; not DSP-connected yet)"
        }
      },
      {
        "box": {
          "id": "primelbl",
          "maxclass": "comment",
          "patching_rect": [
            30.0,
            625.0,
            85.0,
            18.0
          ],
          "text": "PRIME"
        }
      },
      {
        "box": {
          "id": "prime",
          "maxclass": "toggle",
          "patching_rect": [
            30.0,
            647.0,
            20.0,
            20.0
          ]
        }
      },
      {
        "box": {
          "id": "seqlbl",
          "maxclass": "comment",
          "patching_rect": [
            130.0,
            625.0,
            85.0,
            18.0
          ],
          "text": "SEQ"
        }
      },
      {
        "box": {
          "id": "seq",
          "maxclass": "toggle",
          "patching_rect": [
            130.0,
            647.0,
            20.0,
            20.0
          ]
        }
      },
      {
        "box": {
          "id": "seqspeedlbl",
          "maxclass": "comment",
          "patching_rect": [
            230.0,
            625.0,
            85.0,
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
            230.0,
            647.0,
            70.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "cutterlbl",
          "maxclass": "comment",
          "patching_rect": [
            330.0,
            625.0,
            85.0,
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
            330.0,
            647.0,
            70.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "patternlbl",
          "maxclass": "comment",
          "patching_rect": [
            430.0,
            625.0,
            85.0,
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
            430.0,
            647.0,
            70.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "octlbl",
          "maxclass": "comment",
          "patching_rect": [
            530.0,
            625.0,
            85.0,
            18.0
          ],
          "text": "OCTAVER"
        }
      },
      {
        "box": {
          "id": "oct",
          "maxclass": "flonum",
          "patching_rect": [
            530.0,
            647.0,
            70.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "rndlbl",
          "maxclass": "comment",
          "patching_rect": [
            630.0,
            625.0,
            85.0,
            18.0
          ],
          "text": "RND"
        }
      },
      {
        "box": {
          "id": "rnd",
          "maxclass": "flonum",
          "patching_rect": [
            630.0,
            647.0,
            70.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "rnd2lbl",
          "maxclass": "comment",
          "patching_rect": [
            730.0,
            625.0,
            85.0,
            18.0
          ],
          "text": "RND2"
        }
      },
      {
        "box": {
          "id": "rnd2",
          "maxclass": "flonum",
          "patching_rect": [
            730.0,
            647.0,
            70.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "jitterlbl",
          "maxclass": "comment",
          "patching_rect": [
            830.0,
            625.0,
            85.0,
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
            830.0,
            647.0,
            70.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "pitchlbl",
          "maxclass": "comment",
          "patching_rect": [
            30.0,
            695.0,
            85.0,
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
            30.0,
            717.0,
            70.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "translbl",
          "maxclass": "comment",
          "patching_rect": [
            130.0,
            695.0,
            85.0,
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
            130.0,
            717.0,
            70.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "paniclbl",
          "maxclass": "comment",
          "patching_rect": [
            230.0,
            695.0,
            85.0,
            18.0
          ],
          "text": "PANIC"
        }
      },
      {
        "box": {
          "id": "panic",
          "maxclass": "toggle",
          "patching_rect": [
            230.0,
            717.0,
            20.0,
            20.0
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
            "speed",
            0
          ],
          "destination": [
            "sigspd",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "sigspd",
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
            "clipvol",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "clipvol",
            0
          ],
          "destination": [
            "sigvol",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "sigvol",
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
            "sigvol",
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
            "mulL",
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
            "mulR",
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
            "zero",
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
            "one",
            0
          ],
          "destination": [
            "speed",
            0
          ]
        }
      }
    ]
  }
}