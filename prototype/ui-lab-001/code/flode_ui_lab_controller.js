// UI LAB 001 visual-state controller. No audio, EQ, JUNG or timing behavior.
// @arguments #0.ui.lab A
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
const DEFAULTS = {vol: 0.80, pan: 0.50, speed: 0.20, jung: 0.30,
    eq_low: 0.50, eq_mid: 0.50, eq_high: 0.50};

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
    send("waveform", "position_display", convert(model.playhead));
}
function controlDisplay(key) {
    let display = "";
    if (key === "vol") display = model.vol === 0 ? "−∞ dB" : (20 * Math.log10(model.vol)).toFixed(1) + " dB";
    else if (key === "pan") {
        const pan = model.pan * 2 - 1;
        display = Math.abs(pan) < 0.005 ? "C" : (pan < 0 ? "L " : "R ") + Math.round(Math.abs(pan) * 100) + " %";
    } else if (key === "speed") display = (0.25 + model.speed * 3.75).toFixed(2) + " ×";
    else if (key.indexOf("eq_") === 0) {
        let db = (model[key] - 0.5) * 24;
        if (Math.abs(db) < 0.05) db = 0;
        display = (db > 0 ? "+" : "") + db.toFixed(1) + " dB";
    }
    // JUNG uses only STABLE/RESTLESS endpoint labels, never internal probabilities.
    send(key, "value_norm", model[key], revision);
    send(key, "display", display, revision, model[key]);
}
function reset() {
    revision++; duration = 0; pendingFilename = "";
    model = {loop_start: 0.12, loop_end: 0.78, playhead: 0.32};
    Object.keys(DEFAULTS).forEach(function (key) { model[key] = DEFAULTS[key]; });
    cache.set("peaks", []); peakVersion++;
    send("header", "filename", "NO SAMPLE");
    send("waveform", "peaks", CACHE_NAME, peakVersion);
    send("waveform", "min_loop", 0.02);
    send("waveform", "playhead", model.playhead, revision);
    send("waveform", "snap_points", 0, 1);
    send("waveform", "ruler");
    Object.keys(DEFAULTS).forEach(controlDisplay);
    loopDisplay();
}
// All component events come here after their POD identity has been prepended.
function pod(id, event) {
    if (String(id) !== POD) return;
    const args = arrayfromargs(arguments).slice(2);
    outlet(1, ["pod", id, event].concat(args));
    if (event === "control_begin" || event === "loop_begin") return;
    if (event === "control_change" || event === "control_commit") {
        const key = String(args[0]);
        if (!Object.prototype.hasOwnProperty.call(DEFAULTS, key) || !finite(args[1])) return;
        model[key] = norm(args[1]); revision++; controlDisplay(key); return;
    }
    if (event === "control_reset_request") {
        const key = String(args[0]);
        if (!Object.prototype.hasOwnProperty.call(DEFAULTS, key)) return;
        model[key] = DEFAULTS[key]; revision++; controlDisplay(key); return;
    }
    if (event === "loop_change" || event === "loop_commit") {
        if (!finite(args[0]) || !finite(args[1])) return;
        model.loop_start = clamp(Number(args[0]), 0, 0.98);
        model.loop_end = clamp(Number(args[1]), model.loop_start + 0.02, 1);
        revision++; loopDisplay(); return;
    }
    if (event === "loop_reset_request") {
        model.loop_start = 0; model.loop_end = 1; revision++; loopDisplay();
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
        const name = path.slice(path.lastIndexOf("/") + 1) || "Loaded audio";
        send("header", "filename", /^apache\b/i.test(name) ? "APACHE" : name);
        outlet(1, ["sample", POD, name]);
        send("waveform", "peaks", CACHE_NAME, peakVersion);
        send("waveform", "playhead", model.playhead, revision);
        const ruler = [];
        for (let i = 0; i < 8; i++) ruler.push((duration * i / 8000).toFixed(2) + "s");
        send.apply(null, ["waveform", "ruler"].concat(ruler));
        loopDisplay();
    } catch (error) {
        outlet(1, ["preview_error", String(error.message)]);
        post("flode UI preview: " + error.message + "\n");
    }
}
function playhead(value) {
    if (!finite(value)) return;
    model.playhead = norm(value); revision++;
    send("waveform", "playhead", model.playhead, revision); loopDisplay();
}
// This minimal lab has no slicing interface; generic browser hosts may call this no-op.
function markers() {}
