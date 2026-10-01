/* Browser-only UI harness. All drawings and gestures run the existing Max scripts. */
(function () {
    "use strict";
    const status = document.getElementById("status");
    const events = document.getElementById("events");
    const upload = document.getElementById("audio-file");
    const drop = document.getElementById("drop-audio");
    let view = null, request = 0;
    const messages = [];
    function notice(message) { status.textContent = message; }
    function event(message) {
        messages.unshift(message.map(String).join(" "));
        messages.length = Math.min(messages.length, 40);
        events.textContent = messages.join("\n");
    }
    async function readSource(path) {
        const response = await fetch(path, {cache: "no-store"});
        if (!response.ok) throw new Error("Cannot load " + path + " (HTTP " + response.status + ")");
        return response.text();
    }
    async function load(file) {
        if (!file || !view) return;
        const current = ++request;
        const AudioContext = window.AudioContext || window.webkitAudioContext;
        if (!AudioContext) { notice("This browser cannot decode audio for the preview."); return; }
        let context;
        notice("Loading " + file.name + "…");
        try {
            context = new AudioContext();
            const audio = await context.decodeAudioData(await file.arrayBuffer());
            if (current !== request) return;
            view.loadDecodedAudio(audio, file.name);
            notice(file.name + " — waveform loaded. This preview does not play audio.");
        } catch (error) {
            if (current === request) notice("Could not load audio: " + error.message);
        } finally {
            if (context) {
                try { await context.close(); } catch (error) { /* Context may already be closed. */ }
            }
        }
    }
    upload.addEventListener("change", function () {
        load(upload.files[0]); upload.value = "";
    });
    // File selection belongs to the host harness, outside the shared UI component.
    ["dragenter", "dragover"].forEach(type => drop.addEventListener(type, function (event) {
        event.preventDefault(); drop.classList.add("dragover");
    }));
    drop.addEventListener("dragleave", () => drop.classList.remove("dragover"));
    drop.addEventListener("drop", function (event) {
        event.preventDefault(); drop.classList.remove("dragover");
        load(event.dataTransfer.files[0]);
    });
    document.getElementById("reset").addEventListener("click", function () {
        request++;
        if (view) view.reset();
        notice("No audio loaded. Drop a WAV or AIFF on the strip.");
    });
    async function start() {
        try {
            if (typeof p5 !== "function" || typeof FlodeP5Bridge === "undefined")
                throw new Error("The p5.js dependency did not load.");
            const sources = await Promise.all([
                readSource("../max9-pod-a/code/flode_ui_component.js"),
                readSource("../max9-pod-a/code/flode_ui_demo_controller.js")
            ]);
            new p5(function (p) {
                let pending = false, pointer = null;
                function invalidate() {
                    if (pending) return;
                    pending = true;
                    requestAnimationFrame(function () {
                        pending = false;
                        if (view) p.redraw();
                    });
                }
                p.setup = function () {
                    const canvas = p.createCanvas(960, 600);
                    canvas.parent("canvas-host");
                    p.pixelDensity(Math.min(2, window.devicePixelRatio || 1));
                    p.noLoop();
                    view = FlodeP5Bridge.create(p, {component: sources[0], controller: sources[1]},
                        {invalidate, onEvent: event, onError: notice});
                    const element = canvas.elt;
                    element.tabIndex = 0;
                    element.setAttribute("aria-label", "Pod A UI preview. Drag Jung, Jitter and loop handles; click M, S and mode buttons.");
                    function position(event) {
                        const rect = element.getBoundingClientRect();
                        return [(event.clientX - rect.left) * 960 / rect.width,
                            (event.clientY - rect.top) * 600 / rect.height];
                    }
                    element.addEventListener("pointerdown", function (event) {
                        if (event.button !== 0 || pointer !== null) return;
                        pointer = event.pointerId;
                        element.setPointerCapture(pointer);
                        view.pointerDown(...position(event), event.shiftKey);
                        event.preventDefault();
                    });
                    element.addEventListener("pointermove", function (event) {
                        if (pointer !== null && pointer !== event.pointerId) return;
                        view.pointerMove(...position(event), pointer !== null, event.shiftKey);
                    });
                    element.addEventListener("pointerup", function (event) {
                        if (pointer !== event.pointerId) return;
                        view.pointerUp(...position(event), event.shiftKey);
                        pointer = null;
                        if (element.hasPointerCapture(event.pointerId)) element.releasePointerCapture(event.pointerId);
                    });
                    function cancel() { pointer = null; if (view) view.pointerCancel(); }
                    element.addEventListener("pointercancel", cancel);
                    element.addEventListener("lostpointercapture", cancel);
                    element.addEventListener("dblclick", event => view.doubleClick(...position(event)));
                    window.addEventListener("blur", cancel);
                    p.windowResized = invalidate;
                    notice("No audio loaded. Drop a WAV or AIFF on the strip.");
                };
                p.draw = function () { if (view) view.draw(); };
            });
        } catch (error) { notice(error.message + " Serve this folder from the repository root; see README."); }
    }
    start();
})();
