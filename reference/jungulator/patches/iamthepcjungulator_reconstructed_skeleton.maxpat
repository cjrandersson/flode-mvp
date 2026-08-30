{
  "patcher": {
    "fileversion": 1,
    "appversion": {
      "major": 8,
      "minor": 6,
      "revision": 0,
      "architecture": "x64",
      "modernui": 1
    },
    "classnamespace": "box",
    "rect": [
      100,
      100,
      980,
      650
    ],
    "bglocked": 0,
    "openinpresentation": 0,
    "default_fontsize": 12.0,
    "default_fontface": 0,
    "default_fontname": "Arial",
    "gridonopen": 1,
    "gridsize": [
      15.0,
      15.0
    ],
    "boxes": [
      {
        "box": {
          "id": "obj-1",
          "maxclass": "comment",
          "patching_rect": [
            30,
            20,
            820,
            24
          ],
          "text": "iamthepcjungulator \u2014 reconstructed skeleton from .mxf (not a decompiled original)"
        }
      },
      {
        "box": {
          "id": "obj-2",
          "maxclass": "comment",
          "patching_rect": [
            30,
            50,
            860,
            40
          ],
          "text": "Original .mxf is an old binary Max collective. This patch preserves the inferred architecture and object inventory for rebuilding/modernizing."
        }
      },
      {
        "box": {
          "id": "obj-3",
          "maxclass": "newobj",
          "patching_rect": [
            50,
            120,
            120,
            22
          ],
          "text": "adc~ 1 2"
        }
      },
      {
        "box": {
          "id": "obj-4",
          "maxclass": "newobj",
          "patching_rect": [
            50,
            160,
            120,
            22
          ],
          "text": "*~ 0.5"
        }
      },
      {
        "box": {
          "id": "obj-5",
          "maxclass": "newobj",
          "patching_rect": [
            50,
            200,
            120,
            22
          ],
          "text": "tapin~ 2000"
        }
      },
      {
        "box": {
          "id": "obj-6",
          "maxclass": "newobj",
          "patching_rect": [
            50,
            240,
            150,
            22
          ],
          "text": "tapout~ 250 500"
        }
      },
      {
        "box": {
          "id": "obj-7",
          "maxclass": "newobj",
          "patching_rect": [
            50,
            280,
            140,
            22
          ],
          "text": "reson~ 440 50 1."
        }
      },
      {
        "box": {
          "id": "obj-8",
          "maxclass": "newobj",
          "patching_rect": [
            50,
            330,
            120,
            22
          ],
          "text": "dac~ 1 2"
        }
      },
      {
        "box": {
          "id": "obj-9",
          "maxclass": "newobj",
          "patching_rect": [
            240,
            120,
            120,
            22
          ],
          "text": "buffer~ snd"
        }
      },
      {
        "box": {
          "id": "obj-10",
          "maxclass": "newobj",
          "patching_rect": [
            240,
            160,
            120,
            22
          ],
          "text": "record~ snd"
        }
      },
      {
        "box": {
          "id": "obj-11",
          "maxclass": "newobj",
          "patching_rect": [
            240,
            200,
            130,
            22
          ],
          "text": "groove~ snd 2"
        }
      },
      {
        "box": {
          "id": "obj-12",
          "maxclass": "newobj",
          "patching_rect": [
            240,
            240,
            120,
            22
          ],
          "text": "line~"
        }
      },
      {
        "box": {
          "id": "obj-13",
          "maxclass": "newobj",
          "patching_rect": [
            430,
            120,
            120,
            22
          ],
          "text": "notein"
        }
      },
      {
        "box": {
          "id": "obj-14",
          "maxclass": "newobj",
          "patching_rect": [
            430,
            160,
            150,
            22
          ],
          "text": "makenote 100 250"
        }
      },
      {
        "box": {
          "id": "obj-15",
          "maxclass": "newobj",
          "patching_rect": [
            430,
            200,
            120,
            22
          ],
          "text": "pack 0 0"
        }
      },
      {
        "box": {
          "id": "obj-16",
          "maxclass": "message",
          "patching_rect": [
            430,
            240,
            130,
            22
          ],
          "text": "midievent $1 $2"
        }
      },
      {
        "box": {
          "id": "obj-17",
          "maxclass": "newobj",
          "patching_rect": [
            430,
            280,
            120,
            22
          ],
          "text": "vst~"
        }
      },
      {
        "box": {
          "id": "obj-18",
          "maxclass": "newobj",
          "patching_rect": [
            430,
            330,
            120,
            22
          ],
          "text": "noteout"
        }
      },
      {
        "box": {
          "id": "obj-19",
          "maxclass": "newobj",
          "patching_rect": [
            620,
            120,
            120,
            22
          ],
          "text": "metro 125"
        }
      },
      {
        "box": {
          "id": "obj-20",
          "maxclass": "newobj",
          "patching_rect": [
            620,
            160,
            120,
            22
          ],
          "text": "random 128"
        }
      },
      {
        "box": {
          "id": "obj-21",
          "maxclass": "newobj",
          "patching_rect": [
            620,
            200,
            120,
            22
          ],
          "text": "counter"
        }
      },
      {
        "box": {
          "id": "obj-22",
          "maxclass": "newobj",
          "patching_rect": [
            620,
            240,
            180,
            22
          ],
          "text": "coll jungulator_patterns"
        }
      },
      {
        "box": {
          "id": "obj-23",
          "maxclass": "newobj",
          "patching_rect": [
            620,
            280,
            120,
            22
          ],
          "text": "umenu"
        }
      },
      {
        "box": {
          "id": "obj-24",
          "maxclass": "comment",
          "patching_rect": [
            30,
            390,
            850,
            44
          ],
          "text": "Missing UI assets detected: wfknob.pct, wfmodes.pct, plus generated u*.pct files. Replace old pictslider/image UI with live.dial, live.menu, panel, waveform~ attributes."
        }
      },
      {
        "box": {
          "id": "obj-25",
          "maxclass": "comment",
          "patching_rect": [
            30,
            440,
            850,
            44
          ],
          "text": "Detected VST names: poda.vst \u2026 podi.vst, plus runtime error for plug-in \u201cfl\u201d. These are placeholders; install/replace plugins before expecting audio parity."
        }
      },
      {
        "box": {
          "id": "obj-26",
          "maxclass": "comment",
          "patching_rect": [
            30,
            500,
            900,
            80
          ],
          "text": "Detected object inventory (approx): sprintf\u00d761, int\u00d752, buffer~\u00d741, if\u00d730, float\u00d727, waveform~\u00d725, message\u00d722, vst~\u00d719, adstatus\u00d718, clear\u00d717, umenu\u00d710, coll\u00d710, toggle\u00d78, send\u00d78, pictslider\u00d78, change\u00d77, folder\u00d77, panel\u00d77, window\u00d75, loadbang\u00d75, inlet\u00d75, switch\u00d75, tapin~\u00d75, sfinfo~\u00d75, adc~\u00d75, counter\u00d74, receive~\u00d74, line~\u00d74, tapout~\u00d74, split\u00d74, groove~\u00d74, record~\u00d74, dac~\u00d74, -~\u00d74, newex\u00d73, midievent\u00d73, uslider\u00d73, delay\u00d73, hslider\u00d73, urn\u00d73, pow\u00d73, led\u00d73, meter~\u00d73, reson~\u00d73, scale\u00d73"
        }
      }
    ],
    "lines": [
      {
        "patchline": {
          "source": [
            "obj-3",
            0
          ],
          "destination": [
            "obj-4",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-4",
            0
          ],
          "destination": [
            "obj-5",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-5",
            0
          ],
          "destination": [
            "obj-6",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-6",
            0
          ],
          "destination": [
            "obj-7",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-7",
            0
          ],
          "destination": [
            "obj-8",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-9",
            0
          ],
          "destination": [
            "obj-10",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-9",
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
            "obj-12",
            0
          ],
          "destination": [
            "obj-11",
            1
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
            "obj-8",
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
            "obj-14",
            0
          ],
          "destination": [
            "obj-15",
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
            "obj-16",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-16",
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
            "obj-14",
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
            "obj-19",
            0
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
            "obj-19",
            0
          ],
          "destination": [
            "obj-21",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-21",
            0
          ],
          "destination": [
            "obj-22",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-22",
            0
          ],
          "destination": [
            "obj-23",
            0
          ]
        }
      }
    ]
  }
}