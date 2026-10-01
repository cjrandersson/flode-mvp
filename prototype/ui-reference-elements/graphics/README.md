# Individual reference elements

Each SVG is exported from [the shared JavaScript](../code/flode_reference_ui.js). Text remains editable. Required font data is embedded; standalone files do not fetch external fonts or images. Both font licences are in [the font directory](../../../design/ui/component-atlas/fonts/).

| Asset | Use |
| --- | --- |
| [pod.svg](pod.svg) | POD letter/brackets and sample identity |
| [range.svg](range.svg) | Read-only selection region, endpoint triangles and distinct playhead; no audio |
| [fader.svg](fader.svg) | JUNG stable/restless control |
| [knob.svg](knob.svg) | Compact PAN study |
| [readout.svg](readout.svg) | SPEED numeric readout |
| [meter.svg](meter.svg) | Unavailable-data stereo meter state |
| [glyph.svg](glyph.svg) | Canonical HOME geometry |
| [icon-play.svg](icon-play.svg) | Transparent, named play symbol; illustrated active state |
| [icon-stop.svg](icon-stop.svg) | Transparent, named stop symbol; illustrated active state |
| [icon-record.svg](icon-record.svg) | Transparent, named record symbol; illustrated active state |
| [icon-loop.svg](icon-loop.svg) | Transparent, named loop symbol; illustrated active state |
| [icon-tempo.svg](icon-tempo.svg) | Transparent, named tempo symbol; illustrated active state |
| [icon-pause.svg](icon-pause.svg) | Transparent, named pause symbol; illustrated active state |
| [jung-home.svg](jung-home.svg) | JUNG HOME static study |
| [jung-restless.svg](jung-restless.svg) | JUNG RESTLESS static study |
| [jung-intervention.svg](jung-intervention.svg) | JUNG INTERVENTION static study |
| [jung-resolving.svg](jung-resolving.svg) | JUNG RESOLVING static study |
| [jung-return_home.svg](jung-return_home.svg) | JUNG RETURN HOME static study |
| [pod-a.svg](pod-a.svg) | Static POD A address study |
| [pod-b.svg](pod-b.svg) | Static POD B address study |
| [pod-c.svg](pod-c.svg) | Static POD C address study |
| [pod-d.svg](pod-d.svg) | Static POD D address study |
| [pod-e.svg](pod-e.svg) | Static POD E address study |
| [pod-f.svg](pod-f.svg) | Static POD F address study |
| [pod-identities.svg](pod-identities.svg) | Six static addresses using one geometry; A emphasized, B–F neutral |
| [reference-elements-preview.svg](reference-elements-preview.svg) | Full gallery with default demo state |

Import SVGs into an editor or use the source drawing API for interactive controls. An editor that does not support embedded web fonts may require installing the bundled TTFs. This is geometric reconstruction of transferable principles, not a raster crop or wholesale reproduction of the supplied pictures.

The A–F address assets are static design studies; they do not add B–F runtime behavior. The exporter now produces 26 library SVGs. See the [source map](../SOURCE_MAP.md) for reference provenance and stack entry points.
