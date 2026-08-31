import { useState, useRef, useCallback, MouseEvent as ME } from "react";

// ══════════════════════════════════════════════════════════
// PALETTE — matte charcoal instrument aesthetic
// ══════════════════════════════════════════════════════════
const AM  = "#df7924";   // amber primary
const AMB = "#f59018";   // amber bright
const GN  = "#3e8e44";   // green (active/play)
const RD  = "#b83030";   // red (record/danger)
const BG  = "#181818";   // main background
const POD = "#1e1e1e";   // pod surface
const WFB = "#0c0c0c";   // waveform area bg
const BD  = "#282828";   // border dim
const BN  = "#303030";   // border normal
const TX  = "#a8a8a8";   // text normal
const TD  = "#484848";   // text dim
const TB  = "#c8c8c8";   // text bright
const BTN = "#222222";   // button bg
const BTNA= "#323232";   // button active bg
const KBG = "#1e1e1e";   // knob body
const KRM = "#2c2c2c";   // knob rim
const MONO= "'JetBrains Mono', monospace";

// ══════════════════════════════════════════════════════════
// WAVEFORM GENERATION — seeded LCG
// ══════════════════════════════════════════════════════════
const WF_CACHE = new Map<number, number[]>();

function getWf(seed: number): number[] {
  if (WF_CACHE.has(seed)) return WF_CACHE.get(seed)!;
  let s = seed >>> 0;
  const r = () => { s = (s * 1664525 + 1013904223) >>> 0; return s / 0x100000000; };
  const p: number[] = [];
  let e = 0.08, sm = 0;
  for (let i = 0; i < 256; i++) {
    const t = i / 256;
    const fade = Math.min(t * 8, 1) * Math.min((1 - t) * 8, 1);
    e = e * 0.93 + r() * 0.07;
    const burst = r() > 0.968 ? r() * 0.9 : 0;
    sm = sm * 0.88 + (e + burst) * 0.12;
    p.push(Math.min(sm, 1) * fade);
  }
  WF_CACHE.set(seed, p);
  return p;
}

// ══════════════════════════════════════════════════════════
// TYPES
// ══════════════════════════════════════════════════════════
interface PS {
  filename: string; loaded: boolean; playing: boolean; recording: boolean;
  muted: boolean; solo: boolean; vol: number; pan: number; playMode: string;
  jungOn: boolean; prime: number; seqSpeed: number; looper: number;
  cutter: number; jPattern: string; octaver: number; rndAmt: number; jPitch: number;
  speed: number; range: number; rnd: number; rnd2: number; jitter: number;
  pitch: number; octave: number; density: number; fadeIn: number; fadeOut: number;
  rndEngine: string; engine: string; quality: string; transDetect: string;
  syncMode: string; quantize: string; timeSig: string; choke: string;
  filterType: string; filterCut: number; filterRes: number;
  tapeDrive: number; tapeTone: number;
  compThresh: number; compRatio: number; compMix: number;
  eqLo: number; eqMid: number; eqHi: number; fxPan: number;
  wfStart: number; wfEnd: number; playhead: number;
  selSlice: number; slices: number;
}

const FILES   = ["breakbeat_01.wav", "bass_stab.aiff", "---", "hats_loop.wav", "---", "chord_chop.wav"];
const SEEDS   = [42, 137, 73, 256, 181, 99];
const POD_IDS = ["A", "B", "C", "D", "E", "F"];
const TIME_SIGS = ["4/4","3/4","2/4","6/8","5/4","7/8","9/8","12/8","2/2","5/8"];

function mkPS(i: number): PS {
  return {
    filename: FILES[i],
    loaded:   [true, true, false, true, false, true][i],
    playing:  i === 0, recording: false, muted: false, solo: false,
    vol: 0.78, pan: 0.5, playMode: "LOOP",
    jungOn: i === 0, prime: 0.62, seqSpeed: 0.5, looper: 0.45,
    cutter: 0.32, jPattern: "P1", octaver: 0.5, rndAmt: 0.42, jPitch: 0.5,
    speed: 0.5, range: 0.3, rnd: 0.38, rnd2: 0.22, jitter: 0.12,
    pitch: 0.5, octave: 0.5, density: 0.6, fadeIn: 0.08, fadeOut: 0.13,
    rndEngine: "JUNG", engine: "GROOVE~", quality: "HQ", transDetect: "BONK~",
    syncMode: "SYNC", quantize: "1/8", timeSig: "4/4", choke: "OFF",
    filterType: "LP", filterCut: 0.82, filterRes: 0.18,
    tapeDrive: 0.2, tapeTone: 0.5, compThresh: 0.6, compRatio: 0.4, compMix: 0.72,
    eqLo: 0.5, eqMid: 0.5, eqHi: 0.5, fxPan: 0.5,
    wfStart: 0.05, wfEnd: 0.95,
    playhead: i === 0 ? 0.35 : 0, selSlice: 2, slices: 8,
  };
}

// ══════════════════════════════════════════════════════════
// PRIMITIVES
// ══════════════════════════════════════════════════════════

