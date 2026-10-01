"use strict";
// Run: node prototype/ui-reference-elements/tests/elements.test.cjs
function runChecks(files){
    const results=[];
    function check(v,m){if(!v)throw Error(m);}
    function close(a,b){check(Math.abs(a-b)<1e-8,a+" != "+b);}
    function test(n,f){f();results.push(n);}
    const mod={exports:{}};new Function("module",files.source)(mod);const UI=mod.exports;
    function maxHost(kind,id){
        const drawing=[],events=[];let depth=0;
        const g={init(){},redraw(){}};
        for(const name of ["set_source_rgba","set_line_width","select_font_face","set_font_size","move_to","line_to",
            "rectangle","ellipse","show_text","close_path","fill","stroke"])
            g[name]=(...args)=>drawing.push([name,...args]);
        g.save=()=>depth++;g.restore=()=>{depth--;check(depth>=0,"Max state underflow");};
        const api=new Function("mgraphics","box","jsarguments","outlet",files.source+
            "\nreturn {paint,set,enable,onclick,ondrag,onrelease,ondblclick,onresize,host:()=>_flodeHost};")(
            g,{rect:[20,40,340,180]},["flode_reference_ui.js","A",kind,id],(index,event)=>events.push(event));
        return{api,g,drawing,events,depth:()=>depth};
    }
    test("All eight families produce finite, self-contained editable SVG commands",()=>{
        check(UI.kinds.length===8,"Family count");
        for(const kind of UI.kinds){
            const s=UI.scene(kind,{width:320,height:180,value:Infinity,start:-2,end:5});
            function finite(obj){for(const v of Object.values(obj))if(typeof v==="number")check(Number.isFinite(v),"Nonfinite geometry");else if(v&&typeof v==="object")finite(v);}
            finite(s);const svg=UI.toSvg(s);
            check(svg.startsWith("<svg ")&&svg.endsWith("</svg>\n"),"Malformed SVG");
            check(!/<image|<script|href=/.test(svg),"External SVG dependency");
        }
    });
    test("User-supplied labels are escaped in SVG text",()=>{
        const svg=UI.toSvg(UI.scene("readout",{display:'<&"\'>'}),"<unsafe>");
        check(svg.includes("&lt;&amp;&quot;&apos;&gt;"),"Unescaped value");
        check(svg.includes("&lt;unsafe&gt;"),"Unescaped title");
    });
    test("p5 and mgraphics draw the same primitive geometry and font choices",()=>{
        const calls=[],p={RGB:"rgb",CORNER:"corner",CENTER:"center",LEFT:"left",BASELINE:"baseline",CLOSE:"close"};
        let depth=0;
        p.push=()=>depth++;p.pop=()=>depth--;
        for(const name of ["colorMode","rectMode","ellipseMode","noStroke","fill","noFill","stroke","strokeWeight",
            "textFont","textSize","textAlign","text","rect","ellipse","line","beginShape","vertex","endShape"])
            p[name]=(...args)=>calls.push([name,...args]);
        const h=maxHost("meter","meter");
        for(const kind of UI.kinds){
            const s=UI.scene(kind,{width:320,height:180,active:true,available:true,left:.6,right:.4});
            calls.length=0;h.drawing.length=0;
            UI.renderP5(s,p);UI.renderMgraphics(s,h.g);
            check(depth===0&&h.depth()===0,"Unbalanced draw state");
            check(calls.filter(c=>["rect","ellipse","line","text","beginShape"].includes(c[0])).length===s.commands.length,"p5 command count");
            for(const c of s.commands){
                if(c.op==="rect"){
                    check(calls.some(a=>a[0]==="rect"&&JSON.stringify(a.slice(1))===JSON.stringify([c.x,c.y,c.w,c.h])),"p5 rect changed");
                    check(h.drawing.some(a=>a[0]==="rectangle"&&JSON.stringify(a.slice(1))===JSON.stringify([c.x,c.y,c.w,c.h])),"Max rect changed");
                }
                if(c.op==="circle"){
                    check(calls.some(a=>a[0]==="ellipse"&&JSON.stringify(a.slice(1))===JSON.stringify([c.x,c.y,c.r*2,c.r*2])),"p5 circle changed");
                    check(h.drawing.some(a=>a[0]==="ellipse"&&JSON.stringify(a.slice(1))===JSON.stringify([c.x-c.r,c.y-c.r,c.r*2,c.r*2])),"Max ellipse changed");
                }
                if(c.op==="poly")for(const pt of c.points){
                    check(calls.some(a=>a[0]==="vertex"&&JSON.stringify(a.slice(1))===JSON.stringify(pt)),"p5 path point changed");
                    check(h.drawing.some(a=>["move_to","line_to"].includes(a[0])&&JSON.stringify(a.slice(1))===JSON.stringify(pt)),"Max path point changed");
                }
                if(c.op==="text"){
                    check(calls.some(a=>a[0]==="textFont"&&a[1]===c.font),"p5 font changed");
                    check(h.drawing.some(a=>a[0]==="select_font_face"&&a[1]===c.font),"Max font changed");
                }
            }
        }
    });
    test("Labels use Jersey 10 and numeric readouts use IBM Plex Mono",()=>{
        const s=UI.scene("readout",{display:"120.00 BPM"});
        check(s.commands.some(c=>c.op==="text"&&c.text==="READOUT"&&c.font==="Jersey 10"),"Label font");
        check(s.commands.some(c=>c.op==="text"&&c.text==="120.00 BPM"&&c.font==="IBM Plex Mono"),"Numeric font");
        const svg=UI.toSvg(s,"Fonts",{jersey:"AA==",mono:"AA=="});
        check(svg.includes('@font-face{font-family:"Jersey 10"')&&svg.includes('@font-face{font-family:"IBM Plex Mono"'),"Fonts not embedded");
    });
    test("Relative fader/knob gestures preserve authority and never jump on press",()=>{
        for(const kind of ["fader","knob"]){
            const events=[],c=UI.createControl(kind,{value:.5},e=>events.push(e));
            c.begin(100,100);close(c.visual().value,.5);
            c.move(kind==="fader"?120:100,kind==="knob"?80:100,false,100);close(c.visual().value,.7);
            c.set("value",[.6,3]);close(c.visual().value,.7);
            c.end();close(c.visual().value,.6);
            check(events.map(e=>e.phase).join(",")==="begin,change,commit","Gesture phases");
        }
    });
    test("Fine adjustment, clamping and reset requests keep normalized semantics",()=>{
        const events=[],c=UI.createControl("fader",{value:.5},e=>events.push(e));
        c.begin(0,0);c.move(100,0,true,100);close(c.visual().value,.6);
        c.move(10000,0,false,100);close(c.visual().value,1);c.end();
        c.reset();check(events.at(-1).phase==="reset_request","Missing reset");
        close(c.visual().value,.5);
        close(UI.controlSpan("fader",120),105.6);close(UI.controlSpan("knob",140),150);
    });
    test("Stale echoes and unmatched display values cannot move an active preview",()=>{
        const c=UI.createControl("fader",{value:.5,display:"old"},()=>{});
        c.set("value",[.6,4]);c.begin(0,0);c.move(10,0,false,100);
        c.set("display",["intermediate",5,.65]);check(c.visual().display==="old","Unmatched display");
        c.set("display",["matched",6,.7]);check(c.visual().display==="matched","Matched display lost");
        c.set("value",[.1,3]);c.end();close(c.visual().value,.6);
        c.set("value",[NaN,99]);c.set("value",[.8,7]);close(c.visual().value,.8);
    });
    test("Disable cancels a preview and prevents edits; re-enable restores authority",()=>{
        const events=[],c=UI.createControl("knob",{value:.5},e=>events.push(e));
        c.begin(0,0);c.move(0,-20,false,100);c.set("enabled",[0]);
        const count=events.length;c.move(0,-40,false,100);c.end();c.reset();c.begin(0,0);
        check(events.length===count,"Disabled emitted");close(c.visual().value,.5);
        c.set("enabled",[1]);c.begin(0,0);check(events.length===count+1,"Re-enable failed");
    });
    test("JUNG returns to exact canonical edges and keeps its temporal anchor fixed",()=>{
        const scenes=UI.behaviors.map(behavior=>UI.scene("glyph",{width:220,height:176,behavior,phase:1}));
        const edges=s=>s.commands.filter(c=>c.op==="poly");
        check(JSON.stringify(edges(scenes[0]))===JSON.stringify(edges(scenes[4])),"Return differs from home");
        check(JSON.stringify(edges(scenes[0]))===JSON.stringify(edges(scenes[3])),"Resolved edges differ from home");
        const anchor=s=>s.commands.filter(c=>JSON.stringify(c.color)===JSON.stringify(UI.colors.cyan));
        for(const s of scenes)check(JSON.stringify(anchor(s))===JSON.stringify(anchor(scenes[0])),"Anchor moved");
        for(const s of scenes)check(!s.commands.some(c=>c.op==="text"&&/%|probability|seed/i.test(c.text)),"JUNG exposes internals");
    });
    test("Meter defaults distinguish unavailable data from silence and only explicit clip is shown",()=>{
        const text=s=>s.commands.filter(c=>c.op==="text").map(c=>c.text);
        check(text(UI.scene("meter",{})).includes("NO LEVEL DATA"),"Unavailable hidden");
        check(!text(UI.scene("meter",{clip:true})).includes("CLIP"),"Unknown source clipped");
        check(text(UI.scene("meter",{available:true,left:0,right:0,clip:true})).includes("CLIP"),"Explicit clip hidden");
        check(!text(UI.scene("meter",{available:true,left:0,right:0})).includes("NO LEVEL DATA"),"Silence marked unavailable");
    });
    test("Max global functions emit the shared contract and setters stay silent",()=>{
        const h=maxHost("fader","jung");
        h.api.set("value_norm",.3,1);h.api.set("display","",1,.3);
        check(h.events.length===0,"Setter emitted");
        h.api.onclick(20,40,1);h.api.ondrag(48.8,40,1,0,0);
        close(h.api.host().control.visual().value,.4);
        h.api.set("value_norm",.4,2);h.api.onrelease();
        check(h.events.map(e=>e[2]).join(",")==="control_begin,control_change,control_commit","Max event mismatch");
        h.api.paint();check(h.depth()===0,"Max draw stack");
        const icon=maxHost("icon","loop");icon.api.onclick(10,10,1);
        check(icon.events[0].join(" ")==="pod A action_request loop","Icon request mismatch");
        icon.api.enable(0);icon.api.onclick(10,10,1);check(icon.events.length===1,"Disabled icon emitted");
    });
    test("Demo controller echoes values but leaves symbol requests unconfirmed",()=>{
        const updates=[],events=[];
        const c=new Function("jsarguments","outlet","var autowatch,inlets,outlets;\n"+files.controller+"\nreturn {reset,pod};")(
            ["demo.js","A"],(index,e)=>(index===0?updates:events).push(e));
        c.reset();check(updates.some(e=>e[0]==="pan"&&e[2]==="display"&&e[3]==="C"),"Default pan");
        const before=updates.length;c.pod("A","action_request","play");
        check(updates.length===before&&events.length===1,"Symbol request mutated state");
        c.pod("A","control_change","pan",1);
        check(updates.at(-1)[3]==="R 100 %","Controller pan mapping");
        c.pod("A","control_reset_request","pan");check(updates.at(-1)[3]==="C","Controller reset");
    });
    test("Native patch connections, gallery bounds and dependency files are coherent",()=>{
        const p=files.patch.patcher,byId=Object.fromEntries(p.boxes.map(x=>[x.box.id,x.box]));
        for(const item of p.lines){
            const l=item.patchline,s=byId[l.source[0]],d=byId[l.destination[0]];
            check(s&&d&&l.source[1]<s.numoutlets&&l.destination[1]<d.numinlets,"Bad native connection");
        }
        for(const s of files.specs){
            const b=byId["ui-"+s.id];check(b&&JSON.stringify(b.presentation_rect)===JSON.stringify([s.x,s.y,s.width,s.height]),"Host layout mismatch");
            check(s.x+s.width<=960&&s.y+s.height<=780,"Gallery overflow");
        }
        check(!p.boxes.some(x=>/^(dac~|ezdac~|groove~|buffer~|metro|transport)\b/.test(x.box.text||"")),"Unexpected audio/timing object");
        check(p.dependency_cache.every(d=>[files.sourceName,files.controllerName].includes(d.name)),"Unknown dependency");
    });
    return results;
}
if(typeof module!=="undefined"){
    module.exports={runChecks};
    if(typeof require==="function"&&require.main===module){
        const fs=require("node:fs"),path=require("node:path"),root=path.resolve(__dirname,"..");
        const results=runChecks({
            source:fs.readFileSync(path.join(root,"code/flode_reference_ui.js"),"utf8"),
            controller:fs.readFileSync(path.join(root,"code/flode_reference_demo_controller.js"),"utf8"),
            sourceName:"flode_reference_ui.js",controllerName:"flode_reference_demo_controller.js",
            patch:JSON.parse(fs.readFileSync(path.join(root,"patchers/flode_reference_elements.maxpat"),"utf8")),
            specs:JSON.parse(fs.readFileSync(path.join(root,"gallery.json"),"utf8")).elements
        });
        results.forEach(name=>console.log("PASS "+name));console.log(results.length+" element checks passed (host calls recorded).");
    }
}
