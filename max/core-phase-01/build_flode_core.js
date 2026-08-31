const fs = require('fs');
const path = require('path');

const outDir = __dirname;

function box(id, maxclass, rect, extra = {}) {
  return { box: { id, maxclass, patching_rect: rect, ...extra } };
}

function line(sourceId, sourceOutlet, destId, destInlet, order) {
  const patchline = {
    source: [sourceId, sourceOutlet],
    destination: [destId, destInlet],
  };
  if (order !== undefined) patchline.order = order;
  return { patchline };
}

function patcher(rect, boxes, lines, presentationRect = rect) {
  return {
    patcher: {
      fileversion: 1,
      appversion: { major: 9, minor: 0, revision: 7, architecture: 'x64', modernui: 1 },
      classnamespace: 'box',
      rect,
      bglocked: 0,
      openinpresentation: 1,
      default_fontsize: 12,
      default_fontface: 0,
      default_fontname: 'Arial',
      gridonopen: 1,
      gridsize: [15, 15],
      toolbarvisible: 1,
      boxanimatetime: 200,
      enablehscroll: 1,
      enablevscroll: 1,
      devicewidth: 0,
      description: '',
      digest: '',
      tags: '',
      style: '',
      subpatcher_template: '',
      assistshowspatchername: 0,
      boxes,
      lines,
      dependency_cache: [],
      autosave: 0,
      saved_object_attributes: { globalpatchername: '' },
    },
  };
}

