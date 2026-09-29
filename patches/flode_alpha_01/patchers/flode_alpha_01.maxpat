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
      800.0,
      740.0
    ],
    "openinpresentation": 0,
    "boxes": [
      {
        "box": {
          "id": "obj-1",
          "maxclass": "comment",
          "text": "flöde~ Alpha 0.1 — First Audible POD developer harness (Max runtime unverified)",
          "patching_rect": [
            30.0,
            20.0,
            430.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-2",
          "maxclass": "comment",
          "text": "One master transport; explicit full-sample playback; no JUNG behaviour.",
          "patching_rect": [
            30.0,
            45.0,
            390.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-3",
          "maxclass": "newobj",
          "text": "loadmess 92.",
          "patching_rect": [
            30.0,
            90.0,
            88.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-4",
          "maxclass": "flonum",
          "patching_rect": [
            30.0,
            125.0,
            72.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-5",
          "maxclass": "comment",
          "text": "master BPM",
          "patching_rect": [
            110.0,
            125.0,
            90.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-6",
          "maxclass": "newobj",
          "text": "prepend tempo",
          "patching_rect": [
            30.0,
            160.0,
            98.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-7",
          "maxclass": "newobj",
          "text": "transport",
          "patching_rect": [
            30.0,
            205.0,
            72.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-8",
          "maxclass": "toggle",
          "patching_rect": [
            160.0,
            205.0,
            24.0,
            24.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-9",
          "maxclass": "comment",
          "text": "start / stop",
          "patching_rect": [
            192.0,
            207.0,
            85.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-10",
          "maxclass": "newobj",
          "text": "metro 16n @transport internal @quantize 16n",
          "patching_rect": [
            160.0,
            250.0,
            292.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-11",
          "maxclass": "newobj",
          "text": "counter 0 15",
          "patching_rect": [
            160.0,
            290.0,
            88.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-12",
          "maxclass": "newobj",
          "text": "t i i",
          "patching_rect": [
            160.0,
            325.0,
            42.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-13",
          "maxclass": "newobj",
          "text": "prepend tick",
          "patching_rect": [
            300.0,
            325.0,
            88.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-14",
          "maxclass": "newobj",
          "text": "prepend running",
          "patching_rect": [
            300.0,
            205.0,
            112.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-15",
          "maxclass": "newobj",
          "text": "print flode.transport",
          "patching_rect": [
            470.0,
            250.0,
            132.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-16",
          "maxclass": "newobj",
          "text": "flode_pod_v01 #0 A",
          "patching_rect": [
            160.0,
            380.0,
            142.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-17",
          "maxclass": "newobj",
          "text": "print flode.pod.A",
          "patching_rect": [
            470.0,
            380.0,
            122.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-18",
          "maxclass": "newobj",
          "text": "dac~ 1 2",
          "patching_rect": [
            160.0,
            450.0,
            68.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-19",
          "maxclass": "comment",
          "text": "Enable DSP first. Load Apache explicitly; Start/Stop also controls POD A.",
          "patching_rect": [
            245.0,
            450.0,
            355.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-20",
          "maxclass": "newobj",
          "text": "prepend tick",
          "patching_rect": [
            160.0,
            350.0,
            88.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "pod_diag_route",
          "maxclass": "newobj",
          "patching_rect": [
            470.0,
            345.0,
            127.3,
            22.0
          ],
          "text": "route debug_enabled"
        }
      },
      {
        "box": {
          "id": "transport_diag_gate",
          "maxclass": "newobj",
          "patching_rect": [
            470.0,
            295.0,
            55.0,
            22.0
          ],
          "text": "gate 1 1"
        }
      },
      {
        "box": {
          "id": "run_to_playback",
          "maxclass": "newobj",
          "patching_rect": [
            30.0,
            525.0,
            55.0,
            22.0
          ],
          "text": "sel 0 1"
        }
      },
      {
        "box": {
          "id": "pod_stop",
          "maxclass": "message",
          "patching_rect": [
            30.0,
            570.0,
            55.0,
            22.0
          ],
          "text": "stop"
        }
      },
      {
        "box": {
          "id": "pod_play",
          "maxclass": "message",
          "patching_rect": [
            130.0,
            570.0,
            55.0,
            22.0
          ],
          "text": "play"
        }
      },
      {
        "box": {
          "id": "load_apache",
          "maxclass": "message",
          "patching_rect": [
            270.0,
            570.0,
            73.7,
            22.0
          ],
          "text": "load_apache"
        }
      },
      {
        "box": {
          "id": "retrigger",
          "maxclass": "message",
          "patching_rect": [
            390.0,
            570.0,
            60.300000000000004,
            22.0
          ],
          "text": "retrigger"
        }
      },
      {
        "box": {
          "id": "getstate",
          "maxclass": "message",
          "patching_rect": [
            500.0,
            570.0,
            55.0,
            22.0
          ],
          "text": "getstate"
        }
      },
      {
        "box": {
          "id": "debug_off",
          "maxclass": "message",
          "patching_rect": [
            30.0,
            620.0,
            100.5,
            22.0
          ],
          "text": "debug_enabled 0"
        }
      },
      {
        "box": {
          "id": "debug_on",
          "maxclass": "message",
          "patching_rect": [
            190.0,
            620.0,
            100.5,
            22.0
          ],
          "text": "debug_enabled 1"
        }
      },
      {
        "box": {
          "id": "developer_note",
          "maxclass": "comment",
          "patching_rect": [
            30.0,
            670.0,
            603.0,
            22.0
          ],
          "text": "Developer messages only: load → getstate → play/stop/retrigger. Normal speed: base_rate 1."
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
            "obj-8",
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
            "obj-8",
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
            "obj-8",
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
            "obj-12",
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
            "obj-20",
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
            "obj-12",
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
            "obj-16",
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
            "obj-16",
            1
          ],
          "destination": [
            "obj-18",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-16",
            2
          ],
          "destination": [
            "pod_diag_route",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "pod_diag_route",
            1
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
            "pod_diag_route",
            0
          ],
          "destination": [
            "transport_diag_gate",
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
            "transport_diag_gate",
            1
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
            "transport_diag_gate",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "transport_diag_gate",
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
            "obj-8",
            0
          ],
          "destination": [
            "run_to_playback",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "run_to_playback",
            0
          ],
          "destination": [
            "pod_stop",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "run_to_playback",
            1
          ],
          "destination": [
            "pod_play",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "pod_stop",
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
            "pod_play",
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
            "load_apache",
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
            "retrigger",
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
            "getstate",
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
            "debug_off",
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
            "debug_on",
            0
          ],
          "destination": [
            "obj-16",
            0
          ]
        }
      }
    ]
  }
}
