// flöde~ — p5.js concept prototype
// UI/UX visual representation of the confirmed six-pod Max/MSP instrument.
// No DSP is implemented here; dropped audio is decoded only to draw real waveforms.

const C={
  bg:'#171818',app:'#202121',title:'#191a1a',pod:'#292a2a',pod2:'#2c2d2d',
  inset:'#111212',line:'#3c3e3d',line2:'#2e302f',text:'#c8cbc7',text2:'#949994',
  text3:'#666b67',amber:'#c59a58',amber2:'#d8ad6b',olive:'#737a6c',red:'#865e55',
  blue:'#657078',wave:'#e8a047',waveDim:'#a77743'
};
const TIMESIGS=['4/4','3/4','2/4','6/8','5/4','7/8','9/8','12/8','2/2','5/8'];
const RANDOM_MODES=['pure','weighted','memory'];
const ENGINES=['groove~','play~'];
const QUALITY=['HQ','LO'];
const DETECT=['bonk~','sigmund~'];
const CHOKES=['–','A','B','C','D','E'];

let pods=[], bpmWin, masterFX, cvs, uiScale=1, activeDrag=null;

function setup(){
  cvs=createCanvas(windowWidth,windowHeight);
  pixelDensity(Math.min(2,window.devicePixelRatio||1));
  textFont('Helvetica Neue, Helvetica, Arial, sans-serif');
  for(let i=0;i<6;i++) pods.push(new Pod(i));
  bpmWin=new BPMWindow();
  masterFX=new MasterFXChain();
  cvs.drop(handleDroppedFile);
}

function draw(){
  background(C.bg); computeScale(); drawMainWindow();
  pods.forEach(p=>{p.layout();p.draw();});
  masterFX.layout(); masterFX.draw();
  bpmWin.draw(); drawFooter();
}

function computeScale(){uiScale=constrain(Math.min(width/1480,height/900),.72,1.25)}
function S(v){return v*uiScale}

function drawMainWindow(){
  const x=S(22),y=S(22),w=width-S(44),h=height-S(44);
  noStroke();fill(C.app);rect(x,y,w,h,S(3));
  fill(C.title);rect(x,y,w,S(34),S(3),S(3),0,0);
  fill(C.text);textSize(S(12));textAlign(LEFT,CENTER);text('flöde~',x+S(13),y+S(17));
  fill(C.text3);textSize(S(8.5));text('six-pod slicing / probability sampler',x+S(64),y+S(17));
  textAlign(RIGHT,CENTER);text('prototype 02 / standalone',x+w-S(14),y+S(17));
  textAlign(LEFT,BASELINE);
}

