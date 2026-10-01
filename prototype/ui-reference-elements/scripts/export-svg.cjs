"use strict";
// Run: node prototype/ui-reference-elements/scripts/export-svg.cjs
function build(UI,gallery,fontData){
    const files=[];
    for(const s of gallery.elements){
        const icon=s.kind==="icon",options=icon?{id:s.id,width:s.width,height:s.height,active:true,transparent:true}:
            Object.assign({},s.options,{id:s.id,pod:"A",width:s.width,height:s.height});
        files.push({path:"graphics/"+(icon?"icon-"+s.id:s.kind)+".svg",
            content:UI.toSvg(UI.scene(s.kind,options),s.kind+" "+s.id+" reference study",fontData)});
    }
    for(const behavior of UI.behaviors)files.push({path:"graphics/jung-"+behavior+".svg",
        content:UI.toSvg(UI.scene("glyph",{width:220,height:176,behavior}),"JUNG "+behavior,fontData)});
    const fontStyle=UI.toSvg(UI.scene("readout",{}),"Fonts",fontData).match(/<defs>[\s\S]*?<\/defs>/)?.[0]||"";
    const groups=gallery.elements.map(s=>{
        const svg=UI.toSvg(UI.scene(s.kind,Object.assign({},s.options,{id:s.id,pod:"A",width:s.width,height:s.height})));
        const body=svg.split("\n").slice(1,-2).join("\n").replaceAll('id="element-','id="'+s.id+'-element-');
        return '<g id="'+s.id+'" transform="translate('+s.x+' '+s.y+')">'+body+'</g>';
    });
    const preview='<svg xmlns="http://www.w3.org/2000/svg" width="'+gallery.width+'" height="'+gallery.height+
        '" viewBox="0 0 '+gallery.width+' '+gallery.height+'" role="img"><title>flöde~ reference elements — visual study, no audio</title>'+
        fontStyle+'<rect width="'+gallery.width+'" height="'+gallery.height+'" fill="#0e1115"/>\n'+groups.join("\n")+'\n</svg>\n';
    files.push({path:"graphics/reference-elements-preview.svg",content:preview});return files;
}
if(typeof module!=="undefined"){
    module.exports={build};
    if(typeof require==="function"&&require.main===module){
        const fs=require("node:fs"),path=require("node:path"),root=path.resolve(__dirname,"..");
        const UI=require(path.join(root,"code/flode_reference_ui.js"));
        const gallery=JSON.parse(fs.readFileSync(path.join(root,"gallery.json"),"utf8"));
        const fontRoot=path.resolve(root,"../../design/ui/component-atlas/fonts");
        const fontData={jersey:fs.readFileSync(path.join(fontRoot,"Jersey10-Regular.ttf")).toString("base64"),
            mono:fs.readFileSync(path.join(fontRoot,"IBMPlexMono-Regular.ttf")).toString("base64")};
        const files=build(UI,gallery,fontData);fs.mkdirSync(path.join(root,"graphics"),{recursive:true});
        for(const file of files)fs.writeFileSync(path.join(root,file.path),file.content,"utf8");
        console.log("Exported "+files.length+" editable SVG files.");
    }
}
