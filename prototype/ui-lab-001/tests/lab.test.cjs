"use strict";
// UI LAB 001 checks: same source scripts on the Max and p5 paths.
// Run: node prototype/ui-lab-001/tests/lab.test.cjs
function runChecks(files) {
    const results=[];
    function check(v,message){if(!v)throw Error(message);}
    function close(a,b){check(Math.abs(a-b)<1e-8,a+" != "+b);}
    function test(name,fn){fn();results.push(name);}
    const module={exports:{}};new Function("module",files.adapter)(module);
    function host(extra) {
        const commands=[],events=[],errors=[];let depth=0;
        const p={RGB:"rgb",CORNER:"corner",LEFT:"left",BASELINE:"baseline",CLOSE:"close"};
        for(const method of ["colorMode","rectMode","fill","stroke","noStroke","noFill","strokeWeight","rect","line",
            "beginShape","vertex","endShape","textFont","textSize","textAlign","text","background","translate"])
            p[method]=function(){
                const args=Array.from(arguments);
                for(const value of args)if(typeof value==="number")check(Number.isFinite(value),"Non-finite "+method);
                commands.push([method,...args]);
            };
        p.push=()=>depth++;
        p.pop=()=>{depth--;check(depth>=0,"Drawing stack underflow");};
        const view=module.exports.create(p,{component:files.component,controller:files.controller},
            {components:files.config.components,width:files.config.width,height:files.config.height,
                onEvent:e=>events.push(e),onError:e=>errors.push(e),...extra});
        return{view,commands,events,errors,depth:()=>depth};
    }
    function drag(h,id,delta,shift){
        const spec=files.config.components.find(row=>row[0]===id),[x,y,w,height]=spec.slice(3);
        const pad=Math.min(16,w*.025),span=w-2*pad,sx=x+pad+span*.1,sy=y+height*.52;
        h.view.pointerDown(sx,sy,shift);h.view.pointerMove(sx+span*delta,sy,true,shift);
        h.view.pointerUp(sx+span*delta,sy,shift);
    }
    test("Nine components draw a waveform-first layout with only the seven musical controls",()=>{
        const h=host();h.view.draw();
        check(h.depth()===0,"Unbalanced draw state");
        check(h.commands.filter(c=>c[0]==="translate").length===9,"Wrong component count");
        const labels=h.commands.filter(c=>c[0]==="text").map(c=>c[1]);
        for(const name of ["POD A","VOL","PAN","SPEED","JUNG","STABLE","RESTLESS","LOW","MID","HIGH"])
            check(labels.includes(name),"Missing "+name);
        for(const name of ["JITTER","ONCE","SYNC","PROBABILITY","INPUT","DISK"])
            check(!labels.includes(name),"Unexpected "+name);
        check(h.view.height===720,"Lab height lost");
    });
    test("Pressing a slider never jumps its value; relative motion emits normalized phases",()=>{
        const h=host();h.view.pointerDown(42,438,false);close(h.view.getVisualState("vol").value,.8);
        h.view.pointerUp(42,438,false);close(h.view.getVisualState("vol").value,.8);
        drag(h,"vol",.1,false);close(h.view.getVisualState("vol").value,.9);
        check(h.view.getVisualState("vol").display==="-0.9 dB","Volume units drifted");
        const first=h.events[0],last=h.events[h.events.length-1];
        check(first[2]==="control_begin"&&first[3]==="vol","Wrong begin contract");
        check(last[2]==="control_commit"&&last[3]==="vol","Wrong commit contract");
        close(last[4],.9);
    });
    test("Shift precision and hard bounds apply to controls; zero volume has a finite display string",()=>{
        const h=host();drag(h,"vol",.5,true);close(h.view.getVisualState("vol").value,.85);
        drag(h,"vol",-10,false);close(h.view.getVisualState("vol").value,0);
        check(h.view.getVisualState("vol").display==="−∞ dB","Zero gain formatting invalid");
        drag(h,"vol",10,false);close(h.view.getVisualState("vol").value,1);
    });
    test("Pan, speed and EQ unit mapping stays in the controller",()=>{
        const h=host();drag(h,"pan",-.25,false);
        check(h.view.getVisualState("pan").display==="L 50 %","Pan mapping invalid");
        drag(h,"speed",.1,false);const speed=h.view.getVisualState("speed");close(speed.value,.3);
        check(speed.display.endsWith("×")&&Math.abs(parseFloat(speed.display)-1.375)<.006,"Speed mapping invalid");
        drag(h,"eq_low",.25,false);check(h.view.getVisualState("eq_low").display==="+6.0 dB","EQ mapping invalid");
        h.view.doubleClick(100,606);close(h.view.getVisualState("eq_low").value,.5);
        check(h.view.getVisualState("eq_low").display==="0.0 dB","EQ neutral reset invalid");
    });
    test("JUNG presents stable/restless temperament without probability percentages",()=>{
        const h=host();drag(h,"jung",.2,false);close(h.view.getVisualState("jung").value,.5);
        check(h.view.getVisualState("jung").display==="","JUNG exposed a numeric percentage");
        h.view.draw();
        const labels=h.commands.filter(c=>c[0]==="text").map(c=>c[1]);
        check(labels.includes("STABLE")&&labels.includes("RESTLESS"),"Temperament endpoints missing");
    });
    test("EQ fades use faint bounded alpha at neutral and preserve balanced rendering",()=>{
        const h=host();h.view.draw();
        const faded=h.commands.filter(c=>c[0]==="fill"&&c.length===5&&c[4]>0&&c[4]<2);
        check(faded.length>=480,"EQ soft-edge primitive fades missing");
        check(h.depth()===0,"EQ rendering unbalanced");
    });
    test("Audio peaks are real multichannel data; APACHE is named only after a matching file loads",()=>{
        const h=host(),channels=[new Float32Array([-.3,.2,.7,-.5]),new Float32Array([.4,-.6,.1,.9])];
        check(h.view.getVisualState("header").filename==="NO SAMPLE","Empty state claims a sample");
        h.view.loadDecodedAudio({length:4,numberOfChannels:2,duration:1,getChannelData:i=>channels[i]},"Apache Break.wav");
        check(h.view.getVisualState("header").filename==="APACHE","Apache identity not resolved");
        const actual=h.view.getVisualState("waveform").peaks,expected=[-.3,.4,-.6,.2,.1,.7,-.5,.9];
        check(actual.length===8,"Peak cache missing");
        actual.forEach((value,i)=>check(Math.abs(value-expected[i])<1e-6,"Peak data altered"));
        h.view.playhead(.6);
        close(h.view.getVisualState("waveform").playhead,.6);
        check(h.view.getVisualState("waveform").position_display==="0.600 s","Position units missing");
        h.view.draw();check(h.errors.length===0,"Audio drawing error");
        h.view.reset();check(h.view.getVisualState("waveform").peaks.length===0,"Reset retained peaks");
    });
    test("Loop bounds stay ordered and active drag survives intermediate state echoes",()=>{
        const h=host(),x=36,w=888,y=140;
        h.view.pointerDown(x+w*.12,y,true);h.view.pointerMove(x+w*.3,y,true,true);
        close(h.view.getVisualState("waveform").loop[0],.3);
        h.view.set("waveform","loop",.1,.8,999);close(h.view.getVisualState("waveform").loop[0],.3);
        h.view.pointerMove(x+w*1.5,y,true,true);
        close(h.view.getVisualState("waveform").loop[0],.76);
        h.view.pointerUp(x+w*1.5,y,true);
        // A deliberately newer external controller revision owns reconciliation.
        const loop=h.view.getVisualState("waveform").loop;close(loop[0],.1);close(loop[1],.8);
    });
    test("Configurable adapter rejects duplicate, invalid and out-of-bounds layouts",()=>{
        for(const components of [
            [["a","slider","vol",0,0,10,10],["a","slider","pan",0,0,10,10]],
            [["a","slider","vol",0,0,-1,10]],
            [["a","slider","vol",0,0,2000,10]]
        ]){
            let failed=false;try{host({components});}catch(error){failed=true;}
            check(failed,"Bad layout accepted");
        }
    });
    test("Native patch shares layout, routes all components and contains no playback or EQ DSP",()=>{
        const p=files.patch.patcher,byId=Object.fromEntries(p.boxes.map(x=>[x.box.id,x.box]));
        for(const row of files.config.components){
            const box=byId["ui-"+row[0]];
            check(box&&JSON.stringify(box.presentation_rect)===JSON.stringify(row.slice(3)),"Native/p5 layout differs");
        }
        for(const item of p.lines){
            const l=item.patchline,s=byId[l.source[0]],d=byId[l.destination[0]];
            check(s&&d,"Dangling Max cord");
            check(l.source[1]<(s.numoutlets||0)&&l.destination[1]<(d.numinlets||0),"Bad Max port");
        }
        check(byId.buffer.text==="buffer~ #0.ui.lab","Unscoped preview resource");
        const forbidden=["dac~","ezdac~","groove~","filtergraph~","biquad~","metro","transport"];
        check(!p.boxes.some(x=>x.box.maxclass==="newobj"&&forbidden.includes((x.box.text||"").split(" ")[0])),"Lab gained DSP/timing");
    });
    return results;
}
if(typeof module!=="undefined"){
    module.exports={runChecks};
    if(require.main===module){
        const fs=require("node:fs"),path=require("node:path"),root=path.resolve(__dirname,"..");
        const results=runChecks({
            adapter:fs.readFileSync(path.join(root,"../p5-pod-a/max-p5-adapter.js"),"utf8"),
            component:fs.readFileSync(path.join(root,"code/flode_ui_lab_component.js"),"utf8"),
            controller:fs.readFileSync(path.join(root,"code/flode_ui_lab_controller.js"),"utf8"),
            config:JSON.parse(fs.readFileSync(path.join(root,"p5/config.json"),"utf8")),
            patch:JSON.parse(fs.readFileSync(path.join(root,"patchers/flode_ui_lab_001.maxpat"),"utf8"))
        });
        results.forEach(name=>console.log("PASS "+name));
        console.log(results.length+" UI lab checks passed (host calls recorded).");
    }
}