function makePod() {
  const boxes = [];
  const lines = [];
  const add = (b) => boxes.push(b);
  const wire = (...args) => lines.push(line(...args));

  add(box('bg', 'panel', [8, 8, 304, 184], {
    bgcolor: [0.105, 0.11, 0.105, 1],
    bordercolor: [0.27, 0.29, 0.27, 1],
    rounded: 14,
    presentation: 1,
    presentation_rect: [0, 0, 304, 184],
  }));
  add(box('title', 'comment', [18, 14, 120, 20], {
    text: 'POD #1', textcolor: [0.78, 0.82, 0.76, 1], fontsize: 14,
    presentation: 1, presentation_rect: [12, 8, 100, 20],
  }));
  add(box('drop', 'dropfile', [272, 14, 24, 24], {
    presentation: 1, presentation_rect: [266, 9, 24, 24],
  }));
  add(box('prependReplace', 'newobj', [340, 18, 98, 22], { text: 'prepend replace' }));
  add(box('buffer', 'newobj', [340, 48, 142, 22], { text: 'buffer~ flode.buf.#1 4000' }));
  add(box('wave', 'waveform~', [18, 42, 278, 54], {
    buffername: 'flode.buf.#1', setmode: 0,
    bgcolor: [0.07, 0.075, 0.07, 1], wavecolor: [0.62, 0.70, 0.58, 1],
    selectioncolor: [0.34, 0.42, 0.32, 0.45],
    presentation: 1, presentation_rect: [12, 36, 278, 54],
  }));

  add(box('stepRecv', 'newobj', [340, 88, 76, 22], { text: 'r flode.step' }));
  add(box('stepSel', 'newobj', [340, 118, 316, 22], {
    text: 'sel 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15',
  }));

  const toggleIds = [];
  for (let i = 0; i < 16; i++) {
    const x = 14 + i * 17;
    const tid = `step${i}`;
    const store = `store${i}`;
    const active = `active${i}`;
    toggleIds.push(tid);
    add(box(tid, 'toggle', [x, 104, 14, 14], {
      bgcolor: [0.18, 0.19, 0.18, 1], checkedcolor: [0.69, 0.75, 0.60, 1],
      presentation: 1, presentation_rect: [12 + i * 17, 98, 14, 14],
    }));
    add(box(store, 'newobj', [340 + (i % 4) * 58, 154 + Math.floor(i / 4) * 26, 30, 22], { text: 'int 0' }));
    add(box(active, 'newobj', [374 + (i % 4) * 58, 154 + Math.floor(i / 4) * 26, 34, 22], { text: 'sel 1' }));
    wire(tid, 0, store, 1);
    wire('stepSel', i, store, 0);
    wire(store, 0, active, 0);
  }

  add(box('rand', 'newobj', [340, 274, 72, 22], { text: 'random 100' }));
  add(box('probCompare', 'newobj', [420, 274, 46, 22], { text: '< 100' }));
  add(box('probSel', 'newobj', [474, 274, 34, 22], { text: 'sel 1' }));
  for (let i = 0; i < 16; i++) wire(`active${i}`, 0, 'rand', 0);
  wire('rand', 0, 'probCompare', 0);
  wire('probCompare', 0, 'probSel', 0);

  add(box('probLabel', 'comment', [18, 124, 42, 18], {
    text: 'PROB', textcolor: [0.52, 0.55, 0.50, 1], fontsize: 9,
    presentation: 1, presentation_rect: [12, 120, 40, 16],
  }));
  add(box('prob', 'number', [18, 142, 42, 20], {
    minimum: 0, maximum: 100,
    presentation: 1, presentation_rect: [12, 137, 42, 20],
  }));
  add(box('probLoad', 'newobj', [520, 274, 83, 22], { text: 'loadmess 100' }));
  wire('prob', 0, 'probCompare', 1);
  wire('probLoad', 0, 'prob', 0);

  add(box('playMsg', 'message', [340, 392, 38, 22], { text: 'start' }));
  add(box('stopMsg', 'message', [384, 392, 35, 22], { text: 'stop' }));
  add(box('stopButton', 'button', [268, 139, 18, 18], {
    presentation: 1, presentation_rect: [270, 138, 18, 18],
  }));
  add(box('stopLabel', 'comment', [255, 159, 42, 15], {
    text: 'STOP', textcolor: [0.52, 0.55, 0.50, 1], fontsize: 8,
    presentation: 1, presentation_rect: [260, 158, 38, 14],
  }));
  add(box('player', 'newobj', [340, 424, 116, 22], { text: 'play~ flode.buf.#1 2' }));
  wire('probSel', 0, 'playMsg', 0);
  wire('playMsg', 0, 'player', 0);
  wire('stopButton', 0, 'stopMsg', 0);
  wire('stopMsg', 0, 'player', 0);

  add(box('volLabel', 'comment', [78, 124, 36, 18], {
    text: 'VOL', textcolor: [0.52, 0.55, 0.50, 1], fontsize: 9,
    presentation: 1, presentation_rect: [72, 120, 34, 16],
  }));
  add(box('vol', 'flonum', [78, 142, 46, 20], {
    minimum: 0.0, maximum: 1.0,
    presentation: 1, presentation_rect: [70, 137, 46, 20],
  }));
  add(box('volLoad', 'newobj', [468, 424, 76, 22], { text: 'loadmess 0.7' }));
  wire('volLoad', 0, 'vol', 0);

  add(box('panLabel', 'comment', [140, 124, 36, 18], {
    text: 'PAN', textcolor: [0.52, 0.55, 0.50, 1], fontsize: 9,
    presentation: 1, presentation_rect: [132, 120, 34, 16],
  }));
  add(box('pan', 'flonum', [140, 142, 46, 20], {
    minimum: -1.0, maximum: 1.0,
    presentation: 1, presentation_rect: [130, 137, 46, 20],
  }));
  add(box('panLoad', 'newobj', [552, 424, 70, 22], { text: 'loadmess 0.' }));
  add(box('panL', 'newobj', [340, 458, 148, 22], { text: 'expr min(1.\, 1.-max(0.\,$f1))' }));
  add(box('panR', 'newobj', [496, 458, 148, 22], { text: 'expr min(1.\, 1.+min(0.\,$f1))' }));
  wire('panLoad', 0, 'pan', 0);
  wire('pan', 0, 'panL', 0);
  wire('pan', 0, 'panR', 0);

  add(box('muteLabel', 'comment', [205, 124, 38, 18], {
    text: 'MUTE', textcolor: [0.52, 0.55, 0.50, 1], fontsize: 9,
    presentation: 1, presentation_rect: [194, 120, 40, 16],
  }));
  add(box('mute', 'toggle', [214, 143, 18, 18], {
    presentation: 1, presentation_rect: [205, 138, 18, 18],
  }));
  add(box('muteInvert', 'newobj', [652, 424, 36, 22], { text: '!- 1' }));
  wire('mute', 0, 'muteInvert', 0);

  add(box('gainL', 'newobj', [340, 492, 36, 22], { text: '*~ 1.' }));
  add(box('gainR', 'newobj', [430, 492, 36, 22], { text: '*~ 1.' }));
  add(box('volL', 'newobj', [340, 522, 36, 22], { text: '*~ 1.' }));
  add(box('volR', 'newobj', [430, 522, 36, 22], { text: '*~ 1.' }));
  add(box('muteL', 'newobj', [340, 552, 36, 22], { text: '*~ 1.' }));
  add(box('muteR', 'newobj', [430, 552, 36, 22], { text: '*~ 1.' }));
  add(box('outL', 'outlet', [340, 586, 24, 24], { outlettype: ['signal'] }));
  add(box('outR', 'outlet', [430, 586, 24, 24], { outlettype: ['signal'] }));
  wire('player', 0, 'gainL', 0);
  wire('player', 1, 'gainR', 0);
  wire('panL', 0, 'gainL', 1);
  wire('panR', 0, 'gainR', 1);
  wire('gainL', 0, 'volL', 0);
  wire('gainR', 0, 'volR', 0);
  wire('vol', 0, 'volL', 1);
  wire('vol', 0, 'volR', 1);
  wire('volL', 0, 'muteL', 0);
  wire('volR', 0, 'muteR', 0);
  wire('muteInvert', 0, 'muteL', 1);
  wire('muteInvert', 0, 'muteR', 1);
  wire('muteL', 0, 'outL', 0);
  wire('muteR', 0, 'outR', 0);

  add(box('seedLoad', 'newobj', [618, 274, 55, 22], { text: 'loadbang' }));
  for (const i of [0, 4, 8, 12]) {
    const mid = `seed${i}`;
    add(box(mid, 'message', [618 + (i / 4) * 30, 306, 24, 22], { text: '1' }));
    wire('seedLoad', 0, mid, 0);
    wire(mid, 0, `step${i}`, 0);
  }

  return patcher([40, 80, 740, 650], boxes, lines, [0, 0, 304, 184]);
}