// ── Knob ──────────────────────────────────────────────────
function Knob({ label, v = 0.5, set, sz = 26, color = AM }: {
  label?: string; v?: number; set?: (n: number) => void; sz?: number; color?: string;
}) {
  const sy = useRef(0); const sv = useRef(0);
  const onMD = useCallback((e: ME) => {
    sy.current = e.clientY; sv.current = v; e.preventDefault();
    const mM = (ev: MouseEvent) => {
      set?.(Math.max(0, Math.min(1, sv.current + (sy.current - ev.clientY) / (ev.shiftKey ? 500 : 88))));
    };
    const mU = () => { document.removeEventListener("mousemove", mM); document.removeEventListener("mouseup", mU); };
    document.addEventListener("mousemove", mM);
    document.addEventListener("mouseup", mU);
  }, [v, set]);

  const R = sz / 2 - 2.5; const cx = sz / 2; const cy = sz / 2; const tr = R - 1.5;
  const rad = (d: number) => d * Math.PI / 180;
  const pt  = (d: number, r: number) => ({ x: cx + r * Math.sin(rad(d)), y: cy - r * Math.cos(rad(d)) });
  const arc = (f: number, t: number, r: number) => {
    const a = pt(f, r); const b = pt(t, r); const lg = Math.abs(t - f) > 180 ? 1 : 0;
    return `M${a.x.toFixed(2)} ${a.y.toFixed(2)} A${r} ${r} 0 ${lg} 1 ${b.x.toFixed(2)} ${b.y.toFixed(2)}`;
  };
  const vd  = -135 + v * 270;
  const tip = pt(vd, tr * 0.6); const hub = pt(vd, tr * 0.15);

  return (
    <div style={{ display:"flex", flexDirection:"column", alignItems:"center", gap:1, cursor:"ns-resize", userSelect:"none" }} onMouseDown={onMD}>
      <svg width={sz} height={sz}>
        <circle cx={cx} cy={cy} r={R + 1.5} fill={KRM} />
        <circle cx={cx} cy={cy} r={R} fill={KBG} />
        <path d={arc(-135, 135, tr)} fill="none" stroke="#262626" strokeWidth={2} strokeLinecap="round" />
        {v > 0.01 && <path d={arc(-135, vd, tr)} fill="none" stroke={color} strokeWidth={2} strokeLinecap="round" />}
        <line x1={hub.x} y1={hub.y} x2={tip.x} y2={tip.y} stroke={color} strokeWidth={1.5} strokeLinecap="round" />
      </svg>
      {label && <div style={{ fontSize:7, color:TD, letterSpacing:"0.07em", textTransform:"uppercase" }}>{label}</div>}
    </div>
  );
}

// ── Button ─────────────────────────────────────────────────
function Btn({ c, act = false, onClick, danger = false, fs = 7, px = 4, py = 2, color = AM }: {
  c: string; act?: boolean; onClick?: () => void; danger?: boolean;
  fs?: number; px?: number; py?: number; color?: string;
}) {
  const cl = danger ? RD : color;
  return (
    <button onClick={onClick} style={{
      fontSize:fs, padding:`${py}px ${px}px`,
      background: act ? `${cl}1a` : BTN,
      border:`1px solid ${act ? cl : BN}`, borderRadius:2,
      color: act ? cl : TX, letterSpacing:"0.07em", textTransform:"uppercase",
      cursor:"pointer", fontFamily:"inherit", fontWeight: act ? 600 : 500,
      lineHeight:1, userSelect:"none", whiteSpace:"nowrap",
    }}>{c}</button>
  );
}

// ── LED button ─────────────────────────────────────────────
function Led({ label, act, onClick, color = GN }: {
  label: string; act: boolean; onClick: () => void; color?: string;
}) {
  return (
    <button onClick={onClick} style={{
      display:"flex", alignItems:"center", gap:3, fontSize:7, padding:"2px 5px",
      background: act ? `${color}14` : BTN,
      border:`1px solid ${act ? color : BN}`, borderRadius:2,
      color: act ? color : TX, cursor:"pointer", letterSpacing:"0.07em",
      textTransform:"uppercase", fontFamily:"inherit", fontWeight:500,
      lineHeight:1, userSelect:"none",
    }}>
      <span style={{ width:5, height:5, borderRadius:"50%", background: act ? color : "#191919", border:`1px solid ${act ? color : BD}`, flexShrink:0 }} />
      {label}
    </button>
  );
}

// ── Segmented control ──────────────────────────────────────
function Seg({ opts, val, set, sm = true }: {
  opts: string[]; val: string; set: (v: string) => void; sm?: boolean;
}) {
  return (
    <div style={{ display:"flex", border:`1px solid ${BN}`, borderRadius:2, overflow:"hidden" }}>
      {opts.map((o, i) => (
        <button key={o} onClick={() => set(o)} style={{
          fontSize: sm ? 7 : 8, padding: sm ? "2px 4px" : "3px 6px",
          background: val === o ? BTNA : BTN,
          border:"none", borderRight: i < opts.length - 1 ? `1px solid ${BN}` : "none",
          color: val === o ? TB : TD, cursor:"pointer", letterSpacing:"0.06em",
          textTransform:"uppercase", fontFamily:"inherit",
          fontWeight: val === o ? 600 : 400, lineHeight:1, userSelect:"none",
        }}>{o}</button>
      ))}
    </div>
  );
}

// ── Helpers ────────────────────────────────────────────────
const VD = () => <div style={{ width:1, background:BD, alignSelf:"stretch", margin:"0 2px", flexShrink:0 }} />;
const HD = () => <div style={{ height:1, background:BD, margin:"0" }} />;

function Lbl({ t, bright = false, fs = 7, color }: {
  t: string; bright?: boolean; fs?: number; color?: string;
}) {
  return (
    <div style={{ fontSize:fs, color: color || (bright ? TB : TD), letterSpacing:"0.08em", textTransform:"uppercase", lineHeight:1, whiteSpace:"nowrap", flexShrink:0 }}>
      {t}
    </div>
  );
}

