# UI LAB 001 — waveform-first Pod A prototype

An isolated implementation of [CJ's approved design direction](../../design/UI_LAB_001_POD_A.md). The UI study uses one shared JavaScript renderer/controller in Max 9 and p5.js.

![Default-state lab preview](graphics/pod-a-lab-preview.svg)

## Open in Max 9

Install both [bundled UI fonts](../../design/ui/component-atlas/fonts/) (Jersey 10 and IBM Plex Mono) in your operating system and restart Max. Download/extract the `max-msp` branch and open `prototype/ui-lab-001/flode_ui_lab_001.maxproj`, then `flode_ui_lab_001.maxpat`. It opens in Presentation.

Drop a WAV/AIFF on the bottom strip. The controller reads the loaded buffer once and builds cached real min/max columns. A file whose name begins with Apache shows APACHE in the header; an empty buffer shows NO SAMPLE.

Drag VOL, PAN, SPEED, JUNG or LOW/MID/HIGH horizontally. All sliders use relative movement, so pressing a different part of a track does not jump the parameter. Shift reduces sensitivity. Double-click restores that control's demo default.

Drag the active-region handles or body. Shift bypasses loop snapping; double-click the waveform requests a full-range reset. Controller-supplied playhead state is visible once audio is loaded.

## Open in p5.js

Serve the repository root:

```sh
python3 -m http.server 8000 --bind 127.0.0.1
```

Open [http://127.0.0.1:8000/prototype/ui-lab-001/p5/](http://127.0.0.1:8000/prototype/ui-lab-001/p5/).

The browser page uses the shared [p5 host adapter](../p5-pod-a/max-p5-adapter.js) and harness, with this lab's [configuration](p5/config.json) selecting its renderer, controller, component positions and canvas dimensions. p5.js 1.11.8 is loaded from jsDelivr.

Both hosts use the same normalized requests, unit formatting and gesture rules. This is a visual study: it loads/draws audio and changes demo state. It does not play sound, process EQ, run JUNG behavior or advance a transport.

## Visual and interaction decisions

- POD A and the loaded sample name are the only header content.
- The waveform dominates the panel. Cached peak columns before the active region are subdued cyan; the active region is orange; columns after it use subdued acid/yellow. These colours mark region relationship.
- The playhead is a distinct pale line/triangle, supplied by the controller rather than a timer.
- Primary controls are VOL, PAN and SPEED. Their engineering labels are controller owned.
- JUNG has one STABLE ↔ RESTLESS surface. The product UI displays no probability percentages or internal engine controls.
- Three compact EQ sliders occupy a quiet secondary zone. A faint two-dimensional colour fade blends its edges into the surrounding field. Neutral EQ is almost visually absent.
- There are nine component instances: header, waveform and seven sliders. The 960 × 720 layout is identical in the native patch and browser config.

The default SVG captures NO SAMPLE and an empty waveform. No procedural audio wave was fabricated. Load the repository Apache reference in either host to view its actual waveform.

## Individual elements

[Open the SVG catalog](graphics/README.md). Every asset is exported from the same JavaScript drawing path used by the lab, via the [committed SVG exporter](scripts/export-svg.cjs). Jersey 10 labels and POD letters follow CJ’s choice; IBM Plex Mono carries numeric readouts. SVGs embed both used font faces and retain editable text; the browser loads the bundled local TTFs before drawing. Colours, geometry and default labels originate in the renderer/controller rather than a separate hand-drawn SVG layout.

Instantiate components in Max:

```text
v8ui flode_ui_lab_component.js @arguments A header
v8ui flode_ui_lab_component.js @arguments A waveform
v8ui flode_ui_lab_component.js @arguments A slider vol
v8ui flode_ui_lab_component.js @arguments A slider pan
v8ui flode_ui_lab_component.js @arguments A slider speed
v8ui flode_ui_lab_component.js @arguments A slider jung
v8ui flode_ui_lab_component.js @arguments A slider eq_low
v8ui flode_ui_lab_component.js @arguments A slider eq_mid
v8ui flode_ui_lab_component.js @arguments A slider eq_high
```

## Message contract and ownership

```text
pod A control_begin vol 0.80
pod A control_change vol 0.85
pod A control_commit vol 0.85
pod A control_reset_request pan
pod A loop_begin 0.12 0.78
pod A loop_change 0.20 0.78
pod A loop_commit 0.20 0.78
pod A loop_reset_request
```

Controller messages are silent `set` updates, including `value_norm`, revision-bound `display`, ordered `loop`, versioned `peaks`, `playhead` and its `position_display`. Gestures own temporary preview state; intermediate echoes cannot move an active handle.

VOL uses a normalized linear-gain display (0…1 → −∞…0 dB), PAN maps 0…1 to left/centre/right, SPEED displays 0.25…4.00×, and EQ uses a proposed −12…+12 dB display domain around 0 dB. These are visual/demo mappings, not a change to a POD audio contract.

JUNG remains a normalized high-level temperament request with fixed STABLE/RESTLESS endpoint labels. The controller does not implement its internal behavioral translation.

Buffer and peak-dictionary names include the native patch's `#0` instance scope. The browser gives each view its own scope/cache. File selection and audio scanning are host/controller responsibilities.

Switch out of Presentation to find the optional `playhead 0.45` message. In the browser, a developer can supply `view.playhead(0.45)`. Neither input starts playback. The demo's initial position is 0.32, a static visual-state fixture.

## Validation and remaining review

Ten new lab checks passed in a V8 isolate with p5 calls recorded: component/label scope, no-jump dragging, precision/bounds, controller unit domains, JUNG surface, EQ fades, real multichannel peak logic/sample naming, loop authority, layout validation and native patch routing. The existing p5 companion's ten integration checks also passed after the shared adapter/harness update.

```sh
node prototype/ui-lab-001/tests/lab.test.cjs
node prototype/ui-lab-001/scripts/export-svg.cjs
node prototype/p5-pod-a/tests/bridge.test.cjs
```

No Max 9 or browser runtime is available here. Actual host opening, p5 appearance, mouse/pointer behavior and audio decoding/loading still need a manual check. SVGs were generated with the committed exporter; font/rendering fidelity needs visual review. The ten lab checks also passed after the approved Jersey 10 / IBM Plex Mono pairing was applied.

The [reference-image folder](../../design/ui/component-atlas/references/) now contains nine supplied originals. Eight have been visually inspected and [analysed individually](../../design/ui/component-atlas/references/ANALYSIS.md). The large all-POD PNG could not be retrieved through the connector; its analysis is pending. The new [reference-element library](../ui-reference-elements/) provides geometric adaptations alongside this narrower waveform-first lab.

This study does not change the Alpha 0.1 patches, POD contract, JUNG engine or musical timing architecture. Their stage gates remain in Issue #5.
