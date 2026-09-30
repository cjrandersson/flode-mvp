// flöde~ Pod A UI prototype. Max 9 v8ui.
// Usage: v8ui flode_ui_component.js @arguments A waveform
// Components: header, waveform, jung, jitter, stepper <slice|speed>, modes.
// Persistent state arrives through silent "set" messages; gestures emit semantic requests.

autowatch = 1;
inlets = 1;
outlets = 1;
mgraphics.init();
mgraphics.relative_coords = 0;
mgraphics.autofill = 0;

const POD = String(jsarguments[1] || "A");
const KIND = String(jsarguments[2] || "waveform");
const CONTROL = String(jsarguments[3] || "slice");
const T = {
    canvas: [0.055, 0.067, 0.082, 1],
    panel: [0.078, 0.090, 0.106, 1],
    raised: [0.106, 0.122, 0.141, 1],
    line: [0.19, 0.22, 0.25, 1],
    text: [0.83, 0.87, 0.91, 1],
    dim: [0.43, 0.49, 0.55, 1],
    amber: [1, 0.66, 0, 1],
    cyan: [0.27, 0.79, 0.88, 1]
};
const state = {
    enabled: true, revision: -1, filename: "No audio loaded", mute: 0, solo: 0,
    value_norm: 0, display: "", looper_mode: "on", timing_mode: "sync",
    loop_start: 0.12, loop_end: 0.78, min_loop: 0.02, playhead: 0,
    markers: [], snap_points: [], selected_slice: -1, peaks: [],
    peaks_ref: "", peaks_version: -1, ruler: [],
    start_display: "", length_display: "", end_display: "", mode_display: "Transients"
};
let gesture = null;
let hover = "";
let layout = {};