// ══════════════════════════════════════════════════════════
// WAVEFORM DISPLAY
// ══════════════════════════════════════════════════════════
function WaveformDisplay({ seed, ps, set }: {
  seed: number; ps: PS; set: (u: Partial<PS>) => void;
}) {
  const pts = getWf(seed);
  const n = pts.length;
  const W = 100; const H = 60; const MID = H / 2;

  const upperPts = pts.map((a, i) =>
    `${(i / n * W).toFixed(1)},${(MID - a * MID * 0.9).toFixed(1)}`
  ).join(" ");

  const lowerPts = [...pts].reverse().map((a, i) =>
    `${((n - 1 - i) / n * W).toFixed(1)},${(MID + a * MID * 0.9).toFixed(1)}`
  ).join(" ");

  const fillPath =
    `M 0 ${MID} ` +
    upperPts.split(" ").map(p => "L " + p).join(" ") +
    ` L ${W} ${MID} ` +
    lowerPts.split(" ").map(p => "L " + p).join(" ") +
    " Z";

  const slicePs = Array.from({ length: ps.slices }, (_, i) => (i + 1) / (ps.slices + 1));

  return (
    <div style={{ background: WFB, borderBottom:`1px solid ${BN}` }}>
      {/* Timeline ruler */}
      <div style={{ height:11, background:"#0a0a0a", borderBottom:`1px solid ${BD}`, position:"relative", overflow:"hidden" }}>
        {[0.25, 0.5, 0.75].map(t => (
          <div key={t} style={{ position:"absolute", left:`${t * 100}%`, top:0, bottom:0, borderLeft:`1px solid ${BD}`, paddingLeft:2, display:"flex", alignItems:"center" }}>
            <span style={{ fontSize:6, color:TD, fontFamily:MONO }}>{(t * 2.45).toFixed(2)}s</span>
          </div>
        ))}
        <div style={{ position:"absolute", left:1, top:0, bottom:0, display:"flex", alignItems:"center" }}>
          <span style={{ fontSize:6, color:TD, fontFamily:MONO }}>0.00s</span>
        </div>
        <div style={{ position:"absolute", right:2, top:0, bottom:0, display:"flex", alignItems:"center" }}>
          <span style={{ fontSize:6, color:TD, fontFamily:MONO }}>2.45s</span>
        </div>
      </div>

      {/* Main waveform SVG */}
      <svg viewBox={`0 0 ${W} ${H}`} preserveAspectRatio="none" style={{ width:"100%", height:98, display:"block" }}>
        {/* Loop region */}
        {ps.loaded && (
          <rect x={ps.wfStart * W} y={0} width={(ps.wfEnd - ps.wfStart) * W} height={H} fill="rgba(223,121,36,0.07)" />
        )}
        {/* Waveform fill */}
        {ps.loaded && <path d={fillPath} fill="rgba(223,121,36,0.38)" />}
        {/* Upper waveform outline */}
        {ps.loaded && <polyline points={upperPts} fill="none" stroke={AM} strokeWidth={0.7} opacity={0.85} />}
        {/* Center baseline */}
        <line x1={0} y1={MID} x2={W} y2={MID} stroke="#1c1c1c" strokeWidth={0.4} />

        {/* Start handle */}
        {ps.loaded && (
          <g style={{ cursor:"ew-resize" }}>
            <line x1={ps.wfStart * W} y1={0} x2={ps.wfStart * W} y2={H} stroke="#4466ee" strokeWidth={0.9} />
            <polygon points={`${ps.wfStart * W},0 ${ps.wfStart * W + 5},0 ${ps.wfStart * W},6`} fill="#4466ee" />
            <text x={ps.wfStart * W + 1.5} y={11} fill="#4466ee" fontSize={3.5} fontFamily="monospace">S</text>
          </g>
        )}

        {/* End handle */}
        {ps.loaded && (
          <g style={{ cursor:"ew-resize" }}>
            <line x1={ps.wfEnd * W} y1={0} x2={ps.wfEnd * W} y2={H} stroke="#4466ee" strokeWidth={0.9} />
            <polygon points={`${ps.wfEnd * W},0 ${ps.wfEnd * W - 5},0 ${ps.wfEnd * W},6`} fill="#4466ee" />
            <text x={ps.wfEnd * W - 6} y={11} fill="#4466ee" fontSize={3.5} fontFamily="monospace">E</text>
          </g>
        )}

        {/* Slice markers */}
        {ps.loaded && slicePs.map((p, i) => {
          const sel = i + 1 === ps.selSlice;
          return (
            <g key={i} onClick={() => set({ selSlice: i + 1 })} style={{ cursor:"pointer" }}>
              <line x1={p * W} y1={0} x2={p * W} y2={H} stroke={sel ? AMB : "#5a2c0a"} strokeWidth={sel ? 1.1 : 0.55} />
              <rect x={p * W - 3.5} y={MID - 3} width={7} height={6} fill={sel ? AM : "#221308"} rx={0.8} />
              <text x={p * W} y={MID + 2} textAnchor="middle" fill={sel ? "#111" : "#5a3010"} fontSize={3.2} fontFamily="monospace" fontWeight={700}>{i + 1}</text>
            </g>
          );
        })}

        {/* Playhead */}
        {ps.playing && (
          <line x1={ps.playhead * W} y1={0} x2={ps.playhead * W} y2={H} stroke="rgba(255,255,255,0.42)" strokeWidth={0.8} />
        )}

        {/* Empty state */}
        {!ps.loaded && (
          <>
            <rect x={1} y={1} width={W - 2} height={H - 2} fill="none" stroke={BD} strokeWidth={0.5} strokeDasharray="2 2" rx={1} />
            <text x={W / 2} y={H / 2 + 2} textAnchor="middle" fill={TD} fontSize={5} letterSpacing={1.2} fontFamily="monospace">
              DROP AUDIO OR LOAD
            </text>
          </>
        )}
      </svg>

      {/* Info bar */}
      <div style={{ display:"flex", justifyContent:"space-between", padding:"2px 5px", background:"#0a0a0a", borderTop:`1px solid ${BD}` }}>
        <span style={{ fontSize:6, color:TD, fontFamily:MONO }}>
          {ps.loaded ? "2.450s · 44.1kHz · 16bit · stereo" : "no file loaded"}
        </span>
        <div style={{ display:"flex", gap:8 }}>
          {ps.loaded && <span style={{ fontSize:6, color:AM, fontFamily:MONO }}>{ps.slices} slices</span>}
          {ps.loaded && <span style={{ fontSize:6, color:TD, fontFamily:MONO }}>{Math.round(ps.wfStart * 100)}% → {Math.round(ps.wfEnd * 100)}%</span>}
        </div>
      </div>
    </div>
  );
}

