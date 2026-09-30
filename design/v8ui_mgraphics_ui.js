// ==========================================================================
// 6-CH AUDIO MANGLER / FORS.FM PHILOSOPHY UI
// Minimal, flat, pixel-perfect, thin lines, monospace labels.
// ==========================================================================

mgraphics.init();
mgraphics.relative_coords = 0; 
mgraphics.autofill = 0;

// Fors FM Färgpalett (Kolsvart chassi, kritvita linjer, dämpad neonorange)
const COLORS = {
    bg: [0.07, 0.07, 0.07, 1.0],
    stripBg: [0.09, 0.09, 0.09, 1.0],
    accent: [1.0, 0.45, 0.0, 1.0],
    accentDim: [0.30, 0.15, 0.0, 1.0],
    lines: [0.22, 0.22, 0.22, 1.0],
    textMain: [0.90, 0.90, 0.90, 1.0],
    textDim: [0.45, 0.45, 0.45, 1.0]
};

let channels = ['A', 'B', 'C', 'D', 'E', 'F'].map((id, index) => ({
    id: id,
    name: id === 'A' ? "break_amen" : `track_0${index + 1}`,
    active: true,
    volume: 0.75 - (index * 0.05),
    speed: 0.5 + (index * 0.1),
    pan: 0.5
}));

let width = 0;
let height = 0;
let dragTarget = null;
let lastMouseY = 0;

function paint() {
    width = box.rect - box.rect;
    height = box.rect - box.rect;

    with (mgraphics) {
        set_source_rgba(COLORS.bg);
        rectangle(0, 0, width, height);
        fill();

        set_source_rgba(COLORS.textMain);
        set_font_name("Courier New");
        set_font_size(10);
        move_to(15, 22);
        text_path("FORS // MANGLER // 6-STREAM SAMPLER");
        fill();

        set_source_rgba(COLORS.lines);
        set_line_width(1);
        move_to(0, 35);
        line_to(width, 35);
        stroke();

        const stripW = width / 6;
        const stripH = height - 35;

        channels.forEach((ch, index) => {
            drawForsStrip(index * stripW, 35, stripW, stripH, ch, index);
        });
    }
}

function drawForsStrip(x, y, w, h, ch, index) {
    with (mgraphics) {
        if (index > 0) {
            set_source_rgba(COLORS.lines);
            set_line_width(1);
            move_to(x, y);
            line_to(x, y + h);
            stroke();
        }

        set_font_name("Courier New");
        set_font_size(11);
        set_source_rgba(COLORS.accent);
        move_to(x + 12, y + 25);
        text_path(ch.id);
        fill();

        set_source_rgba(COLORS.textMain);
        move_to(x + 28, y + 25);
        let dispName = ch.name.substring(0, Math.floor(w / 8));
        text_path(dispName);
        fill();

        const dispX = x + 10;
        const dispY = y + 42;
        const dispW = w - 20;
        const dispH = 50;

        set_source_rgba(COLORS.stripBg);
        rectangle(dispX, dispY, dispW, dispH);
        fill();
        set_source_rgba(COLORS.lines);
        rectangle(dispX, dispY, dispW, dispH);
        stroke();

        set_source_rgba(COLORS.accent);
        set_line_width(1);
        move_to(dispX, dispY + dispH/2);
        line_to(dispX + dispW, dispY + dispH/2);
        stroke();

        for (let i = 4; i < dispW - 4; i += 6) {
            let hVal = (Math.sin(i * 0.1 + index) * 15);
            move_to(dispX + i, dispY + dispH/2 - hVal);
            line_to(dispX + i, dispY + dispH/2 + hVal);
            stroke();
        }

        const faderX = x + w/2;
        const faderY = dispY + dispH + 30;
        const faderH = h * 0.35;

        set_source_rgba(COLORS.lines);
        set_line_width(1);
        move_to(faderX, faderY);
        line_to(faderX, faderY + faderH);
        stroke();

        const handleY = faderY + faderH - (faderH * ch.volume);
        set_source_rgba(COLORS.textMain);
        set_line_width(2);
        move_to(faderX - 10, handleY);
        line_to(faderX + 10, handleY);
        stroke();

        set_font_size(9);
        set_source_rgba(COLORS.textDim);
        move_to(faderX + 14, handleY + 3);
        text_path(ch.volume.toFixed(2));
        fill();

        const knobY1 = faderY + faderH + 30;
        const knobY2 = knobY1 + 45;

        drawForsKnob(x + w/2, knobY1, 12, ch.speed, "SPEED", ch.speed.toFixed(2));
        drawForsKnob(x + w/2, knobY2, 12, ch.pan, "PAN", ch.pan > 0.5 ? "R" : ch.pan < 0.5 ? "L" : "C");
    }
}