function makeMain() {
  const boxes = [];
  const lines = [];
  const add = (b) => boxes.push(b);
  const wire = (...args) => lines.push(line(...args));

  add(box('background', 'panel', [0, 0, 1024, 680], {
    bgcolor: [0.075, 0.08, 0.075, 1], bordercolor: [0.075, 0.08, 0.075, 1],
    presentation: 1, presentation_rect: [0, 0, 1024, 680],
  }));
  add(box('brand', 'comment', [28, 20, 180, 34], {
    text: 'flöde~ core', fontsize: 24, textcolor: [0.76, 0.81, 0.72, 1],
    presentation: 1, presentation_rect: [24, 18, 200, 34],
  }));
  add(box('phase', 'comment', [28, 52, 240, 20], {
    text: 'six-pod sampler · phase 01', fontsize: 11, textcolor: [0.44, 0.48, 0.43, 1],
    presentation: 1, presentation_rect: [26, 50, 240, 20],
  }));

  add(box('playLabel', 'comment', [350, 18, 42, 18], {
    text: 'PLAY', fontsize: 9, textcolor: [0.48, 0.52, 0.47, 1],
    presentation: 1, presentation_rect: [350, 17, 42, 18],
  }));
  add(box('play', 'toggle', [358, 40, 24, 24], {
    checkedcolor: [0.69, 0.75, 0.60, 1],
    presentation: 1, presentation_rect: [356, 38, 24, 24],
  }));
  add(box('bpmLabel', 'comment', [416, 18, 36, 18], {
    text: 'BPM', fontsize: 9, textcolor: [0.48, 0.52, 0.47, 1],
    presentation: 1, presentation_rect: [416, 17, 36, 18],
  }));
  add(box('bpm', 'flonum', [410, 40, 62, 24], {
    minimum: 30.0, maximum: 300.0,
    presentation: 1, presentation_rect: [408, 38, 62, 24],
  }));
  add(box('bpmLoad', 'newobj', [750, 18, 85, 22], { text: 'loadmess 120.' }));
  add(box('interval', 'newobj', [750, 46, 100, 22], { text: 'expr 60000./$f1/4.' }));
  add(box('metro', 'newobj', [750, 76, 70, 22], { text: 'metro 125' }));
  add(box('counter', 'newobj', [750, 106, 78, 22], { text: 'counter 0 15' }));
  add(box('stepSend', 'newobj', [750, 136, 76, 22], { text: 's flode.step' }));
  add(box('stepView', 'number', [494, 40, 42, 24], {
    presentation: 1, presentation_rect: [494, 38, 42, 24],
  }));
  add(box('stepLabel', 'comment', [492, 18, 42, 18], {
    text: 'STEP', fontsize: 9, textcolor: [0.48, 0.52, 0.47, 1],
    presentation: 1, presentation_rect: [492, 17, 42, 18],
  }));
  wire('bpmLoad', 0, 'bpm', 0);
  wire('bpm', 0, 'interval', 0);
  wire('interval', 0, 'metro', 1);
  wire('play', 0, 'metro', 0);
  wire('metro', 0, 'counter', 0);
  wire('counter', 0, 'stepSend', 0);
  wire('counter', 0, 'stepView', 0);

  add(box('masterLabel', 'comment', [580, 18, 70, 18], {
    text: 'MASTER', fontsize: 9, textcolor: [0.48, 0.52, 0.47, 1],
    presentation: 1, presentation_rect: [580, 17, 70, 18],
  }));
  add(box('master', 'flonum', [580, 40, 58, 24], {
    minimum: 0.0, maximum: 1.0,
    presentation: 1, presentation_rect: [580, 38, 58, 24],
  }));
  add(box('masterLoad', 'newobj', [858, 18, 79, 22], { text: 'loadmess 0.7' }));
  wire('masterLoad', 0, 'master', 0);
  add(box('audioLabel', 'comment', [680, 18, 48, 18], {
    text: 'AUDIO', fontsize: 9, textcolor: [0.48, 0.52, 0.47, 1],
    presentation: 1, presentation_rect: [680, 17, 48, 18],
  }));
  add(box('audio', 'ezdac~', [684, 39, 45, 25], {
    presentation: 1, presentation_rect: [682, 38, 45, 25],
  }));

  const positions = [
    [24, 92], [348, 92], [672, 92],
    [24, 294], [348, 294], [672, 294],
  ];
  for (let i = 0; i < 6; i++) {
    const id = `pod${i + 1}`;
    const [x, y] = positions[i];
    add(box(id, 'bpatcher', [x, y, 304, 184], {
      name: 'flode_pod.maxpat', args: [i + 1],
      numinlets: 0, numoutlets: 2, outlettype: ['signal', 'signal'],
      border: 0, clickthrough: 0, enablehscroll: 0, enablevscroll: 0,
      offset: [0, 0], lockeddragscroll: 0, viewvisibility: 1,
      presentation: 1, presentation_rect: [x, y, 304, 184],
    }));
  }

  add(box('masterL', 'newobj', [790, 520, 42, 22], { text: '*~ 0.7' }));
  add(box('masterR', 'newobj', [850, 520, 42, 22], { text: '*~ 0.7' }));
  add(box('clipL', 'newobj', [790, 552, 72, 22], { text: 'clip~ -1. 1.' }));
  add(box('clipR', 'newobj', [870, 552, 72, 22], { text: 'clip~ -1. 1.' }));
  add(box('meterL', 'meter~', [790, 586, 150, 12], {
    presentation: 1, presentation_rect: [24, 620, 470, 12],
  }));
  add(box('meterR', 'meter~', [790, 606, 150, 12], {
    presentation: 1, presentation_rect: [506, 620, 470, 12],
  }));
  for (let i = 1; i <= 6; i++) {
    wire(`pod${i}`, 0, 'masterL', 0);
    wire(`pod${i}`, 1, 'masterR', 0);
  }
  wire('master', 0, 'masterL', 1);
  wire('master', 0, 'masterR', 1);
  wire('masterL', 0, 'clipL', 0);
  wire('masterR', 0, 'clipR', 0);
  wire('clipL', 0, 'meterL', 0);
  wire('clipR', 0, 'meterR', 0);
  wire('clipL', 0, 'audio', 0);
  wire('clipR', 0, 'audio', 1);

  add(box('hint', 'comment', [24, 650, 500, 18], {
    text: 'Drop a sample into each pod · set steps · press PLAY · enable AUDIO',
    fontsize: 10, textcolor: [0.43, 0.47, 0.42, 1],
    presentation: 1, presentation_rect: [24, 645, 520, 18],
  }));

  return patcher([40, 50, 1040, 720], boxes, lines, [0, 0, 1024, 680]);
}

const project = {
  name: 'flode_core',
  version: 1,
  creationdate: 0,
  modificationdate: 0,
  viewrect: [0, 0, 320, 500],
  autoorganize: 0,
  hideprojectwindow: 0,
  showdependencies: 1,
  autolocalize: 1,
  contents: {
    patchers: {
      'flode_core.maxpat': { kind: 'patcher', local: 1, toplevel: 1 },
      'flode_pod.maxpat': { kind: 'patcher', local: 1 },
    },
  },
  layout: {},
  searchpath: {},
  detailsvisible: 1,
  readonly: 0,
  devpathtype: 0,
  devpath: '.',
  sortmode: 0,
  viewmode: 0,
};

fs.writeFileSync(path.join(outDir, 'flode_pod.maxpat'), JSON.stringify(makePod(), null, '\t') + '\n');
fs.writeFileSync(path.join(outDir, 'flode_core.maxpat'), JSON.stringify(makeMain(), null, '\t') + '\n');
fs.writeFileSync(path.join(outDir, 'flode_core.maxproj'), JSON.stringify(project, null, '\t') + '\n');