// ══════════════════════════════════════════════════════════
// POD HEADER
// ══════════════════════════════════════════════════════════
function PodHeader({ id, ps, set }: { id: string; ps: PS; set: (u: Partial<PS>) => void }) {
  return (
    <div style={{ display:"flex", alignItems:"center", gap:4, padding:"3px 6px", background:"#191919", borderBottom:`1px solid ${BN}`, minHeight:26 }}>
      {/* Pod ID / play indicator */}
      <div
        onClick={() => set({ playing: !ps.playing })}
        style={{
          width:18, height:18, flexShrink:0, cursor:"pointer",
          background: ps.playing ? AM : "#252525",
          border:`1px solid ${ps.playing ? AM : "#3a3a3a"}`, borderRadius:2,
          display:"flex", alignItems:"center", justifyContent:"center",
          fontSize:9, fontWeight:700, color: ps.playing ? "#111" : TB,
        }}
      >{id}</div>

      {/* Filename */}
      <div style={{ fontSize:7, color: ps.loaded ? TB : TD, fontFamily:MONO, flex:1, overflow:"hidden", textOverflow:"ellipsis", whiteSpace:"nowrap" }}>
        {ps.filename}
      </div>

      <VD />
      <Led label="M" act={ps.muted} onClick={() => set({ muted: !ps.muted })} color="#9999bb" />
      <Led label="S" act={ps.solo} onClick={() => set({ solo: !ps.solo })} color={AMB} />
      <Led label="REC" act={ps.recording} onClick={() => set({ recording: !ps.recording })} color={RD} />
      <VD />
      <Btn c="IN" />
      <Btn c="LOAD" />
      <Btn c="OUT" />
      <VD />
      <Knob label="VOL" v={ps.vol} set={v => set({ vol: v })} sz={22} />
      <Knob label="PAN" v={ps.pan} set={v => set({ pan: v })} sz={22} color="#8888cc" />
      <VD />
      <Btn c="PANIC" danger />
    </div>
  );
}

// ══════════════════════════════════════════════════════════
// JUNGULATOR SECTION — visual priority #2 after waveform
// ══════════════════════════════════════════════════════════
function JungSection({ ps, set }: { ps: PS; set: (u: Partial<PS>) => void }) {
  const kColor = ps.jungOn ? AM : "#484848";
  return (
    <div style={{
      margin:"3px 4px 2px",
      padding:"5px 6px",
      background: ps.jungOn ? "rgba(223,121,36,0.04)" : "#1a1a1a",
      border:`1px solid ${ps.jungOn ? AM : BD}`,
      borderRadius:2,
    }}>
      {/* Section header */}
      <div style={{ display:"flex", alignItems:"center", justifyContent:"space-between", marginBottom:5 }}>
        <div style={{ display:"flex", alignItems:"center", gap:6 }}>
          <span style={{ fontSize:7, color: ps.jungOn ? AM : TD, letterSpacing:"0.16em", textTransform:"uppercase", fontWeight:700 }}>
            ◆ JUNGULATOR
          </span>
          <span style={{ fontSize:6, color: TD }}>probability engine</span>
        </div>
        <Led label="JUNG ON" act={ps.jungOn} onClick={() => set({ jungOn: !ps.jungOn })} color={AM} />
      </div>

      {/* Knob row + pattern/fx selectors */}
      <div style={{ display:"flex", alignItems:"flex-start", gap:5, marginBottom:5 }}>
        <Knob label="PRIME"   v={ps.prime}   set={v => set({ prime: v })}   sz={24} color={kColor} />
        <Knob label="SEQ SPD" v={ps.seqSpeed} set={v => set({ seqSpeed: v })} sz={24} color={kColor} />
        <Knob label="LOOPER"  v={ps.looper}  set={v => set({ looper: v })}  sz={24} color={kColor} />
        <Knob label="CUTTER"  v={ps.cutter}  set={v => set({ cutter: v })}  sz={24} color={kColor} />
        <Knob label="OCTAVER" v={ps.octaver} set={v => set({ octaver: v })} sz={24} color={kColor} />
        <Knob label="RANDOM"  v={ps.rndAmt}  set={v => set({ rndAmt: v })}  sz={24} color={kColor} />
        <Knob label="PITCH"   v={ps.jPitch}  set={v => set({ jPitch: v })}  sz={24} color={kColor} />
        <VD />
        <div style={{ display:"flex", flexDirection:"column", gap:3, justifyContent:"center" }}>
          <div style={{ display:"flex", alignItems:"center", gap:3 }}>
            <Lbl t="SEQ" fs={6} />
            <Seg opts={["P1", "P2", "P3", "RND"]} val={ps.jPattern} set={v => set({ jPattern: v })} />
          </div>
          <div style={{ display:"flex", alignItems:"center", gap:3 }}>
            <Lbl t="FX" fs={6} />
            <Seg opts={["OFF", "FX A", "FX B"]} val="OFF" set={() => {}} />
          </div>
        </div>
      </div>

      {/* Action buttons row */}
      <div style={{ display:"flex", alignItems:"center", gap:3, flexWrap:"wrap" }}>
        <Btn c="JUNG ▲" act={ps.jungOn} onClick={() => {}} />
        <Btn c="JUNG ▼" act={ps.jungOn} onClick={() => {}} />
        <Btn c="OPTIONS" onClick={() => {}} />
        <VD />
        <Btn c="ALL" onClick={() => {}} />
        <Btn c="ONCE" act={ps.playMode === "ONCE"} onClick={() => set({ playMode: "ONCE" })} />
        <Btn c="LOOP" act={ps.playMode === "LOOP"} onClick={() => set({ playMode: "LOOP" })} />
        <Btn c="RESET" onClick={() => {}} />
      </div>
    </div>
  );
}

