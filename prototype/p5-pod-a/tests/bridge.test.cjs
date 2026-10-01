"use strict";
// Run: node prototype/p5-pod-a/tests/bridge.test.cjs
// Tests the adapter plus the real Max scripts, with a p5 method recorder.
function runChecks(files) {
    const reports = [];
    function check(value, message) { if (!value) throw new Error(message); }
    function close(value, expected) { check(Math.abs(value-expected)<1e-8, value+" != "+expected); }
    function test(name, callback) { callback(); reports.push(name); }
    const module = {exports:{}};
    new Function("module", files.adapter)(module);
    const bridge = module.exports;
    function host(options) {
        let depth=0, invalidations=0;
        const commands=[], events=[], errors=[];
        const p={RGB:"rgb",CORNER:"corner",LEFT:"left",BASELINE:"baseline",CLOSE:"close"};
        ["colorMode","rectMode","fill","stroke","noStroke","noFill","strokeWeight",
         "rect","line","beginShape","vertex","endShape","textFont","textSize","textAlign",
         "text","background","translate"].forEach(function (method) {
            p[method]=function () {
                const args=Array.from(arguments);
                args.forEach(arg=>{if(typeof arg==="number")check(Number.isFinite(arg),"Non-finite "+method);});
                commands.push([method].concat(args));
            };
        });
        p.push=()=>{depth++;};
        p.pop=()=>{depth--;check(depth>=0,"p5 stack underflow");};
        const view=bridge.create(p,{component:files.component,controller:files.controller},{
            invalidate:()=>{invalidations++;},
            onEvent:message=>events.push(message),
            onError:message=>errors.push(message),
            ...(options||{})
        });
        return {view,p,commands,events,errors,depth:()=>depth,invalidations:()=>invalidations};
    }
    function audio() {
        const channels=[new Float32Array([-.3,.2,.7,-.5]),new Float32Array([.4,-.6,.1,.9])];
        return {length:4,numberOfChannels:2,duration:1,getChannelData:index=>channels[index]};
    }
    test("Original Max renderer draws all seven p5 components with balanced state",()=>{
        const h=host();h.view.draw();
        check(h.depth()===0,"Unbalanced p5 state");
        check(h.commands.filter(c=>c[0]==="translate").length===7,"Wrong component count");
        check(h.commands.some(c=>c[0]==="text"&&c[1]==="flöde~"),"Header not drawn");
        check(h.commands.some(c=>c[0]==="text"&&c[1]==="1.00 ×"),"Engineering display lost");
        check(h.commands.some(c=>c[0]==="vertex"),"Loop triangles not drawn");
        check(h.errors.length===0,"Renderer posted an error");
    });
    test("p5 slider routing emits the Max protocol and reflects its authoritative echo",()=>{
        const h=host(),x=26.96,y=436.32,w=566.08;
        h.view.pointerDown(x+w*.5,y,false);
        h.view.pointerMove(x+w*.7,y,true,false);
        h.view.pointerUp(x+w*.8,y,false);
        close(h.view.getVisualState("jung").value,.8);
        check(h.view.getVisualState("jung").display==="80 %","Unit text diverged");
        const names=h.events.map(e=>e[2]);
        check(names[0]==="jung_begin"&&names[names.length-1]==="jung_commit","Wrong gesture phases");
        check(h.events.every(e=>e[0]==="pod"&&e[1]==="A"),"Missing pod identity");
        close(h.events[h.events.length-1][3],.8);
    });
    test("Shift precision and release outside the canvas keep values bounded",()=>{
        const h=host(),x=26.96,y=436.32,w=566.08;
        h.view.pointerDown(x+w*.9,y,true);
        h.view.pointerMove(x+w,y,true,true);
        close(h.view.getVisualState("jung").value,.44);
        h.view.pointerUp(3000,y,false);
        close(h.view.getVisualState("jung").value,1);
        check(h.events[h.events.length-1][2]==="jung_commit","Outside release did not commit");
    });
    test("Pointer routing preserves ordered loop endpoints and minimum span",()=>{
        const h=host(),x=50.48,w=859.04,y=130;
        h.view.pointerDown(x+w*.12,y,true);
        h.view.pointerMove(x+w*1.5,y,true,true);
        h.view.pointerUp(x+w*1.5,y,true);
        const loop=h.view.getVisualState("waveform").loop;
        close(loop[0],.76);close(loop[1],.78);
        const event=h.events[h.events.length-1];
        check(event[2]==="loop_commit","Wrong loop phase");
        close(event[3],.76);close(event[4],.78);
    });
    test("Disabled header actions emit nothing while M/S and modes are confirmed",()=>{
        const h=host();
        h.view.pointerDown(620,40,false);h.view.pointerUp(620,40,false);
        check(h.events.length===0,"Disabled INPUT emitted");
        h.view.pointerDown(480,40,false);h.view.pointerUp(480,40,false);
        check(h.view.getVisualState("header").mute===1,"Mute did not confirm");
        check(h.events[0].join(" ")==="pod A mute_request 1","Wrong mute protocol");
        h.view.pointerDown(200,370,false);h.view.pointerUp(200,370,false);
        check(h.view.getVisualState("modes").looper_mode==="once","Mode did not confirm");
        h.view.enable("jung",0);
        const count=h.events.length;h.view.pointerDown(300,440,false);h.view.pointerUp(400,440,false);
        check(h.events.length===count,"Disabled slider emitted");
    });
    test("Native stepper mapping stays identical in p5",()=>{
        const h=host();h.view.pointerDown(900,500,false);h.view.pointerUp(900,500,false);
        const state=h.view.getVisualState("speed");
        close(state.value,.21);check(state.display==="1.04 ×","Speed mapping drifted");
        const e=h.events[h.events.length-1];
        check(e[2]==="stepper_commit"&&e[3]==="speed","Stepper identity lost");close(e[4],.21);
    });
    test("Decoded browser audio uses the Max controller min/max peak cache",()=>{
        const h=host();h.view.loadDecodedAudio(audio(),"Break.wav");
        const state=h.view.getVisualState("waveform"),expected=[-.3,.4,-.6,.2,.1,.7,-.5,.9];
        state.peaks.forEach((value,i)=>check(Math.abs(value-expected[i])<1e-6,"Wrong multichannel peak"));
        check(state.peaks.length===expected.length,"Wrong peak count");
        check(h.view.getVisualState("header").filename==="Break.wav","Filename lost");
        h.view.draw();check(h.errors.length===0,"Peak rendering error");
    });
    test("Two browser instances isolate dictionaries, pod identities and audio",()=>{
        const a=host(),b=host({pod:"B"});
        a.view.loadDecodedAudio(audio(),"A.wav");
        check(b.view.getVisualState("waveform").peaks.length===0,"Peak cache leaked");
        b.view.pointerDown(300,440,false);b.view.pointerUp(400,440,false);
        check(b.events.every(e=>e[1]==="B"),"POD B identity lost");
        close(a.view.getVisualState("jung").value,.43);
    });
    test("Invalid audio cannot replace a valid cache; reset clears data and UI state",()=>{
        const h=host();h.view.loadDecodedAudio(audio(),"Good.wav");
        let failed=false;try{h.view.loadDecodedAudio({length:0},"Bad.wav");}catch(e){failed=true;}
        check(failed,"Invalid audio accepted");
        check(h.view.getVisualState("header").filename==="Good.wav","Invalid audio changed filename");
        h.view.reset();
        check(h.view.getVisualState("waveform").peaks.length===0,"Reset retained waveform");
        check(h.view.getVisualState("header").filename==="No audio loaded","Reset retained filename");
        close(h.view.getVisualState("jung").value,.43);
    });
    test("Double-click reset requests and cancellation complete the same Max gesture flow",()=>{
        const h=host();
        h.view.doubleClick(400,180);
        const loop=h.view.getVisualState("waveform").loop;close(loop[0],0);close(loop[1],1);
        check(h.events[0][2]==="loop_reset_request","Reset protocol drifted");
        h.view.pointerDown(300,440,false);h.view.pointerCancel();
        check(h.events[h.events.length-1][2]==="jung_commit","Cancelled pointer left an active gesture");
    });
    return reports;
}
if (typeof module !== "undefined") {
    module.exports={runChecks};
    if (require.main===module) {
        const fs=require("node:fs"),path=require("node:path"),root=path.resolve(__dirname,"..");
        const reports=runChecks({
            adapter:fs.readFileSync(path.join(root,"max-p5-adapter.js"),"utf8"),
            component:fs.readFileSync(path.join(root,"../max9-pod-a/code/flode_ui_component.js"),"utf8"),
            controller:fs.readFileSync(path.join(root,"../max9-pod-a/code/flode_ui_demo_controller.js"),"utf8")
        });
        reports.forEach(name=>console.log("PASS "+name));
        console.log(reports.length+" cross-host contract checks passed (p5 calls recorded).");
    }
}
