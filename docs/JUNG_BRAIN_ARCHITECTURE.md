# JUNG Brain — Behavioural Architecture

**Status:** Architecture direction for flöde~ Alpha 0.1  
**Branch:** `max-msp`  
**Date:** 2026-09-20

> **Design authority:** JUNG's technical architecture must preserve the principles defined in [`JUNG_MANIFESTO.md`](./JUNG_MANIFESTO.md). Implementation complexity must not override the musical constraints of the manifesto.

This document describes the proposed architecture beneath flöde~ for producing generative behaviour that remains musical, contextual and difficult to reduce to an obvious random-number pattern.

The goal is not maximum randomness. The goal is behaviour.

---

## Core behavioural loop

The JUNG engine is based around a feedback loop:

```text
MEMORY → TENDENCY → PROBABILITY → EVENT → MEMORY
   ↑                                      │
   └──────────────────────────────────────┘
```
