// Isolated reference-element demo state. No audio, clock, JUNG or transport behavior.
autowatch=1;inlets=1;outlets=2;
const POD=String(jsarguments[1]||"A"),defaults={jung:.3,pan:.5};
let revision=0,model={};
function send(id,property){outlet(0,[id,"set",property].concat(Array.from(arguments).slice(2)));}
function control(id){
    send(id,"value_norm",model[id],revision);
    const n=model[id],display=id==="pan"?(Math.abs(n-.5)<.0025?"C":(n<.5?"L ":"R ")+Math.round(Math.abs(n*2-1)*100)+" %"):"";
    send(id,"display",display,revision,n);
}
function reset(){
    revision++;model=Object.assign({},defaults);
    Object.keys(defaults).forEach(control);
    send("header","filename","NO SAMPLE");
    send("waveform","loop",.12,.78);send("waveform","playhead",.32);
    send("waveform","start_display","12.0 %");send("waveform","end_display","78.0 %");
    send("speed","display","1.00 ×");send("meter","available",0);
    send("glyph","behavior_state","home");
}
function pod(id,event){
    if(String(id)!==POD)return;
    const a=Array.from(arguments).slice(2);
    outlet(1,["pod",id,event].concat(a));
    if(event==="control_reset_request"&&Object.prototype.hasOwnProperty.call(defaults,String(a[0]))){
        model[a[0]]=defaults[a[0]];revision++;control(a[0]);
    }else if(["control_change","control_commit"].includes(event)&&Object.prototype.hasOwnProperty.call(defaults,String(a[0]))&&
        Number.isFinite(Number(a[1]))){
        model[a[0]]=Math.max(0,Math.min(1,Number(a[1])));revision++;control(a[0]);
    }
}
