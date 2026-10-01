"use strict";
// Export the actual UI LAB 001 drawing path, including the approved font pairing.
// Run: node prototype/ui-lab-001/scripts/export-svg.cjs
function build(UI,files,fontData){
    const data=new Map(),components=new Map(),drawings=new Map();
    class Dict{
        constructor(name){this.name=name;if(!data.has(name))data.set(name,{});}
        get(key){const v=data.get(this.name)[key];return v===undefined?null:v;}
        set(key,value){data.get(this.name)[key]=value;}
    }
    function graphics(commands){
        let color=[1,1,1,1],weight=1,font="Jersey 10",size=14,position=[0,0],path=[];
        const stack=[];
        function end(filled){
            for(const c of path){
                if(c.op==="rect")commands.push(Object.assign({},c,{color:color.slice(),stroke:filled?0:weight}));
                else commands.push({op:"poly",points:c.points,color:color.slice(),filled,closed:c.closed,weight});
            }path=[];
        }
        return{
            init(){},redraw(){},save(){stack.push({color:color.slice(),weight,font,size});},
            restore(){const s=stack.pop();if(!s)throw Error("Unbalanced graphics state");({color,weight,font,size}=s);},
            set_source_rgba(c){color=Array.isArray(c)?c.slice():Array.from(arguments);},
            set_line_width(v){weight=v;},select_font_face(v){font=v;},set_font_size(v){size=v;},
            rectangle(x,y,w,h){path=[{op:"rect",x,y,w,h}];},
            move_to(x,y){position=[x,y];path.push({points:[[x,y]],closed:false});},
            line_to(x,y){path.at(-1).points.push([x,y]);position=[x,y];},
            close_path(){path.at(-1).closed=true;},fill(){end(true);},stroke(){end(false);},
            show_text(text){commands.push({op:"text",text:String(text),x:position[0],y:position[1],size,font,color:color.slice()});path=[];}
        };
    }
    const prelude="var autowatch,inlets,outlets;\n";
    const factory=new Function("mgraphics","box","jsarguments","outlet","arrayfromargs","Dict","post",
        prelude+files.component+"\nreturn {paint,set};");
    for(const [id,kind,control,x,y,w,h] of files.config.components){
        const commands=[];drawings.set(id,{width:w,height:h,commands});
        components.set(id,factory(graphics(commands),{rect:[0,0,w,h]},["lab.js","A",kind,control],
            ()=>{},Array.from,Dict,()=>{}));
    }
    const controller=new Function("jsarguments","Dict","Buffer","outlet","arrayfromargs","post",
        prelude+files.controller+"\nreturn {reset};")(["controller.js","lab.export","A"],Dict,function(){throw Error("No audio fixture");},
        function(index,message){
            const c=components.get(message[0]);if(index===0&&c&&message[1]==="set")c.set.apply(null,message.slice(2));
        },Array.from,()=>{});
    controller.reset();
    for(const c of components.values())c.paint();
    const assets=[];
    for(const [id,s] of drawings)assets.push({path:"graphics/"+id+".svg",content:UI.toSvg(s,"UI LAB 001 "+id,fontData)});
    const fontStyle=UI.toSvg(UI.scene("readout",{}),"Fonts",fontData).match(/<defs>[\s\S]*?<\/defs>/)?.[0]||"";
    const groups=files.config.components.map(([id,kind,control,x,y])=>{
        const svg=UI.toSvg(drawings.get(id));
        const body=svg.split("\n").slice(1,-2).join("\n").replaceAll('id="element-','id="'+id+'-element-');
        return '<g id="'+id+'" transform="translate('+x+' '+y+')">'+body+'</g>';
    });
    const w=files.config.width,h=files.config.height;
    assets.push({path:"graphics/pod-a-lab-preview.svg",content:
        '<svg xmlns="http://www.w3.org/2000/svg" width="'+w+'" height="'+h+'" viewBox="0 0 '+w+' '+h+
        '" role="img"><title>UI LAB 001 · Jersey 10 labels / IBM Plex Mono numbers · NO SAMPLE</title>'+fontStyle+
        '<rect width="'+w+'" height="'+h+'" fill="#0e1115"/>\n'+groups.join("\n")+'\n</svg>\n'});
    return assets;
}
if(typeof module!=="undefined"){
    module.exports={build};
    if(typeof require==="function"&&require.main===module){
        const fs=require("node:fs"),path=require("node:path"),root=path.resolve(__dirname,"..");
        const UI=require(path.resolve(root,"../ui-reference-elements/code/flode_reference_ui.js"));
        const fontRoot=path.resolve(root,"../../design/ui/component-atlas/fonts");
        const fonts={jersey:fs.readFileSync(path.join(fontRoot,"Jersey10-Regular.ttf")).toString("base64"),
            mono:fs.readFileSync(path.join(fontRoot,"IBMPlexMono-Regular.ttf")).toString("base64")};
        const files={component:fs.readFileSync(path.join(root,"code/flode_ui_lab_component.js"),"utf8"),
            controller:fs.readFileSync(path.join(root,"code/flode_ui_lab_controller.js"),"utf8"),
            config:JSON.parse(fs.readFileSync(path.join(root,"p5/config.json"),"utf8"))};
        const assets=build(UI,files,fonts);fs.mkdirSync(path.join(root,"graphics"),{recursive:true});
        for(const f of assets)fs.writeFileSync(path.join(root,f.path),f.content,"utf8");
        console.log("Exported "+assets.length+" UI LAB SVGs.");
    }
}