// ══════════════════════════════════════════════════════════
// PLAYBACK / MODULATION SECTION
// ══════════════════════════════════════════════════════════
function PlaybackSection({ ps, set }: { ps: PS; set: (u: Partial<PS>) => void }) {
  return (
    <div style={{ padding:"3px 6px 4px", borderBottom:`1px solid ${BD}` }}>
      {/* Knob row */}
      <div style={{ display:"flex", alignItems:"flex-start", gap:5, marginBottom:4, flexWrap:"wrap" }}>
        <Knob label="SPEED"  v={ps.speed}   set={v => set({ speed: v })}   sz={22} />
        <Knob label="RANGE"  v={ps.range}   set={v => set({ range: v })}   sz={22} />
        <Knob label="RND"    v={ps.rnd}     set={v => set({ rnd: v })}     sz={22} color="#cc9933" />
        <Knob label="RND2"   v={ps.rnd2}    set={v => set({ rnd2: v })}    sz={22} color="#cc9933" />
        <Knob label="JITTER" v={ps.jitter}  set={v => set({ jitter: v })}  sz={22} color="#cc9933" />
        <Knob label="PITCH"  v={ps.pitch}   set={v => set({ pitch: v })}   sz={22} />
        <Knob label="OCT"    v={ps.octave}  set={v => set({ octave: v })}  sz={22} />
        <Knob label="DENS"   v={ps.density} set={v => set({ density: v })} sz={22} />
        <Knob label="FD IN"  v={ps.fadeIn}  set={v => set({ fadeIn: v })}  sz={22} />
        <Knob label="FD OUT" v={ps.fadeOut} set={v => set({ fadeOut: v })} sz={22} />
      </div>
      {/* Random engine + extra mod params */}
      <div style={{ display:"flex", alignItems:"center", gap:4, flexWrap:"wrap" }}>
        <Lbl t="RND ENG" fs={6} />
        <Seg opts={["JUNG", "WEIGHTED", "WALK", "MEMORY", "CHAOS"]} val={ps.rndEngine} set={v => set({ rndEngine: v })} />
        <VD />
        <Knob label="DRIFT" v={0.3} sz={18} color="#8877aa" />
        <Knob label="GRAVITY" v={0.5} sz={18} color="#8877aa" />
        <VD />
        <Lbl t="RND2 TARGET" fs={6} />
        <Seg opts={["VEL", "SPD", "BOTH"]} val="BOTH" set={() => {}} />
      </div>
    </div>
  );
}

// ══════════════════════════════════════════════════════════
// ENGINE / QUALITY / TIMING ROW
// ══════════════════════════════════════════════════════════
function EngineRow({ ps, set }: { ps: PS; set: (u: Partial<PS>) => void }) {
  return (
    <div style={{ padding:"3px 6px", display:"flex", alignItems:"center", gap:4, flexWrap:"wrap", borderBottom:`1px solid ${BD}` }}>
      <Lbl t="ENG" fs={6} />
      <Seg opts={["GROOVE~", "PLAY~"]} val={ps.engine} set={v => set({ engine: v })} />
      <VD />
      <Lbl t="QUAL" fs={6} />
      <Seg opts={["HQ", "LO"]} val={ps.quality} set={v => set({ quality: v })} />
      <VD />
      <Lbl t="DETECT" fs={6} />
      <Seg opts={["BONK~", "SIGMUND~"]} val={ps.transDetect} set={v => set({ transDetect: v })} />
      <VD />
      <Seg opts={["SYNC", "FREE"]} val={ps.syncMode} set={v => set({ syncMode: v })} />
      <Lbl t="Q" fs={6} />
      <Seg opts={["OFF", "1/16", "1/8", "1/4"]} val={ps.quantize} set={v => set({ quantize: v })} />
      <VD />
      <Lbl t="SIG" fs={6} />
      <select
        value={ps.timeSig}
        onChange={e => set({ timeSig: e.target.value })}
        style={{ fontSize:7, background:BTN, border:`1px solid ${BN}`, borderRadius:2, color:TX, padding:"1px 3px", cursor:"pointer", fontFamily:"inherit" }}
      >
        {TIME_SIGS.map(t => <option key={t} value={t}>{t}</option>)}
      </select>
      <VD />
      <Lbl t="CHOKE" fs={6} />
      <Seg opts={["OFF", "A", "B", "C", "D", "E"]} val={ps.choke} set={v => set({ choke: v })} />
    </div>
  );
}