class Pod{
  constructor(i){
    this.i=i; this.letter=String.fromCharCode(97+i);
    this.sampleName=['break_01.wav','voice.aif','metal.wav','field.wav','drumloop.wav','noise.wav'][i];
    this.mute=false;this.solo=false;this.loop=true;this.rec=false;this.sync=true;this.fxOpen=false;
    this.filterOn=true;this.filterMode=i%2?'HP':'LP';this.satOn=true;this.compOn=false;this.eqOn=true;
    this.randomMode=RANDOM_MODES[i%3];this.engine='groove~';this.quality='HQ';this.detect='bonk~';this.choke='–';
    this.values={vol:.76,pan:0,spd:.25,rng:.46,rnd:.20,rnd2:.10,jit:.07,pit:.50,trans:.40,
      fadeIn:.10,fadeOut:.10,filter:.58,sat:.26,comp:.20,eqLow:.5,eqMid:.5,eqHigh:.5};
    this.zoom=1;this.loopStart=.14;this.loopEnd=.76;this.playhead=.16;this.seed=900+i*101;
    this.wave=this.syntheticWave();this.actualWave=false;this.selectedTransient=-1;
  }
  syntheticWave(){
    randomSeed(this.seed);noiseSeed(this.seed);let a=[];
    for(let i=0;i<320;i++){
      let env=.2+.75*noise(i*.027+this.i*2.7), detail=.25+.75*noise(i*.19+this.i*9.2);
      let tr=(i%(19+(this.i%4)*5)<2)?1.35:1;a.push(constrain(env*detail*tr,.04,1));
    } return a;
  }
  layout(){
    const m=S(36),top=S(69),gap=S(8),masterH=S(116),totalW=width-m*2;
    this.w=(totalW-gap*2)/3; const bottomTop=height-S(22)-masterH;
    const avail=bottomTop-top-S(10); this.h=(avail-gap)/2;
    const col=this.i%3,row=floor(this.i/3); this.x=m+col*(this.w+gap);this.y=top+row*(this.h+gap);
  }
  draw(){
    fill(this.i%2?C.pod2:C.pod);stroke(C.line);strokeWeight(1);rect(this.x,this.y,this.w,this.h,S(2));
    this.header();this.waveform();this.mixer();this.core();this.modes();this.fxStrip();if(this.fxOpen)this.fxDrawer();
  }
  header(){
    let y=this.y+S(7);noStroke();fill(C.amber);circle(this.x+S(12),y+S(8),S(6.5));
    miniButton(this.x+S(21),y,S(18),S(16),'M',this.mute,C.red);
    miniButton(this.x+S(42),y,S(18),S(16),'S',this.solo,C.olive);
    fill(C.text);textSize(S(9));textAlign(LEFT,CENTER);text('pod '+this.letter,this.x+S(68),y+S(8));
    fill(C.text3);textSize(S(7.7));textAlign(RIGHT,CENTER);text(this.sampleName,this.x+this.w-S(10),y+S(8));
    textAlign(LEFT,BASELINE);
  }
  waveRect(){return{x:this.x+S(9),y:this.y+S(31),w:this.w-S(18),h:max(S(92),this.h*.39)}}
  waveform(){
    const r=this.waveRect();
    fill('#151616');stroke('#0b0c0c');rect(r.x,r.y,r.w,r.h,S(1));

    // Simplr-inspired upper ruler and timing grid.
    noStroke();fill('#222323');rect(r.x,r.y,r.w,S(13));
    const divisions=8;
    for(let i=0;i<=divisions;i++){
      const gx=r.x+i/divisions*r.w;
      stroke(i%2===0?C.line:C.line2);line(gx,r.y+S(13),gx,r.y+r.h);
      if(i<divisions){noStroke();fill(C.text3);textSize(S(5.8));textAlign(LEFT,TOP);text(`${(i*.5).toFixed(1)}s`,gx+S(3),r.y+S(2));}
    }

    const lx=r.x+this.loopStart*r.w,lw=(this.loopEnd-this.loopStart)*r.w;
    noStroke();fill(197,154,88,18);rect(lx,r.y+S(13),lw,r.h-S(13));

    // Waveform is deliberately large and central, inspired by Ableton Simpler rather than copied.
    const mid=r.y+S(13)+(r.h-S(13))/2;
    stroke(this.actualWave?C.wave:C.waveDim);strokeWeight(1);
    for(let i=0;i<this.wave.length;i++){
      const xx=r.x+i/(this.wave.length-1)*r.w;
      const amp=this.wave[i]*(r.h-S(20))*.44;
      line(xx,mid-amp,xx,mid+amp);
    }

    // Slice/transient lines run through the waveform like a slicing sampler.
    const markers=max(1,floor(2+this.values.trans*22));
    for(let i=1;i<markers;i++){
      const mx=r.x+i/markers*r.w;
      stroke(i===this.selectedTransient?C.amber2:'#69583d');
      line(mx,r.y+S(13),mx,r.y+r.h);
      noStroke();fill(i===this.selectedTransient?C.amber2:C.text3);textSize(S(5.5));textAlign(CENTER,TOP);text(i,mx,r.y+S(15));
    }

    // Start/end loop handles.
    stroke(C.amber);strokeWeight(1.2);line(lx,r.y+S(13),lx,r.y+r.h);line(lx+lw,r.y+S(13),lx+lw,r.y+r.h);
    noStroke();fill(C.amber);rect(lx-S(2),r.y+S(13),S(4),S(13));rect(lx+lw-S(2),r.y+S(13),S(4),S(13));

    if(!this.mute){this.playhead+=.00085*map(this.values.spd,0,1,.35,2.4)*(this.sync?1:.91);if(this.playhead>this.loopEnd)this.playhead=this.loopStart}
    const ph=r.x+this.playhead*r.w;stroke('#f0c16f');strokeWeight(1.3);line(ph,r.y+S(13),ph,r.y+r.h);

    // Compact status strip under the waveform, in the spirit of Simpler's dense control row.
    noStroke();fill('#202121');rect(r.x,r.y+r.h-S(17),r.w,S(17));
    fill(C.text3);textSize(S(5.9));textAlign(LEFT,CENTER);
    text(this.actualWave?'SAMPLE':'DROP AUDIO',r.x+S(5),r.y+r.h-S(8.5));
    fill(C.text2);text(`SLICE ${round(this.values.trans*100)}%`,r.x+S(58),r.y+r.h-S(8.5));
    text(this.sync?'SYNC':'FREE',r.x+S(111),r.y+r.h-S(8.5));
    text(this.randomMode.toUpperCase(),r.x+S(148),r.y+r.h-S(8.5));
    textAlign(RIGHT,CENTER);fill(C.text3);text(this.sampleName,r.x+r.w-S(51),r.y+r.h-S(8.5));
    miniButton(r.x+r.w-S(44),r.y+r.h-S(16),S(39),S(14),'PANIC',false,C.red);
    textAlign(LEFT,BASELINE);
  }
  mixer(){
    const w=this.waveRect(),x=this.x+S(12),y=w.y+w.h+S(13),usable=this.h-(y-this.y)-S(57);
    fill(C.text3);noStroke();textSize(S(7));text('VOL',x,y);
    let sx=x+S(7),sy=y+S(10),sh=max(S(48),usable);stroke(C.line2);line(sx,sy,sx,sy+sh);
    let hy=sy+sh*(1-this.values.vol);noStroke();fill(C.amber);rect(sx-S(4),hy-S(2),S(8),S(4));
    let kx=x+S(35),ky=sy+S(19);drawKnob(kx,ky,S(19),this.values.pan,-1,1);
    fill(C.text3);textSize(S(7));textAlign(CENTER,TOP);text('PAN',kx,ky+S(13));textAlign(LEFT,BASELINE);
    fill(C.text3);text('L',kx-S(16),ky+S(1));text('R',kx+S(13),ky+S(1));
  }
  core(){
    const w=this.waveRect(),x=this.x+S(61),y=w.y+w.h+S(12),labelW=S(28),cw=this.w-(x-this.x)-S(11),row=S(20);
    const data=[['spd','spd',speedLabel(this.values.spd)],['rng','rng',round(map(this.values.rng,0,1,1,2000))+' ms'],
      ['rnd','rnd',round(this.values.rnd*100)+'%'],['rnd2','rnd2',round(this.values.rnd2*100)+'%'],
      ['jit','jit',round(map(this.values.jit,0,1,0,80))+' ms'],['pit','pit',pitchLabel(this.values.pit)]];
    for(let i=0;i<data.length;i++){let yy=y+i*row;if(yy>this.y+this.h-S(62))break;
      fill(C.text3);noStroke();textSize(S(7.2));textAlign(LEFT,CENTER);text(data[i][0],x,yy+S(3));
      drawSlider(x+labelW,yy,cw-labelW-S(40),this.values[data[i][1]],data[i][1]==='rnd');
      fill(C.text2);textAlign(RIGHT,CENTER);textSize(S(6.8));text(data[i][2],x+cw,yy+S(3));}
    textAlign(LEFT,BASELINE);
  }
  modes(){
    let y=this.y+this.h-S(50),x=this.x+S(9);tinyLabel(x,y,'RAND');cycleBox(x+S(29),y-S(6),S(56),S(15),this.randomMode);
    tinyLabel(x+S(91),y,'ENGINE');cycleBox(x+S(126),y-S(6),S(51),S(15),this.engine);
    tinyLabel(x+S(183),y,'Q');cycleBox(x+S(194),y-S(6),S(28),S(15),this.quality);
    let dx=x+S(228);if(dx+S(95)<this.x+this.w-S(8)){tinyLabel(dx,y,'DETECT');cycleBox(dx+S(36),y-S(6),S(50),S(15),this.detect)}
  }
  fxStrip(){
    let y=this.y+this.h-S(26),x=this.x+S(9);miniButton(x,y,S(27),S(16),'loop',this.loop,C.olive);
    miniButton(x+S(30),y,S(24),S(16),'rec',this.rec,C.red);miniButton(x+S(57),y,S(28),S(16),this.sync?'sync':'free',this.sync,C.blue);
    tinyLabel(x+S(94),y+S(8),'CHOKE');cycleBox(x+S(127),y,S(25),S(16),this.choke);
    let fxX=this.x+this.w-S(183);miniButton(fxX,y,S(29),S(16),this.filterMode,this.filterOn,C.olive);
    miniButton(fxX+S(32),y,S(31),S(16),'tape',this.satOn,C.olive);miniButton(fxX+S(66),y,S(31),S(16),'comp',this.compOn,C.olive);
    miniButton(fxX+S(100),y,S(24),S(16),'EQ',this.eqOn,C.olive);miniButton(fxX+S(127),y,S(48),S(16),this.fxOpen?'close fx':'pod fx',this.fxOpen,C.amber);
  }
  fxDrawer(){
    let x=this.x+S(7),y=this.y+this.h-S(110),w=this.w-S(14),h=S(78);
    fill('#212222');stroke(C.line);rect(x,y,w,h,S(1));
    fill(C.text3);noStroke();textSize(S(6.2));textAlign(LEFT,CENTER);text('POD FX',x+S(7),y+S(10));

    // One continuous hardware-style strip, not separate cards.
    stroke(C.line2);line(x+S(7),y+S(18),x+w-S(7),y+S(18));
    let names=[['CUT',this.values.filter],['TAPE',this.values.sat],['COMP',this.values.comp],['LOW',this.values.eqLow],['MID',this.values.eqMid],['HIGH',this.values.eqHigh]];
    for(let i=0;i<names.length;i++){
      let cx=x+S(31)+i*((w-S(62))/5);
      drawKnob(cx,y+S(42),S(21),names[i][1],0,1);
      fill(C.text3);noStroke();textSize(S(6.1));textAlign(CENTER,TOP);text(names[i][0],cx,y+S(56));
      if(i<names.length-1){stroke(C.line2);line(cx+(w-S(62))/10,y+S(25),cx+(w-S(62))/10,y+h-S(8))}
    }
    textAlign(LEFT,BASELINE);
  }
  press(mx,my){
    let hy=this.y+S(7);if(hit(mx,my,this.x+S(21),hy,S(18),S(16))){this.mute=!this.mute;return true}
    if(hit(mx,my,this.x+S(42),hy,S(18),S(16))){this.solo=!this.solo;return true}
    const w=this.waveRect();if(hit(mx,my,w.x,w.y,w.w,w.h)){
      if(hit(mx,my,w.x+w.w-S(46),w.y+S(1),S(44),S(18))){this.panic();return true}
      const ls=w.x+this.loopStart*w.w, le=w.x+this.loopEnd*w.w;
      if(abs(mx-ls)<S(8)){activeDrag={type:'loopStart',pod:this};return true}
      if(abs(mx-le)<S(8)){activeDrag={type:'loopEnd',pod:this};return true}

      const markers=max(1,floor(2+this.values.trans*22));
      let nearest=-1,nearestD=999999;
      for(let i=1;i<markers;i++){let tx=w.x+i/markers*w.w,d=abs(mx-tx);if(d<nearestD){nearest=i;nearestD=d}}
      if(nearestD<S(7)){this.selectedTransient=nearest;this.playhead=nearest/markers;return true}

      this.selectedTransient=-1;
      this.playhead=constrain((mx-w.x)/w.w,0,1);return true}
    const cx=this.x+S(61),cy=w.y+w.h+S(12),row=S(20),labelW=S(28),cw=this.w-(cx-this.x)-S(11),keys=['spd','rng','rnd','rnd2','jit','pit'];
    for(let i=0;i<keys.length;i++){let sx=cx+labelW,sy=cy+i*row,sw=cw-labelW-S(40);if(hit(mx,my,sx,sy-S(5),sw,S(12))){activeDrag={type:'slider',pod:this,key:keys[i],x:sx,w:sw,startMouse:mx,startVal:this.values[keys[i]]};this.dragSlider(mx);return true}}
    const mixX=this.x+S(12),mixY=w.y+w.h+S(13),sy=mixY+S(10),sh=max(S(48),this.h-(mixY-this.y)-S(57));
    if(hit(mx,my,mixX,sy-S(5),S(18),sh+S(10))){activeDrag={type:'vol',pod:this,y:sy,h:sh,startMouse:my,startVal:this.values.vol};this.dragVol(my);return true}
    if(dist(mx,my,mixX+S(35),sy+S(19))<S(18)){activeDrag={type:'pan',pod:this,startMouse:my,startVal:this.values.pan};return true}
    let my0=this.y+this.h-S(56),mx0=this.x+S(9);if(hit(mx,my,mx0+S(29),my0,S(56),S(18))){this.randomMode=nextIn(RANDOM_MODES,this.randomMode);return true}
    if(hit(mx,my,mx0+S(126),my0,S(51),S(18))){this.engine=nextIn(ENGINES,this.engine);return true}
    if(hit(mx,my,mx0+S(194),my0,S(28),S(18))){this.quality=nextIn(QUALITY,this.quality);return true}
    let dx=mx0+S(228);if(hit(mx,my,dx+S(36),my0,S(50),S(18))){this.detect=nextIn(DETECT,this.detect);return true}
    let by=this.y+this.h-S(26),bx=this.x+S(9);if(hit(mx,my,bx,by,S(27),S(16))){this.loop=!this.loop;return true}
    if(hit(mx,my,bx+S(30),by,S(24),S(16))){this.rec=!this.rec;return true}
    if(hit(mx,my,bx+S(57),by,S(28),S(16))){this.sync=!this.sync;return true}
    if(hit(mx,my,bx+S(127),by,S(25),S(16))){this.choke=nextIn(CHOKES,this.choke);return true}
    let fxX=this.x+this.w-S(183);if(hit(mx,my,fxX,by,S(29),S(16))){this.filterMode=this.filterMode==='LP'?'HP':'LP';this.filterOn=true;return true}
    if(hit(mx,my,fxX+S(32),by,S(31),S(16))){this.satOn=!this.satOn;return true}
    if(hit(mx,my,fxX+S(66),by,S(31),S(16))){this.compOn=!this.compOn;return true}
    if(hit(mx,my,fxX+S(100),by,S(24),S(16))){this.eqOn=!this.eqOn;return true}
    if(hit(mx,my,fxX+S(127),by,S(48),S(16))){this.fxOpen=!this.fxOpen;return true}
    return false;
  }
  dragSlider(mx){let d=activeDrag;if(!d||d.pod!==this)return;let precision=keyIsDown(SHIFT);this.values[d.key]=precision?constrain(d.startVal+(mx-d.startMouse)/d.w*.15,0,1):constrain((mx-d.x)/d.w,0,1)}
  dragVol(my){let d=activeDrag;if(!d||d.pod!==this)return;let precision=keyIsDown(SHIFT);this.values.vol=precision?constrain(d.startVal+(d.startMouse-my)/d.h*.15,0,1):constrain(1-(my-d.y)/d.h,0,1)}
  drag(mx,my){
    let d=activeDrag;if(!d||d.pod!==this)return;
    if(d.type==='slider')this.dragSlider(mx);
    if(d.type==='vol')this.dragVol(my);
    if(d.type==='pan'){let precision=keyIsDown(SHIFT),sens=precision?.002:.01;this.values.pan=constrain(d.startVal+(d.startMouse-my)*sens,-1,1)}
    if(d.type==='loopStart'){let r=this.waveRect();this.loopStart=constrain((mx-r.x)/r.w,0,this.loopEnd-.01);this.playhead=max(this.playhead,this.loopStart)}
    if(d.type==='loopEnd'){let r=this.waveRect();this.loopEnd=constrain((mx-r.x)/r.w,this.loopStart+.01,1);this.playhead=min(this.playhead,this.loopEnd)}
  }
  panic(){this.loop=true;this.filterOn=this.satOn=this.compOn=this.eqOn=false;this.values.filter=.5;this.values.sat=0;this.values.comp=0;this.values.eqLow=this.values.eqMid=this.values.eqHigh=.5;this.playhead=constrain(ceil(this.playhead*16)/16,this.loopStart,this.loopEnd)}
  zoomWave(delta){this.zoom=constrain(this.zoom*(delta<0?1.13:.885),.5,12)}
}

