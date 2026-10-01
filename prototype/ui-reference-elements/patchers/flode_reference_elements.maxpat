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
      100,
      100,
      960,
      780
    ],
    "openinpresentation": 1,
    "default_fontsize": 12,
    "default_fontface": 0,
    "default_fontname": "Arial",
    "bgcolor": [
      0.055,
      0.067,
      0.082,
      1
    ],
    "boxes": [
      {
        "box": {
          "id": "controller",
          "maxclass": "newobj",
          "text": "v8 flode_reference_demo_controller.js @arguments A",
          "patching_rect": [
            20,
            850,
            360,
            22
          ],
          "numinlets": 1,
          "numoutlets": 2
        }
      },
      {
        "box": {
          "id": "route",
          "maxclass": "newobj",
          "text": "route header waveform jung pan speed meter glyph play stop record loop tempo pause",
          "patching_rect": [
            20,
            890,
            880,
            22
          ],
          "numinlets": 1,
          "numoutlets": 14
        }
      },
      {
        "box": {
          "id": "print",
          "maxclass": "newobj",
          "text": "print flode-reference-requests",
          "patching_rect": [
            400,
            850,
            230,
            22
          ],
          "numinlets": 1,
          "numoutlets": 0
        }
      },
      {
        "box": {
          "id": "loadbang",
          "maxclass": "newobj",
          "text": "loadbang",
          "patching_rect": [
            20,
            800,
            60,
            22
          ],
          "numinlets": 1,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "id": "defer",
          "maxclass": "newobj",
          "text": "deferlow",
          "patching_rect": [
            100,
            800,
            60,
            22
          ],
          "numinlets": 1,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "id": "reset",
          "maxclass": "message",
          "text": "reset",
          "patching_rect": [
            180,
            800,
            48,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "id": "ui-header",
          "maxclass": "newobj",
          "text": "v8ui flode_reference_ui.js @arguments A pod header",
          "patching_rect": [
            20,
            20,
            920,
            64
          ],
          "numinlets": 1,
          "numoutlets": 1,
          "presentation": 1,
          "presentation_rect": [
            20,
            20,
            920,
            64
          ],
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "ui-waveform",
          "maxclass": "newobj",
          "text": "v8ui flode_reference_ui.js @arguments A range waveform",
          "patching_rect": [
            20,
            98,
            920,
            210
          ],
          "numinlets": 1,
          "numoutlets": 1,
          "presentation": 1,
          "presentation_rect": [
            20,
            98,
            920,
            210
          ],
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "ui-jung",
          "maxclass": "newobj",
          "text": "v8ui flode_reference_ui.js @arguments A fader jung",
          "patching_rect": [
            20,
            332,
            440,
            84
          ],
          "numinlets": 1,
          "numoutlets": 1,
          "presentation": 1,
          "presentation_rect": [
            20,
            332,
            440,
            84
          ],
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "ui-pan",
          "maxclass": "newobj",
          "text": "v8ui flode_reference_ui.js @arguments A knob pan",
          "patching_rect": [
            480,
            328,
            140,
            124
          ],
          "numinlets": 1,
          "numoutlets": 1,
          "presentation": 1,
          "presentation_rect": [
            480,
            328,
            140,
            124
          ],
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "ui-speed",
          "maxclass": "newobj",
          "text": "v8ui flode_reference_ui.js @arguments A readout speed",
          "patching_rect": [
            638,
            328,
            302,
            104
          ],
          "numinlets": 1,
          "numoutlets": 1,
          "presentation": 1,
          "presentation_rect": [
            638,
            328,
            302,
            104
          ],
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "ui-meter",
          "maxclass": "newobj",
          "text": "v8ui flode_reference_ui.js @arguments A meter meter",
          "patching_rect": [
            20,
            470,
            280,
            156
          ],
          "numinlets": 1,
          "numoutlets": 1,
          "presentation": 1,
          "presentation_rect": [
            20,
            470,
            280,
            156
          ],
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "ui-glyph",
          "maxclass": "newobj",
          "text": "v8ui flode_reference_ui.js @arguments A glyph glyph",
          "patching_rect": [
            324,
            450,
            220,
            176
          ],
          "numinlets": 1,
          "numoutlets": 1,
          "presentation": 1,
          "presentation_rect": [
            324,
            450,
            220,
            176
          ],
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "ui-play",
          "maxclass": "newobj",
          "text": "v8ui flode_reference_ui.js @arguments A icon play",
          "patching_rect": [
            20,
            654,
            112,
            84
          ],
          "numinlets": 1,
          "numoutlets": 1,
          "presentation": 1,
          "presentation_rect": [
            20,
            654,
            112,
            84
          ],
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "ui-stop",
          "maxclass": "newobj",
          "text": "v8ui flode_reference_ui.js @arguments A icon stop",
          "patching_rect": [
            148,
            654,
            112,
            84
          ],
          "numinlets": 1,
          "numoutlets": 1,
          "presentation": 1,
          "presentation_rect": [
            148,
            654,
            112,
            84
          ],
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "ui-record",
          "maxclass": "newobj",
          "text": "v8ui flode_reference_ui.js @arguments A icon record",
          "patching_rect": [
            276,
            654,
            112,
            84
          ],
          "numinlets": 1,
          "numoutlets": 1,
          "presentation": 1,
          "presentation_rect": [
            276,
            654,
            112,
            84
          ],
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "ui-loop",
          "maxclass": "newobj",
          "text": "v8ui flode_reference_ui.js @arguments A icon loop",
          "patching_rect": [
            404,
            654,
            112,
            84
          ],
          "numinlets": 1,
          "numoutlets": 1,
          "presentation": 1,
          "presentation_rect": [
            404,
            654,
            112,
            84
          ],
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "ui-tempo",
          "maxclass": "newobj",
          "text": "v8ui flode_reference_ui.js @arguments A icon tempo",
          "patching_rect": [
            532,
            654,
            112,
            84
          ],
          "numinlets": 1,
          "numoutlets": 1,
          "presentation": 1,
          "presentation_rect": [
            532,
            654,
            112,
            84
          ],
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "ui-pause",
          "maxclass": "newobj",
          "text": "v8ui flode_reference_ui.js @arguments A icon pause",
          "patching_rect": [
            660,
            654,
            112,
            84
          ],
          "numinlets": 1,
          "numoutlets": 1,
          "presentation": 1,
          "presentation_rect": [
            660,
            654,
            112,
            84
          ],
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "state-home",
          "maxclass": "message",
          "text": "set behavior_state home",
          "patching_rect": [
            20,
            945,
            172,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "id": "state-restless",
          "maxclass": "message",
          "text": "set behavior_state restless",
          "patching_rect": [
            200,
            945,
            172,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "id": "state-intervention",
          "maxclass": "message",
          "text": "set behavior_state intervention",
          "patching_rect": [
            380,
            945,
            172,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "id": "state-resolving",
          "maxclass": "message",
          "text": "set behavior_state resolving",
          "patching_rect": [
            560,
            945,
            172,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "id": "state-return_home",
          "maxclass": "message",
          "text": "set behavior_state return_home",
          "patching_rect": [
            740,
            945,
            172,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "id": "levels",
          "maxclass": "message",
          "text": "set levels 0.68 0.57, set display EXAMPLE -12 dB",
          "patching_rect": [
            20,
            990,
            360,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "id": "no-levels",
          "maxclass": "message",
          "text": "set available 0",
          "patching_rect": [
            400,
            990,
            132,
            22
          ],
          "numinlets": 2,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "id": "help",
          "maxclass": "comment",
          "text": "Reference elements only: JUNG horizontal drag, PAN vertical drag, Shift fine adjustment, double-click reset. Icons log requests. Range is a read-only diagram. Open UI LAB 001 for real audio waveforms.",
          "patching_rect": [
            20,
            1030,
            880,
            44
          ],
          "numinlets": 1,
          "numoutlets": 0,
          "linecount": 2
        }
      }
    ],
    "lines": [
      {
        "patchline": {
          "source": [
            "loadbang",
            0
          ],
          "destination": [
            "defer",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "defer",
            0
          ],
          "destination": [
            "reset",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "reset",
            0
          ],
          "destination": [
            "controller",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "controller",
            0
          ],
          "destination": [
            "route",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "controller",
            1
          ],
          "destination": [
            "print",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "ui-header",
            0
          ],
          "destination": [
            "controller",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "route",
            0
          ],
          "destination": [
            "ui-header",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "ui-waveform",
            0
          ],
          "destination": [
            "controller",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "route",
            1
          ],
          "destination": [
            "ui-waveform",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "ui-jung",
            0
          ],
          "destination": [
            "controller",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "route",
            2
          ],
          "destination": [
            "ui-jung",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "ui-pan",
            0
          ],
          "destination": [
            "controller",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "route",
            3
          ],
          "destination": [
            "ui-pan",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "ui-speed",
            0
          ],
          "destination": [
            "controller",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "route",
            4
          ],
          "destination": [
            "ui-speed",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "ui-meter",
            0
          ],
          "destination": [
            "controller",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "route",
            5
          ],
          "destination": [
            "ui-meter",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "ui-glyph",
            0
          ],
          "destination": [
            "controller",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "route",
            6
          ],
          "destination": [
            "ui-glyph",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "ui-play",
            0
          ],
          "destination": [
            "controller",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "route",
            7
          ],
          "destination": [
            "ui-play",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "ui-stop",
            0
          ],
          "destination": [
            "controller",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "route",
            8
          ],
          "destination": [
            "ui-stop",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "ui-record",
            0
          ],
          "destination": [
            "controller",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "route",
            9
          ],
          "destination": [
            "ui-record",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "ui-loop",
            0
          ],
          "destination": [
            "controller",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "route",
            10
          ],
          "destination": [
            "ui-loop",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "ui-tempo",
            0
          ],
          "destination": [
            "controller",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "route",
            11
          ],
          "destination": [
            "ui-tempo",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "ui-pause",
            0
          ],
          "destination": [
            "controller",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "route",
            12
          ],
          "destination": [
            "ui-pause",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "state-home",
            0
          ],
          "destination": [
            "ui-glyph",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "state-restless",
            0
          ],
          "destination": [
            "ui-glyph",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "state-intervention",
            0
          ],
          "destination": [
            "ui-glyph",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "state-resolving",
            0
          ],
          "destination": [
            "ui-glyph",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "state-return_home",
            0
          ],
          "destination": [
            "ui-glyph",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "levels",
            0
          ],
          "destination": [
            "ui-meter",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "no-levels",
            0
          ],
          "destination": [
            "ui-meter",
            0
          ]
        }
      }
    ],
    "dependency_cache": [
      {
        "name": "flode_reference_ui.js",
        "bootpath": "../code",
        "patcherrelativepath": "../code",
        "type": "TEXT",
        "implicit": 1
      },
      {
        "name": "flode_reference_demo_controller.js",
        "bootpath": "../code",
        "patcherrelativepath": "../code",
        "type": "TEXT",
        "implicit": 1
      }
    ],
    "autosave": 0
  }
}
