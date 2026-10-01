// UI LAB 001: waveform-first Pod A design study. Max 9 v8ui.
// @arguments A header | waveform | slider <vol|pan|speed|jung|eq_low|eq_mid|eq_high>
// UI only: normalized requests, controller-owned values and cached real peaks.
autowatch = 1;
inlets = 1;
outlets = 1;
mgraphics.init();
mgraphics.relative_coords = 0;
mgraphics.autofill = 0;

const POD = String(jsarguments[1] || "A");
const KIND = String(jsarguments[2] || "waveform");
const CONTROL = String(jsarguments[3] || "vol");
const T = {
    canvas: [0.055, 0.067, 0.082, 1],
    panel: [0.078, 0.090, 0.106, 1],
    raised: [0.106, 0.122, 0.141, 1],
    line: [0.19, 0.22, 0.25, 1],
    text: [0.83, 0.87, 0.91, 1],
    dim: [0.43, 0.49, 0.55, 1],
    amber: [1, 0.66, 0, 1],
    cyan: [0.27, 0.79, 0.88, 1],
    acid: [0.82, 0.91, 0.24, 1],
    coral: [0.92, 0.46, 0.34, 1]
};
const state = {
    enabled: true, revision: -1, filename: "NO SAMPLE",
    value_norm: 0, display: "",
    loop_start: 0.12, loop_end: 0.78, min_loop: 0.02, playhead: 0,
    snap_points: [], peaks: [],
    peaks_ref: "", peaks_version: -1, ruler: [],
    start_display: "", length_display: "", end_display: "", position_display: ""
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
function label(value, x, y, size, color, numeric) {
    rgba(color || T.text);
    mgraphics.select_font_face(numeric ? "IBM Plex Mono" : "Jersey 10");
    mgraphics.set_font_size(numeric ? Math.max(12, size) : Math.max(14, size * 1.25));
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
    const d = dimensions(), w = d[0], h = d[1], p = Math.min(16, w * 0.025);
    layout = { w: w, h: h, p: p };
    if (KIND === "waveform") layout.wave = region(p, h * 0.07, w - 2 * p, h * 0.76);
    else if (KIND === "slider") {
        layout.track = region(p, h * 0.52, w - 2 * p, 2);
        layout.slider = region(p, h * 0.34, w - 2 * p, h * 0.42);
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
function paint() {
    const l = geometry();
    mgraphics.save();
    rect(0, 0, l.w, l.h, T.canvas);
    if (KIND === "header") drawHeader(l);
    else if (KIND === "waveform") drawWaveform(l);
    else if (KIND === "slider") drawSlider(l);
    if (!state.enabled) rect(0, 0, l.w, l.h, [0.055, 0.067, 0.082, 0.6]);
    mgraphics.restore();
}
function drawHeader(l) {
    label("POD " + POD, l.p, l.h * 0.62, Math.min(19, l.h * 0.35), T.text);
    const name = state.filename.length > 23 ? state.filename.slice(0, 20) + "…" : state.filename;
    label(name, l.w * 0.73, l.h * 0.62, 12, T.text);
    line(l.p, l.h - 2, l.w - l.p, l.h - 2, T.line);
}
function drawWaveform(l) {
    const r = l.wave, pair = shownLoop(), mid = r.y + r.h * 0.52;
    const sx = r.x + pair[0] * r.w, ex = r.x + pair[1] * r.w;
    rect(r.x, r.y, r.w, r.h, T.panel);
    if (state.peaks.length) {
        for (let i = 0; i < state.peaks.length / 2; i++) {
            const n = (i + 0.5) / (state.peaks.length / 2), x = r.x + n * r.w;
            const color = n < pair[0] ? [0.27, 0.79, 0.88, 0.65]
                : n > pair[1] ? [0.82, 0.91, 0.24, 0.60] : T.amber;
            line(x, mid - state.peaks[i * 2 + 1] * r.h * 0.39,
                x, mid - state.peaks[i * 2] * r.h * 0.39, color);
        }
    } else label("Drop audio below to see the waveform", r.x + r.w * 0.31, mid, 12, T.dim);
    state.ruler.forEach(function (text, i) {
        const x = r.x + i * r.w / 8;
        if (i) line(x, r.y, x, r.y + r.h, [0.19, 0.22, 0.25, 0.35]);
        label(text, x + 4, r.y + 14, 9, T.dim, true);
    });
    rect(sx, r.y, ex - sx, r.h, [1, 0.66, 0, 0.045]);
    [sx, ex].forEach(function (x) {
        line(x, r.y, x, r.y + r.h, T.amber, 1.25);
        rgba(T.amber); mgraphics.move_to(x - 4, r.y);
        mgraphics.line_to(x + 4, r.y); mgraphics.line_to(x, r.y + 6);
        mgraphics.close_path(); mgraphics.fill();
        rect(x - 4, r.y + r.h - 8, 8, 8, T.amber);
    });
    if (state.peaks.length) {
        const px = r.x + state.playhead * r.w;
        line(px, r.y + 16, px, r.y + r.h, T.text, 1.25);
        rgba(T.text); mgraphics.move_to(px - 4, r.y + r.h);
        mgraphics.line_to(px + 4, r.y + r.h); mgraphics.line_to(px, r.y + r.h - 6);
        mgraphics.close_path(); mgraphics.fill();
    }
    const ty = l.h * 0.95;
    label("POSITION", r.x, ty, 10, T.dim);
    label(state.position_display, r.x + 70, ty, 12, T.text, true);
    label("ACTIVE REGION", r.x + r.w * 0.40, ty, 10, T.dim);
    label(state.start_display + "  →  " + state.end_display, r.x + r.w * 0.54, ty, 12, T.text, true);
}
function drawSlider(l) {
    const r = l.track, value = shownValue(), eq = CONTROL.indexOf("eq_") === 0;
    const centered = eq || CONTROL === "pan";
    const color = CONTROL === "pan" || CONTROL === "eq_high" ? T.cyan
        : CONTROL === "speed" || CONTROL === "eq_mid" ? T.acid
        : CONTROL === "eq_low" ? T.coral : CONTROL === "jung" ? T.amber : T.text;
    if (eq) {
        // A very faint 2D fade, built from primitives shared by mgraphics and p5.
        const strength = 0.006 + Math.abs(value - 0.5) * 0.04;
        for (let row = 0; row < 8; row++) for (let column = 0; column < 20; column++) {
            const alpha = Math.sin(Math.PI * (row + 0.5) / 8)
                * Math.sin(Math.PI * (column + 0.5) / 20) * strength;
            rect(column * l.w / 20, row * l.h / 8, l.w / 20, l.h / 8,
                [color[0], color[1], color[2], alpha]);
        }
    }
    const name = eq ? CONTROL.slice(3).toUpperCase() : CONTROL.toUpperCase();
    label(name, l.p, l.h * 0.24, 11, T.dim);
    if (CONTROL !== "jung") label(shownDisplay(), l.w * 0.70, l.h * 0.24, 12, T.text, true);
    line(r.x, r.y, r.x + r.w, r.y, T.line, 1);
    const origin = centered ? r.x + r.w * 0.5 : r.x;
    line(origin, r.y, r.x + r.w * value, r.y, color, 1.5);
    if (centered) line(origin, r.y - 4, origin, r.y + 4, T.dim);
    rect(r.x + r.w * value - 2, r.y - 4, 4, 8, color);
    if (CONTROL === "jung") {
        label("STABLE", r.x, l.h * 0.92, 10, T.dim);
        label("RESTLESS", r.x + r.w - 58, l.h * 0.92, 10, T.dim);
    }
}
// All controller setters are silent. A revision rejects out-of-order echoes.
// Active gesture previews remain separate from the latest authoritative state.
function set(property) {
    const a = arrayfromargs(arguments).slice(1);
    const sequenced = ["value_norm", "loop", "playhead"];
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
    else if (property === "snap_points")
        state.snap_points = a.filter(finite).map(normalized).sort(function (x, y) { return x - y; });
    else if (property === "ruler") state.ruler = a.map(String);
    else if (["filename", "display", "start_display", "length_display", "end_display", "position_display"].indexOf(property) >= 0) {
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
    if (KIND === "slider" && inside(x, y, l.slider)) return "value";
    if (KIND === "waveform" && inside(x, y, l.wave)) {
        const r = l.wave, loop = shownLoop();
        const ds = Math.abs(x - (r.x + loop[0] * r.w));
        const de = Math.abs(x - (r.x + loop[1] * r.w));
        if (Math.min(ds, de) <= 9) return ds <= de ? "start" : "end";
        if (x >= r.x + loop[0] * r.w && x <= r.x + loop[1] * r.w) return "body";
    }
    return "";
}
function valueEvent(phase, value) { emit("control_" + phase, CONTROL, value); }
function onclick(x, y, but, cmd, shift) {
    const target = hit(x, y);
    if (!target || !but) return;
    if (target === "value") {
        // Relative movement always: pressing elsewhere on the track cannot jump a value.
        gesture = {type: "value", value: state.value_norm, display: state.display, lastX: x, lastY: y};
        valueEvent("begin", gesture.value);
    } else {
        gesture = {type: "loop", part: target, start: state.loop_start,
            end: state.loop_end, rawStart: state.loop_start, rawEnd: state.loop_end, lastX: x, lastY: y};
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
        const delta = (x - gesture.lastX) / layout.track.w;
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
    if (!state.enabled) return;
    if (KIND === "waveform" && inside(x, y, layout.wave)) emit("loop_reset_request");
    else if (KIND === "slider" && inside(x, y, layout.slider)) emit("control_reset_request", CONTROL);
}
function onresize() { gesture = null; mgraphics.redraw(); }