class BPMWindow{
  constructor(){this.x=width-S(315);this.y=S(42);this.w=S(250);this.h=S(156);this.bpm='120';this.play=true;this.rec=false;this.external=false;this.timesig='4/4';this.editing=false;this.dragging=false;this.resizing=false}
  draw(){
    this.w=max(S(190),this.w);this.h=max(S(142),this.h);fill('#272828');stroke('#4a4c4b');rect(this.x,this.y,this.w,this.h,S(2));
    fill(C.title);noStroke();rect(this.x,this.y,this.w,S(27),S(2),S(2),0,0);fill(C.text);textSize(S(9));textAlign(LEFT,CENTER);text('flöde~ bpm',this.x+S(10),this.y+S(13.5));
    fill(C.text3);textAlign(RIGHT,CENTER);text(this.external?'EXT MIDI':'INTERNAL',this.x+this.w-S(10),this.y+S(13.5));
    let nx=this.x+S(13),ny=this.y+S(38),nw=this.w-S(26),nh=S(46);fill(C.inset);stroke('#0c0d0d');rect(nx,ny,nw,nh,S(1));
    fill(C.amber2);noStroke();textAlign(CENTER,CENTER);textSize(constrain(this.w*.125,S(23),S(38)));text(this.editing&&this.bpm===''?'|':this.bpm,nx+nw/2,ny+nh/2+S(1));
    fill(C.text3);textSize(S(6.8));textAlign(LEFT,CENTER);text('TYPE BPM  1 → ∞',nx,ny+nh+S(12));cycleBox(nx+S(104),ny+nh+S(5),S(42),S(15),this.timesig);miniButton(nx+S(151),ny+nh+S(5),S(54),S(15),'MIDI CLOCK',this.external,C.blue);
    let by=this.y+this.h-S(31);miniButton(this.x+S(13),by,S(47),S(20),'REC',this.rec,C.red);miniButton(this.x+S(64),by,S(47),S(20),'PLAY',this.play,C.olive);miniButton(this.x+S(115),by,S(47),S(20),'STOP',!this.play,C.red);
    stroke(C.text3);line(this.x+this.w-S(13),this.y+this.h-S(4),this.x+this.w-S(4),this.y+this.h-S(13));line(this.x+this.w-S(8),this.y+this.h-S(4),this.x+this.w-S(4),this.y+this.h-S(8));textAlign(LEFT,BASELINE);
  }
  press(mx,my){
    if(dist(mx,my,this.x+this.w,this.y+this.h)<S(20)){this.resizing=true;return true}
    if(hit(mx,my,this.x,this.y,this.w,S(27))){this.dragging=true;this.dx=mx-this.x;this.dy=my-this.y;return true}
    let nx=this.x+S(13),ny=this.y+S(38),nw=this.w-S(26),nh=S(46);if(hit(mx,my,nx,ny,nw,nh)){this.editing=true;this.bpm='';return true}
    if(hit(mx,my,nx+S(104),ny+nh+S(5),S(42),S(15))){this.timesig=nextIn(TIMESIGS,this.timesig);return true}
    if(hit(mx,my,nx+S(151),ny+nh+S(5),S(54),S(15))){this.external=!this.external;return true}
    let by=this.y+this.h-S(31);if(hit(mx,my,this.x+S(13),by,S(47),S(20))){this.rec=!this.rec;return true}
    if(hit(mx,my,this.x+S(64),by,S(47),S(20))){this.play=true;return true}
    if(hit(mx,my,this.x+S(115),by,S(47),S(20))){this.play=false;return true}return false;
  }
  drag(mx,my){if(this.dragging){this.x=mx-this.dx;this.y=my-this.dy}if(this.resizing){this.w=max(S(190),mx-this.x);this.h=max(S(142),my-this.y)}}
  release(){this.dragging=false;this.resizing=false}
}

