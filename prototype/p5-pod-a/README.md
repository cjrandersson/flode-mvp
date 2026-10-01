# flöde~ Pod A — p5.js preview of the Max UI

The browser uses the existing [Max component renderer](../max9-pod-a/code/flode_ui_component.js) and [demo controller](../max9-pod-a/code/flode_ui_demo_controller.js). Geometry, hit testing, gesture messages, peak-cache behavior and engineering-unit formatting have one source.

The same adapter/harness also hosts [UI LAB 001](../ui-lab-001/), CJ's newer waveform-first study. A trusted local config can supply `components`, `width`, `height` and source paths; the existing page retains its original layout by default.

## Open the preview

Download/extract the `max-msp` branch, then serve the repository root:

```sh
python3 -m http.server 8000 --bind 127.0.0.1
```

Open [http://127.0.0.1:8000/prototype/p5-pod-a/](http://127.0.0.1:8000/prototype/p5-pod-a/) in a browser.

The page loads p5.js 1.11.8 from jsDelivr, matching the existing browser prototype. Internet access is needed for that dependency. Serve the directory over HTTP: direct `file://` opening cannot fetch the shared scripts consistently.

Load a WAV/AIFF using the bottom strip. Browser audio decoding prepares samples for the existing controller's min/max cache; there is no audio playback. Drag Jung/Jitter, loop endpoints/body or the steppers; Shift gives precision and bypasses loop snapping. M/S and modes are controller confirmed. Double-click the waveform for full-range reset.

## Shared code across hosts

| Host | Drawing | State and gestures |
| --- | --- | --- |
| Max 9 `v8ui` | Native `mgraphics` | Existing component + demo controller scripts |
| p5.js | `max-p5-adapter.js` translates the same drawing calls | Those same scripts, each in an isolated host scope |
| JavaScript | Adapter exports `FlodeP5Bridge` in a browser and CommonJS in Node | Normalized semantic messages and silent authoritative setters |
| SVG | [Individual assets](../max9-pod-a/graphics/) and [atlas studies](../../design/ui/component-atlas/prototypes/) | Editable static references; no embedded runtime |

The adapter scopes the Max globals, provides instance-local Dict/Buffer facades, and routes controller messages exactly as the native patch does. It handles pointer capture, the final release position and pointer cancellation. Browser dimensions use the same seven component placements as the native preview.

The controller runs when audio has been decoded, caches merged min/max pairs once and passes a lightweight versioned dictionary reference to the UI. Components never decode audio. Playhead data remains externally supplied; the browser does not create a musical clock.

## Reuse from JavaScript/p5.js

Load `max-p5-adapter.js`, obtain the two trusted repository source files, and create a view inside a p5 instance:

```js
const view = FlodeP5Bridge.create(p, {
  component: componentSource,
  controller: controllerSource
}, {
  pod: "A",
  invalidate: () => requestAnimationFrame(() => p.redraw()),
  onEvent: message => console.log(message)
});

// In p.draw:
view.draw();

// Route canvas coordinates and the modifier state:
view.pointerDown(x, y, shiftPressed);
view.pointerMove(x, y, pointerPressed, shiftPressed);
view.pointerUp(x, y, shiftPressed);

// Supply controller state silently, or external visual positions:
view.set("jung", "value_norm", 0.43);
view.set("jung", "display", "43 %");
view.markers(0.125, 0.25, 0.5, 0.75);
view.playhead(0.45);

// Optional: supply a decoded AudioBuffer from the host:
view.loadDecodedAudio(audioBuffer, "Break.wav");
```

`pointerCancel()` commits the latest preview and closes gesture ownership. `reset()` clears audio and restores demo defaults. `enable(componentId, 0|1)` controls availability. `getVisualState(componentId)` supports prototype inspection without exposing the internal JUNG engine.

`graphics(p, invalidate)` is also exported as a small drawing adapter for the primitives used by this renderer. It is not a complete mgraphics emulation.

The development adapter compiles the two trusted local repository scripts selected by the preview page/config using the JavaScript Function constructor. It requires a development page that allows that operation. Do not compile uploaded files or user text. A production bundle/CSP integration needs a separate reviewed packaging decision; this remains an isolated prototype.

## Validation and remaining checks

Ten integration checks passed in a V8 isolate with p5 methods recorded: all seven components draw with balanced state; gestures use the Max protocol; precision and outside release stay bounded; loop endpoints retain minimum span; disabled controls emit nothing; M/S/modes confirm; speed mapping matches; decoded audio uses multichannel peaks; instances are isolated; reset and cancellation complete state flow.

Run that same check source locally:

```sh
node prototype/p5-pod-a/tests/bridge.test.cjs
```

The existing [13 Max-script contract checks](../max9-pod-a/tests/ui.test.cjs) remain available.

No browser or Max runtime was available in this session. Actual p5 rendering, file selection/decoding, pointer capture and the Max 9 host APIs still need manual verification. Original reference images are also pending or inaccessible, as recorded in the [reference register](../../design/ui/component-atlas/references/README.md). The visual reconstruction remains provisional.

A useful review is to load the same reference WAV in Max and this page, compare the waveform/range and readouts, then try matching gestures while inspecting their messages. The browser uses decoded audio at its context sample rate; the resulting peak columns may differ slightly from native Max resampling.
