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
      720
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
          "patching_rect": [
            40,
            870,
            385,
            22
          ],
          "text": "v8 flode_ui_lab_controller.js @arguments #0.ui.lab A",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ]
        }
      },
      {
        "box": {
          "id": "print",
          "maxclass": "newobj",
          "patching_rect": [
            460,
            918,
            160,
            22
          ],
          "text": "print flode-ui-lab-events",
          "numinlets": 1,
          "numoutlets": 0
        }
      },
      {
        "box": {
          "id": "loadbang",
          "maxclass": "newobj",
          "patching_rect": [
            460,
            800,
            62,
            22
          ],
          "text": "loadbang",
          "numinlets": 1,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "id": "init-defer",
          "maxclass": "newobj",
          "patching_rect": [
            460,
            830,
            62,
            22
          ],
          "text": "deferlow",
          "numinlets": 1,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "id": "reset",
          "maxclass": "message",
          "patching_rect": [
            460,
            870,
            45,
            22
          ],
          "text": "reset",
          "numinlets": 2,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "id": "drop",
          "maxclass": "dropfile",
          "patching_rect": [
            20,
            666,
            920,
            34
          ],
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "presentation": 1,
          "presentation_rect": [
            20,
            666,
            920,
            34
          ],
          "bgcolor": [
            0.078,
            0.09,
            0.106,
            1
          ],
          "textcolor": [
            0.43,
            0.49,
            0.55,
            1
          ]
        }
      },
      {
        "box": {
          "id": "drop-label",
          "maxclass": "comment",
          "patching_rect": [
            35,
            673,
            600,
            22
          ],
          "text": "DROP WAV / AIFF TO VIEW WAVEFORM       •       UI LAB 001",
          "presentation": 1,
          "presentation_rect": [
            35,
            673,
            600,
            22
          ],
          "textcolor": [
            0.43,
            0.49,
            0.55,
            1
          ],
          "fontname": "Arial",
          "fontsize": 11,
          "ignoreclick": 1
        }
      },
      {
        "box": {
          "id": "split-path",
          "maxclass": "newobj",
          "patching_rect": [
            40,
            770,
            45,
            22
          ],
          "text": "t s s",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ]
        }
      },
      {
        "box": {
          "id": "replace",
          "maxclass": "newobj",
          "patching_rect": [
            40,
            800,
            105,
            22
          ],
          "text": "prepend replace",
          "numinlets": 1,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "id": "filename",
          "maxclass": "newobj",
          "patching_rect": [
            190,
            800,
            114,
            22
          ],
          "text": "prepend filename",
          "numinlets": 1,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "id": "buffer",
          "maxclass": "newobj",
          "patching_rect": [
            40,
            830,
            158,
            22
          ],
          "text": "buffer~ #0.ui.lab",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "float",
            "bang"
          ]
        }
      },
      {
        "box": {
          "id": "peaks-defer",
          "maxclass": "newobj",
          "patching_rect": [
            190,
            830,
            62,
            22
          ],
          "text": "deferlow",
          "numinlets": 1,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "id": "refresh",
          "maxclass": "message",
          "patching_rect": [
            285,
            830,
            54,
            22
          ],
          "text": "refresh",
          "numinlets": 2,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "id": "help",
          "maxclass": "comment",
          "patching_rect": [
            40,
            968,
            710,
            44
          ],
          "text": "UI LAB 001: relative slider drags; Shift for precision; double-click resets controls or loop. No audio, EQ processing or running transport. Events appear in the Max Console.",
          "linecount": 2,
          "fontsize": 12
        }
      },
      {
        "box": {
          "id": "manual-playhead",
          "maxclass": "message",
          "patching_rect": [
            325,
            1036,
            120,
            22
          ],
          "text": "playhead 0.45",
          "numinlets": 2,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "id": "manual-help",
          "maxclass": "comment",
          "patching_rect": [
            40,
            1068,
            710,
            30
          ],
          "text": "Optional controller-supplied playhead position. This does not start playback or introduce a clock.",
          "fontsize": 11
        }
      },
      {
        "box": {
          "id": "ui-header",
          "maxclass": "newobj",
          "patching_rect": [
            20,
            20,
            920,
            54
          ],
          "text": "v8ui flode_ui_lab_component.js @arguments A header",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "presentation": 1,
          "presentation_rect": [
            20,
            20,
            920,
            54
          ]
        }
      },
      {
        "box": {
          "id": "ui-waveform",
          "maxclass": "newobj",
          "patching_rect": [
            20,
            84,
            920,
            300
          ],
          "text": "v8ui flode_ui_lab_component.js @arguments A waveform",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "presentation": 1,
          "presentation_rect": [
            20,
            84,
            920,
            300
          ]
        }
      },
      {
        "box": {
          "id": "ui-vol",
          "maxclass": "newobj",
          "patching_rect": [
            20,
            405,
            294,
            64
          ],
          "text": "v8ui flode_ui_lab_component.js @arguments A slider vol",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "presentation": 1,
          "presentation_rect": [
            20,
            405,
            294,
            64
          ]
        }
      },
      {
        "box": {
          "id": "ui-pan",
          "maxclass": "newobj",
          "patching_rect": [
            333,
            405,
            294,
            64
          ],
          "text": "v8ui flode_ui_lab_component.js @arguments A slider pan",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "presentation": 1,
          "presentation_rect": [
            333,
            405,
            294,
            64
          ]
        }
      },
      {
        "box": {
          "id": "ui-speed",
          "maxclass": "newobj",
          "patching_rect": [
            646,
            405,
            294,
            64
          ],
          "text": "v8ui flode_ui_lab_component.js @arguments A slider speed",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "presentation": 1,
          "presentation_rect": [
            646,
            405,
            294,
            64
          ]
        }
      },
      {
        "box": {
          "id": "ui-jung",
          "maxclass": "newobj",
          "patching_rect": [
            20,
            482,
            920,
            64
          ],
          "text": "v8ui flode_ui_lab_component.js @arguments A slider jung",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "presentation": 1,
          "presentation_rect": [
            20,
            482,
            920,
            64
          ]
        }
      },
      {
        "box": {
          "id": "ui-eq_low",
          "maxclass": "newobj",
          "patching_rect": [
            20,
            570,
            294,
            70
          ],
          "text": "v8ui flode_ui_lab_component.js @arguments A slider eq_low",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "presentation": 1,
          "presentation_rect": [
            20,
            570,
            294,
            70
          ]
        }
      },
      {
        "box": {
          "id": "ui-eq_mid",
          "maxclass": "newobj",
          "patching_rect": [
            333,
            570,
            294,
            70
          ],
          "text": "v8ui flode_ui_lab_component.js @arguments A slider eq_mid",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "presentation": 1,
          "presentation_rect": [
            333,
            570,
            294,
            70
          ]
        }
      },
      {
        "box": {
          "id": "ui-eq_high",
          "maxclass": "newobj",
          "patching_rect": [
            646,
            570,
            294,
            70
          ],
          "text": "v8ui flode_ui_lab_component.js @arguments A slider eq_high",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "presentation": 1,
          "presentation_rect": [
            646,
            570,
            294,
            70
          ]
        }
      },
      {
        "box": {
          "id": "routes",
          "maxclass": "newobj",
          "patching_rect": [
            40,
            918,
            650,
            22
          ],
          "text": "route header waveform vol pan speed jung eq_low eq_mid eq_high",
          "numinlets": 1,
          "numoutlets": 10,
          "outlettype": [
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            ""
          ]
        }
      }
    ],
    "lines": [
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
            "loadbang",
            0
          ],
          "destination": [
            "init-defer",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "init-defer",
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
            "drop",
            0
          ],
          "destination": [
            "split-path",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "split-path",
            1
          ],
          "destination": [
            "filename",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "split-path",
            0
          ],
          "destination": [
            "replace",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "filename",
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
            "replace",
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
            "buffer",
            1
          ],
          "destination": [
            "peaks-defer",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "peaks-defer",
            0
          ],
          "destination": [
            "refresh",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "refresh",
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
            "manual-playhead",
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
            "ui-vol",
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
            "ui-eq_low",
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
            "ui-eq_mid",
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
            "ui-eq_high",
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
            "routes",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "routes",
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
            "routes",
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
            "routes",
            2
          ],
          "destination": [
            "ui-vol",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "routes",
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
            "routes",
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
            "routes",
            5
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
            "routes",
            6
          ],
          "destination": [
            "ui-eq_low",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "routes",
            7
          ],
          "destination": [
            "ui-eq_mid",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "routes",
            8
          ],
          "destination": [
            "ui-eq_high",
            0
          ]
        }
      }
    ],
    "dependency_cache": [
      {
        "name": "flode_ui_lab_component.js",
        "bootpath": "../code",
        "patcherrelativepath": "../code",
        "type": "TEXT",
        "implicit": 1
      },
      {
        "name": "flode_ui_lab_controller.js",
        "bootpath": "../code",
        "patcherrelativepath": "../code",
        "type": "TEXT",
        "implicit": 1
      }
    ],
    "autosave": 0
  }
}
