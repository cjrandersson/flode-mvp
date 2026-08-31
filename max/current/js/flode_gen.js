// flöde~ generative engine MVP v1
// inlets: 0 bang, 1 mode index, 2 amount 0..1, 3 jitter 0..1
// outlets: 0 playback speed, 1 normalized position intent, 2 velocity intent
inlets = 4;
outlets = 3;
var mode=1, amount=0.55, jitter=0.18;
var walk=0.5, memory=[], memIndex=0, last=0.5;
function msg_int(v){ if(inlet===1) mode=Math.max(0,Math.min(5,v)); }
function msg_float(v){ if(inlet===2) amount=clamp(v); else if(inlet===3) jitter=clamp(v); }
function clamp(v){ return Math.max(0,Math.min(1,v)); }
function rnd(){ return Math.random(); }
function gaussish(){ return (rnd()+rnd()+rnd())/3; }
function choose(){
 var x;
 switch(mode){
  case 0: x=rnd(); break; // PURE
  case 1: // JUNG: independent impulses + occasional stubborn repeats
    x=(rnd()<0.22)?last:rnd(); if(rnd()<0.12) x=(rnd()<0.5)?0.08:0.92; break;
  case 2: // WEIGHTED: clustered around useful middle zones
    x=gaussish(); if(rnd()<0.30) x=(rnd()<0.5)?0.33:0.66; break;
  case 3: // WALK: bounded random walk
    walk=clamp(walk+(rnd()-0.5)*(0.16+amount*0.34)); x=walk; break;
  case 4: // MEMORY: reuse a rolling bank of prior states
    if(memory.length<8 || rnd()<0.28){ x=rnd(); memory.push(x); if(memory.length>12) memory.shift(); }
    else { memIndex=(memIndex+1)%memory.length; x=memory[memIndex]; } break;
  case 5: // CHAOS: nonlinear feedback using previous state
    x=3.86*last*(1-last); if(!isFinite(x)||x<=0||x>=1) x=rnd(); break;
 }
 x=clamp(x + (rnd()-0.5)*jitter*0.22);
 last=x; return x;
}
function bang(){ if(inlet!==0) return; var x=choose(); var centered=(x-0.5)*2; var speed=1 + centered*(1.35*amount); if(speed<0.25) speed=0.25; if(speed>2) speed=2; var pos=clamp((1-amount)*0.5 + amount*x); var vel=clamp(0.72 + (rnd()-0.5)*(0.45*amount+0.20*jitter)); outlet(2,vel); outlet(1,pos); outlet(0,speed); }
function anything(){ if(inlet===1){ var n=messagename.toUpperCase(); var names=['PURE','JUNG','WEIGHTED','WALK','MEMORY','CHAOS']; var i=names.indexOf(n); if(i>=0) mode=i; } }
