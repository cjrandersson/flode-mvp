# flöde~ — POD A Design System
**Prototype extraction · 6 October 2026 · branch: `max-msp`**

This folder freezes the visual language extracted from the approved POD A master reference. The image owns appearance; the specification owns behaviour.

## Authority order
1. POD A master reference: visual authority.
2. `INVARIANTS.md`: non-negotiable architecture rules.
3. `POD_A_VISUAL_SPEC.md`: measured/standardized visual specification.
4. `COMPONENT_SYSTEM.md`: reusable UI anatomy and composition.
5. `IMPLEMENTATION_CONTRACT.md`: technology-independent implementation contract.

## Evidence labels
- **MEASURED** — directly observable/measurable in the 1448×1086 reference.
- **STANDARDIZED** — regularized from small inconsistencies in the generated master.
- **INFERRED** — strongly implied, but not exactly measurable.
- **UNSPECIFIED** — not established by the reference and must not be invented.

## Scope
POD A is the canonical visual specimen for POD A–F. This folder defines design language and UI structure only. DSP behaviour, parameter curves, engineering ranges and product defaults are separate specifications unless explicitly established.

## Core composition
```
flöde~ Design System
├── Foundations
├── Primitives
├── Controls
├── Instrument Components
└── POD Composition
    ├── Identity
    ├── Primary Control Rail
    └── Main Work Surface
        ├── Waveform / Loop Editor
        ├── Generation Mode
        ├── Generator + EQ
        └── Transport
```

React/Tailwind/SVG/Canvas is a reference implementation. Max/MSP + mgraphics is another implementation of the same specification. Neither technology owns the design system.
