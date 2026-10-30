-- ============================================================
-- CURVAS PERSONALIZADAS
-- ============================================================

hl.curve("overshot", {
    type = "bezier",
    points = {
        { 0.13, 0.99 },
        { 0.29, 1.1 },
    },
})

hl.curve("shot", {
    type = "bezier",
    points = {
        { 0.2, 1.0 },
        { 0.2, 1.0 },
    },
})

hl.curve("swipe", {
    type = "bezier",
    points = {
        { 0.6, 0.0 },
        { 0.2, 1.05 },
    },
})

hl.curve("linear", {
    type = "bezier",
    points = {
        { 0.0, 0.0 },
        { 1.0, 1.0 },
    },
})

hl.curve("progressive", {
    type = "bezier",
    points = {
        { 1.0, 0.0 },
        { 0.6, 1.0 },
    },
})

-- ============================================================

hl.curve("smoothMove", {
    type = "bezier",
    points = {
        { 0.22, 1.0 },
        { 0.36, 1.0 },
    },
})

-- ANIMACIONES
-- ============================================================

hl.animation({
    leaf = "windows",
    enabled = true,
    speed = 6,
    bezier = "shot",
    style = "slide",
})


hl.animation({
    leaf = "windowsMove",
    enabled = true,
    speed = 5,
    bezier = "smoothMove",
})

hl.animation({
    leaf = "workspaces",
    enabled = true,
    speed = 6,
    bezier = "shot",
    style = "slidevert",
})

hl.animation({
    leaf = "fade",
    enabled = true,
    speed = 4,
    bezier = "linear",
})

hl.animation({
    leaf = "border",
    enabled = true,
    speed = 4,
    bezier = "linear",
})

hl.animation({
    leaf = "borderangle",
    enabled = true,
    speed = 18,
    bezier = "linear",
    style = "loop",
})