// ══════════════════════════════════════════════════════════
// POD FX STRIP
// ══════════════════════════════════════════════════════════
function FXStrip({ ps, set }: { ps: PS; set: (u: Partial<PS>) => void }) {
  return (
    <div style={{ padding:"3px 6px 4px", display:"flex", alignItems:"flex-start", gap:5, background:"#191919" }}>
      {/* Filter */}
      <div style={{ display:"flex", flexDirection:"column", gap:2 }}>
        <div style={{ display:"flex", alignItems:"center", gap:2 }}>
          <Lbl t="FILTER" fs={6} color="#99aa55" />
          <Seg opts={["LP", "HP"]} val={ps.filterType} set={v => set({ filterType: v })} />
        </div>
        <div style={{ display:"flex", gap:3 }}>
          <Knob label="CUT" v={ps.filterCut} set={v => set({ filterCut: v })} sz={20} color="#99aa55" />
          <Knob label="RES" v={ps.filterRes} set={v => set({ filterRes: v })} sz={20} color="#99aa55" />
        </div>
      </div>
      <VD />
      {/* Tape/Sat */}
      <div style={{ display:"flex", flexDirection:"column", gap:2 }}>
        <Lbl t="TAPE/SAT" fs={6} color="#cc9944" />
        <div style={{ display:"flex", gap:3 }}>
          <Knob label="DRIV" v={ps.tapeDrive} set={v => set({ tapeDrive: v })} sz={20} color="#cc9944" />
          <Knob label="TONE" v={ps.tapeTone}  set={v => set({ tapeTone: v })}  sz={20} color="#cc9944" />
        </div>
      </div>
      <VD />
      {/* Compressor */}
      <div style={{ display:"flex", flexDirection:"column", gap:2 }}>
        <Lbl t="COMP" fs={6} color="#44aaaa" />
        <div style={{ display:"flex", gap:3 }}>
          <Knob label="THRS"  v={ps.compThresh} set={v => set({ compThresh: v })} sz={20} color="#44aaaa" />
          <Knob label="RATIO" v={ps.compRatio}  set={v => set({ compRatio: v })}  sz={20} color="#44aaaa" />
          <Knob label="MIX"   v={ps.compMix}    set={v => set({ compMix: v })}    sz={20} color="#44aaaa" />
        </div>
      </div>
      <VD />
      {/* 3-band EQ */}
      <div style={{ display:"flex", flexDirection:"column", gap:2 }}>
        <Lbl t="EQ 3B" fs={6} color="#aa66cc" />
        <div style={{ display:"flex", gap:3 }}>
          <Knob label="LO"  v={ps.eqLo}  set={v => set({ eqLo: v })}  sz={20} color="#aa66cc" />
          <Knob label="MID" v={ps.eqMid} set={v => set({ eqMid: v })} sz={20} color="#aa66cc" />
          <Knob label="HI"  v={ps.eqHi}  set={v => set({ eqHi: v })}  sz={20} color="#aa66cc" />
        </div>
      </div>
      <VD />
      {/* Pan */}
      <div style={{ display:"flex", flexDirection:"column", gap:2 }}>
        <Lbl t="PAN" fs={6} />
        <Knob v={ps.fxPan} set={v => set({ fxPan: v })} sz={20} />
      </div>
    </div>
  );
}

// ══════════════════════════════════════════════════════════
// SAMPLER POD — assembled
// ══════════════════════════════════════════════════════════
function SamplerPod({ id, idx }: { id: string; idx: number }) {
  const [ps, setPS] = useState<PS>(() => mkPS(idx));
  const set = useCallback((u: Partial<PS>) => setPS(p => ({ ...p, ...u })), []);

  return (
    <div style={{ background: POD, border:`1px solid ${BN}`, borderRadius:3, display:"flex", flexDirection:"column", overflow:"hidden" }}>
      <PodHeader id={id} ps={ps} set={set} />

      <WaveformDisplay seed={SEEDS[idx]} ps={ps} set={set} />

      {/* Playback mode strip */}
      <div style={{ display:"flex", alignItems:"center", gap:3, padding:"3px 6px", background:"#1a1a1a", borderBottom:`1px solid ${BD}` }}>
        <Lbl t="PLAY MODE" fs={6} />
        <Seg opts={["LOOPER", "ONCE", "LOOP", "SYNC", "FREE"]} val={ps.playMode} set={v => set({ playMode: v })} />
      </div>

      <JungSection ps={ps} set={set} />
      <PlaybackSection ps={ps} set={set} />
      <EngineRow ps={ps} set={set} />
      <FXStrip ps={ps} set={set} />
    </div>
  );
}

// ══════════════════════════════════════════════════════════
// MASTER FX CHAIN
// ══════════════════════════════════════════════════════════
const FX_MODS = [
  { n:"REVERB",  params:[{ k:"mix", l:"MIX" },{ k:"size", l:"SIZE" },{ k:"damp", l:"DAMP" }] },
  { n:"ECHO",    params:[{ k:"time", l:"TIME" },{ k:"feed", l:"FEED" },{ k:"mix", l:"MIX" }] },
  { n:"DELAY",   params:[{ k:"time", l:"TIME" },{ k:"feed", l:"FEED" },{ k:"mix", l:"MIX" }] },
  { n:"DRIVE",   params:[{ k:"drive", l:"DRIV" },{ k:"tone", l:"TONE" }] },
  { n:"LIMITER", params:[{ k:"thresh", l:"THRS" },{ k:"gain", l:"GAIN" }] },
];

const FX_INIT: Record<string, number> = {
  REVERB_mix:0.3,  REVERB_size:0.6,  REVERB_damp:0.4,
  ECHO_time:0.5,   ECHO_feed:0.4,    ECHO_mix:0.35,
  DELAY_time:0.5,  DELAY_feed:0.3,   DELAY_mix:0.25,
  DRIVE_drive:0.35,DRIVE_tone:0.5,
  LIMITER_thresh:0.85,LIMITER_gain:0.7,
};