class MasterFXChain{
  constructor(){this.modules=[
    {name:'REVERB',on:true,a:'mix',av:.24,b:'size',bv:.61},{name:'ECHO',on:false,a:'mix',av:.18,b:'sync',bv:.5},
    {name:'DELAY',on:true,a:'mix',av:.22,b:'1/8',bv:.5},{name:'DRIVE',on:false,a:'mix',av:.12,b:'amt',bv:.25},{name:'LIMITER',on:true,a:'ceil',av:.75,b:'rel',bv:.35}
  ];this.dragIndex=-1;this.dragX=0;this.dragging=false}
  layout(){this.x=S(36);this.h=S(105);this.y=height-S(22)-this.h;this.w=width-S(72)}
  draw(){
    fill('#242525');stroke(C.line);rect(this.x,this.y,this.w,this.h,S(2));fill(C.text3);noStroke();textSize(S(7.3));text('MASTER FX CHAIN',this.x+S(10),this.y+S(14));
    textAlign(RIGHT,BASELINE);text('click = bypass   •   drag = reorder',this.x+this.w-S(10),this.y+S(14));textAlign(LEFT,BASELINE);
    let sx=this.x+S(12),yy=this.y+S(24),gap=S(7),transportW=S(175),avail=this.w-S(24)-transportW,mw=(avail-gap*4)/5;
    for(let i=0;i<this.modules.length;i++){
      let mx=sx+i*(mw+gap);
      this.module(this.modules[i],mx,yy,mw,S(66),i===this.dragIndex&&this.dragging);
      if(i<this.modules.length-1){fill(C.text3);noStroke();textSize(S(9));textAlign(CENTER,CENTER);text('›',mx+mw+gap/2,yy+S(33))}
    }
    textAlign(LEFT,BASELINE);
    let tx=this.x+this.w-transportW+S(10);drawVerticalMeter(tx,this.y+S(30),S(10),S(54),.67);fill(C.text3);noStroke();textSize(S(6.5));text('MASTER',tx+S(18),this.y+S(37));text('OUT',tx+S(18),this.y+S(48));drawKnob(tx+S(70),this.y+S(53),S(23),.72,0,1);textAlign(CENTER,TOP);text('VOL',tx+S(70),this.y+S(69));textAlign(LEFT,BASELINE)
  }
  module(m,x,y,w,h,dragging=false){fill(dragging?'#393832':(m.on?'#30302d':'#292a2a'));stroke(C.line);rect(x,y,w,h,S(1));noStroke();fill(m.on?C.text:C.text3);textSize(S(7.5));text(m.name,x+S(7),y+S(13));fill(m.on?C.amber:C.text3);circle(x+w-S(9),y+S(10),S(5));drawKnob(x+w*.33,y+S(37),S(18),m.av,0,1);drawKnob(x+w*.68,y+S(37),S(18),m.bv,0,1);fill(C.text3);noStroke();textSize(S(6.2));textAlign(CENTER,TOP);text(m.a,x+w*.33,y+S(49));text(m.b,x+w*.68,y+S(49));textAlign(LEFT,BASELINE)}
  press(mx,my){
    let sx=this.x+S(12),yy=this.y+S(24),gap=S(7),transportW=S(175),avail=this.w-S(24)-transportW,mw=(avail-gap*4)/5;
    for(let i=0;i<this.modules.length;i++){
      let x=sx+i*(mw+gap);
      if(hit(mx,my,x,yy,mw,S(66))){
        this.dragIndex=i;this.dragX=mx;this.dragging=true;
        activeDrag={type:'masterFX',master:this,startX:mx,startIndex:i,mw:mw,gap:gap,sx:sx};
        return true;
      }
    }
    return false
  }
  drag(mx,my){
    if(!this.dragging||this.dragIndex<0)return;
    let d=activeDrag;if(!d||d.type!=='masterFX')return;
    let center=(mx-d.sx)/(d.mw+d.gap);
    let target=constrain(round(center-.5),0,this.modules.length-1);
    if(target!==this.dragIndex){
      let item=this.modules.splice(this.dragIndex,1)[0];
      this.modules.splice(target,0,item);
      this.dragIndex=target;
    }
  }
  release(mx,my){
    if(!this.dragging)return;
    // A near-stationary click toggles bypass; a real drag only reorders.
    let d=activeDrag;
    if(d&&d.type==='masterFX'&&abs(mx-d.startX)<S(5)&&this.dragIndex>=0){
      this.modules[this.dragIndex].on=!this.modules[this.dragIndex].on;
    }
    this.dragging=false;this.dragIndex=-1;
  }
}

