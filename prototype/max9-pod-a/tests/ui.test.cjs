"use strict";
// Dependency-free contract checks. Run: node prototype/max9-pod-a/tests/ui.test.cjs
// These exercise JS behavior with Max API mocks, not the Max 9 runtime.
function runChecks(files) {
    const reports = [];
    function check(condition, message) { if (!condition) throw new Error(message); }
    function close(actual, expected) { check(Math.abs(actual - expected) < 1e-8, actual + " != " + expected); }
    function test(name, callback) { callback(); reports.push(name); }
    const dictionaries = {};
    class MockDict {
        constructor(name) { this.name = name; if (!dictionaries[name]) dictionaries[name] = {}; }
        get(key) { return dictionaries[this.name][key] === undefined ? null : dictionaries[this.name][key]; }
        set(key, value) { dictionaries[this.name][key] = value; }
    }
    const arrayfromargs = function (args) { return Array.from(args); };
    function component(kind, control, width, height, sink) {
        const events = [], draws = [], graphics = {};
        ["init", "save", "restore", "rectangle", "fill", "stroke", "set_line_width",
         "move_to", "line_to", "close_path", "select_font_face", "set_font_size",
         "show_text", "set_source_rgba", "redraw"].forEach(function (method) {
            graphics[method] = function () {
                const args = Array.from(arguments);
                args.forEach(function (arg) {
                    if (typeof arg === "number") check(Number.isFinite(arg), "Non-finite drawing coordinate");
                });
                draws.push([method].concat(args));
            };
        });
        const box = {rect:[120,240,120+(width||920),240+(height||254)]};
        const outlet = function (index, event) { events.push(event); if (sink) sink(event); };
        const api = new Function("mgraphics", "box", "jsarguments", "outlet", "arrayfromargs", "Dict", "post",
            files.component + "\nreturn {paint,set,enable,onclick,ondrag,onrelease,ondblclick,onidle,onresize," +
            "geometry,hit,shownValue,shownLoop,shownDisplay,inspect:()=>({state,gesture,layout})};")(
            graphics, box, ["flode_ui_component.js","A",kind,control], outlet, arrayfromargs, MockDict, function () {});
        return {api,events,draws,box};
    }
    test("Sizing uses box.rect endpoints and renders at several aspect ratios", function () {
        ["header","waveform","jung","jitter","stepper","modes"].forEach(function (kind) {
            const c=component(kind,"speed",920,254);
            [[920,254],[460,127],[140,80]].forEach(function (size) {
                c.box.rect=[120,240,120+size[0],240+size[1]];
                c.api.paint();
                close(c.api.inspect().layout.w,size[0]); close(c.api.inspect().layout.h,size[1]);
            });
        });
    });
    test("Controller updates are silent, clamped and revision ordered", function () {
        const c=component("jung",null,580,58);
        c.api.set("value_norm",1.7,3); close(c.api.shownValue(),1);
        c.api.set("value_norm",0.2,2); close(c.api.shownValue(),1);
        c.api.set("value_norm",NaN,4); close(c.api.shownValue(),1);
        check(c.events.length===0,"Setter emitted an event");
    });
    test("Drag preview survives controller echoes; release commits and reconciles", function () {
        const c=component("jung",null,580,58), r=c.api.geometry().track;
        c.api.set("value_norm",0.2,1); c.api.onclick(r.x+r.w*.5,r.y,1,0,0);
        close(c.api.shownValue(),0.5);
        c.api.set("value_norm",0.1,2); close(c.api.shownValue(),0.5);
        c.api.ondrag(r.x+r.w*.75,r.y,1,0,0); close(c.api.shownValue(),0.75);
        c.api.ondrag(r.x+r.w*.75,r.y,0,0,0);
        close(c.api.shownValue(),0.1);
        check(c.events[0][2]==="jung_begin","Missing begin");
        check(c.events[c.events.length-1][2]==="jung_commit","Missing release commit");
        close(c.events[c.events.length-1][3],0.75);
    });
    test("Revision-bound engineering displays defer intermediate controller echoes", function () {
        const c=component("stepper","speed",320,58),l=c.api.geometry();
        c.api.set("value_norm",.2,1);c.api.set("display","1.00 ×",1,.2);
        c.api.onclick(l.field.x+l.field.w*.5,l.field.y+2,1,0,0);
        c.api.ondrag(l.field.x+l.field.w*.5,l.field.y-18,1,0,0);
        const v=c.api.shownValue();
        c.api.set("display","1.50 ×",2,v);
        check(c.api.shownDisplay()==="1.50 ×","Matching display not shown");
        c.api.set("display","1.00 ×",3,.2);
        check(c.api.shownDisplay()==="1.50 ×","Intermediate display jumped");
        c.api.set("display","stale",1,v);
        check(c.api.shownDisplay()==="1.50 ×","Stale display accepted");
    });
    test("Shift slider gestures reduce sensitivity without jumping", function () {
        const c=component("jitter",null,580,58),r=c.api.geometry().track;
        c.api.set("value_norm",0.4);c.api.onclick(r.x+r.w*.8,r.y,1,0,1);
        close(c.api.shownValue(),0.4);
        c.api.ondrag(r.x+r.w*.9,r.y,1,0,1);close(c.api.shownValue(),0.41);
    });
    test("Loop endpoints stay ordered; body movement preserves length at bounds", function () {
        const c=component("waveform"),r=c.api.geometry().wave;
        c.api.set("loop",.2,.4,1);
        c.api.onclick(r.x+r.w*.2,r.y+30,1,0,1);
        c.api.ondrag(r.x+r.w*1.4,r.y+30,1,0,1);
        const pair=c.api.shownLoop();close(pair[0],.38);close(pair[1],.4);
        c.api.onrelease();c.api.set("loop",.2,.4,2);
        c.api.onclick(r.x+r.w*.3,r.y+40,1,0,1);
        c.api.ondrag(r.x+r.w*1.4,r.y+40,1,0,1);
        const moved=c.api.shownLoop();close(moved[0],.8);close(moved[1],1);
    });
    test("Small pointer movements escape snap points; Shift bypasses snap", function () {
        const c=component("waveform"),r=c.api.geometry().wave;
        c.api.set("loop",.25,.8);c.api.set("snap_points",.25);
        const x=r.x+r.w*.25,y=r.y+30;
        c.api.onclick(x,y,1,0,0);
        for(let i=1;i<=8;i++)c.api.ondrag(x+i*2,y,1,0,0);
        check(c.api.shownLoop()[0]>.26,"Loop handle stuck to snap point");
        c.api.onrelease();c.api.onclick(x,y,1,0,1);
        c.api.ondrag(x+1,y,1,0,1);check(c.api.shownLoop()[0]>.25,"Shift did not bypass snap");
    });
    test("Numeric stepper displays controller text verbatim and emits normalized values", function () {
        const c=component("stepper","speed",320,58),l=c.api.geometry();
        c.api.set("display","1.00 ×");c.api.set("value_norm",.2);
        c.api.paint();check(c.draws.some(d=>d[0]==="show_text"&&d[1]==="1.00 ×"),"Display was reformatted");
        c.api.onclick(l.plus.x+2,l.plus.y+2,1,0,0);c.api.onrelease();
        const event=c.events[c.events.length-1];
        check(event[2]==="stepper_commit"&&event[3]==="speed","Wrong stepper identity");close(event[4],.21);
    });
    test("Mute/Solo selection stays controller owned; disabled placeholders emit nothing", function () {
        const c=component("header",null,920,54),l=c.api.geometry();
        c.api.onclick(l.mute.x+3,l.mute.y+3,1);
        check(c.api.inspect().state.mute===0,"Mute toggled locally");
        check(c.events[0][2]==="mute_request"&&c.events[0][3]===1,"Wrong request");
        c.api.set("mute",1,1);check(c.api.inspect().state.mute===1,"Echo ignored");
        const before=c.events.length;
        l.disabled.forEach(r=>c.api.onclick(r.x+2,r.y+2,1));
        check(c.events.length===before,"Disabled header emitted a request");
        c.api.enable(0);c.api.onclick(l.solo.x+2,l.solo.y+2,1);
        check(c.events.length===before,"Disabled component emitted a request");
    });
    test("Mode requests and slice selection leave persistent state controller owned", function () {
        const c=component("modes",null,920,42),r=c.api.geometry().buttons[1];
        c.api.onclick(r.x+2,r.y+2,1);
        check(c.api.inspect().state.looper_mode==="on","Mode toggled locally");
        check(c.events[0].join(" ")==="pod A mode looper_mode once","Wrong mode request");
        const w=component("waveform"),wave=w.api.geometry().wave;
        w.api.set("markers",.5);w.api.onclick(wave.x+wave.w*.5,wave.y+35,1);
        check(w.events[0].join(" ")==="pod A slice_select 0","Wrong slice event");
        check(w.api.inspect().state.selected_slice===-1,"Slice selected locally");
    });
    test("Peak versions invalidate once; invalid or stale peak caches are ignored", function () {
        const c=component("waveform");
        new MockDict("cache").set("peaks",[-.2,.3,-.5,.8]);
        c.api.set("peaks","cache",1);check(c.api.inspect().state.peaks.length===4,"Cache not loaded");
        new MockDict("cache").set("peaks",[-1,1]);c.api.set("peaks","cache",1);
        check(c.api.inspect().state.peaks.length===4,"Same version reloaded");
        c.api.set("peaks","cache",2);check(c.api.inspect().state.peaks.length===2,"New version ignored");
        new MockDict("cache").set("peaks",[1,-1]);c.api.set("peaks","cache",3);
        check(c.api.inspect().state.peaks_version===2,"Invalid pair accepted");
        c.api.set("peaks","cache",1);check(c.api.inspect().state.peaks_version===2,"Version moved backward");
        c.api.paint();
    });
    test("Demo controller caches real multichannel samples and echoes authoritative state", function () {
        const output=[];
        class MockBuffer {
            framecount(){return 4;} channelcount(){return 2;} length(){return 1000;}
            peek(channel,start,count){
                const data=channel===1?[-.3,.2,.7,-.5]:[.4,-.6,.1,.9];
                return count===1?data[start]:data.slice(start,start+count);
            }
        }
        const api=new Function("jsarguments","Dict","Buffer","outlet","arrayfromargs","post",
            files.controller+"\nreturn {reset,pod,filename,refresh};")(
            ["controller.js","test.preview","A"],MockDict,MockBuffer,
            (index,value)=>output.push([index,value]),arrayfromargs,()=>{});
        api.reset();api.filename("/media/Apache Break.wav");api.refresh();
        const peaks=new MockDict("test.preview.peaks").get("peaks");
        check(JSON.stringify(peaks)===JSON.stringify([-.3,.4,-.6,.2,.1,.7,-.5,.9]),"Incorrect multichannel min/max");
        check(output.some(o=>o[1].join(" ")==="header set filename Apache Break.wav"),"Filename lost");
        api.pod("A","jung_change",1.4);
        check(output.some(o=>o[1][0]==="jung"&&o[1][2]==="value_norm"&&o[1][3]===1),"Controller did not clamp");
        const count=output.length;api.pod("B","jung_change",.2);
        check(output.length===count,"Other POD changed state");
    });
    test("Max patch routes every component and has instance scoped, silent preview storage", function () {
        const p=files.patch.patcher,byId=Object.fromEntries(p.boxes.map(b=>[b.box.id,b.box]));
        p.lines.forEach(function (l) {
            const link=l.patchline,source=byId[link.source[0]],destination=byId[link.destination[0]];
            check(source&&destination,"Dangling patch connection");
            check(link.source[1]<(source.numoutlets||0),"Bad outlet");
            check(link.destination[1]<(destination.numinlets||0),"Bad inlet");
        });
        check(p.boxes.filter(b=>(b.box.text||"").startsWith("v8ui ")).length===7,"Wrong component count");
        check(byId.buffer.text==="buffer~ #0.ui.preview","Buffer is not scoped");
        check(!p.boxes.some(b=>/dac~|groove~|metro|transport/.test(b.box.text||"")),"Preview gained audio or timing");
        check(p.openinpresentation===1,"Presentation not enabled");
    });
    return reports;
}
if (typeof module !== "undefined") {
    module.exports = {runChecks};
    if (require.main === module) {
        const fs=require("node:fs"),path=require("node:path"),root=path.resolve(__dirname,"..");
        const reports=runChecks({
            component:fs.readFileSync(path.join(root,"code/flode_ui_component.js"),"utf8"),
            controller:fs.readFileSync(path.join(root,"code/flode_ui_demo_controller.js"),"utf8"),
            patch:JSON.parse(fs.readFileSync(path.join(root,"patchers/flode_pod_a_ui.maxpat"),"utf8"))
        });
        reports.forEach(name=>console.log("PASS "+name));
        console.log(reports.length+" contract checks passed (Max APIs mocked).");
    }
}