function MasterFX() {
  const [byp, setByp] = useState<Record<string, boolean>>({});
  const [vals, setVals] = useState<Record<string, number>>(FX_INIT);
  const [masterVol] = useState(0.85);
  const [masterWidth] = useState(0.7);

  return (
    <div style={{ background:"#161616", borderTop:`2px solid ${BN}`, padding:"5px 8px", display:"flex", alignItems:"flex-start", gap:6 }}>
      {/* Label */}
      <div style={{ display:"flex", flexDirection:"column", justifyContent:"center", alignSelf:"center", gap:2, flexShrink:0 }}>
        <div style={{ fontSize:7, color:AM, letterSpacing:"0.14em", textTransform:"uppercase", fontWeight:700, writingMode:"vertical-rl", transform:"rotate(180deg)" }}>
          MASTER CHAIN
        </div>
      </div>
      <VD />

      {/* FX modules */}
      <div style={{ display:"flex", alignItems:"flex-start", gap:0, flex:1, flexWrap:"wrap" }}>
        {FX_MODS.map((mod, mi) => {
          const b = byp[mod.n];
          const kc = b ? TD : "#7a9a9a";
          return (
            <div key={mod.n} style={{ display:"flex", alignItems:"stretch" }}>
              <div style={{
                border:`1px solid ${b ? BD : "#3a4a4a"}`,
                borderRadius:2, padding:"3px 5px",
                background: b ? "#161616" : "#1a1e1e",
                opacity: b ? 0.5 : 1,
                display:"flex", flexDirection:"column", gap:3,
              }}>
                <div style={{ display:"flex", alignItems:"center", justifyContent:"space-between", gap:6 }}>
                  <Lbl t={mod.n} fs={6} color={b ? TD : "#7a9a9a"} />
                  <button
                    onClick={() => setByp(p => ({ ...p, [mod.n]: !p[mod.n] }))}
                    style={{ fontSize:6, padding:"1px 3px", background: b ? "#3a2020" : BTN, border:`1px solid ${b ? RD : BD}`, borderRadius:1, color: b ? RD : TD, cursor:"pointer", fontFamily:"inherit", lineHeight:1 }}
                  >
                    {b ? "BYP" : "ON"}
                  </button>
                </div>
                <div style={{ display:"flex", gap:4 }}>
                  {mod.params.map(p => (
                    <Knob key={p.k} label={p.l} v={vals[`${mod.n}_${p.k}`] ?? 0.5} set={v => setVals(pv => ({ ...pv, [`${mod.n}_${p.k}`]: v }))} sz={20} color={kc} />
                  ))}
                </div>
              </div>
              {mi < FX_MODS.length - 1 && (
                <div style={{ width:1, background:BD, margin:"4px 3px" }} />
              )}
            </div>
          );
        })}
      </div>

      <VD />

      {/* Output section */}
      <div style={{ display:"flex", alignItems:"flex-start", gap:5, flexShrink:0 }}>
        <div style={{ display:"flex", flexDirection:"column", gap:3 }}>
          <Lbl t="OUTPUT" fs={6} color={AM} />
          <div style={{ display:"flex", gap:4 }}>
            <Knob label="VOL" v={masterVol} sz={24} color={AM} />
            <Knob label="WIDTH" v={masterWidth} sz={24} color="#7799cc" />
          </div>
        </div>
        <VD />
        {/* Stereo level meter */}
        <div style={{ display:"flex", flexDirection:"column", gap:2 }}>
          <Lbl t="OUT METER" fs={6} />
          <div style={{ display:"flex", gap:3, alignItems:"flex-end" }}>
            {([0.72, 0.68] as number[]).map((lv, ci) => (
              <div key={ci} style={{ display:"flex", flexDirection:"column", alignItems:"center", gap:1 }}>
                <div style={{ width:8, height:64, background:"#0c0c0c", border:`1px solid ${BD}`, borderRadius:1, position:"relative", overflow:"hidden", display:"flex", flexDirection:"column", justifyContent:"flex-end" }}>
                  {/* Segmented meter fill — top (red clip), mid (yellow), body (green) */}
                  <div style={{ width:"100%", height:`${lv * 100}%`, display:"flex", flexDirection:"column", justifyContent:"flex-end" }}>
                    <div style={{ height:"12%", background:"#c03030" }} />
                    <div style={{ height:"18%", background:"#c08820" }} />
                    <div style={{ flex:1, background:"#3c8840" }} />
                  </div>
                </div>
                <span style={{ fontSize:6, color:TD }}>{ci === 0 ? "L" : "R"}</span>
              </div>
            ))}
          </div>
        </div>
      </div>
    </div>
  );
}

