import React,{useId,useRef} from "react";
import {flodeTokens,AccentRole} from "./tokens";
import {TechnicalLabel,ValueDisplay} from "./primitives";
const clamp=(v:number)=>Math.max(0,Math.min(1,v));
export function Knob({label,valueNorm,onChange,valueText,variant="primary",accentRole="primary",scale=[]}:{label:string;valueNorm:number;onChange:(v:number)=>void;valueText:string;variant?:"primary"|"eq";accentRole?:AccentRole;scale?:{label:string;norm:number}[]}){
 const gid=useId(), ref=useRef<HTMLDivElement>(null), size=variant==="primary"?flodeTokens.geometry.primaryKnob:flodeTokens.geometry.eqKnob;
 const sweep=flodeTokens.geometry.knobSweepDeg, angle=-sweep/2+clamp(valueNorm)*sweep;
 const down=(e:React.PointerEvent<HTMLDivElement>)=>{const el=e.currentTarget;el.setPointerCapture(e.pointerId);const y=e.clientY,start=valueNorm;
  const move=(p:PointerEvent)=>onChange(clamp(start+(y-p.clientY)*.005));
  const clean=(p:PointerEvent)=>{if(el.hasPointerCapture(p.pointerId))el.releasePointerCapture(p.pointerId);el.removeEventListener("pointermove",move);el.removeEventListener("pointerup",clean);el.removeEventListener("pointercancel",clean);el.removeEventListener("lostpointercapture",lost)};
  const lost=()=>{el.removeEventListener("pointermove",move);el.removeEventListener("pointerup",clean);el.removeEventListener("pointercancel",clean);};
  el.addEventListener("pointermove",move);el.addEventListener("pointerup",clean);el.addEventListener("pointercancel",clean);el.addEventListener("lostpointercapture",lost);
 };
 const col=flodeTokens.color[accentRole];
 return <div style={{display:"grid",justifyItems:"center",gap:6}}><TechnicalLabel>{label}</TechnicalLabel>
 <div ref={ref} role="slider" aria-label={label} aria-valuemin={0} aria-valuemax={1} aria-valuenow={valueNorm} aria-valuetext={valueText} tabIndex={0} onPointerDown={down} style={{width:size,height:size,touchAction:"none",cursor:"ns-resize"}}>
 <svg viewBox="0 0 100 100" width="100%" height="100%">
 <defs><linearGradient id={gid} x1="0" y1="0" x2="0" y2="1"><stop offset="0" stopColor="#fff"/><stop offset=".7" stopColor="#e2e5e7"/><stop offset="1" stopColor="#c8cccc"/></linearGradient></defs>
 {Array.from({length:21},(_,i)=>{const a=(-135+i/20*270)*Math.PI/180,r1=44,r2=i%5===0?50:47;return <line key={i} x1={50+r1*Math.sin(a)} y1={50-r1*Math.cos(a)} x2={50+r2*Math.sin(a)} y2={50-r2*Math.cos(a)} stroke="#555" strokeWidth={i%5===0?1.5:1}/>})}
 {scale.map((t,i)=>{const a=(-135+t.norm*270)*Math.PI/180;return <text key={i} x={50+58*Math.sin(a)} y={53-58*Math.cos(a)} fontSize="9" fontWeight="700" textAnchor="middle">{t.label}</text>})}
 <circle cx="50" cy="50" r="39" fill="#181818" stroke="#000" strokeWidth="1.5"/><circle cx="50" cy="50" r="34" fill={`url(#${gid})`}/>
 <g transform={`rotate(${angle} 50 50)`}><line x1="50" y1="50" x2="50" y2="20" stroke={col} strokeWidth="3.5" strokeLinecap="round"/></g></svg></div>
 <ValueDisplay value={valueText} accentRole={accentRole}/></div>
}
