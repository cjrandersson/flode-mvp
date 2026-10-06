export const flodeTokens = {
  color: {
    chassis: "#c3c7c9", chassisLight: "#d6dada", chassisDark: "#a2a6a8",
    panelBorder: "#8c9092", divider: "rgba(70,74,76,.34)",
    display: "#0d0d0d", displayInset: "#050505", displayBorder: "#282828",
    text: "#121212", textMuted: "#666b6e", textDisplay: "#ff6b00",
    primary: "#ff6b00", primaryDim: "#733300", jitter: "#00d5e6",
    eqLow: "#ff4b43", eqMid: "#ffb800", eqHigh: "#00d5e6", playhead: "#ffffff"
  },
  geometry: {
    referenceWidth: 1448, referenceHeight: 1086,
    primaryRailRatio: .20, workSurfaceRatio: .80,
    primaryKnob: 86, eqKnob: 60, knobSweepDeg: 270,
    waveformHeight: 198, minLoopGapNorm: .01,
    controlRadius: 3, displayRadius: 2
  },
  type: { technical: "system-ui, sans-serif", numeric: "ui-monospace, monospace" },
  depth: {
    display: "inset 0 2px 6px rgba(0,0,0,.9), inset 0 0 2px rgba(0,0,0,.95)",
    raised: "inset 0 1px 0 rgba(255,255,255,.7), 0 1px 3px rgba(0,0,0,.25)",
    pressed: "inset 0 2px 4px rgba(0,0,0,.5)"
  }
} as const;
export type AccentRole = "primary"|"jitter"|"eqLow"|"eqMid"|"eqHigh";
