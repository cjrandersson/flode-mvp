Promise.all([document.fonts.load('16px "Jersey 10"'),document.fonts.load('12px "IBM Plex Mono"')]).then(function(){
/* Reference element gallery. Drawing and continuous gestures share the Max source. */
"use strict";
new p5(function(p){
    const UI=FlodeReferenceUI,events=document.getElementById("events");
    const specs=[{"id":"header","kind":"pod","x":20,"y":20,"width":920,"height":64,"options":{"filename":"NO SAMPLE"}},{"id":"waveform","kind":"range","x":20,"y":98,"width":920,"height":210,"options":{"start":0.12,"end":0.78,"playhead":0.32,"start_display":"12.0 %","end_display":"78.0 %"}},{"id":"jung","kind":"fader","x":20,"y":332,"width":440,"height":84,"options":{"value":0.3}},{"id":"pan","kind":"knob","x":480,"y":328,"width":140,"height":124,"options":{"value":0.5,"display":"C"}},{"id":"speed","kind":"readout","x":638,"y":328,"width":302,"height":104,"options":{"label":"SPEED","display":"1.00 ×"}},{"id":"meter","kind":"meter","x":20,"y":470,"width":280,"height":156,"options":{"available":false}},{"id":"glyph","kind":"glyph","x":324,"y":450,"width":220,"height":176,"options":{"behavior":"home"}},{"id":"play","kind":"icon","x":20,"y":654,"width":112,"height":84,"options":{"icon":"play","active":false}},{"id":"stop","kind":"icon","x":148,"y":654,"width":112,"height":84,"options":{"icon":"stop","active":false}},{"id":"record","kind":"icon","x":276,"y":654,"width":112,"height":84,"options":{"icon":"record","active":false}},{"id":"loop","kind":"icon","x":404,"y":654,"width":112,"height":84,"options":{"icon":"loop","active":false}},{"id":"tempo","kind":"icon","x":532,"y":654,"width":112,"height":84,"options":{"icon":"tempo","active":false}},{"id":"pause","kind":"icon","x":660,"y":654,"width":112,"height":84,"options":{"icon":"pause","active":false}}];
    let active=null,revision=0,canvas;
    function invalidate(){p.redraw();}
    function log(value){events.textContent=value;}
    function display(id,n){return id==="pan"?(Math.abs(n-.5)<.0025?"C":(n<.5?"L ":"R ")+Math.round(Math.abs(n*2-1)*100)+" %"):"";}
    const controls=new Map();
    for(const s of specs)if(s.kind==="fader"||s.kind==="knob"){
        let control;
        control=UI.createControl(s.kind,s.options,function(e){
            log("POD A · "+s.id.toUpperCase()+" · "+e.phase+(e.value===undefined?"":" · "+e.value.toFixed(3)));
            if(e.phase==="begin")return;
            const value=e.phase==="reset_request"?(s.id==="pan"?.5:.3):e.value;
            revision++;control.set("value",[value,revision]);
            control.set("display",[display(s.id,value),revision,value]);
            const input=document.getElementById(s.id+"-value");if(input)input.value=value;
            invalidate();
        });
        controls.set(s.id,control);
    }
    function render(){
        p.background(14,17,21);
        for(const s of specs){
            p.push();p.translate(s.x,s.y);
            UI.renderP5(UI.scene(s.kind,Object.assign({},s.options,{id:s.id,pod:"A",width:s.width,height:s.height},
                controls.has(s.id)?controls.get(s.id).visual():{})),p);p.pop();
        }
    }
    function point(event){
        const r=canvas.elt.getBoundingClientRect();
        return{x:(event.clientX-r.left)*960/r.width,y:(event.clientY-r.top)*780/r.height};
    }
    function target(pt){return specs.find(s=>pt.x>=s.x&&pt.x<=s.x+s.width&&pt.y>=s.y&&pt.y<=s.y+s.height);}
    function finish(event,cancel){
        if(!active||event&&active.pointer!==event.pointerId)return;
        const drag=active,control=controls.get(drag.spec.id);
        if(!cancel&&event){const pt=point(event);control.move(pt.x,pt.y,event.shiftKey,UI.controlSpan(drag.spec.kind,drag.spec.width));}
        control.end();active=null;
        if(canvas.elt.hasPointerCapture(drag.pointer))canvas.elt.releasePointerCapture(drag.pointer);
        invalidate();
    }
    p.setup=function(){
        canvas=p.createCanvas(960,780);canvas.parent("canvas");
        canvas.elt.style.touchAction="none";canvas.elt.setAttribute("role","img");
        canvas.elt.setAttribute("aria-label","POD A reference elements. Empty selection diagram, JUNG fader, pan knob, speed readout, meter, JUNG state glyph and six named symbols. Use the keyboard controls below for JUNG and pan.");
        p.noLoop();
        canvas.elt.addEventListener("pointerdown",e=>{
            if(e.button!==0||active)return;
            const pt=point(e),s=target(pt);if(!s)return;
            if(controls.has(s.id)){
                active={spec:s,pointer:e.pointerId};canvas.elt.setPointerCapture(e.pointerId);
                controls.get(s.id).begin(pt.x,pt.y);e.preventDefault();invalidate();
            }else if(s.kind==="icon")log("POD A · "+s.id.toUpperCase()+" · request");
        });
        canvas.elt.addEventListener("pointermove",e=>{
            if(!active||active.pointer!==e.pointerId)return;
            const pt=point(e),s=active.spec;controls.get(s.id).move(pt.x,pt.y,e.shiftKey,UI.controlSpan(s.kind,s.width));
            invalidate();
        });
        canvas.elt.addEventListener("pointerup",e=>finish(e,false));
        canvas.elt.addEventListener("pointercancel",e=>finish(e,true));
        canvas.elt.addEventListener("lostpointercapture",e=>finish(e,true));
        window.addEventListener("blur",()=>finish(null,true));
        canvas.elt.addEventListener("dblclick",e=>{
            const s=target(point(e));if(s&&controls.has(s.id))controls.get(s.id).reset();
        });
        for(const id of ["jung","pan"]){
            document.getElementById(id+"-value").addEventListener("input",e=>{
                if(active)finish(null,true);
                const n=Number(e.target.value),c=controls.get(id);
                revision++;c.set("value",[n,revision]);c.set("display",[display(id,n),revision,n]);
                log("POD A · "+id.toUpperCase()+" · "+n.toFixed(3));invalidate();
            });
        }
        document.querySelectorAll("[data-behavior]").forEach(button=>button.addEventListener("click",()=>{
            specs.find(s=>s.id==="glyph").options.behavior=button.dataset.behavior;
            document.querySelectorAll("[data-behavior]").forEach(b=>b.setAttribute("aria-pressed",String(b===button)));
            invalidate();
        }));
        document.getElementById("example-levels").addEventListener("change",e=>{
            Object.assign(specs.find(s=>s.id==="meter").options,{available:e.target.checked,left:.68,right:.57,display:"EXAMPLE −12 dB"});
            invalidate();
        });
        document.querySelectorAll("[data-symbol]").forEach(button=>button.addEventListener("click",()=>{
            log("POD A · "+button.dataset.symbol.toUpperCase()+" · request");
        }));
    };
    p.draw=render;
},"canvas");

}).catch(function(error){document.getElementById("events").textContent="Could not load UI fonts: "+error.message;});
