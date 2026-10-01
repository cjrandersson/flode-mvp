/* flöde~ p5.js host adapter for the existing Max 9 prototype scripts.
 * Prototype-only: compiles the two trusted repository scripts inside host scopes.
 * No copy of component geometry, gesture logic or engineering-unit mappings.
 */
(function (root, factory) {
    if (typeof module === "object" && module.exports) module.exports = factory();
    else root.FlodeP5Bridge = factory();
})(typeof globalThis !== "undefined" ? globalThis : this, function () {
    "use strict";
    let instanceCount = 0;

    function graphics(p, invalidate) {
        let color = [1, 1, 1, 1], weight = 1, path = [], position = [0, 0];
        const stack = [];
        function useColor(method) { p[method].apply(p, color.map(v => v * 255)); }
        function drawPath(fill) {
            if (fill) { p.noStroke(); useColor("fill"); }
            else { p.noFill(); useColor("stroke"); p.strokeWeight(weight); }
            for (const item of path) {
                if (item.kind === "rectangle") p.rect.apply(p, item.values);
                else if (fill) {
                    p.beginShape();
                    item.points.forEach(point => p.vertex.apply(p, point));
                    p.endShape(item.closed ? p.CLOSE : undefined);
                } else {
                    for (let i = 1; i < item.points.length; i++)
                        p.line.apply(p, item.points[i - 1].concat(item.points[i]));
                    if (item.closed && item.points.length > 1)
                        p.line.apply(p, item.points[item.points.length - 1].concat(item.points[0]));
                }
            }
            path = [];
        }
        return {
            init() {},
            save() {
                stack.push({color: color.slice(), weight});
                p.push(); p.colorMode(p.RGB, 255); p.rectMode(p.CORNER);
            },
            restore() {
                const saved = stack.pop();
                if (!saved) throw new Error("Unbalanced graphics restore");
                color = saved.color; weight = saved.weight; p.pop();
            },
            set_source_rgba(value) {
                color = Array.isArray(value) ? value.slice() : Array.from(arguments);
                if (color.length === 3) color.push(1);
            },
            set_line_width(value) { weight = value; },
            rectangle(x, y, w, h) { path = [{kind: "rectangle", values: [x, y, w, h]}]; },
            move_to(x, y) {
                position = [x, y];
                path.push({kind: "polygon", points: [[x, y]], closed: false});
            },
            line_to(x, y) {
                if (!path.length || path[path.length - 1].kind !== "polygon")
                    throw new Error("line_to requires move_to");
                path[path.length - 1].points.push([x, y]); position = [x, y];
            },
            close_path() {
                if (path.length) path[path.length - 1].closed = true;
            },
            fill() { drawPath(true); },
            stroke() { drawPath(false); },
            select_font_face(name) { p.textFont(name); },
            set_font_size(value) { p.textSize(value); },
            show_text(value) {
                p.noStroke(); useColor("fill"); p.textAlign(p.LEFT, p.BASELINE);
                p.text(String(value), position[0], position[1]); path = [];
            },
            redraw() { invalidate(); }
        };
    }

    function create(p, sources, options) {
        options = options || {};
        const invalidate = options.invalidate || function () {};
        const onEvent = options.onEvent || function () {};
        const onError = options.onError || function () {};
        const scope = "flode.web." + (++instanceCount);
        const data = new Map();
        let decoded = null, active = null;
        class Dict {
            constructor(name) {
                this.name = String(name);
                if (!data.has(this.name)) data.set(this.name, {});
            }
            get(key) {
                const value = data.get(this.name)[key];
                return value === undefined ? null : value;
            }
            set(key, value) { data.get(this.name)[key] = value; }
        }
        class BrowserBuffer {
            constructor(name) {
                if (name !== scope || !decoded) throw new Error("No preview audio loaded");
            }
            framecount() { return decoded.length; }
            channelcount() { return decoded.numberOfChannels; }
            length() { return decoded.duration * 1000; }
            peek(channel, start, count) {
                const values = decoded.getChannelData(channel - 1);
                return count === 1 ? values[start] : values.subarray(start, start + count);
            }
        }
        // Max has host globals; scope those names locally in the browser.
        const prelude = "var autowatch, inlets, outlets;\n";
        const componentFactory = new Function("mgraphics", "box", "jsarguments", "outlet", "arrayfromargs", "Dict", "post",
            prelude + sources.component + "\nreturn {paint,set,enable,hit,onclick,ondrag,onrelease,onidle,onidleout,ondblclick," +
            "geometry,getVisualState:()=>({value:shownValue(),loop:shownLoop(),display:shownDisplay(),mute:state.mute,solo:state.solo," +
            "filename:state.filename,peaks:state.peaks.slice(),looper_mode:state.looper_mode,timing_mode:state.timing_mode})};");
        const controllerFactory = new Function("jsarguments", "Dict", "Buffer", "outlet", "arrayfromargs", "post",
            prelude + sources.controller + "\nreturn {reset,pod,filename,refresh,markers,playhead};");
        const components = new Map();
        const specs = [
            ["header", "header", "", 20, 20, 920, 54],
            ["waveform", "waveform", "", 20, 84, 920, 254],
            ["modes", "modes", "", 20, 350, 920, 42],
            ["jung", "jung", "", 20, 405, 580, 58],
            ["jitter", "jitter", "", 20, 473, 580, 58],
            ["slice", "stepper", "slice", 620, 405, 320, 58],
            ["speed", "stepper", "speed", 620, 473, 320, 58]
        ];
        const pod = String(options.pod || "A");
        let controller;
        function post(message) { onError(String(message)); }
        for (const [id, kind, control, x, y, w, h] of specs) {
            const api = componentFactory(graphics(p, invalidate), {rect: [0, 0, w, h]},
                ["flode_ui_component.js", pod, kind, control],
                function (outlet, event) {
                    if (controller && event[0] === "pod") controller.pod.apply(null, event.slice(1));
                }, Array.from, Dict, post);
            components.set(id, {id, x, y, w, h, api});
        }
        controller = controllerFactory(["flode_ui_demo_controller.js", scope, pod], Dict, BrowserBuffer,
            function (index, message) {
                if (index === 1) { onEvent(message.slice()); return; }
                const component = components.get(message[0]);
                if (component && message[1] === "set") component.api.set.apply(null, message.slice(2));
            }, Array.from, post);
        controller.reset();

        function target(x, y) {
            for (const component of components.values())
                if (x >= component.x && x <= component.x + component.w &&
                    y >= component.y && y <= component.y + component.h) return component;
            return null;
        }
        function call(component, name, x, y, button, shift) {
            if (component) component.api[name](x - component.x, y - component.y, button, 0, shift ? 1 : 0);
        }
        function release() {
            if (active) { active.api.onrelease(); active = null; }
        }
        return {
            width: 960, height: 600,
            draw() {
                p.background(14, 17, 21);
                for (const component of components.values()) {
                    p.push(); p.translate(component.x, component.y); component.api.paint(); p.pop();
                }
            },
            pointerDown(x, y, shift) {
                release();
                const next = target(x, y);
                if (next && next.api.hit(x - next.x, y - next.y)) {
                    active = next; call(active, "onclick", x, y, 1, shift);
                }
            },
            pointerMove(x, y, pressed, shift) {
                if (active) {
                    if (!pressed) release();
                    else call(active, "ondrag", x, y, 1, shift);
                } else {
                    const next = target(x, y);
                    for (const component of components.values())
                        if (component === next) component.api.onidle(x - component.x, y - component.y);
                        else component.api.onidleout();
                }
            },
            pointerUp(x, y, shift) {
                // Include a final pointer position even if no move event arrived.
                if (active) call(active, "ondrag", x, y, 1, shift);
                release();
            },
            pointerCancel() { release(); },
            doubleClick(x, y) { call(target(x, y), "ondblclick", x, y, 1, false); },
            set(id, property) {
                const component = components.get(id);
                if (!component) throw new Error("Unknown component: " + id);
                component.api.set.apply(null, [property].concat(Array.from(arguments).slice(2)));
            },
            enable(id, value) {
                const component = components.get(id);
                if (!component) throw new Error("Unknown component: " + id);
                if (active === component && !value) release();
                component.api.enable(value);
            },
            getVisualState(id) {
                const component = components.get(id);
                if (!component) throw new Error("Unknown component: " + id);
                return component.api.getVisualState();
            },
            loadDecodedAudio(buffer, filename) {
                if (!buffer || !Number.isInteger(buffer.length) || buffer.length < 1 ||
                    !Number.isInteger(buffer.numberOfChannels) || buffer.numberOfChannels < 1 ||
                    !Number.isFinite(buffer.duration) || buffer.duration <= 0 ||
                    typeof buffer.getChannelData !== "function") throw new Error("Invalid decoded audio");
                for (let i = 0; i < buffer.numberOfChannels; i++) {
                    const channel = buffer.getChannelData(i);
                    if (!channel || channel.length !== buffer.length || typeof channel.subarray !== "function")
                        throw new Error("Invalid decoded channel");
                }
                decoded = buffer;
                controller.filename(String(filename || "Loaded audio"));
                controller.refresh();
            },
            reset() { release(); decoded = null; controller.reset(); },
            // Supply authoritative visual positions/markers; never advance a clock.
            markers() { controller.markers.apply(null, arguments); },
            playhead(value) { controller.playhead(value); }
        };
    }
    return {create, graphics};
});
