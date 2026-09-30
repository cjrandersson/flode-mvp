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
      600
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
          "id": "ui-header",
          "maxclass": "newobj",
          "patching_rect": [
            20,
            20,
            920,
            54
          ],
          "text": "v8ui flode_ui_component.js @arguments A header",
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
            254
          ],
          "text": "v8ui flode_ui_component.js @arguments A waveform",
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
            254
          ]
        }
      },
      {
        "box": {
          "id": "ui-modes",
          "maxclass": "newobj",
          "patching_rect": [
            20,
            350,
            920,
            42
          ],
          "text": "v8ui flode_ui_component.js @arguments A modes",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "presentation": 1,
          "presentation_rect": [
            20,
            350,
            920,
            42
          ]
        }
      },
      {
        "box": {
          "id": "ui-jung",
          "maxclass": "newobj",
          "patching_rect": [
            20,
            405,
            580,
            58
          ],
          "text": "v8ui flode_ui_component.js @arguments A jung",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "presentation": 1,
          "presentation_rect": [
            20,
            405,
            580,
            58
          ]
        }
      },
      {
        "box": {
          "id": "ui-jitter",
          "maxclass": "newobj",
          "patching_rect": [
            20,
            473,
            580,
            58
          ],
          "text": "v8ui flode_ui_component.js @arguments A jitter",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "presentation": 1,
          "presentation_rect": [
            20,
            473,
            580,
            58
          ]
        }
      },
      {
        "box": {
          "id": "ui-slice",
          "maxclass": "newobj",
          "patching_rect": [
            620,
            405,
            320,
            58
          ],
          "text": "v8ui flode_ui_component.js @arguments A stepper slice",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "presentation": 1,
          "presentation_rect": [
            620,
            405,
            320,
            58
          ]
        }
      },
      {
        "box": {
          "id": "ui-speed",
          "maxclass": "newobj",
          "patching_rect": [
            620,
            473,
            320,
            58
          ],
          "text": "v8ui flode_ui_component.js @arguments A stepper speed",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "presentation": 1,
          "presentation_rect": [
            620,
            473,
            320,
            58
          ]
        }
      },
      {
        "box": {
          "id": "controller",
          "maxclass": "newobj",
          "patching_rect": [
            40,
            690,
            385,
            22
          ],
          "text": "v8 flode_ui_demo_controller.js @arguments #0.ui.preview A",
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
          "id": "routes",
          "maxclass": "newobj",
          "patching_rect": [
            40,
            738,
            395,
            22
          ],
          "text": "route header waveform jung jitter slice speed modes",
          "numinlets": 1,
          "numoutlets": 8,
          "outlettype": [
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
      },
      {
        "box": {
          "id": "print",
          "maxclass": "newobj",
          "patching_rect": [
            460,
            738,
            160,
            22
          ],
          "text": "print flode-ui-events",
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
            620,
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
            650,
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
            690,
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
            544,
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
            544,
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
            551,
            580,
            22
          ],
          "text": "DROP WAV / AIFF TO PREVIEW WAVEFORM       •       UI PROTOTYPE",
          "presentation": 1,
          "presentation_rect": [
            35,
            551,
            580,
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
            590,
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
            620,
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
            620,
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
            650,
            158,
            22
          ],
          "text": "buffer~ #0.ui.preview",
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
            650,
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
            650,
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
            788,
            710,
            44
          ],
          "text": "Open in Presentation. Shift + drag: fine sliders / bypass loop snapping. Double-click waveform: reset loop. Events print to the Max Console. No audio output or running clock is connected.",
          "linecount": 2,
          "fontsize": 12
        }
      },
      {
        "box": {
          "id": "manual-markers",
          "maxclass": "message",
          "patching_rect": [
            40,
            856,
            255,
            22
          ],
          "text": "markers 0.125 0.25 0.5 0.75",
          "numinlets": 2,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "id": "manual-playhead",
          "maxclass": "message",
          "patching_rect": [
            325,
            856,
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
            888,
            710,
            30
          ],
          "text": "Optional visual checks: manually supplied slice markers and playhead. These messages do not analyze transients or simulate playback.",
          "fontsize": 11
        }
      }
    ],
    "lines": [
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
            "ui-jung",
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
            "ui-jitter",
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
            "ui-slice",
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
            "ui-speed",
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
            "ui-modes",
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
            "ui-modes",
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
            "ui-jitter",
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
            "ui-slice",
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
            "manual-markers",
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
      }
    ],
    "dependency_cache": [
      {
        "name": "flode_ui_component.js",
        "bootpath": "../code",
        "patcherrelativepath": "../code",
        "type": "TEXT",
        "implicit": 1
      },
      {
        "name": "flode_ui_demo_controller.js",
        "bootpath": "../code",
        "patcherrelativepath": "../code",
        "type": "TEXT",
        "implicit": 1
      }
    ],
    "autosave": 0
  }
}
