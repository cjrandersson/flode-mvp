// flöde~ standalone UI demo controller. Max 9 v8.
// This preview owns UI state only; it never starts DSP or playback.
// Usage: v8 flode_ui_demo_controller.js @arguments #0.ui.preview A

autowatch = 1;
inlets = 1;
outlets = 2;
const BUFFER_NAME = String(jsarguments[1] || "flode.ui.preview");
const POD = String(jsarguments[2] || "A");
const CACHE_NAME = BUFFER_NAME + ".peaks";
const cache = new Dict(CACHE_NAME);
let peakVersion = 0;
let revision = 0;
let duration = 0;
let pendingFilename = "";
let model = {};
function clamp(value, low, high) { return Math.max(low, Math.min(high, value)); }
function norm(value) { return clamp(Number(value), 0, 1); }
function finite(value) { return Number.isFinite(Number(value)); }
function send(component, property) {
    outlet(0, [component, "set", property].concat(arrayfromargs(arguments).slice(2)));
}
function loopDisplay() {
    const convert = duration > 0
        ? function (v) { return (v * duration / 1000).toFixed(3) + " s"; }
        : function (v) { return (v * 100).toFixed(1) + " %"; };
    send("waveform", "loop", model.loop_start, model.loop_end, revision);
    send("waveform", "start_display", convert(model.loop_start));
    send("waveform", "length_display", convert(model.loop_end - model.loop_start));
    send("waveform", "end_display", convert(model.loop_end));
}
function controlDisplay(key) {
    if (key === "jung" || key === "jitter") {
        send(key, "value_norm", model[key], revision);
        send(key, "display", Math.round(model[key] * 100) + " %", revision, model[key]);
    } else if (key === "slice") {
        send("slice", "value_norm", model.slice, revision);
        send("slice", "display", Math.round(model.slice * 100) + " %", revision, model.slice);
    } else if (key === "speed") {
        send("speed", "value_norm", model.speed, revision);
        send("speed", "display", (0.25 + model.speed * 3.75).toFixed(2) + " ×", revision, model.speed);
    }
}
function reset() {
    revision++;
    duration = 0;
    pendingFilename = "";
    model = { jung: 0.43, jitter: 0.12, slice: 0.72, speed: 0.20,
        loop_start: 0.12, loop_end: 0.78, mute: 0, solo: 0,
        looper_mode: "on", timing_mode: "sync" };
    cache.set("peaks", []);
    peakVersion++;
    send("header", "filename", "No audio loaded");
    send("header", "mute", 0, revision);
    send("header", "solo", 0, revision);
    send("waveform", "peaks", CACHE_NAME, peakVersion);
    send("waveform", "min_loop", 0.02);
    send("waveform", "playhead", 0, revision);
    send("waveform", "markers");
    send("waveform", "snap_points", 0, 1);
    send("waveform", "selected_slice", -1, revision);
    send("waveform", "ruler");
    send("modes", "looper_mode", "on", revision);
    send("modes", "timing_mode", "sync", revision);
    send("modes", "mode_display", "Transients");
    ["jung", "jitter", "slice", "speed"].forEach(controlDisplay);
    loopDisplay();
}
// All component events come here after their POD identity has been prepended.
function pod(id, event) {
    if (String(id) !== POD) return;
    const args = arrayfromargs(arguments).slice(2);
    outlet(1, ["pod", id, event].concat(args));
    const match = /^(jung|jitter)_(begin|change|commit)$/.exec(String(event));
    if (match) {
        if (match[2] === "begin" || !finite(args[0])) return;
        model[match[1]] = norm(args[0]); revision++;
        controlDisplay(match[1]); return;
    }
    if (/^stepper_(begin|change|commit)$/.test(String(event))) {
        const key = String(args[0]);
        if (event === "stepper_begin" || ["slice", "speed"].indexOf(key) < 0 || !finite(args[1])) return;
        model[key] = norm(args[1]); revision++;
        controlDisplay(key); return;
    }
    if (event === "loop_change" || event === "loop_commit") {
        if (!finite(args[0]) || !finite(args[1])) return;
        model.loop_start = clamp(Number(args[0]), 0, 0.98);
        model.loop_end = clamp(Number(args[1]), model.loop_start + 0.02, 1);
        revision++; loopDisplay(); return;
    }
    if (event === "loop_reset_request") {
        model.loop_start = 0; model.loop_end = 1;
        revision++; loopDisplay(); return;
    }
    if (event === "mute_request" || event === "solo_request") {
        if (Number(args[0]) !== 0 && Number(args[0]) !== 1) return;
        const key = event === "mute_request" ? "mute" : "solo";
        model[key] = Number(args[0]); revision++;
        send("header", key, model[key], revision); return;
    }
    if (event === "mode") {
        const key = String(args[0]), value = String(args[1]);
        const allowed = key === "looper_mode" ? ["on", "once"]
            : key === "timing_mode" ? ["sync", "free"] : [];
        if (allowed.indexOf(value) < 0) return;
        model[key] = value; revision++;
        send("modes", key, value, revision); return;
    }
    if (event === "slice_select" && finite(args[0])) {
        revision++;
        send("waveform", "selected_slice", Math.floor(Number(args[0])), revision);
    }
}
function filename() { pendingFilename = arrayfromargs(arguments).map(String).join(" "); }
// Called by a deferred native buffer~ completion bang, never by a UI paint/gesture.
// Cache all min/max columns once, merging channels. No DSP/transport is created.
function refresh() {
    try {
        const buffer = new Buffer(BUFFER_NAME);
        const frames = buffer.framecount(), channels = buffer.channelcount();
        if (!frames || !channels) return;
        const columns = Math.min(512, frames), peaks = [];
        for (let bin = 0; bin < columns; bin++) {
            const start = Math.floor(bin * frames / columns);
            const end = Math.floor((bin + 1) * frames / columns);
            let minimum = 1, maximum = -1;
            for (let channel = 1; channel <= channels; channel++) {
                const raw = buffer.peek(channel, start, end - start);
                const samples = typeof raw === "number" ? [raw] : raw;
                for (let i = 0; i < samples.length; i++) {
                    const sample = Number(samples[i]);
                    if (!Number.isFinite(sample)) continue;
                    minimum = Math.min(minimum, sample);
                    maximum = Math.max(maximum, sample);
                }
            }
            if (minimum > maximum) { minimum = 0; maximum = 0; }
            peaks.push(clamp(minimum, -1, 1), clamp(maximum, -1, 1));
        }
        duration = buffer.length();
        if (!Number.isFinite(duration) || duration < 0) duration = 0;
        cache.set("peaks", peaks); peakVersion++; revision++;
        const path = pendingFilename.replace(/\\/g, "/");
        send("header", "filename", path.slice(path.lastIndexOf("/") + 1) || "Loaded audio");
        send("waveform", "peaks", CACHE_NAME, peakVersion);
        send("waveform", "playhead", 0, revision);
        const ruler = [];
        for (let i = 0; i < 8; i++) ruler.push((duration * i / 8000).toFixed(2) + "s");
        send.apply(null, ["waveform", "ruler"].concat(ruler));
        loopDisplay();
    } catch (error) {
        outlet(1, ["preview_error", String(error.message)]);
        post("flode UI preview: " + error.message + "\n");
    }
}
// Optional controller inputs for testing authoritative state and manual markers.
function playhead(value) {
    if (!finite(value)) return;
    revision++; send("waveform", "playhead", norm(value), revision);
}
function markers() {
    const values = arrayfromargs(arguments).filter(finite).map(norm)
        .sort(function (a, b) { return a - b; });
    send.apply(null, ["waveform", "markers"].concat(values));
    send.apply(null, ["waveform", "snap_points", 0].concat(values, [1]));
}
