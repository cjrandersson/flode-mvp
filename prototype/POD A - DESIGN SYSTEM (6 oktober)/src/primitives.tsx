import React from "react";
import {flodeTokens,AccentRole} from "./tokens";
import {SemanticState} from "./types";
const accent=(r:AccentRole)=>flodeTokens.color[r];
export const TechnicalLabel=({children}:{children:React.ReactNode})=><span style={{fontFamily:flodeTokens.type.technical,fontSize:10,fontWeight:700,letterSpacing:1.2,textTransform:"uppercase",color:flodeTokens.color.text}}>{children}</span>;
export const ValueDisplay=({value,accentRole="primary"}:{value:string;accentRole?:AccentRole})=><div style={{background:flodeTokens.color.display,border:`1px solid ${flodeTokens.color.displayBorder}`,borderRadius:flodeTokens.geometry.displayRadius,boxShadow:flodeTokens.depth.display,padding:"3px 8px",minWidth:58,textAlign:"center",fontFamily:flodeTokens.type.numeric,fontSize:11,fontWeight:700,color:accent(accentRole)}}>{value}</div>;
export const PanelDivider=()=> <div aria-hidden style={{height:1,width:"100%",background:flodeTokens.color.divider}}/>;
export function HardwareButton({children,state="idle",variant="utility",onPress}:{children:React.ReactNode;state?:SemanticState;variant?:"utility"|"segmented"|"transport";onPress?:()=>void}){
 const active=state==="active"||state==="selected"||state==="pressed";
 return <button type="button" aria-pressed={active} disabled={state==="disabled"} onClick={onPress} data-variant={variant} data-state={state}
 style={{appearance:"none",border:`1px solid ${active?"#d45500":flodeTokens.color.panelBorder}`,borderRadius:flodeTokens.geometry.controlRadius,background:active?flodeTokens.color.primary:flodeTokens.color.chassisLight,color:flodeTokens.color.text,boxShadow:active?flodeTokens.depth.pressed:flodeTokens.depth.raised,fontSize:10,fontWeight:800,letterSpacing:.8,padding:variant==="transport"?"8px 28px":"6px 12px",cursor:state==="disabled"?"default":"pointer"}}>{children}</button>;
}