function bounded(v, low, high) { return Math.max(low, Math.min(high, v)); }
function normalized(v) { return bounded(Number(v), 0, 1); }
function finite(v) { return Number.isFinite(Number(v)); }
function rgba(color) { mgraphics.set_source_rgba(color); }
function rect(x, y, w, h, color, outline) {
    rgba(color);
    mgraphics.rectangle(x, y, Math.max(0, w), Math.max(0, h));
    if (outline) { mgraphics.set_line_width(1); mgraphics.stroke(); }
    else mgraphics.fill();
}
function line(x1, y1, x2, y2, color, weight) {
    rgba(color); mgraphics.set_line_width(weight || 1);
    mgraphics.move_to(x1, y1); mgraphics.line_to(x2, y2); mgraphics.stroke();
}
function label(value, x, y, size, color) {
    rgba(color || T.text);
    mgraphics.select_font_face("Arial");
    mgraphics.set_font_size(size);
    mgraphics.move_to(x, y); mgraphics.show_text(String(value));
}
function inside(x, y, r) {
    return r && x >= r.x && x <= r.x + r.w && y >= r.y && y <= r.y + r.h;
}
function region(x, y, w, h) { return { x: x, y: y, w: w, h: h }; }
function dimensions() {
    const r = box.rect;
    return [Math.max(1, r[2] - r[0]), Math.max(1, r[3] - r[1])];
}
function geometry() {
    const d = dimensions(), w = d[0], h = d[1];
    const p = Math.min(w, h) * 0.12;
    layout = { w: w, h: h, p: p };
    if (KIND === "header") {
        const u = w / 920;
        layout.mute = region(w * 0.49, h * 0.23, 30 * u, h * 0.54);
        layout.solo = region(w * 0.53, h * 0.23, 30 * u, h * 0.54);
        layout.disabled = [
            region(w * 0.65, h * 0.23, w * 0.10, h * 0.54),
            region(w * 0.77, h * 0.23, w * 0.10, h * 0.54),
            region(w * 0.89, h * 0.23, w * 0.10, h * 0.54)
        ];
    } else if (KIND === "waveform") {
        layout.wave = region(p, h * 0.09, w - 2 * p, h * 0.75);
    } else if (KIND === "jung" || KIND === "jitter") {
        layout.track = region(p, h * 0.54, w - 2 * p, h * 0.18);
        layout.slider = region(p, h * 0.37, w - 2 * p, h * 0.50);
    } else if (KIND === "stepper") {
        layout.field = region(w * 0.34, h * 0.16, w * 0.63, h * 0.68);
        layout.minus = region(w * 0.34, h * 0.16, w * 0.12, h * 0.68);
        layout.plus = region(w * 0.85, h * 0.16, w * 0.12, h * 0.68);
    } else if (KIND === "modes") {
        layout.buttons = [
            region(w * 0.10, h * 0.14, w * 0.075, h * 0.72),
            region(w * 0.18, h * 0.14, w * 0.075, h * 0.72),
            region(w * 0.37, h * 0.14, w * 0.075, h * 0.72),
            region(w * 0.45, h * 0.14, w * 0.075, h * 0.72)
        ];
    }
    return layout;
}
function shownValue() {
    return gesture && gesture.type === "value" ? gesture.value : state.value_norm;
}
function shownDisplay() {
    return gesture && gesture.type === "value" ? gesture.display : state.display;
}
function shownLoop() {
    return gesture && gesture.type === "loop"
        ? [gesture.start, gesture.end] : [state.loop_start, state.loop_end];
}
function emit() {
    const args = arrayfromargs(arguments);
    outlet(0, ["pod", POD].concat(args));
}
function button(r, text, active, key, disabled) {
    const highlighted = !disabled && (hover === key || (gesture && gesture.button === key));
    rect(r.x, r.y, r.w, r.h, highlighted ? T.raised : T.panel);
    rect(r.x, r.y, r.w, r.h, active && !disabled ? T.amber : T.line, true);
    label(text, r.x + r.w * 0.17, r.y + r.h * 0.65,
        Math.min(12, r.h * 0.40), disabled ? T.dim : active ? T.amber : T.text);
}
function paint() {
    const l = geometry();
    mgraphics.save();
    rect(0, 0, l.w, l.h, T.canvas);
    if (KIND === "header") drawHeader(l);
    else if (KIND === "waveform") drawWaveform(l);
    else if (KIND === "jung" || KIND === "jitter") drawSlider(l);
    else if (KIND === "stepper") drawStepper(l);
    else if (KIND === "modes") drawModes(l);
    else label("Unknown component: " + KIND, l.p, l.h * 0.6, 11, T.dim);
    if (!state.enabled) rect(0, 0, l.w, l.h, [0.055, 0.067, 0.082, 0.60]);
    mgraphics.restore();
}
function drawHeader(l) {
    const scale = Math.min(l.w / 920, l.h / 54);
    label("flöde~", l.w * 0.012, l.h * 0.64, 20 * scale, T.text);
    label(POD, l.w * 0.115, l.h * 0.74, 34 * scale, T.amber);
    const text = state.filename.length > 34 ? state.filename.slice(0, 31) + "…" : state.filename;
    label(text, l.w * 0.175, l.h * 0.62, 13 * scale, T.text);
    button(l.mute, "M", state.mute, "mute", false);
    button(l.solo, "S", state.solo, "solo", false);
    ["INPUT", "LOAD", "DISK"].forEach(function (text, i) {
        button(l.disabled[i], text, false, "", true);
    });
    line(0, l.h - 1, l.w, l.h - 1, T.line);
}
function drawWaveform(l) {
    const r = l.wave, pair = shownLoop(), mid = r.y + r.h * 0.52;
    const sx = r.x + pair[0] * r.w, ex = r.x + pair[1] * r.w;
    // Fixed drawing order: background, peaks, grid, fill, boundaries,
    // triangles, handles, selected slice, playhead.
    rect(r.x, r.y, r.w, r.h, T.panel);
    if (state.peaks.length) {
        for (let i = 0; i < state.peaks.length / 2; i++) {
            const n = (i + 0.5) / (state.peaks.length / 2);
            const x = r.x + n * r.w;
            const color = n >= pair[0] && n <= pair[1] ? T.amber : [0.42, 0.32, 0.14, 1];
            line(x, mid - state.peaks[i * 2 + 1] * r.h * 0.40,
                x, mid - state.peaks[i * 2] * r.h * 0.40, color);
        }
    } else label("Drop audio below to preview its waveform", r.x + r.w * 0.31,
        mid, Math.min(13, l.h * 0.05), T.dim);
    for (let i = 1; i < 8; i++)
        line(r.x + i * r.w / 8, r.y, r.x + i * r.w / 8, r.y + r.h, [0.19, 0.22, 0.25, 0.5]);
    state.ruler.forEach(function (text, i) {
        label(text, r.x + i * r.w / 8 + 4, r.y + 12, 9, T.dim);
    });
    // Dashed controller-supplied slice markers are part of the grid pass.
    state.markers.forEach(function (n) {
        const x = r.x + n * r.w;
        for (let y = r.y + 19; y < r.y + r.h - 12; y += 8)
            line(x, y, x, Math.min(y + 3, r.y + r.h - 12), [1, 0.66, 0, 0.40]);
    });
    rect(sx, r.y, ex - sx, r.h, [1, 0.66, 0, 0.075]);
    [sx, ex].forEach(function (x) {
        line(x, r.y, x, r.y + r.h, T.amber, 1.5);
    });
    [sx, ex].forEach(function (x) {
        rgba(T.amber); mgraphics.move_to(x - 5, r.y);
        mgraphics.line_to(x + 5, r.y); mgraphics.line_to(x, r.y + 7);
        mgraphics.close_path(); mgraphics.fill();
    });
    [sx, ex].forEach(function (x) {
        rect(x - 5, r.y + r.h - 10, 10, 10, T.amber);
    });
    const selected = state.markers[state.selected_slice];
    if (finite(selected))
        line(r.x + selected * r.w, r.y + 17, r.x + selected * r.w, r.y + r.h - 12, T.cyan, 1.5);
    if (state.peaks.length)
        line(r.x + state.playhead * r.w, r.y, r.x + state.playhead * r.w, r.y + r.h, T.text);
    const ty = l.h * 0.95;
    label("START", r.x, ty, 10, T.dim);
    label(state.start_display, r.x + r.w * 0.07, ty, 11, T.text);
    label("LOOP LENGTH", r.x + r.w * 0.38, ty, 10, T.dim);
    label(state.length_display, r.x + r.w * 0.49, ty, 11, T.text);
    label("END", r.x + r.w * 0.80, ty, 10, T.dim);
    label(state.end_display, r.x + r.w * 0.85, ty, 11, T.text);
}
function drawSlider(l) {
    const r = l.track, color = KIND === "jitter" ? T.cyan : T.amber;
    label(KIND === "jitter" ? "JITTER" : "RANDOM / JUNG", l.p, l.h * 0.28, 11, T.dim);
    label(shownDisplay(), l.w * 0.88, l.h * 0.28, 11, color);
    rect(r.x, r.y, r.w, r.h, T.panel);
    rect(r.x, r.y, r.w, r.h, T.line, true);
    rect(r.x + 1, r.y + 1, Math.max(0, (r.w - 2) * shownValue()), r.h - 2, color);
    rect(r.x + shownValue() * (r.w - 4), r.y - 3, 4, r.h + 6, color);
}
function drawStepper(l) {
    label(CONTROL.toUpperCase(), l.w * 0.035, l.h * 0.61, 11, T.dim);
    rect(l.field.x, l.field.y, l.field.w, l.field.h, T.panel);
    rect(l.field.x, l.field.y, l.field.w, l.field.h, T.line, true);
    label(shownDisplay(), l.w * 0.49, l.h * 0.61, 14, T.text);
    label("−", l.w * 0.375, l.h * 0.60, 15, T.dim);
    label("+", l.w * 0.888, l.h * 0.60, 15, T.dim);
}
function drawModes(l) {
    label("LOOPER", l.w * 0.012, l.h * 0.61, 10, T.dim);
    label("TIMING", l.w * 0.29, l.h * 0.61, 10, T.dim);
    ["ON", "ONCE", "SYNC", "FREE"].forEach(function (text, i) {
        const active = i < 2 ? state.looper_mode === text.toLowerCase()
            : state.timing_mode === text.toLowerCase();
        button(l.buttons[i], text, active, String(i), false);
    });
    label("MODE:", l.w * 0.67, l.h * 0.61, 10, T.dim);
    label(state.mode_display, l.w * 0.74, l.h * 0.61, 12, T.cyan);
}
// All controller setters are silent. A revision rejects out-of-order echoes.
// Active gesture previews remain separate from the latest authoritative state.
function set(property) {
    const a = arrayfromargs(arguments).slice(1);
    const sequenced = ["value_norm", "loop", "mute", "solo", "looper_mode", "timing_mode", "selected_slice", "playhead"];
    const payload = property === "loop" ? 2 : 1;
    if (sequenced.indexOf(property) >= 0 && a.length > payload) {
        const revision = Number(a[payload]);
        if (!Number.isFinite(revision) || revision < state.revision) return;
        state.revision = revision;
    }
    if (property === "display" && a.length === 3 && finite(a[1]) && finite(a[2])) {
        const revision = Number(a[1]);
        if (revision < state.revision) return;
        state.revision = revision;
        state.display = String(a[0]);
        if (gesture && gesture.type === "value" && Math.abs(Number(a[2]) - gesture.value) < 1e-8)
            gesture.display = state.display;
    } else if (property === "value_norm" && finite(a[0])) state.value_norm = normalized(a[0]);
    else if (property === "loop" && finite(a[0]) && finite(a[1])) {
        state.loop_start = bounded(Number(a[0]), 0, 1 - state.min_loop);
        state.loop_end = bounded(Number(a[1]), state.loop_start + state.min_loop, 1);
    } else if (property === "min_loop" && finite(a[0])) {
        state.min_loop = bounded(Number(a[0]), 0.001, 1);
        state.loop_start = Math.min(state.loop_start, 1 - state.min_loop);
        state.loop_end = Math.max(state.loop_end, state.loop_start + state.min_loop);
    } else if (property === "playhead" && finite(a[0])) state.playhead = normalized(a[0]);
    else if (property === "mute" || property === "solo") state[property] = Number(a[0]) === 1 ? 1 : 0;
    else if (property === "looper_mode" && ["on", "once"].indexOf(String(a[0])) >= 0)
        state.looper_mode = String(a[0]);
    else if (property === "timing_mode" && ["sync", "free"].indexOf(String(a[0])) >= 0)
        state.timing_mode = String(a[0]);
    else if (property === "selected_slice" && finite(a[0])) state.selected_slice = Math.floor(Number(a[0]));
    else if (property === "markers" || property === "snap_points")
        state[property] = a.filter(finite).map(normalized).sort(function (x, y) { return x - y; });
    else if (property === "ruler") state.ruler = a.map(String);
    else if (["filename", "display", "start_display", "length_display", "end_display", "mode_display"].indexOf(property) >= 0) {
        state[property] = a.map(String).join(" ");
        if (property === "display" && gesture && gesture.type === "value") gesture.display = state.display;
    }
    else if (property === "peaks_ref") state.peaks_ref = String(a[0]);
    else if (property === "peaks_version") updatePeaks(state.peaks_ref, Number(a[0]));
    else if (property === "peaks") updatePeaks(String(a[0]), Number(a[1]));
    mgraphics.redraw();
}
function updatePeaks(reference, version) {
    if (!Number.isInteger(version) || version <= state.peaks_version) return;
    try {
        const data = new Dict(reference).get("peaks");
        const peaks = data === null ? [] : Array.isArray(data) ? data : [data];
        if (peaks.length % 2 || peaks.length > 8192) return;
        if (!peaks.every(function (v) { return finite(v) && Number(v) >= -1 && Number(v) <= 1; })) return;
        for (let i = 0; i < peaks.length; i += 2) if (peaks[i] > peaks[i + 1]) return;
        state.peaks = peaks.map(Number);
        state.peaks_ref = reference; state.peaks_version = version;
    } catch (error) { post("flode UI peak cache: " + error.message + "\n"); }
}
function enable(value) {
    state.enabled = Number(value) === 1;
    if (!state.enabled) { gesture = null; hover = ""; }
    mgraphics.redraw();
}
function hit(x, y) {
    const l = geometry();
    if (!state.enabled) return "";
    if (KIND === "header") {
        if (inside(x, y, l.mute)) return "mute";
        if (inside(x, y, l.solo)) return "solo";
    } else if ((KIND === "jung" || KIND === "jitter") && inside(x, y, l.slider)) return "value";
    else if (KIND === "stepper" && inside(x, y, l.field)) return "value";
    else if (KIND === "modes") {
        for (let i = 0; i < l.buttons.length; i++) if (inside(x, y, l.buttons[i])) return String(i);
    } else if (KIND === "waveform" && inside(x, y, l.wave)) {
        const r = l.wave, loop = shownLoop();
        const ds = Math.abs(x - (r.x + loop[0] * r.w)), de = Math.abs(x - (r.x + loop[1] * r.w));
        // Closest endpoint wins even when handles overlap at small sizes.
        if (Math.min(ds, de) <= 9) return ds <= de ? "start" : "end";
        let nearest = -1, distance = 7;
        state.markers.forEach(function (n, i) {
            const d = Math.abs(x - (r.x + n * r.w));
            if (d < distance) { nearest = i; distance = d; }
        });
        if (nearest >= 0) return "slice:" + nearest;
        if (x >= r.x + loop[0] * r.w && x <= r.x + loop[1] * r.w) return "body";
    }
    return "";
}
function valueEvent(phase, value) {
    if (KIND === "stepper") emit("stepper_" + phase, CONTROL, value);
    else emit(KIND + "_" + phase, value);
}
function onclick(x, y, but, cmd, shift) {
    const target = hit(x, y);
    if (!target || !but) return;
    if (target === "mute" || target === "solo") {
        gesture = { type: "button", button: target };
        emit(target + "_request", state[target] ? 0 : 1);
    } else if (KIND === "modes") {
        const i = Number(target);
        gesture = { type: "button", button: target };
        emit("mode", i < 2 ? "looper_mode" : "timing_mode", ["on", "once", "sync", "free"][i]);
    } else if (target.indexOf("slice:") === 0) {
        emit("slice_select", Number(target.slice(6)));
    } else if (target === "value") {
        gesture = { type: "value", value: state.value_norm, display: state.display, lastX: x, lastY: y };
        valueEvent("begin", gesture.value);
        if (KIND === "stepper") {
            if (inside(x, y, layout.minus)) gesture.value = normalized(gesture.value - (shift ? 0.001 : 0.01));
            else if (inside(x, y, layout.plus)) gesture.value = normalized(gesture.value + (shift ? 0.001 : 0.01));
        } else if (!shift) gesture.value = normalized((x - layout.track.x) / layout.track.w);
        valueEvent("change", gesture.value);
    } else {
        gesture = { type: "loop", part: target, start: state.loop_start,
            end: state.loop_end, rawStart: state.loop_start, rawEnd: state.loop_end, lastX: x, lastY: y };
        emit("loop_begin", gesture.start, gesture.end);
    }
    mgraphics.redraw();
}
function snap(value, shift) {
    if (shift) return value;
    let result = value, distance = 8 / layout.wave.w;
    state.snap_points.forEach(function (point) {
        if (Math.abs(point - value) < distance) { result = point; distance = Math.abs(point - value); }
    });
    return result;
}
function ondrag(x, y, but, cmd, shift) {
    if (!gesture) return;
    if (!but) { finish(); return; }
    geometry();
    if (gesture.type === "value") {
        const dx = x - gesture.lastX, dy = gesture.lastY - y;
        const delta = KIND === "stepper" ? dy / Math.max(80, layout.h * 2) : dx / layout.track.w;
        gesture.value = normalized(gesture.value + delta * (shift ? 0.1 : 1));
        valueEvent("change", gesture.value);
    } else if (gesture.type === "loop") {
        const delta = (x - gesture.lastX) / layout.wave.w;
        if (gesture.part === "start") {
            gesture.rawStart = bounded(gesture.rawStart + delta, 0, gesture.end - state.min_loop);
            gesture.start = bounded(snap(gesture.rawStart, shift), 0, gesture.end - state.min_loop);
        } else if (gesture.part === "end") {
            gesture.rawEnd = bounded(gesture.rawEnd + delta, gesture.start + state.min_loop, 1);
            gesture.end = bounded(snap(gesture.rawEnd, shift), gesture.start + state.min_loop, 1);
        } else {
            const length = gesture.end - gesture.start;
            gesture.rawStart = bounded(gesture.rawStart + delta, 0, 1 - length);
            gesture.start = bounded(snap(gesture.rawStart, shift), 0, 1 - length);
            gesture.end = gesture.start + length;
        }
        emit("loop_change", gesture.start, gesture.end);
    }
    gesture.lastX = x; gesture.lastY = y;
    mgraphics.redraw();
}
function finish() {
    if (!gesture) return;
    if (gesture.type === "value") valueEvent("commit", gesture.value);
    else if (gesture.type === "loop") emit("loop_commit", gesture.start, gesture.end);
    gesture = null; mgraphics.redraw();
}
function onrelease() { finish(); }
function onidle(x, y) {
    const next = hit(x, y);
    if (next !== hover) { hover = next; mgraphics.redraw(); }
}
function onidleout() { hover = ""; mgraphics.redraw(); }
function ondblclick(x, y) {
    geometry();
    if (state.enabled && KIND === "waveform" && inside(x, y, layout.wave))
        emit("loop_reset_request");
}
function onresize() { gesture = null; mgraphics.redraw(); }