function mousePressed(){if(bpmWin.press(mouseX,mouseY))return;for(const p of pods)if(p.press(mouseX,mouseY))return;masterFX.press(mouseX,mouseY)}
function mouseDragged(){bpmWin.drag(mouseX,mouseY);if(activeDrag?.pod)activeDrag.pod.drag(mouseX,mouseY);if(activeDrag?.type==='masterFX')masterFX.drag(mouseX,mouseY)}
function mouseReleased(){bpmWin.release();masterFX.release(mouseX,mouseY);activeDrag=null}
function mouseWheel(e){if(keyIsDown(CONTROL)){for(const p of pods){let r=p.waveRect();if(hit(mouseX,mouseY,r.x,r.y,r.w,r.h)){p.zoomWave(e.delta);return false}}}}
function keyTyped(){if(bpmWin.editing&&key>='0'&&key<='9'){bpmWin.bpm+=key;return false}}
function keyPressed(){if(bpmWin.editing){if(keyCode===BACKSPACE){bpmWin.bpm=bpmWin.bpm.slice(0,-1);return false}if(keyCode===ENTER){let n=parseInt(bpmWin.bpm,10);bpmWin.bpm=String(Number.isFinite(n)?max(1,n):120);bpmWin.editing=false;return false}if(keyCode===ESCAPE){if(bpmWin.bpm==='')bpmWin.bpm='120';bpmWin.editing=false;return false}}}
function windowResized(){resizeCanvas(windowWidth,windowHeight)}

