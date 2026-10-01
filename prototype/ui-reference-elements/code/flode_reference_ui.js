/* flode~ reference UI elements. Isolated design study; no audio/timing engine.
 * CommonJS, browser global FlodeReferenceUI, or directly in Max 9 v8ui.
 * Max: @arguments A <pod|range|fader|knob|meter|glyph|icon|readout> <id>
 */
var autowatch = 1, inlets = 1, outlets = 1;
var FlodeReferenceUI = (function () {
    "use strict";
    const colors = {
        canvas: [0.055,0.067,0.082,1], panel: [0.078,0.090,0.106,1],
        line: [0.19,0.22,0.25,1], text: [0.83,0.87,0.91,1],
        muted: [0.43,0.49,0.55,1], orange: [1,0.588,0.149,1],
        cyan: [0.27,0.79,0.88,1], acid: [0.82,0.91,0.24,1],
        record: [0.92,0.27,0.23,1]
    };
    const kinds = ["pod","range","fader","knob","meter","glyph","icon","readout"];
    const behaviors = ["home","restless","intervention","resolving","return_home"];
    const icons = ["play","stop","record","loop","tempo","pause"];
    function number(v, fallback) {
        if (v === null || v === "" || v === undefined) return fallback;
        const n = Number(v); return Number.isFinite(n) ? n : fallback;
    }
    function clamp(n, lo, hi) { return Math.max(lo,Math.min(hi,n)); }
    function norm(v, fallback) { return clamp(number(v,fallback === undefined ? .5 : fallback),0,1); }
    function col(name, alpha) {
        const c = (colors[name] || colors.text).slice();
        if (alpha !== undefined) c[3] = alpha; return c;
    }
    function scene(kind, options) {
        if (!kinds.includes(kind)) throw Error("Unknown element: "+kind);
        const o = options || {}, w = clamp(number(o.width,320),64,4096),
            h = clamp(number(o.height,100),48,4096), p = Math.min(16,w*.06), commands = [];
        const value = norm(o.value), id = String(o.id || kind);
        function rect(x,y,width,height,c,stroke) {
            commands.push({op:"rect",x,y,w:Math.max(0,width),h:Math.max(0,height),color:c,stroke:stroke||0});
        }
        function line(x1,y1,x2,y2,c,weight) { commands.push({op:"line",x1,y1,x2,y2,color:c,weight:weight||1}); }
        function poly(points,c,filled,closed,weight) {
            commands.push({op:"poly",points,color:c,filled:!!filled,closed:!!closed,weight:weight||1});
        }
        function circle(x,y,r,c,filled,weight) { commands.push({op:"circle",x,y,r,color:c,filled:!!filled,weight:weight||1}); }
        function text(value,x,y,size,c,numeric) {
            commands.push({op:"text",text:String(value),x,y,size:numeric?Math.max(12,size):Math.max(14,size*1.25),color:c||col("text"),font:numeric?"IBM Plex Mono":"Jersey 10"});
        }
        function bracket(x,y,width,height,c) {
            const d = Math.min(8,width*.1,height*.2);
            line(x+d,y,x,y,c);line(x,y,x,y+d,c);
            line(x+width-d,y,x+width,y,c);line(x+width,y,x+width,y+d,c);
            line(x,y+height-d,x,y+height,c);line(x,y+height,x+d,y+height,c);
            line(x+width-d,y+height,x+width,y+height,c);line(x+width,y+height,x+width,y+height-d,c);
        }
        const c = col(o.accent || (kind === "knob" ? "cyan" : "orange"));
        if (!o.transparent) rect(0,0,w,h,col("canvas"));
        if (kind === "pod") {
            const pod = /^[A-F]$/.test(String(o.pod || "A")) ? String(o.pod || "A") : "A";
            const fs = Math.min(28,h*.45);
            bracket(p,h*.16,fs*1.8,h*.64,col("line"));
            text(pod,p+10,h*.65,fs,c);
            text("POD "+pod,p+fs*2.25,h*.42,11,col("muted"));
            const maxChars = Math.max(3,Math.floor((w-p-fs*2.25-p)/8));
            let name = String(o.filename || "NO SAMPLE");
            if(name.length>maxChars)name=name.slice(0,maxChars-1)+"…";
            text(name,p+fs*2.25,h*.73,14,col("text"));
            line(p,h-2,w-p,h-2,col("line"));
        } else if (kind === "range") {
            const x=p,y=16,rw=w-2*p,rh=h-52;
            const start=clamp(norm(o.start,.2),0,.98), end=clamp(norm(o.end,.75),start+.02,1);
            const sx=x+start*rw,ex=x+end*rw,ph=x+norm(o.playhead,.45)*rw;
            rect(x,y,rw,rh,col("panel"));bracket(x,y,rw,rh,col("line"));
            rect(sx,y,ex-sx,rh,col("orange",.055));
            for(let i=1;i<8;i++)line(x+i*rw/8,y,x+i*rw/8,y+rh,col("line",.45));
            line(x,y+rh*.5,x+rw,y+rh*.5,col("line",.45));
            line(sx,y,ex,y,c);
            [sx,ex].forEach(px=>{
                line(px,y,px,y+rh,c,1.5);
                poly([[px-5,y],[px+5,y],[px,y+7]],c,true,true);
                poly([[px-5,y+rh],[px+5,y+rh],[px,y+rh-7]],c,true,true);
            });
            line(ph,y+12,ph,y+rh,col("text"),1.25);
            poly([[ph-4,y+8],[ph+4,y+8],[ph,y+14]],col("text"),true,true);
            text("SELECTION STUDY · NO AUDIO",x+8,y+rh*.72,10,col("muted"));
            text("START "+String(o.start_display||"—"),x,h-12,11,col("text"),true);
            text("END "+String(o.end_display||"—"),x+rw*.66,h-12,11,col("text"),true);
        } else if (kind === "fader") {
            const y=h*.5, rw=w-2*p, x=p, centered=!!o.centered;
            text(String(o.label||id).toUpperCase(),p,h*.22,11,col("muted"));
            if(id!=="jung")text(String(o.display||"—"),w*.64,h*.22,12,col("text"),true);
            line(x,y,x+rw,y,col("line"),2);
            const origin=centered?x+rw*.5:x;
            line(origin,y,x+rw*value,y,c,2);
            if(centered)line(origin,y-5,origin,y+5,col("muted"));
            rect(x+rw*value-3,y-6,6,12,c);
            if(id==="jung") {
                text("STABLE",p,h*.87,10,col("muted"));
                text("RESTLESS",w-p-60,h*.87,10,col("muted"));
            }
        } else if (kind === "knob") {
            const r=Math.min(24,w*.18,h*.24),cx=w*.5,cy=h*.47;
            const start=Math.PI*.75,sweep=Math.PI*1.5;
            text(String(o.label||id).toUpperCase(),p,14,11,col("muted"));
            function arc(to,color) {
                if(to===0)return;
                const pts=[],n=Math.max(1,Math.ceil(48*to));
                for(let i=0;i<=n;i++) {
                    const a=start+sweep*to*i/n;pts.push([cx+Math.cos(a)*r,cy+Math.sin(a)*r]);
                } poly(pts,color,false,false,1.5);
            }
            arc(1,col("line"));arc(value,c);
            const a=start+sweep*value;
            line(cx+Math.cos(a)*r*.35,cy+Math.sin(a)*r*.35,cx+Math.cos(a)*r*.83,cy+Math.sin(a)*r*.83,c,2);
            circle(cx,cy,2,col("muted"),true);
            for(let i=0;i<5;i++) {
                const theta=start+sweep*i/4;
                line(cx+Math.cos(theta)*(r+4),cy+Math.sin(theta)*(r+4),
                    cx+Math.cos(theta)*(r+7),cy+Math.sin(theta)*(r+7),col("line"));
            }
            text(String(o.display||"—"),p,h-10,12,col("text"),true);
        } else if (kind === "meter") {
            text(String(o.label||"LEVEL").toUpperCase(),p,15,11,col("muted"));
            const available=o.available===true,levels=[norm(o.left,0),norm(o.right,0)];
            const x=p+8,y=30,bh=Math.max(10,h-70),count=20,bw=10,gap=2;
            for(let ch=0;ch<2;ch++)for(let i=0;i<count;i++){
                const lit=available && i<count*levels[ch];
                const color=lit?col(i>=18?"record":i>=15?"orange":"cyan"):col("line",.5);
                rect(x+ch*20,y+bh-(i+1)*bh/count,bw,Math.max(1,bh/count-gap),color);
            }
            text("L",x,h-25,10,col("muted"));text("R",x+20,h-25,10,col("muted"));
            text(available?String(o.display||"— dB"):"NO LEVEL DATA",x+48,44,11,col("text"),available);
            if(available && o.clip===true){
                rect(x+48,56,4,4,col("record"));text("CLIP",x+58,62,11,col("record"));
            }
        } else if (kind === "glyph") {
            const behavior=behaviors.includes(o.behavior)?o.behavior:"home";
            const cx=w*.5,cy=h*.45,r=Math.min(32,w*.22,h*.22);
            const tension=norm(o.tension,.6),phase=norm(o.phase,0);
            bracket(cx-r*1.7,cy-r*1.45,r*3.4,r*2.9,col("line"));
            line(cx,cy-r*1.3,cx,cy+r*1.3,col("cyan"),1.25);
            line(cx-r*.3,cy,cx+r*.3,cy,col("cyan"),1.25);
            circle(cx,cy,2.5,col("cyan"),true);
            for(let i=0;i<6;i++) {
                const a=-Math.PI/2+i*Math.PI/3,b=a+Math.PI/3;
                const home=[[Math.cos(a)*r,Math.sin(a)*r],[Math.cos(b)*r,Math.sin(b)*r]];
                let amount=behavior==="restless"?.35*tension:behavior==="intervention"?1:
                    behavior==="resolving"?1-phase:0;
                const sign=i%2?1:-1,shift=amount*r*.30*sign,
                    trim=(behavior==="intervention"||behavior==="resolving")?amount*.18:0;
                const dx=home[1][0]-home[0][0],dy=home[1][1]-home[0][1];
                const pts=[[cx+home[0][0]+dx*trim+shift,cy+home[0][1]+dy*trim],
                    [cx+home[1][0]-dx*trim+shift,cy+home[1][1]-dy*trim]];
                poly(pts,col(amount>0?"orange":"text"),false,false,1.5);
            }
            const names={home:"STABLE / HOME",restless:"RESTLESS",intervention:"INTERVENTION",resolving:"RESOLVING",return_home:"RETURN HOME"};
            text(names[behavior],p,h-10,10,col("text"));
        } else if (kind === "icon") {
            const symbol=icons.includes(o.icon||id)?(o.icon||id):"play";
            const size=Math.min(24,w*.28,h*.30),cx=w*.5,cy=h*.42;
            const color=o.active===true?(symbol==="record"?col("record"):c):col("muted");
            if(o.active===true)bracket(p,5,w-2*p,h-25,col("line"));
            if(symbol==="play")poly([[cx-size*.5,cy-size*.6],[cx+size*.6,cy],[cx-size*.5,cy+size*.6]],color,true,true);
            if(symbol==="stop")rect(cx-size*.48,cy-size*.48,size*.96,size*.96,color);
            if(symbol==="record")circle(cx,cy,size*.52,color,true);
            if(symbol==="pause") {
                rect(cx-size*.45,cy-size*.55,size*.27,size*1.1,color);
                rect(cx+size*.18,cy-size*.55,size*.27,size*1.1,color);
            }
            if(symbol==="loop") {
                poly([[cx-size*.35,cy-size*.5],[cx+size*.55,cy-size*.5],[cx+size*.55,cy+size*.45],
                    [cx-size*.55,cy+size*.45],[cx-size*.55,cy-size*.25]],color,false,false,2);
                poly([[cx-size*.40,cy-size*.5],[cx-size*.08,cy-size*.73],[cx-size*.08,cy-size*.27]],color,true,true);
            }
            if(symbol==="tempo") {
                poly([[cx-size*.5,cy+size*.55],[cx,cy-size*.65],[cx+size*.5,cy+size*.55]],color,false,true,1.5);
                line(cx,cy+size*.2,cx+size*.4,cy-size*.35,color,2);
            }
            text(symbol.toUpperCase(),p,h-8,10,col("text"));
        } else if (kind === "readout") {
            bracket(p,8,w-2*p,h-16,col("line"));
            text(String(o.label||id).toUpperCase(),p+10,25,11,col("muted"));
            text(String(o.display||"—"),p+10,h*.7,Math.min(24,h*.3),c,true);
        }
        if(o.enabled===false)rect(0,0,w,h,col("canvas",.65));
        return {kind,width:w,height:h,commands};
    }
    function renderMgraphics(s,g) {
        g.save();
        for(const c of s.commands){
            g.set_source_rgba(c.color);g.set_line_width(c.weight||c.stroke||1);
            if(c.op==="text"){
                g.select_font_face(c.font);g.set_font_size(c.size);g.move_to(c.x,c.y);g.show_text(c.text);
            } else if(c.op==="line"){
                g.move_to(c.x1,c.y1);g.line_to(c.x2,c.y2);g.stroke();
            } else {
                if(c.op==="rect")g.rectangle(c.x,c.y,c.w,c.h);
                else if(c.op==="circle")g.ellipse(c.x-c.r,c.y-c.r,c.r*2,c.r*2);
                else {
                    g.move_to(c.points[0][0],c.points[0][1]);
                    for(let i=1;i<c.points.length;i++)g.line_to(c.points[i][0],c.points[i][1]);
                    if(c.closed)g.close_path();
                }
                if(c.op==="rect"?!c.stroke:c.filled)g.fill();else g.stroke();
            }
        }g.restore();
    }
    function renderP5(s,p) {
        p.push();p.colorMode(p.RGB,255);p.rectMode(p.CORNER);p.ellipseMode(p.CENTER);
        for(const c of s.commands){
            const filled=c.op==="text"||(c.op==="rect"?!c.stroke:c.filled);
            if(filled){p.noStroke();p.fill.apply(p,c.color.map(v=>v*255));}
            else{p.noFill();p.stroke.apply(p,c.color.map(v=>v*255));p.strokeWeight(c.weight||c.stroke||1);}
            if(c.op==="text"){p.textFont(c.font);p.textSize(c.size);p.textAlign(p.LEFT,p.BASELINE);p.text(c.text,c.x,c.y);}
            else if(c.op==="rect")p.rect(c.x,c.y,c.w,c.h);
            else if(c.op==="circle")p.ellipse(c.x,c.y,c.r*2,c.r*2);
            else if(c.op==="line")p.line(c.x1,c.y1,c.x2,c.y2);
            else{p.beginShape();c.points.forEach(point=>p.vertex.apply(p,point));p.endShape(c.closed?p.CLOSE:undefined);}
        }p.pop();
    }
    function escape(value) {
        return String(value).replace(/&/g,"&amp;").replace(/</g,"&lt;").replace(/>/g,"&gt;")
            .replace(/"/g,"&quot;").replace(/'/g,"&apos;");
    }
    function toSvg(s,title,fontData) {
        const n=v=>String(Math.round(v*1000)/1000);
        fontData=fontData||{};
        const familyData={"Jersey 10":fontData.jersey,"IBM Plex Mono":fontData.mono};
        const usedFonts=new Set(s.commands.filter(c=>c.op==="text").map(c=>c.font));
        const fonts=Array.from(usedFonts).filter(f=>familyData[f]).map(f=>{
            const data=String(familyData[f]).replace(/\s/g,"");
            if(!/^[A-Za-z0-9+/=]+$/.test(data))throw Error("Invalid embedded font data");
            return '@font-face{font-family:"'+f+'";src:url(data:font/ttf;base64,'+data+') format("truetype");font-weight:400;font-style:normal}';
        }).join("");
        const fontStyle=fonts?"<defs><style>"+fonts+"</style></defs>":"";
        const nodes=s.commands.map((c,i)=>{
            const rgb=c.color.slice(0,3).map(v=>Math.round(v*255));
            const color="rgb("+rgb.join(",")+")",filled=c.op==="text"||(c.op==="rect"?!c.stroke:c.filled);
            const style='fill="'+(filled?color:"none")+'" stroke="'+(filled?"none":color)+
                '" opacity="'+n(c.color[3])+'" stroke-width="'+n(c.weight||c.stroke||1)+'"';
            let node;
            if(c.op==="rect")node='<rect x="'+n(c.x)+'" y="'+n(c.y)+'" width="'+n(c.w)+'" height="'+n(c.h)+'" '+style+'/>';
            if(c.op==="circle")node='<circle cx="'+n(c.x)+'" cy="'+n(c.y)+'" r="'+n(c.r)+'" '+style+'/>';
            if(c.op==="line")node='<line x1="'+n(c.x1)+'" y1="'+n(c.y1)+'" x2="'+n(c.x2)+'" y2="'+n(c.y2)+'" '+style+'/>';
            if(c.op==="poly"){
                const tag=c.closed?"polygon":"polyline";
                node='<'+tag+' points="'+c.points.map(pt=>pt.map(n).join(",")).join(" ")+'" '+style+'/>';
            }
            if(c.op==="text")node='<text x="'+n(c.x)+'" y="'+n(c.y)+'" font-family="'+escape(c.font)+
                '" font-size="'+n(c.size)+'" '+style+'>'+escape(c.text)+'</text>';
            return '<g id="element-'+i+'">'+node+'</g>';
        });
        return '<svg xmlns="http://www.w3.org/2000/svg" width="'+s.width+'" height="'+s.height+
            '" viewBox="0 0 '+s.width+' '+s.height+'" role="img"><title>'+escape(title||s.kind)+
            '</title>'+fontStyle+'\n'+nodes.join("\n")+'\n</svg>\n';
    }
    function createControl(kind,options,emit) {
        if(kind!=="fader"&&kind!=="knob")throw Error("Not a continuous control");
        options=options||{};emit=emit||function(){};
        let value=norm(options.value),display=String(options.display||"—"),revision=-1,enabled=true,drag=null;
        function event(phase,n){emit({phase,value:n});}
        return {
            set(property,args){
                if(property==="enabled"){
                    enabled=Number(args[0])===1;if(!enabled)drag=null;return;
                }
                if(property!=="value"&&property!=="display")return;
                const r=args[1]===undefined?revision:number(args[1],NaN);
                if(!Number.isFinite(r)||r<revision)return;
                if(property==="value"){
                    const n=number(args[0],NaN);if(!Number.isFinite(n))return;
                    revision=r;value=norm(n);
                } else {
                    revision=r;display=String(args[0]);
                    if(drag&&args[2]!==undefined&&Math.abs(number(args[2],NaN)-drag.value)<1e-8)drag.display=display;
                }
            },
            begin(x,y){
                if(!enabled)return;drag={value,display,x,y};event("begin",value);
            },
            move(x,y,shift,span){
                if(!enabled||!drag)return;
                const delta=kind==="knob"?drag.y-y:x-drag.x;
                drag.value=norm(drag.value+delta/Math.max(1,span)*(shift?.1:1));
                drag.x=x;drag.y=y;event("change",drag.value);
            },
            end(){if(!drag)return;event("commit",drag.value);drag=null;},
            cancel(){drag=null;},
            reset(){if(enabled)emit({phase:"reset_request"});},
            visual(){return {value:drag?drag.value:value,display:drag?drag.display:display,enabled};}
        };
    }
    function controlSpan(kind,width) {
        return kind==="knob"?150:Math.max(1,width-2*Math.min(16,width*.06));
    }
    return {colors,kinds,behaviors,icons,scene,renderMgraphics,renderP5,toSvg,createControl,controlSpan};
})();
if(typeof module==="object"&&module.exports)module.exports=FlodeReferenceUI;

// Max host functions stay at script scope so v8ui can dispatch them.
var _flodeHost = null;
if(typeof mgraphics!=="undefined"&&typeof jsarguments!=="undefined"){
    mgraphics.init();mgraphics.relative_coords=0;mgraphics.autofill=0;
    var _flodePod=String(jsarguments[1]||"A"),_flodeKind=String(jsarguments[2]||"fader"),
        _flodeId=String(jsarguments[3]||(_flodeKind==="fader"?"jung":_flodeKind));
    _flodeHost={options:{pod:_flodePod,id:_flodeId,icon:_flodeId},control:null};
    if(_flodeKind==="fader"||_flodeKind==="knob")
        _flodeHost.control=FlodeReferenceUI.createControl(_flodeKind,{},function(e){
            outlet(0,["pod",_flodePod,"control_"+e.phase,_flodeId].concat(e.value===undefined?[]:[e.value]));
        });
}
function _flodeSize(){
    return {width:Math.max(64,box.rect[2]-box.rect[0]),height:Math.max(48,box.rect[3]-box.rect[1])};
}
function paint(){
    if(!_flodeHost)return;
    const o=Object.assign({},_flodeHost.options,_flodeSize(),_flodeHost.control?_flodeHost.control.visual():{});
    FlodeReferenceUI.renderMgraphics(FlodeReferenceUI.scene(_flodeKind,o),mgraphics);
}
function set(property){
    if(!_flodeHost)return;
    const a=Array.from(arguments).slice(1);
    if(_flodeHost.control&&["value_norm","display"].includes(property))
        _flodeHost.control.set(property==="value_norm"?"value":"display",a);
    else if(property==="loop"){
        if(a.length>=2&&Number.isFinite(Number(a[0]))&&Number.isFinite(Number(a[1])))
            Object.assign(_flodeHost.options,{start:Number(a[0]),end:Number(a[1])});
    } else if(property==="levels"){
        if(a.length>=2&&Number.isFinite(Number(a[0]))&&Number.isFinite(Number(a[1])))
            Object.assign(_flodeHost.options,{left:Number(a[0]),right:Number(a[1]),available:true});
    } else if(["filename","label","start_display","end_display","display"].includes(property))
        _flodeHost.options[property]=property==="display"?String(a[0]):a.map(String).join(" ");
    else if(property==="behavior_state")_flodeHost.options.behavior=String(a[0]);
    else if(["playhead","tension","phase"].includes(property)&&Number.isFinite(Number(a[0])))
        _flodeHost.options[property]=Number(a[0]);
    else if(["active","clip","available"].includes(property))_flodeHost.options[property]=Number(a[0])===1;
    mgraphics.redraw();
}
function enable(value){
    if(!_flodeHost)return;
    _flodeHost.options.enabled=Number(value)===1;
    if(_flodeHost.control)_flodeHost.control.set("enabled",[value]);
    mgraphics.redraw();
}
function onclick(x,y,but){
    if(!_flodeHost||!but||_flodeHost.options.enabled===false)return;
    if(_flodeHost.control)_flodeHost.control.begin(x,y);
    else if(_flodeKind==="icon")outlet(0,["pod",_flodePod,"action_request",_flodeId]);
    mgraphics.redraw();
}
function ondrag(x,y,but,cmd,shift){
    if(!_flodeHost||!_flodeHost.control)return;
    if(!but)_flodeHost.control.end();
    else _flodeHost.control.move(x,y,!!shift,FlodeReferenceUI.controlSpan(_flodeKind,_flodeSize().width));
    mgraphics.redraw();
}
function onrelease(){if(_flodeHost&&_flodeHost.control)_flodeHost.control.end();if(_flodeHost)mgraphics.redraw();}
function ondblclick(){if(_flodeHost&&_flodeHost.control)_flodeHost.control.reset();}
function onresize(){if(_flodeHost&&_flodeHost.control)_flodeHost.control.cancel();if(_flodeHost)mgraphics.redraw();}
