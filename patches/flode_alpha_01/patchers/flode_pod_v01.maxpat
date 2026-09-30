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
      100.0,
      100.0,
      1650.0,
      1620.0
    ],
    "openinpresentation": 0,
    "boxes": [
      {
        "box": {
          "id": "obj-1",
          "maxclass": "comment",
          "text": "POD v0.1 — TV001: state/safety foundation + minimal First Audible playback",
          "patching_rect": [
            30.0,
            20.0,
            340.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-2",
          "maxclass": "inlet",
          "patching_rect": [
            30.0,
            70.0,
            24.0,
            24.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-5",
          "maxclass": "outlet",
          "patching_rect": [
            700.0,
            465.0,
            24.0,
            24.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-6",
          "maxclass": "newobj",
          "text": "buffer~ #1.pod.#2.buffer 2",
          "patching_rect": [
            250.0,
            70.0,
            178.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-7",
          "maxclass": "comment",
          "text": "Allocation is unchanged; file loading determines channels.",
          "patching_rect": [
            445.0,
            70.0,
            240.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-8",
          "maxclass": "newobj",
          "text": "sig~ 0.",
          "patching_rect": [
            250.0,
            125.0,
            55.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-9",
          "maxclass": "newobj",
          "text": "groove~ #1.pod.#2.buffer 2 @loop 0",
          "patching_rect": [
            250.0,
            165.0,
            234.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-10",
          "maxclass": "comment",
          "text": "Controlled rate: zero until validated play; base_rate 1. = normal forward playback.",
          "patching_rect": [
            500.0,
            165.0,
            320.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-11",
          "maxclass": "newobj",
          "text": "clip 0. 1.",
          "patching_rect": [
            125.0,
            220.0,
            72.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-12",
          "maxclass": "newobj",
          "text": "clip -1. 1.",
          "patching_rect": [
            215.0,
            220.0,
            78.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-13",
          "maxclass": "newobj",
          "text": "pak 0.8 0.",
          "patching_rect": [
            125.0,
            265.0,
            78.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-14",
          "maxclass": "newobj",
          "text": "unpack f f",
          "patching_rect": [
            125.0,
            305.0,
            72.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-15",
          "maxclass": "newobj",
          "text": "expr $f1 * (1. - max(0.\\, $f2))",
          "patching_rect": [
            125.0,
            345.0,
            210.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-16",
          "maxclass": "newobj",
          "text": "expr $f1 * (1. + min(0.\\, $f2))",
          "patching_rect": [
            365.0,
            345.0,
            210.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-17",
          "maxclass": "newobj",
          "text": "pack 0. 10",
          "patching_rect": [
            125.0,
            385.0,
            78.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-18",
          "maxclass": "newobj",
          "text": "pack 0. 10",
          "patching_rect": [
            365.0,
            385.0,
            78.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-19",
          "maxclass": "newobj",
          "text": "line~ 0.",
          "patching_rect": [
            125.0,
            425.0,
            62.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-20",
          "maxclass": "newobj",
          "text": "line~ 0.",
          "patching_rect": [
            365.0,
            425.0,
            62.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-21",
          "maxclass": "newobj",
          "text": "*~",
          "patching_rect": [
            250.0,
            425.0,
            34.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-22",
          "maxclass": "newobj",
          "text": "*~",
          "patching_rect": [
            490.0,
            425.0,
            34.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-23",
          "maxclass": "outlet",
          "outlettype": [
            "signal"
          ],
          "patching_rect": [
            250.0,
            500.0,
            24.0,
            24.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-24",
          "maxclass": "outlet",
          "outlettype": [
            "signal"
          ],
          "patching_rect": [
            490.0,
            500.0,
            24.0,
            24.0
          ]
        }
      },
      {
        "box": {
          "id": "controls",
          "maxclass": "newobj",
          "patching_rect": [
            30.0,
            105.0,
            134.0,
            22.0
          ],
          "text": "p validated_controls",
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
              1200.0,
              1400.0
            ],
            "openinpresentation": 0,
            "boxes": [
              {
                "box": {
                  "id": "in",
                  "maxclass": "inlet",
                  "patching_rect": [
                    30.0,
                    25.0,
                    55.0,
                    22.0
                  ]
                }
              },
              {
                "box": {
                  "id": "state",
                  "maxclass": "outlet",
                  "patching_rect": [
                    30.0,
                    1000.0,
                    55.0,
                    22.0
                  ]
                }
              },
              {
                "box": {
                  "id": "tick",
                  "maxclass": "outlet",
                  "patching_rect": [
                    160.0,
                    1000.0,
                    55.0,
                    22.0
                  ]
                }
              },
              {
                "box": {
                  "id": "load",
                  "maxclass": "outlet",
                  "patching_rect": [
                    290.0,
                    1000.0,
                    55.0,
                    22.0
                  ]
                }
              },
              {
                "box": {
                  "id": "error",
                  "maxclass": "outlet",
                  "patching_rect": [
                    420.0,
                    1000.0,
                    55.0,
                    22.0
                  ]
                }
              },
              {
                "box": {
                  "id": "dump",
                  "maxclass": "outlet",
                  "patching_rect": [
                    550.0,
                    1000.0,
                    55.0,
                    22.0
                  ]
                }
              },
              {
                "box": {
                  "id": "event",
                  "maxclass": "outlet",
                  "patching_rect": [
                    680.0,
                    1000.0,
                    55.0,
                    22.0
                  ]
                }
              },
              {
                "box": {
                  "id": "route",
                  "maxclass": "newobj",
                  "patching_rect": [
                    30.0,
                    70.0,
                    650.0,
                    22.0
                  ],
                  "text": "route tick gain pan api_version base_rate jung_enabled seed slice_count debug_enabled sample_path getstate stop event play retrigger load_apache"
                }
              },
              {
                "box": {
                  "id": "tick_check",
                  "maxclass": "newobj",
                  "patching_rect": [
                    30.0,
                    140.0,
                    100.5,
                    22.0
                  ],
                  "text": "p validate_tick",
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
                      1200.0,
                      850.0
                    ],
                    "openinpresentation": 0,
                    "boxes": [
                      {
                        "box": {
                          "id": "in",
                          "maxclass": "inlet",
                          "patching_rect": [
                            30.0,
                            25.0,
                            55.0,
                            22.0
                          ]
                        }
                      },
                      {
                        "box": {
                          "id": "valid",
                          "maxclass": "outlet",
                          "patching_rect": [
                            30.0,
                            700.0,
                            55.0,
                            22.0
                          ]
                        }
                      },
                      {
                        "box": {
                          "id": "invalid",
                          "maxclass": "outlet",
                          "patching_rect": [
                            300.0,
                            700.0,
                            55.0,
                            22.0
                          ]
                        }
                      },
                      {
                        "box": {
                          "id": "arity",
                          "maxclass": "newobj",
                          "patching_rect": [
                            30.0,
                            65.0,
                            55.0,
                            22.0
                          ],
                          "text": "t l l"
                        }
                      },
                      {
                        "box": {
                          "id": "len",
                          "maxclass": "newobj",
                          "patching_rect": [
                            240.0,
                            105.0,
                            55.0,
                            22.0
                          ],
                          "text": "zl len"
                        }
                      },
                      {
                        "box": {
                          "id": "one",
                          "maxclass": "newobj",
                          "patching_rect": [
                            240.0,
                            145.0,
                            55.0,
                            22.0
                          ],
                          "text": "== 1"
                        }
                      },
                      {
                        "box": {
                          "id": "length_order",
                          "maxclass": "newobj",
                          "patching_rect": [
                            240.0,
                            185.0,
                            55.0,
                            22.0
                          ],
                          "text": "t i i"
                        }
                      },
                      {
                        "box": {
                          "id": "bad_length",
                          "maxclass": "newobj",
                          "patching_rect": [
                            340.0,
                            225.0,
                            55.0,
                            22.0
                          ],
                          "text": "sel 0"
                        }
                      },
                      {
                        "box": {
                          "id": "gate",
                          "maxclass": "newobj",
                          "patching_rect": [
                            30.0,
                            225.0,
                            55.0,
                            22.0
                          ],
                          "text": "gate 1 0"
                        }
                      },
                      {
                        "box": {
                          "id": "type",
                          "maxclass": "newobj",
                          "patching_rect": [
                            30.0,
                            265.0,
                            60.300000000000004,
                            22.0
                          ],
                          "text": "route int"
                        }
                      },
                      {
                        "box": {
                          "id": "store_first",
                          "maxclass": "newobj",
                          "patching_rect": [
                            30.0,
                            305.0,
                            55.0,
                            22.0
                          ],
                          "text": "t i i"
                        }
                      },
                      {
                        "box": {
                          "id": "value",
                          "maxclass": "newobj",
                          "patching_rect": [
                            30.0,
                            445.0,
                            55.0,
                            22.0
                          ],
                          "text": "int"
                        }
                      },
                      {
                        "box": {
                          "id": "predicate",
                          "maxclass": "newobj",
                          "patching_rect": [
                            220.0,
                            345.0,
                            87.10000000000001,
                            22.0
                          ],
                          "text": "expr $i1 >= 0"
                        }
                      },
                      {
                        "box": {
                          "id": "verdict",
                          "maxclass": "newobj",
                          "patching_rect": [
                            220.0,
                            395.0,
                            55.0,
                            22.0
                          ],
                          "text": "sel 1 0"
                        }
                      },
                      {
                        "box": {
                          "id": "note",
                          "maxclass": "comment",
                          "patching_rect": [
                            30.0,
                            760.0,
                            502.5,
                            22.0
                          ],
                          "text": "Exactly one typed atom; reject before coercion; finite numeric values only."
                        }
                      }
                    ],
                    "lines": [
                      {
                        "patchline": {
                          "source": [
                            "in",
                            0
                          ],
                          "destination": [
                            "arity",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "arity",
                            1
                          ],
                          "destination": [
                            "len",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "len",
                            0
                          ],
                          "destination": [
                            "one",
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
                            "length_order",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "length_order",
                            1
                          ],
                          "destination": [
                            "gate",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "length_order",
                            0
                          ],
                          "destination": [
                            "bad_length",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "bad_length",
                            0
                          ],
                          "destination": [
                            "invalid",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "arity",
                            0
                          ],
                          "destination": [
                            "gate",
                            1
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "gate",
                            0
                          ],
                          "destination": [
                            "type",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "type",
                            0
                          ],
                          "destination": [
                            "store_first",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "type",
                            1
                          ],
                          "destination": [
                            "invalid",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "store_first",
                            1
                          ],
                          "destination": [
                            "value",
                            1
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "store_first",
                            0
                          ],
                          "destination": [
                            "predicate",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "predicate",
                            0
                          ],
                          "destination": [
                            "verdict",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "verdict",
                            0
                          ],
                          "destination": [
                            "value",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "verdict",
                            1
                          ],
                          "destination": [
                            "invalid",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "value",
                            0
                          ],
                          "destination": [
                            "valid",
                            0
                          ]
                        }
                      }
                    ]
                  }
                }
              },
              {
                "box": {
                  "id": "tick_error",
                  "maxclass": "message",
                  "patching_rect": [
                    160.0,
                    225.0,
                    120.60000000000001,
                    22.0
                  ],
                  "text": "error invalid_tick"
                }
              },
              {
                "box": {
                  "id": "tick_label",
                  "maxclass": "newobj",
                  "patching_rect": [
                    30.0,
                    185.0,
                    80.4,
                    22.0
                  ],
                  "text": "prepend tick"
                }
              },
              {
                "box": {
                  "id": "gain_check",
                  "maxclass": "newobj",
                  "patching_rect": [
                    410.0,
                    140.0,
                    100.5,
                    22.0
                  ],
                  "text": "p validate_gain",
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
                      1200.0,
                      850.0
                    ],
                    "openinpresentation": 0,
                    "boxes": [
                      {
                        "box": {
                          "id": "in",
                          "maxclass": "inlet",
                          "patching_rect": [
                            30.0,
                            25.0,
                            55.0,
                            22.0
                          ]
                        }
                      },
                      {
                        "box": {
                          "id": "valid",
                          "maxclass": "outlet",
                          "patching_rect": [
                            30.0,
                            700.0,
                            55.0,
                            22.0
                          ]
                        }
                      },
                      {
                        "box": {
                          "id": "invalid",
                          "maxclass": "outlet",
                          "patching_rect": [
                            300.0,
                            700.0,
                            55.0,
                            22.0
                          ]
                        }
                      },
                      {
                        "box": {
                          "id": "arity",
                          "maxclass": "newobj",
                          "patching_rect": [
                            30.0,
                            65.0,
                            55.0,
                            22.0
                          ],
                          "text": "t l l"
                        }
                      },
                      {
                        "box": {
                          "id": "len",
                          "maxclass": "newobj",
                          "patching_rect": [
                            240.0,
                            105.0,
                            55.0,
                            22.0
                          ],
                          "text": "zl len"
                        }
                      },
                      {
                        "box": {
                          "id": "one",
                          "maxclass": "newobj",
                          "patching_rect": [
                            240.0,
                            145.0,
                            55.0,
                            22.0
                          ],
                          "text": "== 1"
                        }
                      },
                      {
                        "box": {
                          "id": "length_order",
                          "maxclass": "newobj",
                          "patching_rect": [
                            240.0,
                            185.0,
                            55.0,
                            22.0
                          ],
                          "text": "t i i"
                        }
                      },
                      {
                        "box": {
                          "id": "bad_length",
                          "maxclass": "newobj",
                          "patching_rect": [
                            340.0,
                            225.0,
                            55.0,
                            22.0
                          ],
                          "text": "sel 0"
                        }
                      },
                      {
                        "box": {
                          "id": "gate",
                          "maxclass": "newobj",
                          "patching_rect": [
                            30.0,
                            225.0,
                            55.0,
                            22.0
                          ],
                          "text": "gate 1 0"
                        }
                      },
                      {
                        "box": {
                          "id": "type",
                          "maxclass": "newobj",
                          "patching_rect": [
                            30.0,
                            265.0,
                            100.5,
                            22.0
                          ],
                          "text": "route int float"
                        }
                      },
                      {
                        "box": {
                          "id": "store_first",
                          "maxclass": "newobj",
                          "patching_rect": [
                            30.0,
                            305.0,
                            55.0,
                            22.0
                          ],
                          "text": "t f f"
                        }
                      },
                      {
                        "box": {
                          "id": "value",
                          "maxclass": "newobj",
                          "patching_rect": [
                            30.0,
                            445.0,
                            55.0,
                            22.0
                          ],
                          "text": "float"
                        }
                      },
                      {
                        "box": {
                          "id": "predicate",
                          "maxclass": "newobj",
                          "patching_rect": [
                            220.0,
                            345.0,
                            207.70000000000002,
                            22.0
                          ],
                          "text": "expr (($f1 - $f1) == 0.) && (1)"
                        }
                      },
                      {
                        "box": {
                          "id": "verdict",
                          "maxclass": "newobj",
                          "patching_rect": [
                            220.0,
                            395.0,
                            55.0,
                            22.0
                          ],
                          "text": "sel 1 0"
                        }
                      },
                      {
                        "box": {
                          "id": "note",
                          "maxclass": "comment",
                          "patching_rect": [
                            30.0,
                            760.0,
                            502.5,
                            22.0
                          ],
                          "text": "Exactly one typed atom; reject before coercion; finite numeric values only."
                        }
                      }
                    ],
                    "lines": [
                      {
                        "patchline": {
                          "source": [
                            "in",
                            0
                          ],
                          "destination": [
                            "arity",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "arity",
                            1
                          ],
                          "destination": [
                            "len",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "len",
                            0
                          ],
                          "destination": [
                            "one",
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
                            "length_order",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "length_order",
                            1
                          ],
                          "destination": [
                            "gate",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "length_order",
                            0
                          ],
                          "destination": [
                            "bad_length",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "bad_length",
                            0
                          ],
                          "destination": [
                            "invalid",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "arity",
                            0
                          ],
                          "destination": [
                            "gate",
                            1
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "gate",
                            0
                          ],
                          "destination": [
                            "type",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "type",
                            0
                          ],
                          "destination": [
                            "store_first",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "type",
                            2
                          ],
                          "destination": [
                            "invalid",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "store_first",
                            1
                          ],
                          "destination": [
                            "value",
                            1
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "store_first",
                            0
                          ],
                          "destination": [
                            "predicate",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "predicate",
                            0
                          ],
                          "destination": [
                            "verdict",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "verdict",
                            0
                          ],
                          "destination": [
                            "value",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "verdict",
                            1
                          ],
                          "destination": [
                            "invalid",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "value",
                            0
                          ],
                          "destination": [
                            "valid",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "type",
                            1
                          ],
                          "destination": [
                            "store_first",
                            0
                          ]
                        }
                      }
                    ]
                  }
                }
              },
              {
                "box": {
                  "id": "gain_error",
                  "maxclass": "message",
                  "patching_rect": [
                    540.0,
                    225.0,
                    120.60000000000001,
                    22.0
                  ],
                  "text": "error invalid_gain"
                }
              },
              {
                "box": {
                  "id": "gain_clip",
                  "maxclass": "newobj",
                  "patching_rect": [
                    410.0,
                    185.0,
                    67.0,
                    22.0
                  ],
                  "text": "clip 0. 1."
                }
              },
              {
                "box": {
                  "id": "gain_replace",
                  "maxclass": "newobj",
                  "patching_rect": [
                    410.0,
                    260.0,
                    134.0,
                    22.0
                  ],
                  "text": "prepend replace gain"
                }
              },
              {
                "box": {
                  "id": "pan_check",
                  "maxclass": "newobj",
                  "patching_rect": [
                    790.0,
                    140.0,
                    93.8,
                    22.0
                  ],
                  "text": "p validate_pan",
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
                      1200.0,
                      850.0
                    ],
                    "openinpresentation": 0,
                    "boxes": [
                      {
                        "box": {
                          "id": "in",
                          "maxclass": "inlet",
                          "patching_rect": [
                            30.0,
                            25.0,
                            55.0,
                            22.0
                          ]
                        }
                      },
                      {
                        "box": {
                          "id": "valid",
                          "maxclass": "outlet",
                          "patching_rect": [
                            30.0,
                            700.0,
                            55.0,
                            22.0
                          ]
                        }
                      },
                      {
                        "box": {
                          "id": "invalid",
                          "maxclass": "outlet",
                          "patching_rect": [
                            300.0,
                            700.0,
                            55.0,
                            22.0
                          ]
                        }
                      },
                      {
                        "box": {
                          "id": "arity",
                          "maxclass": "newobj",
                          "patching_rect": [
                            30.0,
                            65.0,
                            55.0,
                            22.0
                          ],
                          "text": "t l l"
                        }
                      },
                      {
                        "box": {
                          "id": "len",
                          "maxclass": "newobj",
                          "patching_rect": [
                            240.0,
                            105.0,
                            55.0,
                            22.0
                          ],
                          "text": "zl len"
                        }
                      },
                      {
                        "box": {
                          "id": "one",
                          "maxclass": "newobj",
                          "patching_rect": [
                            240.0,
                            145.0,
                            55.0,
                            22.0
                          ],
                          "text": "== 1"
                        }
                      },
                      {
                        "box": {
                          "id": "length_order",
                          "maxclass": "newobj",
                          "patching_rect": [
                            240.0,
                            185.0,
                            55.0,
                            22.0
                          ],
                          "text": "t i i"
                        }
                      },
                      {
                        "box": {
                          "id": "bad_length",
                          "maxclass": "newobj",
                          "patching_rect": [
                            340.0,
                            225.0,
                            55.0,
                            22.0
                          ],
                          "text": "sel 0"
                        }
                      },
                      {
                        "box": {
                          "id": "gate",
                          "maxclass": "newobj",
                          "patching_rect": [
                            30.0,
                            225.0,
                            55.0,
                            22.0
                          ],
                          "text": "gate 1 0"
                        }
                      },
                      {
                        "box": {
                          "id": "type",
                          "maxclass": "newobj",
                          "patching_rect": [
                            30.0,
                            265.0,
                            100.5,
                            22.0
                          ],
                          "text": "route int float"
                        }
                      },
                      {
                        "box": {
                          "id": "store_first",
                          "maxclass": "newobj",
                          "patching_rect": [
                            30.0,
                            305.0,
                            55.0,
                            22.0
                          ],
                          "text": "t f f"
                        }
                      },
                      {
                        "box": {
                          "id": "value",
                          "maxclass": "newobj",
                          "patching_rect": [
                            30.0,
                            445.0,
                            55.0,
                            22.0
                          ],
                          "text": "float"
                        }
                      },
                      {
                        "box": {
                          "id": "predicate",
                          "maxclass": "newobj",
                          "patching_rect": [
                            220.0,
                            345.0,
                            207.70000000000002,
                            22.0
                          ],
                          "text": "expr (($f1 - $f1) == 0.) && (1)"
                        }
                      },
                      {
                        "box": {
                          "id": "verdict",
                          "maxclass": "newobj",
                          "patching_rect": [
                            220.0,
                            395.0,
                            55.0,
                            22.0
                          ],
                          "text": "sel 1 0"
                        }
                      },
                      {
                        "box": {
                          "id": "note",
                          "maxclass": "comment",
                          "patching_rect": [
                            30.0,
                            760.0,
                            502.5,
                            22.0
                          ],
                          "text": "Exactly one typed atom; reject before coercion; finite numeric values only."
                        }
                      }
                    ],
                    "lines": [
                      {
                        "patchline": {
                          "source": [
                            "in",
                            0
                          ],
                          "destination": [
                            "arity",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "arity",
                            1
                          ],
                          "destination": [
                            "len",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "len",
                            0
                          ],
                          "destination": [
                            "one",
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
                            "length_order",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "length_order",
                            1
                          ],
                          "destination": [
                            "gate",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "length_order",
                            0
                          ],
                          "destination": [
                            "bad_length",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "bad_length",
                            0
                          ],
                          "destination": [
                            "invalid",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "arity",
                            0
                          ],
                          "destination": [
                            "gate",
                            1
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "gate",
                            0
                          ],
                          "destination": [
                            "type",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "type",
                            0
                          ],
                          "destination": [
                            "store_first",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "type",
                            2
                          ],
                          "destination": [
                            "invalid",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "store_first",
                            1
                          ],
                          "destination": [
                            "value",
                            1
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "store_first",
                            0
                          ],
                          "destination": [
                            "predicate",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "predicate",
                            0
                          ],
                          "destination": [
                            "verdict",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "verdict",
                            0
                          ],
                          "destination": [
                            "value",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "verdict",
                            1
                          ],
                          "destination": [
                            "invalid",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "value",
                            0
                          ],
                          "destination": [
                            "valid",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "type",
                            1
                          ],
                          "destination": [
                            "store_first",
                            0
                          ]
                        }
                      }
                    ]
                  }
                }
              },
              {
                "box": {
                  "id": "pan_error",
                  "maxclass": "message",
                  "patching_rect": [
                    920.0,
                    225.0,
                    113.9,
                    22.0
                  ],
                  "text": "error invalid_pan"
                }
              },
              {
                "box": {
                  "id": "pan_clip",
                  "maxclass": "newobj",
                  "patching_rect": [
                    790.0,
                    185.0,
                    73.7,
                    22.0
                  ],
                  "text": "clip -1. 1."
                }
              },
              {
                "box": {
                  "id": "pan_replace",
                  "maxclass": "newobj",
                  "patching_rect": [
                    790.0,
                    260.0,
                    127.3,
                    22.0
                  ],
                  "text": "prepend replace pan"
                }
              },
              {
                "box": {
                  "id": "api_version_check",
                  "maxclass": "newobj",
                  "patching_rect": [
                    30.0,
                    350.0,
                    147.4,
                    22.0
                  ],
                  "text": "p validate_api_version",
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
                      1200.0,
                      850.0
                    ],
                    "openinpresentation": 0,
                    "boxes": [
                      {
                        "box": {
                          "id": "in",
                          "maxclass": "inlet",
                          "patching_rect": [
                            30.0,
                            25.0,
                            55.0,
                            22.0
                          ]
                        }
                      },
                      {
                        "box": {
                          "id": "valid",
                          "maxclass": "outlet",
                          "patching_rect": [
                            30.0,
                            700.0,
                            55.0,
                            22.0
                          ]
                        }
                      },
                      {
                        "box": {
                          "id": "invalid",
                          "maxclass": "outlet",
                          "patching_rect": [
                            300.0,
                            700.0,
                            55.0,
                            22.0
                          ]
                        }
                      },
                      {
                        "box": {
                          "id": "arity",
                          "maxclass": "newobj",
                          "patching_rect": [
                            30.0,
                            65.0,
                            55.0,
                            22.0
                          ],
                          "text": "t l l"
                        }
                      },
                      {
                        "box": {
                          "id": "len",
                          "maxclass": "newobj",
                          "patching_rect": [
                            240.0,
                            105.0,
                            55.0,
                            22.0
                          ],
                          "text": "zl len"
                        }
                      },
                      {
                        "box": {
                          "id": "one",
                          "maxclass": "newobj",
                          "patching_rect": [
                            240.0,
                            145.0,
                            55.0,
                            22.0
                          ],
                          "text": "== 1"
                        }
                      },
                      {
                        "box": {
                          "id": "length_order",
                          "maxclass": "newobj",
                          "patching_rect": [
                            240.0,
                            185.0,
                            55.0,
                            22.0
                          ],
                          "text": "t i i"
                        }
                      },
                      {
                        "box": {
                          "id": "bad_length",
                          "maxclass": "newobj",
                          "patching_rect": [
                            340.0,
                            225.0,
                            55.0,
                            22.0
                          ],
                          "text": "sel 0"
                        }
                      },
                      {
                        "box": {
                          "id": "gate",
                          "maxclass": "newobj",
                          "patching_rect": [
                            30.0,
                            225.0,
                            55.0,
                            22.0
                          ],
                          "text": "gate 1 0"
                        }
                      },
                      {
                        "box": {
                          "id": "type",
                          "maxclass": "newobj",
                          "patching_rect": [
                            30.0,
                            265.0,
                            60.300000000000004,
                            22.0
                          ],
                          "text": "route int"
                        }
                      },
                      {
                        "box": {
                          "id": "store_first",
                          "maxclass": "newobj",
                          "patching_rect": [
                            30.0,
                            305.0,
                            55.0,
                            22.0
                          ],
                          "text": "t i i"
                        }
                      },
                      {
                        "box": {
                          "id": "value",
                          "maxclass": "newobj",
                          "patching_rect": [
                            30.0,
                            445.0,
                            55.0,
                            22.0
                          ],
                          "text": "int"
                        }
                      },
                      {
                        "box": {
                          "id": "predicate",
                          "maxclass": "newobj",
                          "patching_rect": [
                            220.0,
                            345.0,
                            87.10000000000001,
                            22.0
                          ],
                          "text": "expr $i1 == 1"
                        }
                      },
                      {
                        "box": {
                          "id": "verdict",
                          "maxclass": "newobj",
                          "patching_rect": [
                            220.0,
                            395.0,
                            55.0,
                            22.0
                          ],
                          "text": "sel 1 0"
                        }
                      },
                      {
                        "box": {
                          "id": "note",
                          "maxclass": "comment",
                          "patching_rect": [
                            30.0,
                            760.0,
                            502.5,
                            22.0
                          ],
                          "text": "Exactly one typed atom; reject before coercion; finite numeric values only."
                        }
                      }
                    ],
                    "lines": [
                      {
                        "patchline": {
                          "source": [
                            "in",
                            0
                          ],
                          "destination": [
                            "arity",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "arity",
                            1
                          ],
                          "destination": [
                            "len",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "len",
                            0
                          ],
                          "destination": [
                            "one",
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
                            "length_order",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "length_order",
                            1
                          ],
                          "destination": [
                            "gate",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "length_order",
                            0
                          ],
                          "destination": [
                            "bad_length",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "bad_length",
                            0
                          ],
                          "destination": [
                            "invalid",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "arity",
                            0
                          ],
                          "destination": [
                            "gate",
                            1
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "gate",
                            0
                          ],
                          "destination": [
                            "type",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "type",
                            0
                          ],
                          "destination": [
                            "store_first",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "type",
                            1
                          ],
                          "destination": [
                            "invalid",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "store_first",
                            1
                          ],
                          "destination": [
                            "value",
                            1
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "store_first",
                            0
                          ],
                          "destination": [
                            "predicate",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "predicate",
                            0
                          ],
                          "destination": [
                            "verdict",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "verdict",
                            0
                          ],
                          "destination": [
                            "value",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "verdict",
                            1
                          ],
                          "destination": [
                            "invalid",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "value",
                            0
                          ],
                          "destination": [
                            "valid",
                            0
                          ]
                        }
                      }
                    ]
                  }
                }
              },
              {
                "box": {
                  "id": "api_version_error",
                  "maxclass": "message",
                  "patching_rect": [
                    160.0,
                    435.0,
                    167.5,
                    22.0
                  ],
                  "text": "error invalid_api_version"
                }
              },
              {
                "box": {
                  "id": "api_version_replace",
                  "maxclass": "newobj",
                  "patching_rect": [
                    30.0,
                    470.0,
                    180.9,
                    22.0
                  ],
                  "text": "prepend replace api_version"
                }
              },
              {
                "box": {
                  "id": "base_rate_check",
                  "maxclass": "newobj",
                  "patching_rect": [
                    410.0,
                    350.0,
                    134.0,
                    22.0
                  ],
                  "text": "p validate_base_rate",
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
                      1200.0,
                      850.0
                    ],
                    "openinpresentation": 0,
                    "boxes": [
                      {
                        "box": {
                          "id": "in",
                          "maxclass": "inlet",
                          "patching_rect": [
                            30.0,
                            25.0,
                            55.0,
                            22.0
                          ]
                        }
                      },
                      {
                        "box": {
                          "id": "valid",
                          "maxclass": "outlet",
                          "patching_rect": [
                            30.0,
                            700.0,
                            55.0,
                            22.0
                          ]
                        }
                      },
                      {
                        "box": {
                          "id": "invalid",
                          "maxclass": "outlet",
                          "patching_rect": [
                            300.0,
                            700.0,
                            55.0,
                            22.0
                          ]
                        }
                      },
                      {
                        "box": {
                          "id": "arity",
                          "maxclass": "newobj",
                          "patching_rect": [
                            30.0,
                            65.0,
                            55.0,
                            22.0
                          ],
                          "text": "t l l"
                        }
                      },
                      {
                        "box": {
                          "id": "len",
                          "maxclass": "newobj",
                          "patching_rect": [
                            240.0,
                            105.0,
                            55.0,
                            22.0
                          ],
                          "text": "zl len"
                        }
                      },
                      {
                        "box": {
                          "id": "one",
                          "maxclass": "newobj",
                          "patching_rect": [
                            240.0,
                            145.0,
                            55.0,
                            22.0
                          ],
                          "text": "== 1"
                        }
                      },
                      {
                        "box": {
                          "id": "length_order",
                          "maxclass": "newobj",
                          "patching_rect": [
                            240.0,
                            185.0,
                            55.0,
                            22.0
                          ],
                          "text": "t i i"
                        }
                      },
                      {
                        "box": {
                          "id": "bad_length",
                          "maxclass": "newobj",
                          "patching_rect": [
                            340.0,
                            225.0,
                            55.0,
                            22.0
                          ],
                          "text": "sel 0"
                        }
                      },
                      {
                        "box": {
                          "id": "gate",
                          "maxclass": "newobj",
                          "patching_rect": [
                            30.0,
                            225.0,
                            55.0,
                            22.0
                          ],
                          "text": "gate 1 0"
                        }
                      },
                      {
                        "box": {
                          "id": "type",
                          "maxclass": "newobj",
                          "patching_rect": [
                            30.0,
                            265.0,
                            100.5,
                            22.0
                          ],
                          "text": "route int float"
                        }
                      },
                      {
                        "box": {
                          "id": "store_first",
                          "maxclass": "newobj",
                          "patching_rect": [
                            30.0,
                            305.0,
                            55.0,
                            22.0
                          ],
                          "text": "t f f"
                        }
                      },
                      {
                        "box": {
                          "id": "value",
                          "maxclass": "newobj",
                          "patching_rect": [
                            30.0,
                            445.0,
                            55.0,
                            22.0
                          ],
                          "text": "float"
                        }
                      },
                      {
                        "box": {
                          "id": "predicate",
                          "maxclass": "newobj",
                          "patching_rect": [
                            220.0,
                            345.0,
                            254.6,
                            22.0
                          ],
                          "text": "expr (($f1 - $f1) == 0.) && ($f1 > 0.)"
                        }
                      },
                      {
                        "box": {
                          "id": "verdict",
                          "maxclass": "newobj",
                          "patching_rect": [
                            220.0,
                            395.0,
                            55.0,
                            22.0
                          ],
                          "text": "sel 1 0"
                        }
                      },
                      {
                        "box": {
                          "id": "note",
                          "maxclass": "comment",
                          "patching_rect": [
                            30.0,
                            760.0,
                            502.5,
                            22.0
                          ],
                          "text": "Exactly one typed atom; reject before coercion; finite numeric values only."
                        }
                      }
                    ],
                    "lines": [
                      {
                        "patchline": {
                          "source": [
                            "in",
                            0
                          ],
                          "destination": [
                            "arity",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "arity",
                            1
                          ],
                          "destination": [
                            "len",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "len",
                            0
                          ],
                          "destination": [
                            "one",
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
                            "length_order",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "length_order",
                            1
                          ],
                          "destination": [
                            "gate",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "length_order",
                            0
                          ],
                          "destination": [
                            "bad_length",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "bad_length",
                            0
                          ],
                          "destination": [
                            "invalid",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "arity",
                            0
                          ],
                          "destination": [
                            "gate",
                            1
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "gate",
                            0
                          ],
                          "destination": [
                            "type",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "type",
                            0
                          ],
                          "destination": [
                            "store_first",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "type",
                            2
                          ],
                          "destination": [
                            "invalid",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "store_first",
                            1
                          ],
                          "destination": [
                            "value",
                            1
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "store_first",
                            0
                          ],
                          "destination": [
                            "predicate",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "predicate",
                            0
                          ],
                          "destination": [
                            "verdict",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "verdict",
                            0
                          ],
                          "destination": [
                            "value",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "verdict",
                            1
                          ],
                          "destination": [
                            "invalid",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "value",
                            0
                          ],
                          "destination": [
                            "valid",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "type",
                            1
                          ],
                          "destination": [
                            "store_first",
                            0
                          ]
                        }
                      }
                    ]
                  }
                }
              },
              {
                "box": {
                  "id": "base_rate_error",
                  "maxclass": "message",
                  "patching_rect": [
                    540.0,
                    435.0,
                    154.1,
                    22.0
                  ],
                  "text": "error invalid_base_rate"
                }
              },
              {
                "box": {
                  "id": "base_rate_replace",
                  "maxclass": "newobj",
                  "patching_rect": [
                    410.0,
                    470.0,
                    167.5,
                    22.0
                  ],
                  "text": "prepend replace base_rate"
                }
              },
              {
                "box": {
                  "id": "jung_enabled_check",
                  "maxclass": "newobj",
                  "patching_rect": [
                    790.0,
                    350.0,
                    154.1,
                    22.0
                  ],
                  "text": "p validate_jung_enabled",
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
                      1200.0,
                      850.0
                    ],
                    "openinpresentation": 0,
                    "boxes": [
                      {
                        "box": {
                          "id": "in",
                          "maxclass": "inlet",
                          "patching_rect": [
                            30.0,
                            25.0,
                            55.0,
                            22.0
                          ]
                        }
                      },
                      {
                        "box": {
                          "id": "valid",
                          "maxclass": "outlet",
                          "patching_rect": [
                            30.0,
                            700.0,
                            55.0,
                            22.0
                          ]
                        }
                      },
                      {
                        "box": {
                          "id": "invalid",
                          "maxclass": "outlet",
                          "patching_rect": [
                            300.0,
                            700.0,
                            55.0,
                            22.0
                          ]
                        }
                      },
                      {
                        "box": {
                          "id": "arity",
                          "maxclass": "newobj",
                          "patching_rect": [
                            30.0,
                            65.0,
                            55.0,
                            22.0
                          ],
                          "text": "t l l"
                        }
                      },
                      {
                        "box": {
                          "id": "len",
                          "maxclass": "newobj",
                          "patching_rect": [
                            240.0,
                            105.0,
                            55.0,
                            22.0
                          ],
                          "text": "zl len"
                        }
                      },
                      {
                        "box": {
                          "id": "one",
                          "maxclass": "newobj",
                          "patching_rect": [
                            240.0,
                            145.0,
                            55.0,
                            22.0
                          ],
                          "text": "== 1"
                        }
                      },
                      {
                        "box": {
                          "id": "length_order",
                          "maxclass": "newobj",
                          "patching_rect": [
                            240.0,
                            185.0,
                            55.0,
                            22.0
                          ],
                          "text": "t i i"
                        }
                      },
                      {
                        "box": {
                          "id": "bad_length",
                          "maxclass": "newobj",
                          "patching_rect": [
                            340.0,
                            225.0,
                            55.0,
                            22.0
                          ],
                          "text": "sel 0"
                        }
                      },
                      {
                        "box": {
                          "id": "gate",
                          "maxclass": "newobj",
                          "patching_rect": [
                            30.0,
                            225.0,
                            55.0,
                            22.0
                          ],
                          "text": "gate 1 0"
                        }
                      },
                      {
                        "box": {
                          "id": "type",
                          "maxclass": "newobj",
                          "patching_rect": [
                            30.0,
                            265.0,
                            60.300000000000004,
                            22.0
                          ],
                          "text": "route int"
                        }
                      },
                      {
                        "box": {
                          "id": "store_first",
                          "maxclass": "newobj",
                          "patching_rect": [
                            30.0,
                            305.0,
                            55.0,
                            22.0
                          ],
                          "text": "t i i"
                        }
                      },
                      {
                        "box": {
                          "id": "value",
                          "maxclass": "newobj",
                          "patching_rect": [
                            30.0,
                            445.0,
                            55.0,
                            22.0
                          ],
                          "text": "int"
                        }
                      },
                      {
                        "box": {
                          "id": "predicate",
                          "maxclass": "newobj",
                          "patching_rect": [
                            220.0,
                            345.0,
                            87.10000000000001,
                            22.0
                          ],
                          "text": "expr $i1 == 0"
                        }
                      },
                      {
                        "box": {
                          "id": "verdict",
                          "maxclass": "newobj",
                          "patching_rect": [
                            220.0,
                            395.0,
                            55.0,
                            22.0
                          ],
                          "text": "sel 1 0"
                        }
                      },
                      {
                        "box": {
                          "id": "note",
                          "maxclass": "comment",
                          "patching_rect": [
                            30.0,
                            760.0,
                            502.5,
                            22.0
                          ],
                          "text": "Exactly one typed atom; reject before coercion; finite numeric values only."
                        }
                      }
                    ],
                    "lines": [
                      {
                        "patchline": {
                          "source": [
                            "in",
                            0
                          ],
                          "destination": [
                            "arity",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "arity",
                            1
                          ],
                          "destination": [
                            "len",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "len",
                            0
                          ],
                          "destination": [
                            "one",
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
                            "length_order",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "length_order",
                            1
                          ],
                          "destination": [
                            "gate",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "length_order",
                            0
                          ],
                          "destination": [
                            "bad_length",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "bad_length",
                            0
                          ],
                          "destination": [
                            "invalid",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "arity",
                            0
                          ],
                          "destination": [
                            "gate",
                            1
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "gate",
                            0
                          ],
                          "destination": [
                            "type",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "type",
                            0
                          ],
                          "destination": [
                            "store_first",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "type",
                            1
                          ],
                          "destination": [
                            "invalid",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "store_first",
                            1
                          ],
                          "destination": [
                            "value",
                            1
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "store_first",
                            0
                          ],
                          "destination": [
                            "predicate",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "predicate",
                            0
                          ],
                          "destination": [
                            "verdict",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "verdict",
                            0
                          ],
                          "destination": [
                            "value",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "verdict",
                            1
                          ],
                          "destination": [
                            "invalid",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "value",
                            0
                          ],
                          "destination": [
                            "valid",
                            0
                          ]
                        }
                      }
                    ]
                  }
                }
              },
              {
                "box": {
                  "id": "jung_enabled_error",
                  "maxclass": "message",
                  "patching_rect": [
                    920.0,
                    435.0,
                    174.20000000000002,
                    22.0
                  ],
                  "text": "error invalid_jung_enabled"
                }
              },
              {
                "box": {
                  "id": "jung_enabled_replace",
                  "maxclass": "newobj",
                  "patching_rect": [
                    790.0,
                    470.0,
                    187.6,
                    22.0
                  ],
                  "text": "prepend replace jung_enabled"
                }
              },
              {
                "box": {
                  "id": "seed_check",
                  "maxclass": "newobj",
                  "patching_rect": [
                    30.0,
                    560.0,
                    100.5,
                    22.0
                  ],
                  "text": "p validate_seed",
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
                      1200.0,
                      850.0
                    ],
                    "openinpresentation": 0,
                    "boxes": [
                      {
                        "box": {
                          "id": "in",
                          "maxclass": "inlet",
                          "patching_rect": [
                            30.0,
                            25.0,
                            55.0,
                            22.0
                          ]
                        }
                      },
                      {
                        "box": {
                          "id": "valid",
                          "maxclass": "outlet",
                          "patching_rect": [
                            30.0,
                            700.0,
                            55.0,
                            22.0
                          ]
                        }
                      },
                      {
                        "box": {
                          "id": "invalid",
                          "maxclass": "outlet",
                          "patching_rect": [
                            300.0,
                            700.0,
                            55.0,
                            22.0
                          ]
                        }
                      },
                      {
                        "box": {
                          "id": "arity",
                          "maxclass": "newobj",
                          "patching_rect": [
                            30.0,
                            65.0,
                            55.0,
                            22.0
                          ],
                          "text": "t l l"
                        }
                      },
                      {
                        "box": {
                          "id": "len",
                          "maxclass": "newobj",
                          "patching_rect": [
                            240.0,
                            105.0,
                            55.0,
                            22.0
                          ],
                          "text": "zl len"
                        }
                      },
                      {
                        "box": {
                          "id": "one",
                          "maxclass": "newobj",
                          "patching_rect": [
                            240.0,
                            145.0,
                            55.0,
                            22.0
                          ],
                          "text": "== 1"
                        }
                      },
                      {
                        "box": {
                          "id": "length_order",
                          "maxclass": "newobj",
                          "patching_rect": [
                            240.0,
                            185.0,
                            55.0,
                            22.0
                          ],
                          "text": "t i i"
                        }
                      },
                      {
                        "box": {
                          "id": "bad_length",
                          "maxclass": "newobj",
                          "patching_rect": [
                            340.0,
                            225.0,
                            55.0,
                            22.0
                          ],
                          "text": "sel 0"
                        }
                      },
                      {
                        "box": {
                          "id": "gate",
                          "maxclass": "newobj",
                          "patching_rect": [
                            30.0,
                            225.0,
                            55.0,
                            22.0
                          ],
                          "text": "gate 1 0"
                        }
                      },
                      {
                        "box": {
                          "id": "type",
                          "maxclass": "newobj",
                          "patching_rect": [
                            30.0,
                            265.0,
                            60.300000000000004,
                            22.0
                          ],
                          "text": "route int"
                        }
                      },
                      {
                        "box": {
                          "id": "store_first",
                          "maxclass": "newobj",
                          "patching_rect": [
                            30.0,
                            305.0,
                            55.0,
                            22.0
                          ],
                          "text": "t i i"
                        }
                      },
                      {
                        "box": {
                          "id": "value",
                          "maxclass": "newobj",
                          "patching_rect": [
                            30.0,
                            445.0,
                            55.0,
                            22.0
                          ],
                          "text": "int"
                        }
                      },
                      {
                        "box": {
                          "id": "predicate",
                          "maxclass": "newobj",
                          "patching_rect": [
                            220.0,
                            345.0,
                            55.0,
                            22.0
                          ],
                          "text": "expr 1"
                        }
                      },
                      {
                        "box": {
                          "id": "verdict",
                          "maxclass": "newobj",
                          "patching_rect": [
                            220.0,
                            395.0,
                            55.0,
                            22.0
                          ],
                          "text": "sel 1 0"
                        }
                      },
                      {
                        "box": {
                          "id": "note",
                          "maxclass": "comment",
                          "patching_rect": [
                            30.0,
                            760.0,
                            502.5,
                            22.0
                          ],
                          "text": "Exactly one typed atom; reject before coercion; finite numeric values only."
                        }
                      }
                    ],
                    "lines": [
                      {
                        "patchline": {
                          "source": [
                            "in",
                            0
                          ],
                          "destination": [
                            "arity",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "arity",
                            1
                          ],
                          "destination": [
                            "len",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "len",
                            0
                          ],
                          "destination": [
                            "one",
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
                            "length_order",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "length_order",
                            1
                          ],
                          "destination": [
                            "gate",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "length_order",
                            0
                          ],
                          "destination": [
                            "bad_length",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "bad_length",
                            0
                          ],
                          "destination": [
                            "invalid",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "arity",
                            0
                          ],
                          "destination": [
                            "gate",
                            1
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "gate",
                            0
                          ],
                          "destination": [
                            "type",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "type",
                            0
                          ],
                          "destination": [
                            "store_first",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "type",
                            1
                          ],
                          "destination": [
                            "invalid",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "store_first",
                            1
                          ],
                          "destination": [
                            "value",
                            1
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "store_first",
                            0
                          ],
                          "destination": [
                            "predicate",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "predicate",
                            0
                          ],
                          "destination": [
                            "verdict",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "verdict",
                            0
                          ],
                          "destination": [
                            "value",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "verdict",
                            1
                          ],
                          "destination": [
                            "invalid",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "value",
                            0
                          ],
                          "destination": [
                            "valid",
                            0
                          ]
                        }
                      }
                    ]
                  }
                }
              },
              {
                "box": {
                  "id": "seed_error",
                  "maxclass": "message",
                  "patching_rect": [
                    160.0,
                    645.0,
                    120.60000000000001,
                    22.0
                  ],
                  "text": "error invalid_seed"
                }
              },
              {
                "box": {
                  "id": "seed_replace",
                  "maxclass": "newobj",
                  "patching_rect": [
                    30.0,
                    680.0,
                    134.0,
                    22.0
                  ],
                  "text": "prepend replace seed"
                }
              },
              {
                "box": {
                  "id": "slice_count_check",
                  "maxclass": "newobj",
                  "patching_rect": [
                    410.0,
                    560.0,
                    147.4,
                    22.0
                  ],
                  "text": "p validate_slice_count",
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
                      1200.0,
                      850.0
                    ],
                    "openinpresentation": 0,
                    "boxes": [
                      {
                        "box": {
                          "id": "in",
                          "maxclass": "inlet",
                          "patching_rect": [
                            30.0,
                            25.0,
                            55.0,
                            22.0
                          ]
                        }
                      },
                      {
                        "box": {
                          "id": "valid",
                          "maxclass": "outlet",
                          "patching_rect": [
                            30.0,
                            700.0,
                            55.0,
                            22.0
                          ]
                        }
                      },
                      {
                        "box": {
                          "id": "invalid",
                          "maxclass": "outlet",
                          "patching_rect": [
                            300.0,
                            700.0,
                            55.0,
                            22.0
                          ]
                        }
                      },
                      {
                        "box": {
                          "id": "arity",
                          "maxclass": "newobj",
                          "patching_rect": [
                            30.0,
                            65.0,
                            55.0,
                            22.0
                          ],
                          "text": "t l l"
                        }
                      },
                      {
                        "box": {
                          "id": "len",
                          "maxclass": "newobj",
                          "patching_rect": [
                            240.0,
                            105.0,
                            55.0,
                            22.0
                          ],
                          "text": "zl len"
                        }
                      },
                      {
                        "box": {
                          "id": "one",
                          "maxclass": "newobj",
                          "patching_rect": [
                            240.0,
                            145.0,
                            55.0,
                            22.0
                          ],
                          "text": "== 1"
                        }
                      },
                      {
                        "box": {
                          "id": "length_order",
                          "maxclass": "newobj",
                          "patching_rect": [
                            240.0,
                            185.0,
                            55.0,
                            22.0
                          ],
                          "text": "t i i"
                        }
                      },
                      {
                        "box": {
                          "id": "bad_length",
                          "maxclass": "newobj",
                          "patching_rect": [
                            340.0,
                            225.0,
                            55.0,
                            22.0
                          ],
                          "text": "sel 0"
                        }
                      },
                      {
                        "box": {
                          "id": "gate",
                          "maxclass": "newobj",
                          "patching_rect": [
                            30.0,
                            225.0,
                            55.0,
                            22.0
                          ],
                          "text": "gate 1 0"
                        }
                      },
                      {
                        "box": {
                          "id": "type",
                          "maxclass": "newobj",
                          "patching_rect": [
                            30.0,
                            265.0,
                            60.300000000000004,
                            22.0
                          ],
                          "text": "route int"
                        }
                      },
                      {
                        "box": {
                          "id": "store_first",
                          "maxclass": "newobj",
                          "patching_rect": [
                            30.0,
                            305.0,
                            55.0,
                            22.0
                          ],
                          "text": "t i i"
                        }
                      },
                      {
                        "box": {
                          "id": "value",
                          "maxclass": "newobj",
                          "patching_rect": [
                            30.0,
                            445.0,
                            55.0,
                            22.0
                          ],
                          "text": "int"
                        }
                      },
                      {
                        "box": {
                          "id": "predicate",
                          "maxclass": "newobj",
                          "patching_rect": [
                            220.0,
                            345.0,
                            80.4,
                            22.0
                          ],
                          "text": "expr $i1 > 0"
                        }
                      },
                      {
                        "box": {
                          "id": "verdict",
                          "maxclass": "newobj",
                          "patching_rect": [
                            220.0,
                            395.0,
                            55.0,
                            22.0
                          ],
                          "text": "sel 1 0"
                        }
                      },
                      {
                        "box": {
                          "id": "note",
                          "maxclass": "comment",
                          "patching_rect": [
                            30.0,
                            760.0,
                            502.5,
                            22.0
                          ],
                          "text": "Exactly one typed atom; reject before coercion; finite numeric values only."
                        }
                      }
                    ],
                    "lines": [
                      {
                        "patchline": {
                          "source": [
                            "in",
                            0
                          ],
                          "destination": [
                            "arity",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "arity",
                            1
                          ],
                          "destination": [
                            "len",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "len",
                            0
                          ],
                          "destination": [
                            "one",
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
                            "length_order",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "length_order",
                            1
                          ],
                          "destination": [
                            "gate",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "length_order",
                            0
                          ],
                          "destination": [
                            "bad_length",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "bad_length",
                            0
                          ],
                          "destination": [
                            "invalid",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "arity",
                            0
                          ],
                          "destination": [
                            "gate",
                            1
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "gate",
                            0
                          ],
                          "destination": [
                            "type",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "type",
                            0
                          ],
                          "destination": [
                            "store_first",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "type",
                            1
                          ],
                          "destination": [
                            "invalid",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "store_first",
                            1
                          ],
                          "destination": [
                            "value",
                            1
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "store_first",
                            0
                          ],
                          "destination": [
                            "predicate",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "predicate",
                            0
                          ],
                          "destination": [
                            "verdict",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "verdict",
                            0
                          ],
                          "destination": [
                            "value",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "verdict",
                            1
                          ],
                          "destination": [
                            "invalid",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "value",
                            0
                          ],
                          "destination": [
                            "valid",
                            0
                          ]
                        }
                      }
                    ]
                  }
                }
              },
              {
                "box": {
                  "id": "slice_count_error",
                  "maxclass": "message",
                  "patching_rect": [
                    540.0,
                    645.0,
                    167.5,
                    22.0
                  ],
                  "text": "error invalid_slice_count"
                }
              },
              {
                "box": {
                  "id": "slice_count_replace",
                  "maxclass": "newobj",
                  "patching_rect": [
                    410.0,
                    680.0,
                    180.9,
                    22.0
                  ],
                  "text": "prepend replace slice_count"
                }
              },
              {
                "box": {
                  "id": "debug_enabled_check",
                  "maxclass": "newobj",
                  "patching_rect": [
                    790.0,
                    560.0,
                    160.8,
                    22.0
                  ],
                  "text": "p validate_debug_enabled",
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
                      1200.0,
                      850.0
                    ],
                    "openinpresentation": 0,
                    "boxes": [
                      {
                        "box": {
                          "id": "in",
                          "maxclass": "inlet",
                          "patching_rect": [
                            30.0,
                            25.0,
                            55.0,
                            22.0
                          ]
                        }
                      },
                      {
                        "box": {
                          "id": "valid",
                          "maxclass": "outlet",
                          "patching_rect": [
                            30.0,
                            700.0,
                            55.0,
                            22.0
                          ]
                        }
                      },
                      {
                        "box": {
                          "id": "invalid",
                          "maxclass": "outlet",
                          "patching_rect": [
                            300.0,
                            700.0,
                            55.0,
                            22.0
                          ]
                        }
                      },
                      {
                        "box": {
                          "id": "arity",
                          "maxclass": "newobj",
                          "patching_rect": [
                            30.0,
                            65.0,
                            55.0,
                            22.0
                          ],
                          "text": "t l l"
                        }
                      },
                      {
                        "box": {
                          "id": "len",
                          "maxclass": "newobj",
                          "patching_rect": [
                            240.0,
                            105.0,
                            55.0,
                            22.0
                          ],
                          "text": "zl len"
                        }
                      },
                      {
                        "box": {
                          "id": "one",
                          "maxclass": "newobj",
                          "patching_rect": [
                            240.0,
                            145.0,
                            55.0,
                            22.0
                          ],
                          "text": "== 1"
                        }
                      },
                      {
                        "box": {
                          "id": "length_order",
                          "maxclass": "newobj",
                          "patching_rect": [
                            240.0,
                            185.0,
                            55.0,
                            22.0
                          ],
                          "text": "t i i"
                        }
                      },
                      {
                        "box": {
                          "id": "bad_length",
                          "maxclass": "newobj",
                          "patching_rect": [
                            340.0,
                            225.0,
                            55.0,
                            22.0
                          ],
                          "text": "sel 0"
                        }
                      },
                      {
                        "box": {
                          "id": "gate",
                          "maxclass": "newobj",
                          "patching_rect": [
                            30.0,
                            225.0,
                            55.0,
                            22.0
                          ],
                          "text": "gate 1 0"
                        }
                      },
                      {
                        "box": {
                          "id": "type",
                          "maxclass": "newobj",
                          "patching_rect": [
                            30.0,
                            265.0,
                            60.300000000000004,
                            22.0
                          ],
                          "text": "route int"
                        }
                      },
                      {
                        "box": {
                          "id": "store_first",
                          "maxclass": "newobj",
                          "patching_rect": [
                            30.0,
                            305.0,
                            55.0,
                            22.0
                          ],
                          "text": "t i i"
                        }
                      },
                      {
                        "box": {
                          "id": "value",
                          "maxclass": "newobj",
                          "patching_rect": [
                            30.0,
                            445.0,
                            55.0,
                            22.0
                          ],
                          "text": "int"
                        }
                      },
                      {
                        "box": {
                          "id": "predicate",
                          "maxclass": "newobj",
                          "patching_rect": [
                            220.0,
                            345.0,
                            194.3,
                            22.0
                          ],
                          "text": "expr ($i1 == 0) || ($i1 == 1)"
                        }
                      },
                      {
                        "box": {
                          "id": "verdict",
                          "maxclass": "newobj",
                          "patching_rect": [
                            220.0,
                            395.0,
                            55.0,
                            22.0
                          ],
                          "text": "sel 1 0"
                        }
                      },
                      {
                        "box": {
                          "id": "note",
                          "maxclass": "comment",
                          "patching_rect": [
                            30.0,
                            760.0,
                            502.5,
                            22.0
                          ],
                          "text": "Exactly one typed atom; reject before coercion; finite numeric values only."
                        }
                      }
                    ],
                    "lines": [
                      {
                        "patchline": {
                          "source": [
                            "in",
                            0
                          ],
                          "destination": [
                            "arity",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "arity",
                            1
                          ],
                          "destination": [
                            "len",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "len",
                            0
                          ],
                          "destination": [
                            "one",
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
                            "length_order",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "length_order",
                            1
                          ],
                          "destination": [
                            "gate",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "length_order",
                            0
                          ],
                          "destination": [
                            "bad_length",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "bad_length",
                            0
                          ],
                          "destination": [
                            "invalid",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "arity",
                            0
                          ],
                          "destination": [
                            "gate",
                            1
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "gate",
                            0
                          ],
                          "destination": [
                            "type",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "type",
                            0
                          ],
                          "destination": [
                            "store_first",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "type",
                            1
                          ],
                          "destination": [
                            "invalid",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "store_first",
                            1
                          ],
                          "destination": [
                            "value",
                            1
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "store_first",
                            0
                          ],
                          "destination": [
                            "predicate",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "predicate",
                            0
                          ],
                          "destination": [
                            "verdict",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "verdict",
                            0
                          ],
                          "destination": [
                            "value",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "verdict",
                            1
                          ],
                          "destination": [
                            "invalid",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "value",
                            0
                          ],
                          "destination": [
                            "valid",
                            0
                          ]
                        }
                      }
                    ]
                  }
                }
              },
              {
                "box": {
                  "id": "debug_enabled_error",
                  "maxclass": "message",
                  "patching_rect": [
                    920.0,
                    645.0,
                    180.9,
                    22.0
                  ],
                  "text": "error invalid_debug_enabled"
                }
              },
              {
                "box": {
                  "id": "debug_enabled_replace",
                  "maxclass": "newobj",
                  "patching_rect": [
                    790.0,
                    680.0,
                    194.3,
                    22.0
                  ],
                  "text": "prepend replace debug_enabled"
                }
              },
              {
                "box": {
                  "id": "path_check",
                  "maxclass": "newobj",
                  "patching_rect": [
                    30.0,
                    800.0,
                    100.5,
                    22.0
                  ],
                  "text": "p validate_path",
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
                      1200.0,
                      850.0
                    ],
                    "openinpresentation": 0,
                    "boxes": [
                      {
                        "box": {
                          "id": "in",
                          "maxclass": "inlet",
                          "patching_rect": [
                            30.0,
                            25.0,
                            55.0,
                            22.0
                          ]
                        }
                      },
                      {
                        "box": {
                          "id": "valid",
                          "maxclass": "outlet",
                          "patching_rect": [
                            30.0,
                            700.0,
                            55.0,
                            22.0
                          ]
                        }
                      },
                      {
                        "box": {
                          "id": "invalid",
                          "maxclass": "outlet",
                          "patching_rect": [
                            300.0,
                            700.0,
                            55.0,
                            22.0
                          ]
                        }
                      },
                      {
                        "box": {
                          "id": "split",
                          "maxclass": "newobj",
                          "patching_rect": [
                            30.0,
                            65.0,
                            55.0,
                            22.0
                          ],
                          "text": "t l l"
                        }
                      },
                      {
                        "box": {
                          "id": "len",
                          "maxclass": "newobj",
                          "patching_rect": [
                            250.0,
                            100.0,
                            55.0,
                            22.0
                          ],
                          "text": "zl len"
                        }
                      },
                      {
                        "box": {
                          "id": "is_one",
                          "maxclass": "newobj",
                          "patching_rect": [
                            250.0,
                            140.0,
                            55.0,
                            22.0
                          ],
                          "text": "== 1"
                        }
                      },
                      {
                        "box": {
                          "id": "len_order",
                          "maxclass": "newobj",
                          "patching_rect": [
                            250.0,
                            180.0,
                            55.0,
                            22.0
                          ],
                          "text": "t i i"
                        }
                      },
                      {
                        "box": {
                          "id": "badlen",
                          "maxclass": "newobj",
                          "patching_rect": [
                            360.0,
                            220.0,
                            55.0,
                            22.0
                          ],
                          "text": "sel 0"
                        }
                      },
                      {
                        "box": {
                          "id": "gate",
                          "maxclass": "newobj",
                          "patching_rect": [
                            30.0,
                            220.0,
                            55.0,
                            22.0
                          ],
                          "text": "gate 1 0"
                        }
                      },
                      {
                        "box": {
                          "id": "reject_types",
                          "maxclass": "newobj",
                          "patching_rect": [
                            30.0,
                            260.0,
                            134.0,
                            22.0
                          ],
                          "text": "route int float bang"
                        }
                      },
                      {
                        "box": {
                          "id": "symbol",
                          "maxclass": "newobj",
                          "patching_rect": [
                            30.0,
                            310.0,
                            55.0,
                            22.0
                          ],
                          "text": "tosymbol"
                        }
                      }
                    ],
                    "lines": [
                      {
                        "patchline": {
                          "source": [
                            "in",
                            0
                          ],
                          "destination": [
                            "split",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "split",
                            1
                          ],
                          "destination": [
                            "len",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "len",
                            0
                          ],
                          "destination": [
                            "is_one",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "is_one",
                            0
                          ],
                          "destination": [
                            "len_order",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "len_order",
                            1
                          ],
                          "destination": [
                            "gate",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "len_order",
                            0
                          ],
                          "destination": [
                            "badlen",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "badlen",
                            0
                          ],
                          "destination": [
                            "invalid",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "split",
                            0
                          ],
                          "destination": [
                            "gate",
                            1
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "gate",
                            0
                          ],
                          "destination": [
                            "reject_types",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "reject_types",
                            3
                          ],
                          "destination": [
                            "symbol",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "symbol",
                            0
                          ],
                          "destination": [
                            "valid",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "reject_types",
                            0
                          ],
                          "destination": [
                            "invalid",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "reject_types",
                            1
                          ],
                          "destination": [
                            "invalid",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "reject_types",
                            2
                          ],
                          "destination": [
                            "invalid",
                            0
                          ]
                        }
                      }
                    ]
                  }
                }
              },
              {
                "box": {
                  "id": "path_error",
                  "maxclass": "message",
                  "patching_rect": [
                    190.0,
                    840.0,
                    167.5,
                    22.0
                  ],
                  "text": "error invalid_sample_path"
                }
              },
              {
                "box": {
                  "id": "getstate_empty",
                  "maxclass": "newobj",
                  "patching_rect": [
                    400.0,
                    800.0,
                    67.0,
                    22.0
                  ],
                  "text": "route bang"
                }
              },
              {
                "box": {
                  "id": "getstate_bad",
                  "maxclass": "message",
                  "patching_rect": [
                    480.0,
                    900.0,
                    147.4,
                    22.0
                  ],
                  "text": "error invalid_getstate"
                }
              },
              {
                "box": {
                  "id": "stop_empty",
                  "maxclass": "newobj",
                  "patching_rect": [
                    650.0,
                    800.0,
                    67.0,
                    22.0
                  ],
                  "text": "route bang"
                }
              },
              {
                "box": {
                  "id": "stop_label",
                  "maxclass": "message",
                  "patching_rect": [
                    650.0,
                    850.0,
                    55.0,
                    22.0
                  ],
                  "text": "stop"
                }
              },
              {
                "box": {
                  "id": "stop_bad",
                  "maxclass": "message",
                  "patching_rect": [
                    730.0,
                    900.0,
                    120.60000000000001,
                    22.0
                  ],
                  "text": "error invalid_stop"
                }
              },
              {
                "box": {
                  "id": "unknown",
                  "maxclass": "newobj",
                  "patching_rect": [
                    900.0,
                    850.0,
                    221.1,
                    22.0
                  ],
                  "text": "prepend error unsupported_control"
                }
              },
              {
                "box": {
                  "id": "scope",
                  "maxclass": "comment",
                  "patching_rect": [
                    30.0,
                    1050.0,
                    536.0,
                    22.0
                  ],
                  "text": "No JUNG execution. Playback requests are unparameterized full-sample play/stop/retrigger only."
                }
              },
              {
                "box": {
                  "id": "rate_stop_first",
                  "maxclass": "newobj",
                  "patching_rect": [
                    440.0,
                    710.0,
                    55.0,
                    22.0
                  ],
                  "text": "t l b"
                }
              },
              {
                "box": {
                  "id": "play",
                  "maxclass": "outlet",
                  "patching_rect": [
                    810.0,
                    1000.0,
                    55.0,
                    22.0
                  ]
                }
              },
              {
                "box": {
                  "id": "play_empty",
                  "maxclass": "newobj",
                  "patching_rect": [
                    30.0,
                    1140.0,
                    67.0,
                    22.0
                  ],
                  "text": "route bang"
                }
              },
              {
                "box": {
                  "id": "play_bad",
                  "maxclass": "message",
                  "patching_rect": [
                    160.0,
                    1185.0,
                    120.60000000000001,
                    22.0
                  ],
                  "text": "error invalid_play"
                }
              },
              {
                "box": {
                  "id": "retrigger_empty",
                  "maxclass": "newobj",
                  "patching_rect": [
                    380.0,
                    1140.0,
                    67.0,
                    22.0
                  ],
                  "text": "route bang"
                }
              },
              {
                "box": {
                  "id": "retrigger_bad",
                  "maxclass": "message",
                  "patching_rect": [
                    510.0,
                    1185.0,
                    154.1,
                    22.0
                  ],
                  "text": "error invalid_retrigger"
                }
              },
              {
                "box": {
                  "id": "load_apache_empty",
                  "maxclass": "newobj",
                  "patching_rect": [
                    730.0,
                    1140.0,
                    67.0,
                    22.0
                  ],
                  "text": "route bang"
                }
              },
              {
                "box": {
                  "id": "load_apache_bad",
                  "maxclass": "message",
                  "patching_rect": [
                    860.0,
                    1185.0,
                    167.5,
                    22.0
                  ],
                  "text": "error invalid_load_apache"
                }
              },
              {
                "box": {
                  "id": "apache_path",
                  "maxclass": "newobj",
                  "patching_rect": [
                    730.0,
                    1230.0,
                    402.0,
                    22.0
                  ],
                  "text": "zl reg \"Project:/media/Apache Break ( Driven Silk Red ).wav\""
                }
              },
              {
                "box": {
                  "id": "project_absolute",
                  "maxclass": "newobj",
                  "patching_rect": [
                    730.0,
                    1270.0,
                    160.8,
                    22.0
                  ],
                  "text": "conformpath max absolute"
                }
              }
            ],
            "lines": [
              {
                "patchline": {
                  "source": [
                    "in",
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
                    "route",
                    0
                  ],
                  "destination": [
                    "tick_check",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "tick_check",
                    1
                  ],
                  "destination": [
                    "tick_error",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "tick_error",
                    0
                  ],
                  "destination": [
                    "error",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "tick_check",
                    0
                  ],
                  "destination": [
                    "tick_label",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "tick_label",
                    0
                  ],
                  "destination": [
                    "tick",
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
                    "gain_check",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "gain_check",
                    1
                  ],
                  "destination": [
                    "gain_error",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "gain_error",
                    0
                  ],
                  "destination": [
                    "error",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "gain_check",
                    0
                  ],
                  "destination": [
                    "gain_clip",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "gain_clip",
                    0
                  ],
                  "destination": [
                    "gain_replace",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "gain_replace",
                    0
                  ],
                  "destination": [
                    "state",
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
                    "pan_check",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "pan_check",
                    1
                  ],
                  "destination": [
                    "pan_error",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "pan_error",
                    0
                  ],
                  "destination": [
                    "error",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "pan_check",
                    0
                  ],
                  "destination": [
                    "pan_clip",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "pan_clip",
                    0
                  ],
                  "destination": [
                    "pan_replace",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "pan_replace",
                    0
                  ],
                  "destination": [
                    "state",
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
                    "api_version_check",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "api_version_check",
                    1
                  ],
                  "destination": [
                    "api_version_error",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "api_version_error",
                    0
                  ],
                  "destination": [
                    "error",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "api_version_check",
                    0
                  ],
                  "destination": [
                    "api_version_replace",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "api_version_replace",
                    0
                  ],
                  "destination": [
                    "state",
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
                    "base_rate_check",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "base_rate_check",
                    1
                  ],
                  "destination": [
                    "base_rate_error",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "base_rate_error",
                    0
                  ],
                  "destination": [
                    "error",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "base_rate_check",
                    0
                  ],
                  "destination": [
                    "base_rate_replace",
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
                    "jung_enabled_check",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "jung_enabled_check",
                    1
                  ],
                  "destination": [
                    "jung_enabled_error",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "jung_enabled_error",
                    0
                  ],
                  "destination": [
                    "error",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "jung_enabled_check",
                    0
                  ],
                  "destination": [
                    "jung_enabled_replace",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "jung_enabled_replace",
                    0
                  ],
                  "destination": [
                    "state",
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
                    "seed_check",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "seed_check",
                    1
                  ],
                  "destination": [
                    "seed_error",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "seed_error",
                    0
                  ],
                  "destination": [
                    "error",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "seed_check",
                    0
                  ],
                  "destination": [
                    "seed_replace",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "seed_replace",
                    0
                  ],
                  "destination": [
                    "state",
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
                    "slice_count_check",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "slice_count_check",
                    1
                  ],
                  "destination": [
                    "slice_count_error",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "slice_count_error",
                    0
                  ],
                  "destination": [
                    "error",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "slice_count_check",
                    0
                  ],
                  "destination": [
                    "slice_count_replace",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "slice_count_replace",
                    0
                  ],
                  "destination": [
                    "state",
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
                    "debug_enabled_check",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "debug_enabled_check",
                    1
                  ],
                  "destination": [
                    "debug_enabled_error",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "debug_enabled_error",
                    0
                  ],
                  "destination": [
                    "error",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "debug_enabled_check",
                    0
                  ],
                  "destination": [
                    "debug_enabled_replace",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "debug_enabled_replace",
                    0
                  ],
                  "destination": [
                    "state",
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
                    "path_check",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "path_check",
                    0
                  ],
                  "destination": [
                    "load",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "path_check",
                    1
                  ],
                  "destination": [
                    "path_error",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "path_error",
                    0
                  ],
                  "destination": [
                    "error",
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
                    "getstate_empty",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "getstate_empty",
                    0
                  ],
                  "destination": [
                    "dump",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "getstate_empty",
                    1
                  ],
                  "destination": [
                    "getstate_bad",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "getstate_bad",
                    0
                  ],
                  "destination": [
                    "error",
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
                    "stop_empty",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "stop_empty",
                    0
                  ],
                  "destination": [
                    "stop_label",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "stop_label",
                    0
                  ],
                  "destination": [
                    "error",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "stop_empty",
                    1
                  ],
                  "destination": [
                    "stop_bad",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "stop_bad",
                    0
                  ],
                  "destination": [
                    "error",
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
                    "event",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "unknown",
                    0
                  ],
                  "destination": [
                    "error",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "base_rate_replace",
                    0
                  ],
                  "destination": [
                    "rate_stop_first",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "rate_stop_first",
                    1
                  ],
                  "destination": [
                    "stop_label",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "rate_stop_first",
                    0
                  ],
                  "destination": [
                    "state",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "route",
                    16
                  ],
                  "destination": [
                    "unknown",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "route",
                    13
                  ],
                  "destination": [
                    "play_empty",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "play_empty",
                    1
                  ],
                  "destination": [
                    "play_bad",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "play_bad",
                    0
                  ],
                  "destination": [
                    "error",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "play_empty",
                    0
                  ],
                  "destination": [
                    "play",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "route",
                    14
                  ],
                  "destination": [
                    "retrigger_empty",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "retrigger_empty",
                    1
                  ],
                  "destination": [
                    "retrigger_bad",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "retrigger_bad",
                    0
                  ],
                  "destination": [
                    "error",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "retrigger_empty",
                    0
                  ],
                  "destination": [
                    "play",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "route",
                    15
                  ],
                  "destination": [
                    "load_apache_empty",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "load_apache_empty",
                    1
                  ],
                  "destination": [
                    "load_apache_bad",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "load_apache_bad",
                    0
                  ],
                  "destination": [
                    "error",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "load_apache_empty",
                    0
                  ],
                  "destination": [
                    "apache_path",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "apache_path",
                    0
                  ],
                  "destination": [
                    "project_absolute",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "project_absolute",
                    0
                  ],
                  "destination": [
                    "load",
                    0
                  ]
                }
              }
            ]
          }
        }
      },
      {
        "box": {
          "id": "state_write",
          "maxclass": "newobj",
          "patching_rect": [
            860.0,
            260.0,
            55.0,
            22.0
          ],
          "text": "t b l"
        }
      },
      {
        "box": {
          "id": "state",
          "maxclass": "newobj",
          "patching_rect": [
            860.0,
            305.0,
            194.3,
            22.0
          ],
          "text": "dict #1.pod.#2.state @embed 0"
        }
      },
      {
        "box": {
          "id": "read_state",
          "maxclass": "newobj",
          "patching_rect": [
            860.0,
            350.0,
            55.0,
            22.0
          ],
          "text": "t l l"
        }
      },
      {
        "box": {
          "id": "state_values",
          "maxclass": "newobj",
          "patching_rect": [
            860.0,
            390.0,
            335.0,
            22.0
          ],
          "text": "dict.unpack gain: pan: debug_enabled: slice_count:"
        }
      },
      {
        "box": {
          "id": "diag_gate",
          "maxclass": "newobj",
          "patching_rect": [
            1160.0,
            545.0,
            55.0,
            22.0
          ],
          "text": "gate 1 1"
        }
      },
      {
        "box": {
          "id": "state_iter",
          "maxclass": "newobj",
          "patching_rect": [
            860.0,
            445.0,
            60.300000000000004,
            22.0
          ],
          "text": "dict.iter"
        }
      },
      {
        "box": {
          "id": "state_label",
          "maxclass": "newobj",
          "patching_rect": [
            860.0,
            490.0,
            87.10000000000001,
            22.0
          ],
          "text": "prepend state"
        }
      },
      {
        "box": {
          "id": "event",
          "maxclass": "newobj",
          "patching_rect": [
            30.0,
            605.0,
            140.70000000000002,
            22.0
          ],
          "text": "p validate_event_only",
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
              1200.0,
              850.0
            ],
            "openinpresentation": 0,
            "boxes": [
              {
                "box": {
                  "id": "in",
                  "maxclass": "inlet",
                  "patching_rect": [
                    30.0,
                    25.0,
                    55.0,
                    22.0
                  ]
                }
              },
              {
                "box": {
                  "id": "slice_count",
                  "maxclass": "inlet",
                  "patching_rect": [
                    900.0,
                    25.0,
                    55.0,
                    22.0
                  ]
                }
              },
              {
                "box": {
                  "id": "rejected",
                  "maxclass": "outlet",
                  "patching_rect": [
                    30.0,
                    1090.0,
                    55.0,
                    22.0
                  ]
                }
              },
              {
                "box": {
                  "id": "receive_order",
                  "maxclass": "newobj",
                  "patching_rect": [
                    30.0,
                    70.0,
                    55.0,
                    22.0
                  ],
                  "text": "t l l"
                }
              },
              {
                "box": {
                  "id": "arity",
                  "maxclass": "newobj",
                  "patching_rect": [
                    650.0,
                    100.0,
                    55.0,
                    22.0
                  ],
                  "text": "zl len"
                }
              },
              {
                "box": {
                  "id": "arity_ok",
                  "maxclass": "newobj",
                  "patching_rect": [
                    650.0,
                    140.0,
                    55.0,
                    22.0
                  ],
                  "text": "== 11"
                }
              },
              {
                "box": {
                  "id": "arity_order",
                  "maxclass": "newobj",
                  "patching_rect": [
                    650.0,
                    180.0,
                    55.0,
                    22.0
                  ],
                  "text": "t i i"
                }
              },
              {
                "box": {
                  "id": "bad_arity",
                  "maxclass": "newobj",
                  "patching_rect": [
                    780.0,
                    220.0,
                    55.0,
                    22.0
                  ],
                  "text": "sel 0"
                }
              },
              {
                "box": {
                  "id": "gate",
                  "maxclass": "newobj",
                  "patching_rect": [
                    30.0,
                    220.0,
                    55.0,
                    22.0
                  ],
                  "text": "gate 1 0"
                }
              },
              {
                "box": {
                  "id": "malformed",
                  "maxclass": "message",
                  "patching_rect": [
                    30.0,
                    1000.0,
                    140.70000000000002,
                    22.0
                  ],
                  "text": "error malformed_event"
                }
              },
              {
                "box": {
                  "id": "validation_order",
                  "maxclass": "newobj",
                  "patching_rect": [
                    30.0,
                    270.0,
                    55.0,
                    22.0
                  ],
                  "text": "t b l b"
                }
              },
              {
                "box": {
                  "id": "reset",
                  "maxclass": "message",
                  "patching_rect": [
                    850.0,
                    270.0,
                    55.0,
                    22.0
                  ],
                  "text": "1"
                }
              },
              {
                "box": {
                  "id": "valid",
                  "maxclass": "newobj",
                  "patching_rect": [
                    650.0,
                    860.0,
                    55.0,
                    22.0
                  ],
                  "text": "int 0"
                }
              },
              {
                "box": {
                  "id": "bad",
                  "maxclass": "message",
                  "patching_rect": [
                    950.0,
                    720.0,
                    55.0,
                    22.0
                  ],
                  "text": "0"
                }
              },
              {
                "box": {
                  "id": "fields",
                  "maxclass": "newobj",
                  "patching_rect": [
                    30.0,
                    310.0,
                    154.1,
                    22.0
                  ],
                  "text": "t l l l l l l l l l l l"
                }
              },
              {
                "box": {
                  "id": "field_1",
                  "maxclass": "newobj",
                  "patching_rect": [
                    30.0,
                    370.0,
                    55.0,
                    22.0
                  ],
                  "text": "zl nth 1"
                }
              },
              {
                "box": {
                  "id": "check_1",
                  "maxclass": "newobj",
                  "patching_rect": [
                    30.0,
                    410.0,
                    60.300000000000004,
                    22.0
                  ],
                  "text": "p field_1",
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
                      1200.0,
                      850.0
                    ],
                    "openinpresentation": 0,
                    "boxes": [
                      {
                        "box": {
                          "id": "in",
                          "maxclass": "inlet",
                          "patching_rect": [
                            30.0,
                            25.0,
                            55.0,
                            22.0
                          ]
                        }
                      },
                      {
                        "box": {
                          "id": "valid",
                          "maxclass": "outlet",
                          "patching_rect": [
                            30.0,
                            700.0,
                            55.0,
                            22.0
                          ]
                        }
                      },
                      {
                        "box": {
                          "id": "invalid",
                          "maxclass": "outlet",
                          "patching_rect": [
                            300.0,
                            700.0,
                            55.0,
                            22.0
                          ]
                        }
                      },
                      {
                        "box": {
                          "id": "arity",
                          "maxclass": "newobj",
                          "patching_rect": [
                            30.0,
                            65.0,
                            55.0,
                            22.0
                          ],
                          "text": "t l l"
                        }
                      },
                      {
                        "box": {
                          "id": "len",
                          "maxclass": "newobj",
                          "patching_rect": [
                            240.0,
                            105.0,
                            55.0,
                            22.0
                          ],
                          "text": "zl len"
                        }
                      },
                      {
                        "box": {
                          "id": "one",
                          "maxclass": "newobj",
                          "patching_rect": [
                            240.0,
                            145.0,
                            55.0,
                            22.0
                          ],
                          "text": "== 1"
                        }
                      },
                      {
                        "box": {
                          "id": "length_order",
                          "maxclass": "newobj",
                          "patching_rect": [
                            240.0,
                            185.0,
                            55.0,
                            22.0
                          ],
                          "text": "t i i"
                        }
                      },
                      {
                        "box": {
                          "id": "bad_length",
                          "maxclass": "newobj",
                          "patching_rect": [
                            340.0,
                            225.0,
                            55.0,
                            22.0
                          ],
                          "text": "sel 0"
                        }
                      },
                      {
                        "box": {
                          "id": "gate",
                          "maxclass": "newobj",
                          "patching_rect": [
                            30.0,
                            225.0,
                            55.0,
                            22.0
                          ],
                          "text": "gate 1 0"
                        }
                      },
                      {
                        "box": {
                          "id": "type",
                          "maxclass": "newobj",
                          "patching_rect": [
                            30.0,
                            265.0,
                            60.300000000000004,
                            22.0
                          ],
                          "text": "route int"
                        }
                      },
                      {
                        "box": {
                          "id": "store_first",
                          "maxclass": "newobj",
                          "patching_rect": [
                            30.0,
                            305.0,
                            55.0,
                            22.0
                          ],
                          "text": "t i i"
                        }
                      },
                      {
                        "box": {
                          "id": "value",
                          "maxclass": "newobj",
                          "patching_rect": [
                            30.0,
                            445.0,
                            55.0,
                            22.0
                          ],
                          "text": "int"
                        }
                      },
                      {
                        "box": {
                          "id": "predicate",
                          "maxclass": "newobj",
                          "patching_rect": [
                            220.0,
                            345.0,
                            87.10000000000001,
                            22.0
                          ],
                          "text": "expr $i1 == 1"
                        }
                      },
                      {
                        "box": {
                          "id": "verdict",
                          "maxclass": "newobj",
                          "patching_rect": [
                            220.0,
                            395.0,
                            55.0,
                            22.0
                          ],
                          "text": "sel 1 0"
                        }
                      },
                      {
                        "box": {
                          "id": "note",
                          "maxclass": "comment",
                          "patching_rect": [
                            30.0,
                            760.0,
                            502.5,
                            22.0
                          ],
                          "text": "Exactly one typed atom; reject before coercion; finite numeric values only."
                        }
                      }
                    ],
                    "lines": [
                      {
                        "patchline": {
                          "source": [
                            "in",
                            0
                          ],
                          "destination": [
                            "arity",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "arity",
                            1
                          ],
                          "destination": [
                            "len",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "len",
                            0
                          ],
                          "destination": [
                            "one",
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
                            "length_order",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "length_order",
                            1
                          ],
                          "destination": [
                            "gate",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "length_order",
                            0
                          ],
                          "destination": [
                            "bad_length",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "bad_length",
                            0
                          ],
                          "destination": [
                            "invalid",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "arity",
                            0
                          ],
                          "destination": [
                            "gate",
                            1
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "gate",
                            0
                          ],
                          "destination": [
                            "type",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "type",
                            0
                          ],
                          "destination": [
                            "store_first",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "type",
                            1
                          ],
                          "destination": [
                            "invalid",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "store_first",
                            1
                          ],
                          "destination": [
                            "value",
                            1
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "store_first",
                            0
                          ],
                          "destination": [
                            "predicate",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "predicate",
                            0
                          ],
                          "destination": [
                            "verdict",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "verdict",
                            0
                          ],
                          "destination": [
                            "value",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "verdict",
                            1
                          ],
                          "destination": [
                            "invalid",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "value",
                            0
                          ],
                          "destination": [
                            "valid",
                            0
                          ]
                        }
                      }
                    ]
                  }
                }
              },
              {
                "box": {
                  "id": "field_2",
                  "maxclass": "newobj",
                  "patching_rect": [
                    310.0,
                    370.0,
                    55.0,
                    22.0
                  ],
                  "text": "zl nth 2"
                }
              },
              {
                "box": {
                  "id": "check_2",
                  "maxclass": "newobj",
                  "patching_rect": [
                    310.0,
                    410.0,
                    60.300000000000004,
                    22.0
                  ],
                  "text": "p field_2",
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
                      1200.0,
                      850.0
                    ],
                    "openinpresentation": 0,
                    "boxes": [
                      {
                        "box": {
                          "id": "in",
                          "maxclass": "inlet",
                          "patching_rect": [
                            30.0,
                            25.0,
                            55.0,
                            22.0
                          ]
                        }
                      },
                      {
                        "box": {
                          "id": "valid",
                          "maxclass": "outlet",
                          "patching_rect": [
                            30.0,
                            700.0,
                            55.0,
                            22.0
                          ]
                        }
                      },
                      {
                        "box": {
                          "id": "invalid",
                          "maxclass": "outlet",
                          "patching_rect": [
                            300.0,
                            700.0,
                            55.0,
                            22.0
                          ]
                        }
                      },
                      {
                        "box": {
                          "id": "arity",
                          "maxclass": "newobj",
                          "patching_rect": [
                            30.0,
                            65.0,
                            55.0,
                            22.0
                          ],
                          "text": "t l l"
                        }
                      },
                      {
                        "box": {
                          "id": "len",
                          "maxclass": "newobj",
                          "patching_rect": [
                            240.0,
                            105.0,
                            55.0,
                            22.0
                          ],
                          "text": "zl len"
                        }
                      },
                      {
                        "box": {
                          "id": "one",
                          "maxclass": "newobj",
                          "patching_rect": [
                            240.0,
                            145.0,
                            55.0,
                            22.0
                          ],
                          "text": "== 1"
                        }
                      },
                      {
                        "box": {
                          "id": "length_order",
                          "maxclass": "newobj",
                          "patching_rect": [
                            240.0,
                            185.0,
                            55.0,
                            22.0
                          ],
                          "text": "t i i"
                        }
                      },
                      {
                        "box": {
                          "id": "bad_length",
                          "maxclass": "newobj",
                          "patching_rect": [
                            340.0,
                            225.0,
                            55.0,
                            22.0
                          ],
                          "text": "sel 0"
                        }
                      },
                      {
                        "box": {
                          "id": "gate",
                          "maxclass": "newobj",
                          "patching_rect": [
                            30.0,
                            225.0,
                            55.0,
                            22.0
                          ],
                          "text": "gate 1 0"
                        }
                      },
                      {
                        "box": {
                          "id": "type",
                          "maxclass": "newobj",
                          "patching_rect": [
                            30.0,
                            265.0,
                            60.300000000000004,
                            22.0
                          ],
                          "text": "route int"
                        }
                      },
                      {
                        "box": {
                          "id": "store_first",
                          "maxclass": "newobj",
                          "patching_rect": [
                            30.0,
                            305.0,
                            55.0,
                            22.0
                          ],
                          "text": "t i i"
                        }
                      },
                      {
                        "box": {
                          "id": "value",
                          "maxclass": "newobj",
                          "patching_rect": [
                            30.0,
                            445.0,
                            55.0,
                            22.0
                          ],
                          "text": "int"
                        }
                      },
                      {
                        "box": {
                          "id": "predicate",
                          "maxclass": "newobj",
                          "patching_rect": [
                            220.0,
                            345.0,
                            87.10000000000001,
                            22.0
                          ],
                          "text": "expr $i1 >= 0"
                        }
                      },
                      {
                        "box": {
                          "id": "verdict",
                          "maxclass": "newobj",
                          "patching_rect": [
                            220.0,
                            395.0,
                            55.0,
                            22.0
                          ],
                          "text": "sel 1 0"
                        }
                      },
                      {
                        "box": {
                          "id": "note",
                          "maxclass": "comment",
                          "patching_rect": [
                            30.0,
                            760.0,
                            502.5,
                            22.0
                          ],
                          "text": "Exactly one typed atom; reject before coercion; finite numeric values only."
                        }
                      }
                    ],
                    "lines": [
                      {
                        "patchline": {
                          "source": [
                            "in",
                            0
                          ],
                          "destination": [
                            "arity",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "arity",
                            1
                          ],
                          "destination": [
                            "len",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "len",
                            0
                          ],
                          "destination": [
                            "one",
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
                            "length_order",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "length_order",
                            1
                          ],
                          "destination": [
                            "gate",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "length_order",
                            0
                          ],
                          "destination": [
                            "bad_length",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "bad_length",
                            0
                          ],
                          "destination": [
                            "invalid",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "arity",
                            0
                          ],
                          "destination": [
                            "gate",
                            1
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "gate",
                            0
                          ],
                          "destination": [
                            "type",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "type",
                            0
                          ],
                          "destination": [
                            "store_first",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "type",
                            1
                          ],
                          "destination": [
                            "invalid",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "store_first",
                            1
                          ],
                          "destination": [
                            "value",
                            1
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "store_first",
                            0
                          ],
                          "destination": [
                            "predicate",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "predicate",
                            0
                          ],
                          "destination": [
                            "verdict",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "verdict",
                            0
                          ],
                          "destination": [
                            "value",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "verdict",
                            1
                          ],
                          "destination": [
                            "invalid",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "value",
                            0
                          ],
                          "destination": [
                            "valid",
                            0
                          ]
                        }
                      }
                    ]
                  }
                }
              },
              {
                "box": {
                  "id": "field_3",
                  "maxclass": "newobj",
                  "patching_rect": [
                    590.0,
                    370.0,
                    55.0,
                    22.0
                  ],
                  "text": "zl nth 3"
                }
              },
              {
                "box": {
                  "id": "check_3",
                  "maxclass": "newobj",
                  "patching_rect": [
                    590.0,
                    410.0,
                    55.0,
                    22.0
                  ],
                  "text": "sel #2"
                }
              },
              {
                "box": {
                  "id": "field_4",
                  "maxclass": "newobj",
                  "patching_rect": [
                    870.0,
                    370.0,
                    55.0,
                    22.0
                  ],
                  "text": "zl nth 4"
                }
              },
              {
                "box": {
                  "id": "check_4",
                  "maxclass": "newobj",
                  "patching_rect": [
                    870.0,
                    410.0,
                    60.300000000000004,
                    22.0
                  ],
                  "text": "p field_4",
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
                      1200.0,
                      850.0
                    ],
                    "openinpresentation": 0,
                    "boxes": [
                      {
                        "box": {
                          "id": "in",
                          "maxclass": "inlet",
                          "patching_rect": [
                            30.0,
                            25.0,
                            55.0,
                            22.0
                          ]
                        }
                      },
                      {
                        "box": {
                          "id": "valid",
                          "maxclass": "outlet",
                          "patching_rect": [
                            30.0,
                            700.0,
                            55.0,
                            22.0
                          ]
                        }
                      },
                      {
                        "box": {
                          "id": "invalid",
                          "maxclass": "outlet",
                          "patching_rect": [
                            300.0,
                            700.0,
                            55.0,
                            22.0
                          ]
                        }
                      },
                      {
                        "box": {
                          "id": "arity",
                          "maxclass": "newobj",
                          "patching_rect": [
                            30.0,
                            65.0,
                            55.0,
                            22.0
                          ],
                          "text": "t l l"
                        }
                      },
                      {
                        "box": {
                          "id": "len",
                          "maxclass": "newobj",
                          "patching_rect": [
                            240.0,
                            105.0,
                            55.0,
                            22.0
                          ],
                          "text": "zl len"
                        }
                      },
                      {
                        "box": {
                          "id": "one",
                          "maxclass": "newobj",
                          "patching_rect": [
                            240.0,
                            145.0,
                            55.0,
                            22.0
                          ],
                          "text": "== 1"
                        }
                      },
                      {
                        "box": {
                          "id": "length_order",
                          "maxclass": "newobj",
                          "patching_rect": [
                            240.0,
                            185.0,
                            55.0,
                            22.0
                          ],
                          "text": "t i i"
                        }
                      },
                      {
                        "box": {
                          "id": "bad_length",
                          "maxclass": "newobj",
                          "patching_rect": [
                            340.0,
                            225.0,
                            55.0,
                            22.0
                          ],
                          "text": "sel 0"
                        }
                      },
                      {
                        "box": {
                          "id": "gate",
                          "maxclass": "newobj",
                          "patching_rect": [
                            30.0,
                            225.0,
                            55.0,
                            22.0
                          ],
                          "text": "gate 1 0"
                        }
                      },
                      {
                        "box": {
                          "id": "type",
                          "maxclass": "newobj",
                          "patching_rect": [
                            30.0,
                            265.0,
                            60.300000000000004,
                            22.0
                          ],
                          "text": "route int"
                        }
                      },
                      {
                        "box": {
                          "id": "store_first",
                          "maxclass": "newobj",
                          "patching_rect": [
                            30.0,
                            305.0,
                            55.0,
                            22.0
                          ],
                          "text": "t i i"
                        }
                      },
                      {
                        "box": {
                          "id": "value",
                          "maxclass": "newobj",
                          "patching_rect": [
                            30.0,
                            445.0,
                            55.0,
                            22.0
                          ],
                          "text": "int"
                        }
                      },
                      {
                        "box": {
                          "id": "predicate",
                          "maxclass": "newobj",
                          "patching_rect": [
                            220.0,
                            345.0,
                            87.10000000000001,
                            22.0
                          ],
                          "text": "expr $i1 >= 0"
                        }
                      },
                      {
                        "box": {
                          "id": "verdict",
                          "maxclass": "newobj",
                          "patching_rect": [
                            220.0,
                            395.0,
                            55.0,
                            22.0
                          ],
                          "text": "sel 1 0"
                        }
                      },
                      {
                        "box": {
                          "id": "note",
                          "maxclass": "comment",
                          "patching_rect": [
                            30.0,
                            760.0,
                            502.5,
                            22.0
                          ],
                          "text": "Exactly one typed atom; reject before coercion; finite numeric values only."
                        }
                      }
                    ],
                    "lines": [
                      {
                        "patchline": {
                          "source": [
                            "in",
                            0
                          ],
                          "destination": [
                            "arity",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "arity",
                            1
                          ],
                          "destination": [
                            "len",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "len",
                            0
                          ],
                          "destination": [
                            "one",
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
                            "length_order",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "length_order",
                            1
                          ],
                          "destination": [
                            "gate",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "length_order",
                            0
                          ],
                          "destination": [
                            "bad_length",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "bad_length",
                            0
                          ],
                          "destination": [
                            "invalid",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "arity",
                            0
                          ],
                          "destination": [
                            "gate",
                            1
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "gate",
                            0
                          ],
                          "destination": [
                            "type",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "type",
                            0
                          ],
                          "destination": [
                            "store_first",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "type",
                            1
                          ],
                          "destination": [
                            "invalid",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "store_first",
                            1
                          ],
                          "destination": [
                            "value",
                            1
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "store_first",
                            0
                          ],
                          "destination": [
                            "predicate",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "predicate",
                            0
                          ],
                          "destination": [
                            "verdict",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "verdict",
                            0
                          ],
                          "destination": [
                            "value",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "verdict",
                            1
                          ],
                          "destination": [
                            "invalid",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "value",
                            0
                          ],
                          "destination": [
                            "valid",
                            0
                          ]
                        }
                      }
                    ]
                  }
                }
              },
              {
                "box": {
                  "id": "field_5",
                  "maxclass": "newobj",
                  "patching_rect": [
                    30.0,
                    500.0,
                    55.0,
                    22.0
                  ],
                  "text": "zl nth 5"
                }
              },
              {
                "box": {
                  "id": "check_5",
                  "maxclass": "newobj",
                  "patching_rect": [
                    30.0,
                    540.0,
                    274.7,
                    22.0
                  ],
                  "text": "sel hold repeat nearby different surprise"
                }
              },
              {
                "box": {
                  "id": "field_6",
                  "maxclass": "newobj",
                  "patching_rect": [
                    310.0,
                    500.0,
                    55.0,
                    22.0
                  ],
                  "text": "zl nth 6"
                }
              },
              {
                "box": {
                  "id": "check_6",
                  "maxclass": "newobj",
                  "patching_rect": [
                    310.0,
                    540.0,
                    60.300000000000004,
                    22.0
                  ],
                  "text": "p field_6",
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
                      1200.0,
                      850.0
                    ],
                    "openinpresentation": 0,
                    "boxes": [
                      {
                        "box": {
                          "id": "in",
                          "maxclass": "inlet",
                          "patching_rect": [
                            30.0,
                            25.0,
                            55.0,
                            22.0
                          ]
                        }
                      },
                      {
                        "box": {
                          "id": "valid",
                          "maxclass": "outlet",
                          "patching_rect": [
                            30.0,
                            700.0,
                            55.0,
                            22.0
                          ]
                        }
                      },
                      {
                        "box": {
                          "id": "invalid",
                          "maxclass": "outlet",
                          "patching_rect": [
                            300.0,
                            700.0,
                            55.0,
                            22.0
                          ]
                        }
                      },
                      {
                        "box": {
                          "id": "arity",
                          "maxclass": "newobj",
                          "patching_rect": [
                            30.0,
                            65.0,
                            55.0,
                            22.0
                          ],
                          "text": "t l l"
                        }
                      },
                      {
                        "box": {
                          "id": "len",
                          "maxclass": "newobj",
                          "patching_rect": [
                            240.0,
                            105.0,
                            55.0,
                            22.0
                          ],
                          "text": "zl len"
                        }
                      },
                      {
                        "box": {
                          "id": "one",
                          "maxclass": "newobj",
                          "patching_rect": [
                            240.0,
                            145.0,
                            55.0,
                            22.0
                          ],
                          "text": "== 1"
                        }
                      },
                      {
                        "box": {
                          "id": "length_order",
                          "maxclass": "newobj",
                          "patching_rect": [
                            240.0,
                            185.0,
                            55.0,
                            22.0
                          ],
                          "text": "t i i"
                        }
                      },
                      {
                        "box": {
                          "id": "bad_length",
                          "maxclass": "newobj",
                          "patching_rect": [
                            340.0,
                            225.0,
                            55.0,
                            22.0
                          ],
                          "text": "sel 0"
                        }
                      },
                      {
                        "box": {
                          "id": "gate",
                          "maxclass": "newobj",
                          "patching_rect": [
                            30.0,
                            225.0,
                            55.0,
                            22.0
                          ],
                          "text": "gate 1 0"
                        }
                      },
                      {
                        "box": {
                          "id": "type",
                          "maxclass": "newobj",
                          "patching_rect": [
                            30.0,
                            265.0,
                            60.300000000000004,
                            22.0
                          ],
                          "text": "route int"
                        }
                      },
                      {
                        "box": {
                          "id": "store_first",
                          "maxclass": "newobj",
                          "patching_rect": [
                            30.0,
                            305.0,
                            55.0,
                            22.0
                          ],
                          "text": "t i i"
                        }
                      },
                      {
                        "box": {
                          "id": "value",
                          "maxclass": "newobj",
                          "patching_rect": [
                            30.0,
                            445.0,
                            55.0,
                            22.0
                          ],
                          "text": "int"
                        }
                      },
                      {
                        "box": {
                          "id": "predicate",
                          "maxclass": "newobj",
                          "patching_rect": [
                            220.0,
                            345.0,
                            55.0,
                            22.0
                          ],
                          "text": "expr 1"
                        }
                      },
                      {
                        "box": {
                          "id": "verdict",
                          "maxclass": "newobj",
                          "patching_rect": [
                            220.0,
                            395.0,
                            55.0,
                            22.0
                          ],
                          "text": "sel 1 0"
                        }
                      },
                      {
                        "box": {
                          "id": "note",
                          "maxclass": "comment",
                          "patching_rect": [
                            30.0,
                            760.0,
                            502.5,
                            22.0
                          ],
                          "text": "Exactly one typed atom; reject before coercion; finite numeric values only."
                        }
                      }
                    ],
                    "lines": [
                      {
                        "patchline": {
                          "source": [
                            "in",
                            0
                          ],
                          "destination": [
                            "arity",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "arity",
                            1
                          ],
                          "destination": [
                            "len",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "len",
                            0
                          ],
                          "destination": [
                            "one",
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
                            "length_order",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "length_order",
                            1
                          ],
                          "destination": [
                            "gate",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "length_order",
                            0
                          ],
                          "destination": [
                            "bad_length",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "bad_length",
                            0
                          ],
                          "destination": [
                            "invalid",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "arity",
                            0
                          ],
                          "destination": [
                            "gate",
                            1
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "gate",
                            0
                          ],
                          "destination": [
                            "type",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "type",
                            0
                          ],
                          "destination": [
                            "store_first",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "type",
                            1
                          ],
                          "destination": [
                            "invalid",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "store_first",
                            1
                          ],
                          "destination": [
                            "value",
                            1
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "store_first",
                            0
                          ],
                          "destination": [
                            "predicate",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "predicate",
                            0
                          ],
                          "destination": [
                            "verdict",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "verdict",
                            0
                          ],
                          "destination": [
                            "value",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "verdict",
                            1
                          ],
                          "destination": [
                            "invalid",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "value",
                            0
                          ],
                          "destination": [
                            "valid",
                            0
                          ]
                        }
                      }
                    ]
                  }
                }
              },
              {
                "box": {
                  "id": "field_7",
                  "maxclass": "newobj",
                  "patching_rect": [
                    590.0,
                    500.0,
                    55.0,
                    22.0
                  ],
                  "text": "zl nth 7"
                }
              },
              {
                "box": {
                  "id": "check_7",
                  "maxclass": "newobj",
                  "patching_rect": [
                    590.0,
                    540.0,
                    60.300000000000004,
                    22.0
                  ],
                  "text": "p field_7",
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
                      1200.0,
                      850.0
                    ],
                    "openinpresentation": 0,
                    "boxes": [
                      {
                        "box": {
                          "id": "in",
                          "maxclass": "inlet",
                          "patching_rect": [
                            30.0,
                            25.0,
                            55.0,
                            22.0
                          ]
                        }
                      },
                      {
                        "box": {
                          "id": "valid",
                          "maxclass": "outlet",
                          "patching_rect": [
                            30.0,
                            700.0,
                            55.0,
                            22.0
                          ]
                        }
                      },
                      {
                        "box": {
                          "id": "invalid",
                          "maxclass": "outlet",
                          "patching_rect": [
                            300.0,
                            700.0,
                            55.0,
                            22.0
                          ]
                        }
                      },
                      {
                        "box": {
                          "id": "arity",
                          "maxclass": "newobj",
                          "patching_rect": [
                            30.0,
                            65.0,
                            55.0,
                            22.0
                          ],
                          "text": "t l l"
                        }
                      },
                      {
                        "box": {
                          "id": "len",
                          "maxclass": "newobj",
                          "patching_rect": [
                            240.0,
                            105.0,
                            55.0,
                            22.0
                          ],
                          "text": "zl len"
                        }
                      },
                      {
                        "box": {
                          "id": "one",
                          "maxclass": "newobj",
                          "patching_rect": [
                            240.0,
                            145.0,
                            55.0,
                            22.0
                          ],
                          "text": "== 1"
                        }
                      },
                      {
                        "box": {
                          "id": "length_order",
                          "maxclass": "newobj",
                          "patching_rect": [
                            240.0,
                            185.0,
                            55.0,
                            22.0
                          ],
                          "text": "t i i"
                        }
                      },
                      {
                        "box": {
                          "id": "bad_length",
                          "maxclass": "newobj",
                          "patching_rect": [
                            340.0,
                            225.0,
                            55.0,
                            22.0
                          ],
                          "text": "sel 0"
                        }
                      },
                      {
                        "box": {
                          "id": "gate",
                          "maxclass": "newobj",
                          "patching_rect": [
                            30.0,
                            225.0,
                            55.0,
                            22.0
                          ],
                          "text": "gate 1 0"
                        }
                      },
                      {
                        "box": {
                          "id": "type",
                          "maxclass": "newobj",
                          "patching_rect": [
                            30.0,
                            265.0,
                            100.5,
                            22.0
                          ],
                          "text": "route int float"
                        }
                      },
                      {
                        "box": {
                          "id": "store_first",
                          "maxclass": "newobj",
                          "patching_rect": [
                            30.0,
                            305.0,
                            55.0,
                            22.0
                          ],
                          "text": "t f f"
                        }
                      },
                      {
                        "box": {
                          "id": "value",
                          "maxclass": "newobj",
                          "patching_rect": [
                            30.0,
                            445.0,
                            55.0,
                            22.0
                          ],
                          "text": "float"
                        }
                      },
                      {
                        "box": {
                          "id": "predicate",
                          "maxclass": "newobj",
                          "patching_rect": [
                            220.0,
                            345.0,
                            261.3,
                            22.0
                          ],
                          "text": "expr (($f1 - $f1) == 0.) && ($f1 != 0.)"
                        }
                      },
                      {
                        "box": {
                          "id": "verdict",
                          "maxclass": "newobj",
                          "patching_rect": [
                            220.0,
                            395.0,
                            55.0,
                            22.0
                          ],
                          "text": "sel 1 0"
                        }
                      },
                      {
                        "box": {
                          "id": "note",
                          "maxclass": "comment",
                          "patching_rect": [
                            30.0,
                            760.0,
                            502.5,
                            22.0
                          ],
                          "text": "Exactly one typed atom; reject before coercion; finite numeric values only."
                        }
                      }
                    ],
                    "lines": [
                      {
                        "patchline": {
                          "source": [
                            "in",
                            0
                          ],
                          "destination": [
                            "arity",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "arity",
                            1
                          ],
                          "destination": [
                            "len",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "len",
                            0
                          ],
                          "destination": [
                            "one",
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
                            "length_order",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "length_order",
                            1
                          ],
                          "destination": [
                            "gate",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "length_order",
                            0
                          ],
                          "destination": [
                            "bad_length",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "bad_length",
                            0
                          ],
                          "destination": [
                            "invalid",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "arity",
                            0
                          ],
                          "destination": [
                            "gate",
                            1
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "gate",
                            0
                          ],
                          "destination": [
                            "type",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "type",
                            0
                          ],
                          "destination": [
                            "store_first",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "type",
                            2
                          ],
                          "destination": [
                            "invalid",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "store_first",
                            1
                          ],
                          "destination": [
                            "value",
                            1
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "store_first",
                            0
                          ],
                          "destination": [
                            "predicate",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "predicate",
                            0
                          ],
                          "destination": [
                            "verdict",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "verdict",
                            0
                          ],
                          "destination": [
                            "value",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "verdict",
                            1
                          ],
                          "destination": [
                            "invalid",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "value",
                            0
                          ],
                          "destination": [
                            "valid",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "type",
                            1
                          ],
                          "destination": [
                            "store_first",
                            0
                          ]
                        }
                      }
                    ]
                  }
                }
              },
              {
                "box": {
                  "id": "field_8",
                  "maxclass": "newobj",
                  "patching_rect": [
                    870.0,
                    500.0,
                    55.0,
                    22.0
                  ],
                  "text": "zl nth 8"
                }
              },
              {
                "box": {
                  "id": "check_8",
                  "maxclass": "newobj",
                  "patching_rect": [
                    870.0,
                    540.0,
                    60.300000000000004,
                    22.0
                  ],
                  "text": "p field_8",
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
                      1200.0,
                      850.0
                    ],
                    "openinpresentation": 0,
                    "boxes": [
                      {
                        "box": {
                          "id": "in",
                          "maxclass": "inlet",
                          "patching_rect": [
                            30.0,
                            25.0,
                            55.0,
                            22.0
                          ]
                        }
                      },
                      {
                        "box": {
                          "id": "valid",
                          "maxclass": "outlet",
                          "patching_rect": [
                            30.0,
                            700.0,
                            55.0,
                            22.0
                          ]
                        }
                      },
                      {
                        "box": {
                          "id": "invalid",
                          "maxclass": "outlet",
                          "patching_rect": [
                            300.0,
                            700.0,
                            55.0,
                            22.0
                          ]
                        }
                      },
                      {
                        "box": {
                          "id": "arity",
                          "maxclass": "newobj",
                          "patching_rect": [
                            30.0,
                            65.0,
                            55.0,
                            22.0
                          ],
                          "text": "t l l"
                        }
                      },
                      {
                        "box": {
                          "id": "len",
                          "maxclass": "newobj",
                          "patching_rect": [
                            240.0,
                            105.0,
                            55.0,
                            22.0
                          ],
                          "text": "zl len"
                        }
                      },
                      {
                        "box": {
                          "id": "one",
                          "maxclass": "newobj",
                          "patching_rect": [
                            240.0,
                            145.0,
                            55.0,
                            22.0
                          ],
                          "text": "== 1"
                        }
                      },
                      {
                        "box": {
                          "id": "length_order",
                          "maxclass": "newobj",
                          "patching_rect": [
                            240.0,
                            185.0,
                            55.0,
                            22.0
                          ],
                          "text": "t i i"
                        }
                      },
                      {
                        "box": {
                          "id": "bad_length",
                          "maxclass": "newobj",
                          "patching_rect": [
                            340.0,
                            225.0,
                            55.0,
                            22.0
                          ],
                          "text": "sel 0"
                        }
                      },
                      {
                        "box": {
                          "id": "gate",
                          "maxclass": "newobj",
                          "patching_rect": [
                            30.0,
                            225.0,
                            55.0,
                            22.0
                          ],
                          "text": "gate 1 0"
                        }
                      },
                      {
                        "box": {
                          "id": "type",
                          "maxclass": "newobj",
                          "patching_rect": [
                            30.0,
                            265.0,
                            100.5,
                            22.0
                          ],
                          "text": "route int float"
                        }
                      },
                      {
                        "box": {
                          "id": "store_first",
                          "maxclass": "newobj",
                          "patching_rect": [
                            30.0,
                            305.0,
                            55.0,
                            22.0
                          ],
                          "text": "t f f"
                        }
                      },
                      {
                        "box": {
                          "id": "value",
                          "maxclass": "newobj",
                          "patching_rect": [
                            30.0,
                            445.0,
                            55.0,
                            22.0
                          ],
                          "text": "float"
                        }
                      },
                      {
                        "box": {
                          "id": "predicate",
                          "maxclass": "newobj",
                          "patching_rect": [
                            220.0,
                            345.0,
                            395.3,
                            22.0
                          ],
                          "text": "expr (($f1 - $f1) == 0.) && (($f1 >= -12.) && ($f1 <= 12.))"
                        }
                      },
                      {
                        "box": {
                          "id": "verdict",
                          "maxclass": "newobj",
                          "patching_rect": [
                            220.0,
                            395.0,
                            55.0,
                            22.0
                          ],
                          "text": "sel 1 0"
                        }
                      },
                      {
                        "box": {
                          "id": "note",
                          "maxclass": "comment",
                          "patching_rect": [
                            30.0,
                            760.0,
                            502.5,
                            22.0
                          ],
                          "text": "Exactly one typed atom; reject before coercion; finite numeric values only."
                        }
                      }
                    ],
                    "lines": [
                      {
                        "patchline": {
                          "source": [
                            "in",
                            0
                          ],
                          "destination": [
                            "arity",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "arity",
                            1
                          ],
                          "destination": [
                            "len",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "len",
                            0
                          ],
                          "destination": [
                            "one",
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
                            "length_order",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "length_order",
                            1
                          ],
                          "destination": [
                            "gate",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "length_order",
                            0
                          ],
                          "destination": [
                            "bad_length",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "bad_length",
                            0
                          ],
                          "destination": [
                            "invalid",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "arity",
                            0
                          ],
                          "destination": [
                            "gate",
                            1
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "gate",
                            0
                          ],
                          "destination": [
                            "type",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "type",
                            0
                          ],
                          "destination": [
                            "store_first",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "type",
                            2
                          ],
                          "destination": [
                            "invalid",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "store_first",
                            1
                          ],
                          "destination": [
                            "value",
                            1
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "store_first",
                            0
                          ],
                          "destination": [
                            "predicate",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "predicate",
                            0
                          ],
                          "destination": [
                            "verdict",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "verdict",
                            0
                          ],
                          "destination": [
                            "value",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "verdict",
                            1
                          ],
                          "destination": [
                            "invalid",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "value",
                            0
                          ],
                          "destination": [
                            "valid",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "type",
                            1
                          ],
                          "destination": [
                            "store_first",
                            0
                          ]
                        }
                      }
                    ]
                  }
                }
              },
              {
                "box": {
                  "id": "field_9",
                  "maxclass": "newobj",
                  "patching_rect": [
                    30.0,
                    630.0,
                    55.0,
                    22.0
                  ],
                  "text": "zl nth 9"
                }
              },
              {
                "box": {
                  "id": "check_9",
                  "maxclass": "newobj",
                  "patching_rect": [
                    30.0,
                    670.0,
                    60.300000000000004,
                    22.0
                  ],
                  "text": "p field_9",
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
                      1200.0,
                      850.0
                    ],
                    "openinpresentation": 0,
                    "boxes": [
                      {
                        "box": {
                          "id": "in",
                          "maxclass": "inlet",
                          "patching_rect": [
                            30.0,
                            25.0,
                            55.0,
                            22.0
                          ]
                        }
                      },
                      {
                        "box": {
                          "id": "valid",
                          "maxclass": "outlet",
                          "patching_rect": [
                            30.0,
                            700.0,
                            55.0,
                            22.0
                          ]
                        }
                      },
                      {
                        "box": {
                          "id": "invalid",
                          "maxclass": "outlet",
                          "patching_rect": [
                            300.0,
                            700.0,
                            55.0,
                            22.0
                          ]
                        }
                      },
                      {
                        "box": {
                          "id": "arity",
                          "maxclass": "newobj",
                          "patching_rect": [
                            30.0,
                            65.0,
                            55.0,
                            22.0
                          ],
                          "text": "t l l"
                        }
                      },
                      {
                        "box": {
                          "id": "len",
                          "maxclass": "newobj",
                          "patching_rect": [
                            240.0,
                            105.0,
                            55.0,
                            22.0
                          ],
                          "text": "zl len"
                        }
                      },
                      {
                        "box": {
                          "id": "one",
                          "maxclass": "newobj",
                          "patching_rect": [
                            240.0,
                            145.0,
                            55.0,
                            22.0
                          ],
                          "text": "== 1"
                        }
                      },
                      {
                        "box": {
                          "id": "length_order",
                          "maxclass": "newobj",
                          "patching_rect": [
                            240.0,
                            185.0,
                            55.0,
                            22.0
                          ],
                          "text": "t i i"
                        }
                      },
                      {
                        "box": {
                          "id": "bad_length",
                          "maxclass": "newobj",
                          "patching_rect": [
                            340.0,
                            225.0,
                            55.0,
                            22.0
                          ],
                          "text": "sel 0"
                        }
                      },
                      {
                        "box": {
                          "id": "gate",
                          "maxclass": "newobj",
                          "patching_rect": [
                            30.0,
                            225.0,
                            55.0,
                            22.0
                          ],
                          "text": "gate 1 0"
                        }
                      },
                      {
                        "box": {
                          "id": "type",
                          "maxclass": "newobj",
                          "patching_rect": [
                            30.0,
                            265.0,
                            60.300000000000004,
                            22.0
                          ],
                          "text": "route int"
                        }
                      },
                      {
                        "box": {
                          "id": "store_first",
                          "maxclass": "newobj",
                          "patching_rect": [
                            30.0,
                            305.0,
                            55.0,
                            22.0
                          ],
                          "text": "t i i"
                        }
                      },
                      {
                        "box": {
                          "id": "value",
                          "maxclass": "newobj",
                          "patching_rect": [
                            30.0,
                            445.0,
                            55.0,
                            22.0
                          ],
                          "text": "int"
                        }
                      },
                      {
                        "box": {
                          "id": "predicate",
                          "maxclass": "newobj",
                          "patching_rect": [
                            220.0,
                            345.0,
                            194.3,
                            22.0
                          ],
                          "text": "expr ($i1 >= 1) && ($i1 <= 3)"
                        }
                      },
                      {
                        "box": {
                          "id": "verdict",
                          "maxclass": "newobj",
                          "patching_rect": [
                            220.0,
                            395.0,
                            55.0,
                            22.0
                          ],
                          "text": "sel 1 0"
                        }
                      },
                      {
                        "box": {
                          "id": "note",
                          "maxclass": "comment",
                          "patching_rect": [
                            30.0,
                            760.0,
                            502.5,
                            22.0
                          ],
                          "text": "Exactly one typed atom; reject before coercion; finite numeric values only."
                        }
                      }
                    ],
                    "lines": [
                      {
                        "patchline": {
                          "source": [
                            "in",
                            0
                          ],
                          "destination": [
                            "arity",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "arity",
                            1
                          ],
                          "destination": [
                            "len",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "len",
                            0
                          ],
                          "destination": [
                            "one",
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
                            "length_order",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "length_order",
                            1
                          ],
                          "destination": [
                            "gate",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "length_order",
                            0
                          ],
                          "destination": [
                            "bad_length",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "bad_length",
                            0
                          ],
                          "destination": [
                            "invalid",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "arity",
                            0
                          ],
                          "destination": [
                            "gate",
                            1
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "gate",
                            0
                          ],
                          "destination": [
                            "type",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "type",
                            0
                          ],
                          "destination": [
                            "store_first",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "type",
                            1
                          ],
                          "destination": [
                            "invalid",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "store_first",
                            1
                          ],
                          "destination": [
                            "value",
                            1
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "store_first",
                            0
                          ],
                          "destination": [
                            "predicate",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "predicate",
                            0
                          ],
                          "destination": [
                            "verdict",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "verdict",
                            0
                          ],
                          "destination": [
                            "value",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "verdict",
                            1
                          ],
                          "destination": [
                            "invalid",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "value",
                            0
                          ],
                          "destination": [
                            "valid",
                            0
                          ]
                        }
                      }
                    ]
                  }
                }
              },
              {
                "box": {
                  "id": "field_10",
                  "maxclass": "newobj",
                  "patching_rect": [
                    310.0,
                    630.0,
                    60.300000000000004,
                    22.0
                  ],
                  "text": "zl nth 10"
                }
              },
              {
                "box": {
                  "id": "check_10",
                  "maxclass": "newobj",
                  "patching_rect": [
                    310.0,
                    670.0,
                    67.0,
                    22.0
                  ],
                  "text": "p field_10",
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
                      1200.0,
                      850.0
                    ],
                    "openinpresentation": 0,
                    "boxes": [
                      {
                        "box": {
                          "id": "in",
                          "maxclass": "inlet",
                          "patching_rect": [
                            30.0,
                            25.0,
                            55.0,
                            22.0
                          ]
                        }
                      },
                      {
                        "box": {
                          "id": "valid",
                          "maxclass": "outlet",
                          "patching_rect": [
                            30.0,
                            700.0,
                            55.0,
                            22.0
                          ]
                        }
                      },
                      {
                        "box": {
                          "id": "invalid",
                          "maxclass": "outlet",
                          "patching_rect": [
                            300.0,
                            700.0,
                            55.0,
                            22.0
                          ]
                        }
                      },
                      {
                        "box": {
                          "id": "arity",
                          "maxclass": "newobj",
                          "patching_rect": [
                            30.0,
                            65.0,
                            55.0,
                            22.0
                          ],
                          "text": "t l l"
                        }
                      },
                      {
                        "box": {
                          "id": "len",
                          "maxclass": "newobj",
                          "patching_rect": [
                            240.0,
                            105.0,
                            55.0,
                            22.0
                          ],
                          "text": "zl len"
                        }
                      },
                      {
                        "box": {
                          "id": "one",
                          "maxclass": "newobj",
                          "patching_rect": [
                            240.0,
                            145.0,
                            55.0,
                            22.0
                          ],
                          "text": "== 1"
                        }
                      },
                      {
                        "box": {
                          "id": "length_order",
                          "maxclass": "newobj",
                          "patching_rect": [
                            240.0,
                            185.0,
                            55.0,
                            22.0
                          ],
                          "text": "t i i"
                        }
                      },
                      {
                        "box": {
                          "id": "bad_length",
                          "maxclass": "newobj",
                          "patching_rect": [
                            340.0,
                            225.0,
                            55.0,
                            22.0
                          ],
                          "text": "sel 0"
                        }
                      },
                      {
                        "box": {
                          "id": "gate",
                          "maxclass": "newobj",
                          "patching_rect": [
                            30.0,
                            225.0,
                            55.0,
                            22.0
                          ],
                          "text": "gate 1 0"
                        }
                      },
                      {
                        "box": {
                          "id": "type",
                          "maxclass": "newobj",
                          "patching_rect": [
                            30.0,
                            265.0,
                            60.300000000000004,
                            22.0
                          ],
                          "text": "route int"
                        }
                      },
                      {
                        "box": {
                          "id": "store_first",
                          "maxclass": "newobj",
                          "patching_rect": [
                            30.0,
                            305.0,
                            55.0,
                            22.0
                          ],
                          "text": "t i i"
                        }
                      },
                      {
                        "box": {
                          "id": "value",
                          "maxclass": "newobj",
                          "patching_rect": [
                            30.0,
                            445.0,
                            55.0,
                            22.0
                          ],
                          "text": "int"
                        }
                      },
                      {
                        "box": {
                          "id": "predicate",
                          "maxclass": "newobj",
                          "patching_rect": [
                            220.0,
                            345.0,
                            194.3,
                            22.0
                          ],
                          "text": "expr ($i1 == 0) || ($i1 == 1)"
                        }
                      },
                      {
                        "box": {
                          "id": "verdict",
                          "maxclass": "newobj",
                          "patching_rect": [
                            220.0,
                            395.0,
                            55.0,
                            22.0
                          ],
                          "text": "sel 1 0"
                        }
                      },
                      {
                        "box": {
                          "id": "note",
                          "maxclass": "comment",
                          "patching_rect": [
                            30.0,
                            760.0,
                            502.5,
                            22.0
                          ],
                          "text": "Exactly one typed atom; reject before coercion; finite numeric values only."
                        }
                      }
                    ],
                    "lines": [
                      {
                        "patchline": {
                          "source": [
                            "in",
                            0
                          ],
                          "destination": [
                            "arity",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "arity",
                            1
                          ],
                          "destination": [
                            "len",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "len",
                            0
                          ],
                          "destination": [
                            "one",
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
                            "length_order",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "length_order",
                            1
                          ],
                          "destination": [
                            "gate",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "length_order",
                            0
                          ],
                          "destination": [
                            "bad_length",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "bad_length",
                            0
                          ],
                          "destination": [
                            "invalid",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "arity",
                            0
                          ],
                          "destination": [
                            "gate",
                            1
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "gate",
                            0
                          ],
                          "destination": [
                            "type",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "type",
                            0
                          ],
                          "destination": [
                            "store_first",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "type",
                            1
                          ],
                          "destination": [
                            "invalid",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "store_first",
                            1
                          ],
                          "destination": [
                            "value",
                            1
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "store_first",
                            0
                          ],
                          "destination": [
                            "predicate",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "predicate",
                            0
                          ],
                          "destination": [
                            "verdict",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "verdict",
                            0
                          ],
                          "destination": [
                            "value",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "verdict",
                            1
                          ],
                          "destination": [
                            "invalid",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "value",
                            0
                          ],
                          "destination": [
                            "valid",
                            0
                          ]
                        }
                      }
                    ]
                  }
                }
              },
              {
                "box": {
                  "id": "field_11",
                  "maxclass": "newobj",
                  "patching_rect": [
                    590.0,
                    630.0,
                    60.300000000000004,
                    22.0
                  ],
                  "text": "zl nth 11"
                }
              },
              {
                "box": {
                  "id": "check_11",
                  "maxclass": "newobj",
                  "patching_rect": [
                    590.0,
                    670.0,
                    67.0,
                    22.0
                  ],
                  "text": "p field_11",
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
                      1200.0,
                      850.0
                    ],
                    "openinpresentation": 0,
                    "boxes": [
                      {
                        "box": {
                          "id": "in",
                          "maxclass": "inlet",
                          "patching_rect": [
                            30.0,
                            25.0,
                            55.0,
                            22.0
                          ]
                        }
                      },
                      {
                        "box": {
                          "id": "valid",
                          "maxclass": "outlet",
                          "patching_rect": [
                            30.0,
                            700.0,
                            55.0,
                            22.0
                          ]
                        }
                      },
                      {
                        "box": {
                          "id": "invalid",
                          "maxclass": "outlet",
                          "patching_rect": [
                            300.0,
                            700.0,
                            55.0,
                            22.0
                          ]
                        }
                      },
                      {
                        "box": {
                          "id": "arity",
                          "maxclass": "newobj",
                          "patching_rect": [
                            30.0,
                            65.0,
                            55.0,
                            22.0
                          ],
                          "text": "t l l"
                        }
                      },
                      {
                        "box": {
                          "id": "len",
                          "maxclass": "newobj",
                          "patching_rect": [
                            240.0,
                            105.0,
                            55.0,
                            22.0
                          ],
                          "text": "zl len"
                        }
                      },
                      {
                        "box": {
                          "id": "one",
                          "maxclass": "newobj",
                          "patching_rect": [
                            240.0,
                            145.0,
                            55.0,
                            22.0
                          ],
                          "text": "== 1"
                        }
                      },
                      {
                        "box": {
                          "id": "length_order",
                          "maxclass": "newobj",
                          "patching_rect": [
                            240.0,
                            185.0,
                            55.0,
                            22.0
                          ],
                          "text": "t i i"
                        }
                      },
                      {
                        "box": {
                          "id": "bad_length",
                          "maxclass": "newobj",
                          "patching_rect": [
                            340.0,
                            225.0,
                            55.0,
                            22.0
                          ],
                          "text": "sel 0"
                        }
                      },
                      {
                        "box": {
                          "id": "gate",
                          "maxclass": "newobj",
                          "patching_rect": [
                            30.0,
                            225.0,
                            55.0,
                            22.0
                          ],
                          "text": "gate 1 0"
                        }
                      },
                      {
                        "box": {
                          "id": "type",
                          "maxclass": "newobj",
                          "patching_rect": [
                            30.0,
                            265.0,
                            60.300000000000004,
                            22.0
                          ],
                          "text": "route int"
                        }
                      },
                      {
                        "box": {
                          "id": "store_first",
                          "maxclass": "newobj",
                          "patching_rect": [
                            30.0,
                            305.0,
                            55.0,
                            22.0
                          ],
                          "text": "t i i"
                        }
                      },
                      {
                        "box": {
                          "id": "value",
                          "maxclass": "newobj",
                          "patching_rect": [
                            30.0,
                            445.0,
                            55.0,
                            22.0
                          ],
                          "text": "int"
                        }
                      },
                      {
                        "box": {
                          "id": "predicate",
                          "maxclass": "newobj",
                          "patching_rect": [
                            220.0,
                            345.0,
                            55.0,
                            22.0
                          ],
                          "text": "expr 1"
                        }
                      },
                      {
                        "box": {
                          "id": "verdict",
                          "maxclass": "newobj",
                          "patching_rect": [
                            220.0,
                            395.0,
                            55.0,
                            22.0
                          ],
                          "text": "sel 1 0"
                        }
                      },
                      {
                        "box": {
                          "id": "note",
                          "maxclass": "comment",
                          "patching_rect": [
                            30.0,
                            760.0,
                            502.5,
                            22.0
                          ],
                          "text": "Exactly one typed atom; reject before coercion; finite numeric values only."
                        }
                      }
                    ],
                    "lines": [
                      {
                        "patchline": {
                          "source": [
                            "in",
                            0
                          ],
                          "destination": [
                            "arity",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "arity",
                            1
                          ],
                          "destination": [
                            "len",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "len",
                            0
                          ],
                          "destination": [
                            "one",
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
                            "length_order",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "length_order",
                            1
                          ],
                          "destination": [
                            "gate",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "length_order",
                            0
                          ],
                          "destination": [
                            "bad_length",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "bad_length",
                            0
                          ],
                          "destination": [
                            "invalid",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "arity",
                            0
                          ],
                          "destination": [
                            "gate",
                            1
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "gate",
                            0
                          ],
                          "destination": [
                            "type",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "type",
                            0
                          ],
                          "destination": [
                            "store_first",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "type",
                            1
                          ],
                          "destination": [
                            "invalid",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "store_first",
                            1
                          ],
                          "destination": [
                            "value",
                            1
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "store_first",
                            0
                          ],
                          "destination": [
                            "predicate",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "predicate",
                            0
                          ],
                          "destination": [
                            "verdict",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "verdict",
                            0
                          ],
                          "destination": [
                            "value",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "verdict",
                            1
                          ],
                          "destination": [
                            "invalid",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "value",
                            0
                          ],
                          "destination": [
                            "valid",
                            0
                          ]
                        }
                      }
                    ]
                  }
                }
              },
              {
                "box": {
                  "id": "slice_max",
                  "maxclass": "newobj",
                  "patching_rect": [
                    950.0,
                    70.0,
                    55.0,
                    22.0
                  ],
                  "text": "- 1"
                }
              },
              {
                "box": {
                  "id": "slice_clamp",
                  "maxclass": "newobj",
                  "patching_rect": [
                    950.0,
                    820.0,
                    60.300000000000004,
                    22.0
                  ],
                  "text": "clip 0 15"
                }
              },
              {
                "box": {
                  "id": "bounded_slice",
                  "maxclass": "newobj",
                  "patching_rect": [
                    950.0,
                    860.0,
                    140.70000000000002,
                    22.0
                  ],
                  "text": "prepend bounded_slice"
                }
              },
              {
                "box": {
                  "id": "rate",
                  "maxclass": "newobj",
                  "patching_rect": [
                    370.0,
                    790.0,
                    55.0,
                    22.0
                  ],
                  "text": "float 1."
                }
              },
              {
                "box": {
                  "id": "direction_check",
                  "maxclass": "newobj",
                  "patching_rect": [
                    370.0,
                    830.0,
                    194.3,
                    22.0
                  ],
                  "text": "expr ($f1 > 0.) || ($i2 == 1)"
                }
              },
              {
                "box": {
                  "id": "bad_direction",
                  "maxclass": "newobj",
                  "patching_rect": [
                    370.0,
                    870.0,
                    55.0,
                    22.0
                  ],
                  "text": "sel 0"
                }
              },
              {
                "box": {
                  "id": "id",
                  "maxclass": "newobj",
                  "patching_rect": [
                    30.0,
                    790.0,
                    55.0,
                    22.0
                  ],
                  "text": "int 0"
                }
              },
              {
                "box": {
                  "id": "id_monotonic",
                  "maxclass": "newobj",
                  "patching_rect": [
                    30.0,
                    830.0,
                    55.0,
                    22.0
                  ],
                  "text": "> -1"
                }
              },
              {
                "box": {
                  "id": "bad_id",
                  "maxclass": "newobj",
                  "patching_rect": [
                    30.0,
                    870.0,
                    55.0,
                    22.0
                  ],
                  "text": "sel 0"
                }
              },
              {
                "box": {
                  "id": "finish",
                  "maxclass": "newobj",
                  "patching_rect": [
                    650.0,
                    790.0,
                    55.0,
                    22.0
                  ],
                  "text": "t b b b"
                }
              },
              {
                "box": {
                  "id": "verdict",
                  "maxclass": "newobj",
                  "patching_rect": [
                    650.0,
                    910.0,
                    55.0,
                    22.0
                  ],
                  "text": "sel 1 0"
                }
              },
              {
                "box": {
                  "id": "valid_order",
                  "maxclass": "newobj",
                  "patching_rect": [
                    650.0,
                    950.0,
                    55.0,
                    22.0
                  ],
                  "text": "t b b"
                }
              },
              {
                "box": {
                  "id": "id_accept",
                  "maxclass": "newobj",
                  "patching_rect": [
                    800.0,
                    950.0,
                    55.0,
                    22.0
                  ],
                  "text": "int 0"
                }
              },
              {
                "box": {
                  "id": "unsupported",
                  "maxclass": "message",
                  "patching_rect": [
                    390.0,
                    1000.0,
                    241.20000000000002,
                    22.0
                  ],
                  "text": "error unsupported_event_no_execution"
                }
              },
              {
                "box": {
                  "id": "note",
                  "maxclass": "comment",
                  "patching_rect": [
                    30.0,
                    1140.0,
                    650.0,
                    22.0
                  ],
                  "text": "All events stop safely. No slice/repeat/reverse/offset execution; IDs validate received events only."
                }
              },
              {
                "box": {
                  "id": "slice_trace",
                  "maxclass": "newobj",
                  "patching_rect": [
                    950.0,
                    910.0,
                    120.60000000000001,
                    22.0
                  ],
                  "text": "prepend validation"
                }
              }
            ],
            "lines": [
              {
                "patchline": {
                  "source": [
                    "malformed",
                    0
                  ],
                  "destination": [
                    "rejected",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "in",
                    0
                  ],
                  "destination": [
                    "receive_order",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "receive_order",
                    1
                  ],
                  "destination": [
                    "arity",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "arity",
                    0
                  ],
                  "destination": [
                    "arity_ok",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "arity_ok",
                    0
                  ],
                  "destination": [
                    "arity_order",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "arity_order",
                    1
                  ],
                  "destination": [
                    "gate",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "arity_order",
                    0
                  ],
                  "destination": [
                    "bad_arity",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "bad_arity",
                    0
                  ],
                  "destination": [
                    "malformed",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "receive_order",
                    0
                  ],
                  "destination": [
                    "gate",
                    1
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "gate",
                    0
                  ],
                  "destination": [
                    "validation_order",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "validation_order",
                    2
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
                    "valid",
                    1
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "bad",
                    0
                  ],
                  "destination": [
                    "valid",
                    1
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "validation_order",
                    1
                  ],
                  "destination": [
                    "fields",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "fields",
                    0
                  ],
                  "destination": [
                    "field_1",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "field_1",
                    0
                  ],
                  "destination": [
                    "check_1",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "check_1",
                    1
                  ],
                  "destination": [
                    "bad",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "fields",
                    1
                  ],
                  "destination": [
                    "field_2",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "field_2",
                    0
                  ],
                  "destination": [
                    "check_2",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "check_2",
                    1
                  ],
                  "destination": [
                    "bad",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "fields",
                    2
                  ],
                  "destination": [
                    "field_3",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "field_3",
                    0
                  ],
                  "destination": [
                    "check_3",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "check_3",
                    1
                  ],
                  "destination": [
                    "bad",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "fields",
                    3
                  ],
                  "destination": [
                    "field_4",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "field_4",
                    0
                  ],
                  "destination": [
                    "check_4",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "check_4",
                    1
                  ],
                  "destination": [
                    "bad",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "fields",
                    4
                  ],
                  "destination": [
                    "field_5",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "field_5",
                    0
                  ],
                  "destination": [
                    "check_5",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "check_5",
                    5
                  ],
                  "destination": [
                    "bad",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "fields",
                    5
                  ],
                  "destination": [
                    "field_6",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "field_6",
                    0
                  ],
                  "destination": [
                    "check_6",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "check_6",
                    1
                  ],
                  "destination": [
                    "bad",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "fields",
                    6
                  ],
                  "destination": [
                    "field_7",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "field_7",
                    0
                  ],
                  "destination": [
                    "check_7",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "check_7",
                    1
                  ],
                  "destination": [
                    "bad",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "fields",
                    7
                  ],
                  "destination": [
                    "field_8",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "field_8",
                    0
                  ],
                  "destination": [
                    "check_8",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "check_8",
                    1
                  ],
                  "destination": [
                    "bad",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "fields",
                    8
                  ],
                  "destination": [
                    "field_9",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "field_9",
                    0
                  ],
                  "destination": [
                    "check_9",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "check_9",
                    1
                  ],
                  "destination": [
                    "bad",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "fields",
                    9
                  ],
                  "destination": [
                    "field_10",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "field_10",
                    0
                  ],
                  "destination": [
                    "check_10",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "check_10",
                    1
                  ],
                  "destination": [
                    "bad",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "fields",
                    10
                  ],
                  "destination": [
                    "field_11",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "field_11",
                    0
                  ],
                  "destination": [
                    "check_11",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "check_11",
                    1
                  ],
                  "destination": [
                    "bad",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "slice_count",
                    0
                  ],
                  "destination": [
                    "slice_max",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "slice_max",
                    0
                  ],
                  "destination": [
                    "slice_clamp",
                    2
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "check_6",
                    0
                  ],
                  "destination": [
                    "slice_clamp",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "slice_clamp",
                    0
                  ],
                  "destination": [
                    "bounded_slice",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "check_7",
                    0
                  ],
                  "destination": [
                    "rate",
                    1
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "check_10",
                    0
                  ],
                  "destination": [
                    "direction_check",
                    1
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "rate",
                    0
                  ],
                  "destination": [
                    "direction_check",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "direction_check",
                    0
                  ],
                  "destination": [
                    "bad_direction",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "bad_direction",
                    0
                  ],
                  "destination": [
                    "bad",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "check_2",
                    0
                  ],
                  "destination": [
                    "id",
                    1
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "id",
                    0
                  ],
                  "destination": [
                    "id_monotonic",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "id_monotonic",
                    0
                  ],
                  "destination": [
                    "bad_id",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "bad_id",
                    0
                  ],
                  "destination": [
                    "bad",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "validation_order",
                    0
                  ],
                  "destination": [
                    "finish",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "finish",
                    2
                  ],
                  "destination": [
                    "rate",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "finish",
                    1
                  ],
                  "destination": [
                    "id",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "finish",
                    0
                  ],
                  "destination": [
                    "valid",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "valid",
                    0
                  ],
                  "destination": [
                    "verdict",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "verdict",
                    1
                  ],
                  "destination": [
                    "malformed",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "verdict",
                    0
                  ],
                  "destination": [
                    "valid_order",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "check_2",
                    0
                  ],
                  "destination": [
                    "id_accept",
                    1
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "valid_order",
                    1
                  ],
                  "destination": [
                    "id_accept",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "id_accept",
                    0
                  ],
                  "destination": [
                    "id_monotonic",
                    1
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "valid_order",
                    0
                  ],
                  "destination": [
                    "unsupported",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "unsupported",
                    0
                  ],
                  "destination": [
                    "rejected",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "bounded_slice",
                    0
                  ],
                  "destination": [
                    "slice_trace",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "slice_trace",
                    0
                  ],
                  "destination": [
                    "rejected",
                    0
                  ]
                }
              }
            ]
          }
        }
      },
      {
        "box": {
          "id": "event_trace",
          "maxclass": "newobj",
          "patching_rect": [
            30.0,
            650.0,
            147.4,
            22.0
          ],
          "text": "prepend rejected_event"
        }
      },
      {
        "box": {
          "id": "error_order",
          "maxclass": "newobj",
          "patching_rect": [
            600.0,
            610.0,
            55.0,
            22.0
          ],
          "text": "t l b"
        }
      },
      {
        "box": {
          "id": "stop_request",
          "maxclass": "message",
          "patching_rect": [
            600.0,
            655.0,
            55.0,
            22.0
          ],
          "text": "0"
        }
      },
      {
        "box": {
          "id": "safety",
          "maxclass": "newobj",
          "patching_rect": [
            600.0,
            715.0,
            113.9,
            22.0
          ],
          "text": "p playback_safety",
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
              1200.0,
              850.0
            ],
            "openinpresentation": 0,
            "boxes": [
              {
                "box": {
                  "id": "request",
                  "maxclass": "inlet",
                  "patching_rect": [
                    30.0,
                    25.0,
                    55.0,
                    22.0
                  ]
                }
              },
              {
                "box": {
                  "id": "envelope",
                  "maxclass": "outlet",
                  "patching_rect": [
                    30.0,
                    660.0,
                    55.0,
                    22.0
                  ],
                  "outlettype": [
                    "signal"
                  ]
                }
              },
              {
                "box": {
                  "id": "action",
                  "maxclass": "outlet",
                  "patching_rect": [
                    500.0,
                    660.0,
                    55.0,
                    22.0
                  ]
                }
              },
              {
                "box": {
                  "id": "request_order",
                  "maxclass": "newobj",
                  "patching_rect": [
                    30.0,
                    70.0,
                    55.0,
                    22.0
                  ],
                  "text": "t b i b"
                }
              },
              {
                "box": {
                  "id": "disarm",
                  "maxclass": "message",
                  "patching_rect": [
                    450.0,
                    105.0,
                    55.0,
                    22.0
                  ],
                  "text": "0"
                }
              },
              {
                "box": {
                  "id": "completion_gate",
                  "maxclass": "newobj",
                  "patching_rect": [
                    200.0,
                    490.0,
                    55.0,
                    22.0
                  ],
                  "text": "gate 1 0"
                }
              },
              {
                "box": {
                  "id": "pending",
                  "maxclass": "newobj",
                  "patching_rect": [
                    500.0,
                    535.0,
                    55.0,
                    22.0
                  ],
                  "text": "int 0"
                }
              },
              {
                "box": {
                  "id": "dsp",
                  "maxclass": "newobj",
                  "patching_rect": [
                    700.0,
                    70.0,
                    60.300000000000004,
                    22.0
                  ],
                  "text": "dspstate~"
                }
              },
              {
                "box": {
                  "id": "dsp_order",
                  "maxclass": "newobj",
                  "patching_rect": [
                    700.0,
                    110.0,
                    55.0,
                    22.0
                  ],
                  "text": "t i i"
                }
              },
              {
                "box": {
                  "id": "dsp_cache",
                  "maxclass": "newobj",
                  "patching_rect": [
                    30.0,
                    155.0,
                    55.0,
                    22.0
                  ],
                  "text": "int 0"
                }
              },
              {
                "box": {
                  "id": "dsp_off",
                  "maxclass": "newobj",
                  "patching_rect": [
                    800.0,
                    155.0,
                    55.0,
                    22.0
                  ],
                  "text": "sel 0"
                }
              },
              {
                "box": {
                  "id": "off_stop",
                  "maxclass": "message",
                  "patching_rect": [
                    800.0,
                    200.0,
                    55.0,
                    22.0
                  ],
                  "text": "0"
                }
              },
              {
                "box": {
                  "id": "dsp_select",
                  "maxclass": "newobj",
                  "patching_rect": [
                    30.0,
                    200.0,
                    55.0,
                    22.0
                  ],
                  "text": "sel 0 1"
                }
              },
              {
                "box": {
                  "id": "off_order",
                  "maxclass": "newobj",
                  "patching_rect": [
                    30.0,
                    250.0,
                    55.0,
                    22.0
                  ],
                  "text": "t b b"
                }
              },
              {
                "box": {
                  "id": "zero",
                  "maxclass": "message",
                  "patching_rect": [
                    30.0,
                    305.0,
                    55.0,
                    22.0
                  ],
                  "text": "0."
                }
              },
              {
                "box": {
                  "id": "on_order",
                  "maxclass": "newobj",
                  "patching_rect": [
                    200.0,
                    250.0,
                    55.0,
                    22.0
                  ],
                  "text": "t b b"
                }
              },
              {
                "box": {
                  "id": "arm",
                  "maxclass": "message",
                  "patching_rect": [
                    320.0,
                    305.0,
                    55.0,
                    22.0
                  ],
                  "text": "1"
                }
              },
              {
                "box": {
                  "id": "release",
                  "maxclass": "message",
                  "patching_rect": [
                    200.0,
                    305.0,
                    55.0,
                    22.0
                  ],
                  "text": "0. 10"
                }
              },
              {
                "box": {
                  "id": "amp",
                  "maxclass": "newobj",
                  "patching_rect": [
                    30.0,
                    430.0,
                    55.0,
                    22.0
                  ],
                  "text": "line~ 0."
                }
              },
              {
                "box": {
                  "id": "finish",
                  "maxclass": "newobj",
                  "patching_rect": [
                    500.0,
                    490.0,
                    55.0,
                    22.0
                  ],
                  "text": "t b b"
                }
              },
              {
                "box": {
                  "id": "init",
                  "maxclass": "newobj",
                  "patching_rect": [
                    700.0,
                    25.0,
                    55.0,
                    22.0
                  ],
                  "text": "loadbang"
                }
              },
              {
                "box": {
                  "id": "note",
                  "maxclass": "comment",
                  "patching_rect": [
                    30.0,
                    730.0,
                    650.0,
                    22.0
                  ],
                  "text": "0=stop, 1=play, 2=load. Newest request replaces pending action; no POD clock."
                }
              },
              {
                "box": {
                  "id": "cancel_ramp",
                  "maxclass": "message",
                  "text": "stop",
                  "patching_rect": [
                    450.0,
                    150.0,
                    55.0,
                    22.0
                  ]
                }
              },
              {
                "box": {
                  "id": "start_attack",
                  "maxclass": "inlet",
                  "patching_rect": [
                    300.0,
                    25.0,
                    55.0,
                    22.0
                  ]
                }
              },
              {
                "box": {
                  "id": "attack",
                  "maxclass": "message",
                  "patching_rect": [
                    300.0,
                    360.0,
                    55.0,
                    22.0
                  ],
                  "text": "1. 10"
                }
              },
              {
                "box": {
                  "id": "dsp_status",
                  "maxclass": "outlet",
                  "patching_rect": [
                    800.0,
                    660.0,
                    55.0,
                    22.0
                  ]
                }
              }
            ],
            "lines": [
              {
                "patchline": {
                  "source": [
                    "request",
                    0
                  ],
                  "destination": [
                    "request_order",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "request_order",
                    2
                  ],
                  "destination": [
                    "disarm",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "disarm",
                    0
                  ],
                  "destination": [
                    "completion_gate",
                    0
                  ],
                  "order": 0
                }
              },
              {
                "patchline": {
                  "source": [
                    "request_order",
                    1
                  ],
                  "destination": [
                    "pending",
                    1
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "dsp",
                    0
                  ],
                  "destination": [
                    "dsp_order",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "dsp_order",
                    1
                  ],
                  "destination": [
                    "dsp_cache",
                    1
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "dsp_order",
                    0
                  ],
                  "destination": [
                    "dsp_off",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "dsp_off",
                    0
                  ],
                  "destination": [
                    "off_stop",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "off_stop",
                    0
                  ],
                  "destination": [
                    "request_order",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "request_order",
                    0
                  ],
                  "destination": [
                    "dsp_cache",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "dsp_cache",
                    0
                  ],
                  "destination": [
                    "dsp_select",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "dsp_select",
                    0
                  ],
                  "destination": [
                    "off_order",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "off_order",
                    1
                  ],
                  "destination": [
                    "zero",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "dsp_select",
                    1
                  ],
                  "destination": [
                    "on_order",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "on_order",
                    1
                  ],
                  "destination": [
                    "arm",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "arm",
                    0
                  ],
                  "destination": [
                    "completion_gate",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "on_order",
                    0
                  ],
                  "destination": [
                    "release",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "release",
                    0
                  ],
                  "destination": [
                    "amp",
                    0
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
                    "amp",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "amp",
                    0
                  ],
                  "destination": [
                    "envelope",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "amp",
                    1
                  ],
                  "destination": [
                    "completion_gate",
                    1
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "off_order",
                    0
                  ],
                  "destination": [
                    "finish",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "finish",
                    1
                  ],
                  "destination": [
                    "disarm",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "finish",
                    0
                  ],
                  "destination": [
                    "pending",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "pending",
                    0
                  ],
                  "destination": [
                    "action",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "init",
                    0
                  ],
                  "destination": [
                    "dsp",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "completion_gate",
                    0
                  ],
                  "destination": [
                    "finish",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "disarm",
                    0
                  ],
                  "destination": [
                    "cancel_ramp",
                    0
                  ],
                  "order": 1
                }
              },
              {
                "patchline": {
                  "source": [
                    "cancel_ramp",
                    0
                  ],
                  "destination": [
                    "amp",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "start_attack",
                    0
                  ],
                  "destination": [
                    "attack",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "attack",
                    0
                  ],
                  "destination": [
                    "amp",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "dsp_order",
                    1
                  ],
                  "destination": [
                    "dsp_status",
                    0
                  ]
                }
              }
            ]
          }
        }
      },
      {
        "box": {
          "id": "amp_left",
          "maxclass": "newobj",
          "patching_rect": [
            250.0,
            385.0,
            55.0,
            22.0
          ],
          "text": "*~"
        }
      },
      {
        "box": {
          "id": "amp_right",
          "maxclass": "newobj",
          "patching_rect": [
            490.0,
            385.0,
            55.0,
            22.0
          ],
          "text": "*~"
        }
      },
      {
        "box": {
          "id": "safe_action",
          "maxclass": "newobj",
          "patching_rect": [
            600.0,
            765.0,
            55.0,
            22.0
          ],
          "text": "t i b"
        }
      },
      {
        "box": {
          "id": "stop_rate",
          "maxclass": "message",
          "patching_rect": [
            760.0,
            805.0,
            55.0,
            22.0
          ],
          "text": "0."
        }
      },
      {
        "box": {
          "id": "groove_stop",
          "maxclass": "message",
          "patching_rect": [
            840.0,
            805.0,
            55.0,
            22.0
          ],
          "text": "stop"
        }
      },
      {
        "box": {
          "id": "stop_order",
          "maxclass": "newobj",
          "patching_rect": [
            760.0,
            765.0,
            55.0,
            22.0
          ],
          "text": "t b b"
        }
      },
      {
        "box": {
          "id": "action_route",
          "maxclass": "newobj",
          "patching_rect": [
            600.0,
            805.0,
            55.0,
            22.0
          ],
          "text": "sel 2 1"
        }
      },
      {
        "box": {
          "id": "load_order",
          "maxclass": "newobj",
          "patching_rect": [
            30.0,
            725.0,
            55.0,
            22.0
          ],
          "text": "t b b s"
        }
      },
      {
        "box": {
          "id": "pending_path",
          "maxclass": "newobj",
          "patching_rect": [
            30.0,
            855.0,
            55.0,
            22.0
          ],
          "text": "zl reg"
        }
      },
      {
        "box": {
          "id": "load_action",
          "maxclass": "message",
          "patching_rect": [
            190.0,
            765.0,
            55.0,
            22.0
          ],
          "text": "2"
        }
      },
      {
        "box": {
          "id": "load_defer",
          "maxclass": "newobj",
          "patching_rect": [
            30.0,
            900.0,
            55.0,
            22.0
          ],
          "text": "deferlow"
        }
      },
      {
        "box": {
          "id": "physical_load",
          "maxclass": "newobj",
          "patching_rect": [
            30.0,
            945.0,
            55.0,
            22.0
          ],
          "text": "t s b"
        }
      },
      {
        "box": {
          "id": "invalidate_order",
          "maxclass": "newobj",
          "patching_rect": [
            270.0,
            900.0,
            55.0,
            22.0
          ],
          "text": "t b b"
        }
      },
      {
        "box": {
          "id": "invalidate_state",
          "maxclass": "message",
          "patching_rect": [
            270.0,
            945.0,
            509.2,
            22.0
          ],
          "text": "replace sample_loaded 0, setparse sample_path \\\"\\\", replace sample_length_ms 0."
        }
      },
      {
        "box": {
          "id": "empty_buffer",
          "maxclass": "message",
          "patching_rect": [
            270.0,
            1000.0,
            87.10000000000001,
            22.0
          ],
          "text": "sizeinsamps 0"
        }
      },
      {
        "box": {
          "id": "replace_file",
          "maxclass": "newobj",
          "patching_rect": [
            30.0,
            1000.0,
            100.5,
            22.0
          ],
          "text": "prepend replace"
        }
      },
      {
        "box": {
          "id": "completion",
          "maxclass": "newobj",
          "patching_rect": [
            950.0,
            705.0,
            55.0,
            22.0
          ],
          "text": "t b b b"
        }
      },
      {
        "box": {
          "id": "info",
          "maxclass": "newobj",
          "patching_rect": [
            950.0,
            755.0,
            147.4,
            22.0
          ],
          "text": "info~ #1.pod.#2.buffer"
        }
      },
      {
        "box": {
          "id": "reset_metadata",
          "maxclass": "message",
          "patching_rect": [
            1250.0,
            705.0,
            55.0,
            22.0
          ],
          "text": "0."
        }
      },
      {
        "box": {
          "id": "length",
          "maxclass": "newobj",
          "patching_rect": [
            950.0,
            865.0,
            55.0,
            22.0
          ],
          "text": "float 0."
        }
      },
      {
        "box": {
          "id": "channels",
          "maxclass": "newobj",
          "patching_rect": [
            1110.0,
            865.0,
            55.0,
            22.0
          ],
          "text": "int 0"
        }
      },
      {
        "box": {
          "id": "sample_rate",
          "maxclass": "newobj",
          "patching_rect": [
            1270.0,
            865.0,
            55.0,
            22.0
          ],
          "text": "float 0."
        }
      },
      {
        "box": {
          "id": "actual_path",
          "maxclass": "newobj",
          "patching_rect": [
            1430.0,
            865.0,
            55.0,
            22.0
          ],
          "text": "zl reg"
        }
      },
      {
        "box": {
          "id": "metadata_order",
          "maxclass": "newobj",
          "patching_rect": [
            950.0,
            815.0,
            55.0,
            22.0
          ],
          "text": "t b b b"
        }
      },
      {
        "box": {
          "id": "available",
          "maxclass": "newobj",
          "patching_rect": [
            950.0,
            915.0,
            650.0,
            22.0
          ],
          "text": "expr (($f1 - $f1) == 0.) && ($f1 > 0.) && (($i2 == 1) || ($i2 == 2)) && (($f3 - $f3) == 0.) && ($f3 > 0.)"
        }
      },
      {
        "box": {
          "id": "availability",
          "maxclass": "newobj",
          "patching_rect": [
            950.0,
            965.0,
            55.0,
            22.0
          ],
          "text": "sel 1 0"
        }
      },
      {
        "box": {
          "id": "loaded_order",
          "maxclass": "newobj",
          "patching_rect": [
            950.0,
            1010.0,
            55.0,
            22.0
          ],
          "text": "t b b b"
        }
      },
      {
        "box": {
          "id": "path_state",
          "maxclass": "newobj",
          "patching_rect": [
            1350.0,
            1045.0,
            180.9,
            22.0
          ],
          "text": "prepend replace sample_path"
        }
      },
      {
        "box": {
          "id": "length_copy",
          "maxclass": "newobj",
          "patching_rect": [
            1150.0,
            1045.0,
            55.0,
            22.0
          ],
          "text": "float 0."
        }
      },
      {
        "box": {
          "id": "length_state",
          "maxclass": "newobj",
          "patching_rect": [
            1150.0,
            1090.0,
            214.4,
            22.0
          ],
          "text": "prepend replace sample_length_ms"
        }
      },
      {
        "box": {
          "id": "loaded",
          "maxclass": "message",
          "patching_rect": [
            950.0,
            1135.0,
            154.1,
            22.0
          ],
          "text": "replace sample_loaded 1"
        }
      },
      {
        "box": {
          "id": "failed_order",
          "maxclass": "newobj",
          "patching_rect": [
            1430.0,
            965.0,
            55.0,
            22.0
          ],
          "text": "t b b"
        }
      },
      {
        "box": {
          "id": "failed",
          "maxclass": "message",
          "patching_rect": [
            1430.0,
            1010.0,
            194.3,
            22.0
          ],
          "text": "error invalid_or_empty_buffer"
        }
      },
      {
        "box": {
          "id": "init",
          "maxclass": "newobj",
          "patching_rect": [
            860.0,
            70.0,
            55.0,
            22.0
          ],
          "text": "loadbang"
        }
      },
      {
        "box": {
          "id": "init_order",
          "maxclass": "newobj",
          "patching_rect": [
            860.0,
            110.0,
            55.0,
            22.0
          ],
          "text": "t b b b"
        }
      },
      {
        "box": {
          "id": "defaults",
          "maxclass": "message",
          "patching_rect": [
            860.0,
            155.0,
            650.0,
            22.0
          ],
          "text": "clear, replace api_version 1, replace pod_id #2, setparse sample_path \\\"\\\", replace sample_loaded 0, replace gain 0.8, replace pan 0., replace base_rate 1., replace jung_enabled 0, replace seed 42691, replace slice_count 16, replace debug_enabled 1, replace sample_length_ms 0."
        }
      },
      {
        "box": {
          "id": "state_note",
          "maxclass": "comment",
          "patching_rect": [
            860.0,
            30.0,
            650.0,
            22.0
          ],
          "text": "The dict is authoritative. Floats/ints below are transient DSP/metadata caches, not independent user state."
        }
      },
      {
        "box": {
          "id": "debug_status",
          "maxclass": "newobj",
          "patching_rect": [
            1160.0,
            490.0,
            140.70000000000002,
            22.0
          ],
          "text": "prepend debug_enabled"
        }
      },
      {
        "box": {
          "id": "play_request",
          "maxclass": "newobj",
          "patching_rect": [
            30.0,
            1140.0,
            55.0,
            22.0
          ],
          "text": "t b b"
        }
      },
      {
        "box": {
          "id": "play_state",
          "maxclass": "newobj",
          "patching_rect": [
            600.0,
            1170.0,
            368.5,
            22.0
          ],
          "text": "dict.unpack sample_loaded: base_rate: sample_length_ms:"
        }
      },
      {
        "box": {
          "id": "ready_before_release",
          "maxclass": "newobj",
          "patching_rect": [
            30.0,
            1180.0,
            55.0,
            22.0
          ],
          "text": "int 0"
        }
      },
      {
        "box": {
          "id": "can_request",
          "maxclass": "newobj",
          "patching_rect": [
            30.0,
            1220.0,
            55.0,
            22.0
          ],
          "text": "sel 1 0"
        }
      },
      {
        "box": {
          "id": "play_action",
          "maxclass": "message",
          "patching_rect": [
            30.0,
            1260.0,
            55.0,
            22.0
          ],
          "text": "1"
        }
      },
      {
        "box": {
          "id": "not_loaded",
          "maxclass": "message",
          "patching_rect": [
            230.0,
            1260.0,
            221.1,
            22.0
          ],
          "text": "error play_requires_valid_sample_and_DSP"
        }
      },
      {
        "box": {
          "id": "preflight",
          "maxclass": "newobj",
          "patching_rect": [
            600.0,
            1220.0,
            55.0,
            22.0
          ],
          "text": "t b b"
        }
      },
      {
        "box": {
          "id": "ready_after_release",
          "maxclass": "newobj",
          "patching_rect": [
            600.0,
            1260.0,
            55.0,
            22.0
          ],
          "text": "int 0"
        }
      },
      {
        "box": {
          "id": "still_ready",
          "maxclass": "newobj",
          "patching_rect": [
            600.0,
            1300.0,
            55.0,
            22.0
          ],
          "text": "sel 1 0"
        }
      },
      {
        "box": {
          "id": "refresh_before_start",
          "maxclass": "newobj",
          "patching_rect": [
            800.0,
            1300.0,
            55.0,
            22.0
          ],
          "text": "t b b"
        }
      },
      {
        "box": {
          "id": "ready_after_metadata",
          "maxclass": "newobj",
          "patching_rect": [
            800.0,
            1340.0,
            55.0,
            22.0
          ],
          "text": "int 0"
        }
      },
      {
        "box": {
          "id": "start_allowed",
          "maxclass": "newobj",
          "patching_rect": [
            800.0,
            1380.0,
            55.0,
            22.0
          ],
          "text": "sel 1 0"
        }
      },
      {
        "box": {
          "id": "start_valid",
          "maxclass": "newobj",
          "patching_rect": [
            600.0,
            1420.0,
            73.7,
            22.0
          ],
          "text": "t b b b b b"
        }
      },
      {
        "box": {
          "id": "play_rate",
          "maxclass": "newobj",
          "patching_rect": [
            850.0,
            1460.0,
            55.0,
            22.0
          ],
          "text": "float 1."
        }
      },
      {
        "box": {
          "id": "play_end",
          "maxclass": "newobj",
          "patching_rect": [
            600.0,
            1460.0,
            55.0,
            22.0
          ],
          "text": "float 0."
        }
      },
      {
        "box": {
          "id": "full_start",
          "maxclass": "message",
          "patching_rect": [
            700.0,
            1460.0,
            55.0,
            22.0
          ],
          "text": "0."
        }
      },
      {
        "box": {
          "id": "position_zero",
          "maxclass": "message",
          "patching_rect": [
            980.0,
            1460.0,
            55.0,
            22.0
          ],
          "text": "0."
        }
      },
      {
        "box": {
          "id": "sample_duration_signal",
          "maxclass": "newobj",
          "patching_rect": [
            1150.0,
            1370.0,
            55.0,
            22.0
          ],
          "text": "sig~ 0."
        }
      },
      {
        "box": {
          "id": "end_taper",
          "maxclass": "newobj",
          "patching_rect": [
            1150.0,
            1420.0,
            482.40000000000003,
            22.0
          ],
          "text": "p end_taper_native",
          "patcher": {
            "fileversion": 1,
            "rect": [
              0.0,
              0.0,
              550.0,
              390.0
            ],
            "boxes": [
              {
                "box": {
                  "id": "phase",
                  "maxclass": "inlet",
                  "patching_rect": [
                    30.0,
                    20.0,
                    30.0,
                    22.0
                  ],
                  "index": 1
                }
              },
              {
                "box": {
                  "id": "duration",
                  "maxclass": "inlet",
                  "patching_rect": [
                    210.0,
                    20.0,
                    30.0,
                    22.0
                  ],
                  "index": 2
                }
              },
              {
                "box": {
                  "id": "rate",
                  "maxclass": "inlet",
                  "patching_rect": [
                    390.0,
                    20.0,
                    30.0,
                    22.0
                  ],
                  "index": 3
                }
              },
              {
                "box": {
                  "id": "remaining",
                  "maxclass": "newobj",
                  "patching_rect": [
                    30.0,
                    75.0,
                    130.0,
                    22.0
                  ],
                  "text": "!-~ 1."
                }
              },
              {
                "box": {
                  "id": "remaining_ms",
                  "maxclass": "newobj",
                  "patching_rect": [
                    30.0,
                    130.0,
                    130.0,
                    22.0
                  ],
                  "text": "*~"
                }
              },
              {
                "box": {
                  "id": "release_ms",
                  "maxclass": "newobj",
                  "patching_rect": [
                    390.0,
                    75.0,
                    130.0,
                    22.0
                  ],
                  "text": "*~ 10."
                }
              },
              {
                "box": {
                  "id": "safe_denominator",
                  "maxclass": "newobj",
                  "patching_rect": [
                    390.0,
                    130.0,
                    130.0,
                    22.0
                  ],
                  "text": "maximum~ 0.000001"
                }
              },
              {
                "box": {
                  "id": "ratio",
                  "maxclass": "newobj",
                  "patching_rect": [
                    30.0,
                    200.0,
                    130.0,
                    22.0
                  ],
                  "text": "/~"
                }
              },
              {
                "box": {
                  "id": "bound",
                  "maxclass": "newobj",
                  "patching_rect": [
                    30.0,
                    260.0,
                    130.0,
                    22.0
                  ],
                  "text": "clip~ 0. 1."
                }
              },
              {
                "box": {
                  "id": "amplitude",
                  "maxclass": "outlet",
                  "patching_rect": [
                    30.0,
                    320.0,
                    30.0,
                    22.0
                  ],
                  "index": 1
                }
              }
            ],
            "lines": [
              {
                "patchline": {
                  "source": [
                    "phase",
                    0
                  ],
                  "destination": [
                    "remaining",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "remaining",
                    0
                  ],
                  "destination": [
                    "remaining_ms",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "duration",
                    0
                  ],
                  "destination": [
                    "remaining_ms",
                    1
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "rate",
                    0
                  ],
                  "destination": [
                    "release_ms",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "release_ms",
                    0
                  ],
                  "destination": [
                    "safe_denominator",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "remaining_ms",
                    0
                  ],
                  "destination": [
                    "ratio",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "safe_denominator",
                    0
                  ],
                  "destination": [
                    "ratio",
                    1
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "ratio",
                    0
                  ],
                  "destination": [
                    "bound",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "bound",
                    0
                  ],
                  "destination": [
                    "amplitude",
                    0
                  ]
                }
              }
            ]
          }
        }
      },
      {
        "box": {
          "id": "playback_amplitude",
          "maxclass": "newobj",
          "patching_rect": [
            1150.0,
            1480.0,
            55.0,
            22.0
          ],
          "text": "*~"
        }
      },
      {
        "box": {
          "id": "play_note",
          "maxclass": "comment",
          "patching_rect": [
            600.0,
            1520.0,
            650.0,
            22.0
          ],
          "text": "Full buffer only, @loop 0. Start resets to 0 ms after release. End taper is amplitude safety, not slicing."
        }
      },
      {
        "box": {
          "id": "play_dsp_check",
          "maxclass": "newobj",
          "text": "expr ($i1 == 1) && ($i2 == 1)",
          "patching_rect": [
            230.0,
            1180.0,
            240.0,
            22.0
          ]
        }
      }
    ],
    "lines": [
      {
        "patchline": {
          "source": [
            "obj-11",
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
            "obj-12",
            0
          ],
          "destination": [
            "obj-13",
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
            "obj-14",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-14",
            1
          ],
          "destination": [
            "obj-15",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-14",
            1
          ],
          "destination": [
            "obj-16",
            1
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
            "obj-14",
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
            "obj-15",
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
            "obj-17",
            0
          ],
          "destination": [
            "obj-19",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-18",
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
            "obj-8",
            0
          ],
          "destination": [
            "obj-9",
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
            1
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
            "obj-22",
            1
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
            "obj-23",
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
            "obj-24",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-2",
            0
          ],
          "destination": [
            "controls",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "controls",
            0
          ],
          "destination": [
            "state_write",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "state_write",
            1
          ],
          "destination": [
            "state",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "state_write",
            0
          ],
          "destination": [
            "state",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "state",
            0
          ],
          "destination": [
            "read_state",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "read_state",
            1
          ],
          "destination": [
            "state_values",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "state_values",
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
            "state_values",
            1
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
            "state_values",
            2
          ],
          "destination": [
            "diag_gate",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "read_state",
            0
          ],
          "destination": [
            "state_iter",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "state_iter",
            0
          ],
          "destination": [
            "state_label",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "state_label",
            0
          ],
          "destination": [
            "diag_gate",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "controls",
            1
          ],
          "destination": [
            "diag_gate",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "diag_gate",
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
            "controls",
            4
          ],
          "destination": [
            "state",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "controls",
            5
          ],
          "destination": [
            "event",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "state_values",
            3
          ],
          "destination": [
            "event",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "controls",
            5
          ],
          "destination": [
            "event_trace",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "event_trace",
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
            "controls",
            3
          ],
          "destination": [
            "error_order",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "event",
            0
          ],
          "destination": [
            "error_order",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "error_order",
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
            "error_order",
            1
          ],
          "destination": [
            "stop_request",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "stop_request",
            0
          ],
          "destination": [
            "safety",
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
            "amp_left",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-9",
            1
          ],
          "destination": [
            "amp_right",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "amp_left",
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
            "amp_right",
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
            "safety",
            1
          ],
          "destination": [
            "safe_action",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "safe_action",
            1
          ],
          "destination": [
            "stop_order",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "stop_order",
            1
          ],
          "destination": [
            "groove_stop",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "groove_stop",
            0
          ],
          "destination": [
            "obj-9",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "stop_order",
            0
          ],
          "destination": [
            "stop_rate",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "stop_rate",
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
            "safe_action",
            0
          ],
          "destination": [
            "action_route",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "controls",
            2
          ],
          "destination": [
            "load_order",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "load_order",
            0
          ],
          "destination": [
            "load_action",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "load_action",
            0
          ],
          "destination": [
            "safety",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "action_route",
            0
          ],
          "destination": [
            "pending_path",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "pending_path",
            0
          ],
          "destination": [
            "load_defer",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "load_defer",
            0
          ],
          "destination": [
            "physical_load",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "physical_load",
            1
          ],
          "destination": [
            "invalidate_order",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "invalidate_order",
            1
          ],
          "destination": [
            "invalidate_state",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "invalidate_state",
            0
          ],
          "destination": [
            "state_write",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "invalidate_order",
            0
          ],
          "destination": [
            "empty_buffer",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "empty_buffer",
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
            "physical_load",
            0
          ],
          "destination": [
            "replace_file",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "replace_file",
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
            1
          ],
          "destination": [
            "completion",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "completion",
            2
          ],
          "destination": [
            "reset_metadata",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "reset_metadata",
            0
          ],
          "destination": [
            "length",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "reset_metadata",
            0
          ],
          "destination": [
            "channels",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "reset_metadata",
            0
          ],
          "destination": [
            "sample_rate",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "completion",
            1
          ],
          "destination": [
            "info",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "info",
            6
          ],
          "destination": [
            "length",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "info",
            8
          ],
          "destination": [
            "channels",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "info",
            0
          ],
          "destination": [
            "sample_rate",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "info",
            9
          ],
          "destination": [
            "actual_path",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "completion",
            0
          ],
          "destination": [
            "metadata_order",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "metadata_order",
            2
          ],
          "destination": [
            "sample_rate",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "sample_rate",
            0
          ],
          "destination": [
            "available",
            2
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "metadata_order",
            1
          ],
          "destination": [
            "channels",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "channels",
            0
          ],
          "destination": [
            "available",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "metadata_order",
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
            "length",
            0
          ],
          "destination": [
            "available",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "available",
            0
          ],
          "destination": [
            "availability",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "availability",
            0
          ],
          "destination": [
            "loaded_order",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "loaded_order",
            2
          ],
          "destination": [
            "actual_path",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "actual_path",
            0
          ],
          "destination": [
            "path_state",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "path_state",
            0
          ],
          "destination": [
            "state_write",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "info",
            6
          ],
          "destination": [
            "length_copy",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "reset_metadata",
            0
          ],
          "destination": [
            "length_copy",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "loaded_order",
            1
          ],
          "destination": [
            "length_copy",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "length_copy",
            0
          ],
          "destination": [
            "length_state",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "length_state",
            0
          ],
          "destination": [
            "state_write",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "loaded_order",
            0
          ],
          "destination": [
            "loaded",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "loaded",
            0
          ],
          "destination": [
            "state_write",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "availability",
            1
          ],
          "destination": [
            "failed_order",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "failed_order",
            1
          ],
          "destination": [
            "invalidate_state",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "failed_order",
            0
          ],
          "destination": [
            "failed",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "failed",
            0
          ],
          "destination": [
            "error_order",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "init",
            0
          ],
          "destination": [
            "init_order",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "init_order",
            2
          ],
          "destination": [
            "stop_request",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "init_order",
            1
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
            "state",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "init_order",
            0
          ],
          "destination": [
            "state",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "load_order",
            2
          ],
          "destination": [
            "pending_path",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "load_order",
            1
          ],
          "destination": [
            "invalidate_state",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "state_values",
            2
          ],
          "destination": [
            "debug_status",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "debug_status",
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
            "controls",
            6
          ],
          "destination": [
            "play_request",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "play_request",
            1
          ],
          "destination": [
            "state",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "state",
            0
          ],
          "destination": [
            "play_state",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "play_state",
            0
          ],
          "destination": [
            "ready_before_release",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "play_request",
            0
          ],
          "destination": [
            "ready_before_release",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "can_request",
            0
          ],
          "destination": [
            "play_action",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "play_action",
            0
          ],
          "destination": [
            "safety",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "can_request",
            1
          ],
          "destination": [
            "not_loaded",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "not_loaded",
            0
          ],
          "destination": [
            "error_order",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "action_route",
            1
          ],
          "destination": [
            "preflight",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "preflight",
            1
          ],
          "destination": [
            "state",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "play_state",
            0
          ],
          "destination": [
            "ready_after_release",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "preflight",
            0
          ],
          "destination": [
            "ready_after_release",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "ready_after_release",
            0
          ],
          "destination": [
            "still_ready",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "still_ready",
            1
          ],
          "destination": [
            "not_loaded",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "still_ready",
            0
          ],
          "destination": [
            "refresh_before_start",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "refresh_before_start",
            1
          ],
          "destination": [
            "completion",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "play_state",
            0
          ],
          "destination": [
            "ready_after_metadata",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "refresh_before_start",
            0
          ],
          "destination": [
            "ready_after_metadata",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "ready_after_metadata",
            0
          ],
          "destination": [
            "start_allowed",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "start_allowed",
            1
          ],
          "destination": [
            "not_loaded",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "start_allowed",
            0
          ],
          "destination": [
            "start_valid",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "play_state",
            1
          ],
          "destination": [
            "play_rate",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "play_state",
            2
          ],
          "destination": [
            "play_end",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "start_valid",
            4
          ],
          "destination": [
            "play_end",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "play_end",
            0
          ],
          "destination": [
            "obj-9",
            2
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "start_valid",
            3
          ],
          "destination": [
            "full_start",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "full_start",
            0
          ],
          "destination": [
            "obj-9",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "start_valid",
            2
          ],
          "destination": [
            "play_rate",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "play_rate",
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
            "start_valid",
            1
          ],
          "destination": [
            "position_zero",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "position_zero",
            0
          ],
          "destination": [
            "obj-9",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "start_valid",
            0
          ],
          "destination": [
            "safety",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "play_state",
            2
          ],
          "destination": [
            "sample_duration_signal",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-9",
            2
          ],
          "destination": [
            "end_taper",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "sample_duration_signal",
            0
          ],
          "destination": [
            "end_taper",
            1
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
            "end_taper",
            2
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "safety",
            0
          ],
          "destination": [
            "playback_amplitude",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "end_taper",
            0
          ],
          "destination": [
            "playback_amplitude",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "playback_amplitude",
            0
          ],
          "destination": [
            "amp_left",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "playback_amplitude",
            0
          ],
          "destination": [
            "amp_right",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "ready_before_release",
            0
          ],
          "destination": [
            "play_dsp_check",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "safety",
            2
          ],
          "destination": [
            "play_dsp_check",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "play_dsp_check",
            0
          ],
          "destination": [
            "can_request",
            0
          ]
        }
      }
    ]
  }
}