function drawForsKnob(cx, cy, r, val, label, valStr) {
    with (mgraphics) {
        set_source_rgba(COLORS.lines);
        set_line_width(1);
        arc(cx, cy, r, 0, 2 * Math.PI);
        stroke();

        let startAngle = 0.75 * Math.PI;
        let endAngle = startAngle + (val * 1.5 * Math.PI);

        set_source_rgba(COLORS.accent);
        set_line_width(1.5);
        arc(cx, cy, r, startAngle, endAngle);
        stroke();

        set_font_name("Courier New");
        set_font_size(9);
        set_source_rgba(COLORS.textDim);
        move_to(cx - (label.length * 2.7), cy + r + 12);
        text_path(label);
        fill();
    }
}

function onclick(x, y, but, cmd, shift, capslock, option, ctrl) {
    const stripW = width / 6;
    const stripH = height - 35;
    const chIndex = Math.floor(x / stripW);
    if (chIndex < 0 || chIndex >= 6) return;

    const ch = channels[chIndex];
    const localX = x - (chIndex * stripW);
    const localY = y - 35;

    const dispY = 42;
    const faderY = dispY + 50 + 30;
    const faderH = stripH * 0.35;
    const knobY1 = faderY + faderH + 30;
    const knobY2 = knobY1 + 45;

    if (localX >= (stripW/2 - 20) && localX <= (stripW/2 + 20) && localY >= faderY && localY <= (faderY + faderH)) {
        dragTarget = { index: chIndex, type: 'volume', yStart: faderY, height: faderH };
    } else if (Math.abs(localX - stripW/2) < 20 && Math.abs(localY - knobY1) < 20) {
        dragTarget = { index: chIndex, type: 'speed' };
    } else if (Math.abs(localX - stripW/2) < 20 && Math.abs(localY - knobY2) < 20) {
        dragTarget = { index: chIndex, type: 'pan' };
    }

    lastMouseY = y;
}

function ondrag(x, y, but, cmd, shift, capslock, option, ctrl) {
    if (!dragTarget) return;

    const ch = channels[dragTarget.index];
    const deltaY = lastMouseY - y;

    if (dragTarget.type === 'volume') {
        let relY = (y - 35 - dragTarget.yStart);
        let val = 1.0 - (relY / dragTarget.height);
        ch.volume = Math.max(0.0, Math.min(1.0, val));
        outlet(0, "channel", ch.id, "volume", ch.volume);
    } else if (dragTarget.type === 'speed') {
        ch.speed = Math.max(0.0, Math.min(1.0, ch.speed + (deltaY * 0.005)));
        outlet(0, "channel", ch.id, "speed", ch.speed);
    } else if (dragTarget.type === 'pan') {
        ch.pan = Math.max(0.0, Math.min(1.0, ch.pan + (deltaY * 0.005)));
        outlet(0, "channel", ch.id, "pan", ch.pan);
    }

    lastMouseY = y;
    mgraphics.redraw();
}

function onrelease(x, y, but, cmd, shift, capslock, option, ctrl) {
    dragTarget = null;
}

function onresize(w, h) {
    mgraphics.redraw();
}
