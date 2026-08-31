# FLODE Architecture Review

## Executive Summary

FLODE har en stark grundarkitektur byggd kring en återanvändbar POD-abstraktion med tydlig separation mellan UI, State, Event, DSP och Routing. Lösningen är väl positionerad för Max/MSP, Max for Live och generativ ljuddesign.

## Nuvarande styrkor

- Modulär POD-arkitektur.
- Skalbar modell för POD A-F.
- Tydlig separation mellan DSP och presentation.
- Generativ motor med flera beslutsmodeller.
- Förberedd för preset-hantering och automation.

## Identifierade risker

### Hög prioritet

- Position Intent är inte fullständigt integrerad.
- Velocity Intent är inte fullständigt integrerad.
- Pan/Mute/Solo-routing är ofärdig.
- Runtime-beteende är delvis otestat.

### Medel prioritet

- State management är utspritt.
- Generator och playback saknar tydligt API-kontrakt.
- Begränsad diagnostik och telemetri.

## Teknisk skuld

| Område | Påverkan | Prioritet |
|---------|----------|------------|
| Routing | Hög | Hög |
| State Recall | Hög | Hög |
| Host Sync | Hög | Hög |
| Diagnostics | Medel | Medel |
| FX Integration | Medel | Medel |

---

# V2 Architecture Proposal

## Huvudprincip

Separera:

1. Presentation Layer
2. State Layer
3. Event Layer
4. DSP Layer
5. Infrastructure Layer

## Föreslagen arkitektur

```text
MASTER CLOCK
      |
SCHEDULER
      |
EVENT BUS
      |
+-----+-----+-----+
|     |     |     |
POD A POD B POD C ...
      |
STATE API
      |
PLAYBACK ENGINE
      |
MIX / FX
      |
MASTER BUS
      |
OUTPUT
```

## Nya komponenter

### Scheduler Layer

Ansvarar för:

- Clock
- Triggering
- Quantization
- Swing
- Prioritering av events

### Event Bus

Ansvarar för:

- Kommunikation mellan PODs
- Choke-groups
- Solo- och mute-hantering
- Global variation

### Central State Store

Ansvarar för:

- Presets
- Automation
- Undo/Redo
- Recall
- Versionering

---

# Prioriterad Roadmap

## FAS 1 - Stabilisering

- Mixer
- Pan
- Solo
- Mute
- State Restore

## FAS 2 - Slice Engine

- Markeranalys
- Triggering
- Density

## FAS 3 - Generative Integration

- Position Intent
- Velocity Intent
- Memory Engine

## FAS 4 - Six POD Runtime

- POD A-F
- Choke Groups
- Shared Clock

## FAS 5 - FX & Master

- Pod FX
- Master FX
- Recorder
- Limiter

## FAS 6 - Release Candidate

- QA
- Performance Profiling
- Max for Live Packaging

---

# Max/MSP Recommendations

## Performance

- Använd `matrix~` för routing.
- Minimera onödiga `send~/receive~`.
- Isolera UI-refresh från DSP.
- Undvik globala namn.

## Maintainability

- Canonical POD abstraction.
- Versionerade parameterkontrakt.
- Runtime diagnostics.
- Automatiserade regressionstester.
- Dokumenterade state-transitions.

---

# Slutbedömning

Arkitekturen är genomtänkt och har god potential att skalas till en professionell Max for Live-produkt. Den största förbättringen är att införa tydliga lager för Scheduler, Event Bus och Central State Management. Detta minskar kopplingen mellan UI, Generative Logic och DSP samt förenklar testning, felsökning och framtida expansion.