// ══════════════════════════════════════════════════════════
// BPM WINDOW — floating, draggable
// ══════════════════════════════════════════════════════════
function BPMWindow() {
  const [bpm, setBpm]         = useState(120.00);
  const [playing, setPlaying] = useState(false);
  const [rec, setRec]         = useState(false);
  const [hostSync, setHostSync] = useState(false);
  const [swing, setSwing]     = useState(0.5);
  const [pos, setPos]         = useState({ x: 72, y: 72 });
  const [editing, setEditing] = useState(false);
  const [draft, setDraft]     = useState("");
  const drag = useRef<{ sx: number; sy: number; ox: number; oy: number } | null>(null);

  const onTitleMD = (e: ME) => {
    drag.current = { sx: e.clientX, sy: e.clientY, ox: pos.x, oy: pos.y };
    e.preventDefault();
    const mM = (ev: MouseEvent) => {
      if (drag.current) setPos({ x: drag.current.ox + ev.clientX - drag.current.sx, y: drag.current.oy + ev.clientY - drag.current.sy });
    };
    const mU = () => { drag.current = null; document.removeEventListener("mousemove", mM); document.removeEventListener("mouseup", mU); };
    document.addEventListener("mousemove", mM);
    document.addEventListener("mouseup", mU);
  };

  const commit = () => {
    const n = parseFloat(draft);
    if (!isNaN(n) && n >= 1) setBpm(parseFloat(n.toFixed(2)));
    setEditing(false);
  };

  return (
    <div style={{
      position:"fixed", left:pos.x, top:pos.y, zIndex:200, width:220,
      background:"#151515", border:`1px solid ${BN}`, borderRadius:3,
      boxShadow:"0 6px 28px rgba(0,0,0,0.75)", userSelect:"none",
    }}>
      {/* Window title bar */}
      <div
        onMouseDown={onTitleMD}
        style={{ display:"flex", alignItems:"center", justifyContent:"space-between", padding:"3px 7px", background:"#101010", borderBottom:`1px solid ${BN}`, cursor:"move" }}
      >
        <span style={{ fontSize:7, color:AM, letterSpacing:"0.13em", textTransform:"uppercase", fontWeight:700 }}>
          flöde~ bpm
        </span>
        <div style={{ display:"flex", gap:3 }}>
          {(["#3a2828", "#3a3820", "#1e2e1e"] as string[]).map((bg, i) => (
            <div key={i} style={{ width:8, height:8, borderRadius:"50%", background:bg, border:`1px solid ${BD}` }} />
          ))}
        </div>
      </div>

      <div style={{ padding:"10px 10px 8px", display:"flex", flexDirection:"column", gap:8 }}>
        {/* Large BPM display */}
        <div style={{ textAlign:"center" }}>
          {editing ? (
            <input
              autoFocus
              value={draft}
              onChange={e => setDraft(e.target.value)}
              onBlur={commit}
              onKeyDown={e => { if (e.key === "Enter") commit(); if (e.key === "Escape") setEditing(false); }}
              style={{ fontSize:32, fontFamily:MONO, fontWeight:700, color:AM, background:"transparent", border:"none", borderBottom:`1px solid ${AM}`, outline:"none", width:135, textAlign:"center", letterSpacing:"0.04em" }}
            />
          ) : (
            <div
              onClick={() => { setDraft(bpm.toFixed(2)); setEditing(true); }}
              style={{ fontSize:32, fontFamily:MONO, fontWeight:700, color:AM, letterSpacing:"0.04em", cursor:"text" }}
            >
              {bpm.toFixed(2)}
            </div>
          )}
          <Lbl t="BPM  ·  CLICK TO EDIT" fs={6} />
        </div>

        <HD />

        {/* Transport */}
        <div style={{ display:"flex", gap:3, justifyContent:"center" }}>
          <Btn c="TAP" fs={8} px={6} py={3} onClick={() => {}} />
          <Btn c="▶ PLAY" act={playing} fs={8} px={6} py={3} onClick={() => setPlaying(p => !p)} color={GN} />
          <Btn c="■ STOP" fs={8} px={6} py={3} onClick={() => setPlaying(false)} />
          <Led label="REC" act={rec} onClick={() => setRec(p => !p)} color={RD} />
        </div>

        <HD />

        {/* Sync */}
        <div style={{ display:"flex", flexDirection:"column", gap:3 }}>
          <Led label="HOST SYNC" act={hostSync} onClick={() => setHostSync(p => !p)} color="#7788cc" />
          <div style={{ display:"flex", gap:3 }}>
            <Btn c="MIDI CLK IN" fs={7} />
            <Btn c="MIDI CLK OUT" fs={7} />
          </div>
        </div>

        <HD />

        {/* Time sig + swing */}
        <div style={{ display:"flex", alignItems:"center", gap:8 }}>
          <div style={{ display:"flex", alignItems:"center", gap:4 }}>
            <Lbl t="SIG" fs={7} />
            <select style={{ fontSize:7, background:BTN, border:`1px solid ${BN}`, borderRadius:2, color:TX, padding:"2px 3px", fontFamily:"inherit" }}>
              {TIME_SIGS.map(s => <option key={s}>{s}</option>)}
            </select>
          </div>
          <div style={{ display:"flex", alignItems:"center", gap:4 }}>
            <Knob label="SWING" v={swing} set={setSwing} sz={24} color="#aa88bb" />
            <span style={{ fontSize:8, color:TX, fontFamily:MONO }}>{Math.round(swing * 100)}%</span>
          </div>
        </div>
      </div>
    </div>
  );
}

// ══════════════════════════════════════════════════════════
// APP ROOT
// ══════════════════════════════════════════════════════════
export default function App() {
  return (
    <div style={{ background:BG, minHeight:"100vh", minWidth:1280, fontFamily:"'Inter', 'Helvetica Neue', Arial, sans-serif", fontSize:13 }}>
      {/* ─ App header bar ──────────────────────────────────── */}
      <div style={{ display:"flex", alignItems:"center", padding:"4px 10px", gap:8, background:"#131313", borderBottom:`1px solid ${BN}`, height:30, flexShrink:0 }}>
        <span style={{ fontSize:15, fontWeight:700, color:AM, letterSpacing:"-0.03em", flexShrink:0 }}>
          flöde~
        </span>
        <span style={{ fontSize:7, color:"#3a3a3a", marginLeft:-2 }}>v1.0</span>
        <VD />
        <span style={{ fontSize:7, color:TD, letterSpacing:"0.1em", textTransform:"uppercase" }}>
          experimental sampler · probability workstation
        </span>
        <div style={{ flex:1 }} />
        <div style={{ display:"flex", alignItems:"center", gap:5 }}>
          <Knob v={0.85} sz={20} color={AM} />
          <Lbl t="MASTER" fs={6} />
          <VD />
          {(["SETTINGS", "MIDI", "AUDIO I/O", "SAVE", "PRESET ▾"] as string[]).map(l => (
            <Btn key={l} c={l} fs={7} />
          ))}
        </div>
      </div>

      {/* ─ Pod grid 3×2 ────────────────────────────────────── */}
      <div style={{ display:"grid", gridTemplateColumns:"1fr 1fr 1fr", gap:4, padding:"4px" }}>
        {POD_IDS.map((id, i) => (
          <SamplerPod key={id} id={id} idx={i} />
        ))}
      </div>

      {/* ─ Master FX chain ─────────────────────────────────── */}
      <MasterFX />

      {/* ─ Floating BPM window ─────────────────────────────── */}
      <BPMWindow />
    </div>
  );
}