function handleDroppedFile(file){let target=null;for(const p of pods){let r=p.waveRect();if(hit(mouseX,mouseY,r.x,r.y,r.w,r.h)){target=p;break}}if(!target)return;if(file.type!=='audio'){target.sampleName='not_audio';return}target.sampleName=file.name||'audio';decodeWave(file.file,target)}
function decodeWave(blob,pod){let reader=new FileReader();reader.onload=async e=>{try{let ctx=new(window.AudioContext||window.webkitAudioContext)(),buf=await ctx.decodeAudioData(e.target.result.slice(0)),data=buf.getChannelData(0),bins=320,step=max(1,floor(data.length/bins)),arr=[];for(let i=0;i<bins;i++){let peak=0,start=i*step,end=min(data.length,start+step);for(let j=start;j<end;j++)peak=max(peak,abs(data[j]));arr.push(constrain(peak,.01,1))}pod.wave=arr;pod.actualWave=true;ctx.close()}catch(err){console.warn(err)}};reader.readAsArrayBuffer(blob)}

function drawSlider(x,y,w,v,accent=false){stroke(C.line2);strokeWeight(S(1.4));line(x,y+S(3),x+w,y+S(3));stroke(accent?C.amber2:C.amber);line(x,y+S(3),x+w*v,y+S(3));noStroke();fill(accent?C.amber2:C.amber);rect(x+w*v-S(2),y-S(1),S(4),S(8))}
function drawKnob(x,y,d,value,min,max){let n=constrain(map(value,min,max,0,1),0,1);noFill();stroke(C.line2);strokeWeight(S(2.5));arc(x,y,d,d,radians(135),radians(405));stroke(C.amber);strokeWeight(S(1.8));arc(x,y,d,d,radians(135),lerp(radians(135),radians(405),n));let a=lerp(radians(135),radians(405),n);stroke(C.text2);strokeWeight(S(1));line(x,y,x+cos(a)*d*.26,y+sin(a)*d*.26)}
function drawVerticalMeter(x,y,w,h,v){fill(C.inset);noStroke();rect(x,y,w,h);fill(C.olive);rect(x,y+h*(1-v),w,h*v)}
function miniButton(x,y,w,h,label,active,col=C.olive){fill(active?col:'#343535');stroke('#171818');strokeWeight(1);rect(x,y,w,h,S(1));fill(active?'#d4d7d2':C.text3);noStroke();textAlign(CENTER,CENTER);textSize(S(6.6));text(label,x+w/2,y+h/2+S(.2));textAlign(LEFT,BASELINE)}
function cycleBox(x,y,w,h,label){fill('#252626');stroke(C.line);rect(x,y,w,h,S(1));fill(C.text2);noStroke();textAlign(CENTER,CENTER);textSize(S(6.4));let t=String(label);if(t.length>9)t=t.slice(0,9);text(t,x+w/2,y+h/2);textAlign(LEFT,BASELINE)}
function tinyLabel(x,y,label){fill(C.text3);noStroke();textSize(S(6));textAlign(LEFT,CENTER);text(label,x,y);textAlign(LEFT,BASELINE)}
function drawFooter(){fill(C.text3);noStroke();textSize(S(6.8));textAlign(LEFT,BOTTOM);text('SHIFT + drag = precision   •   CTRL + wheel = waveform zoom   •   drag loop handles   •   click transient markers   •   Simplr-inspired slice view   •   drag master FX to reorder   •   drop audio on waveform',S(38),height-S(5));textAlign(LEFT,BASELINE)}
function hit(mx,my,x,y,w,h){return mx>=x&&mx<=x+w&&my>=y&&my<=y+h}
function nextIn(arr,current){return arr[(arr.indexOf(current)+1)%arr.length]}
function speedLabel(v){let r=.25*Math.pow(16,v);return r.toFixed(r<1?2:1)+'×'}
function pitchLabel(v){let s=Math.round(map(v,0,1,-24,24));return (s>=0?'+':'')+s+' st'}
