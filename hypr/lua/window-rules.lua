-- ============================================================
-- TRANSPARENCIAS
-- ============================================================

hl.window_rule({
    name = "kitty-opacity",
    match = { class = "^(kitty)$" },
    opacity = "0.90 0.80",
})

hl.window_rule({
    name = "pcmanfm-opacity",
    match = { class = "^(pcmanfm-qt)$" },
    opacity = "0.90 0.80",
})

hl.window_rule({
    name = "obs-opacity",
    match = { class = "^(com.obsproject.Studio)$" },
    opacity = "0.80 0.80",
})

hl.window_rule({
    name = "qview-opacity",
    match = { class = "^(com.interversehq.qView)$" },
    opacity = "0.90 0.80",
})

-- ============================================================
-- FIREFOX
-- ============================================================

local firefoxTitles = {
    { "firefox-pip", "^Picture-in-Picture$", true },
    { "firefox-library", "^Library$", true },
    { "firefox-close", "^Close Firefox$", true },
    { "firefox-messenger", "^Messenger call.*$", true },
}

for _, item in ipairs(firefoxTitles) do
    hl.window_rule({
        name = item[1],
        match = {
            class = "^(firefox)$",
            title = item[2],
        },
        float = item[3],
    })
end

hl.window_rule({
    name = "firefox-save-image-size",
    match = {
        class = "^(firefox)$",
        title = "^Save Image$",
    },
    size = { 715, 375 },
})

hl.window_rule({
    name = "firefox-upload-size",
    match = {
        class = "^(firefox)$",
        title = "^File Upload$",
    },
    size = { 595, 395 },
})

hl.window_rule({
    name = "firefox-close-size",
    match = {
        class = "^(firefox)$",
        title = "^Close Firefox$",
    },
    size = { 500, 290 },
})

-- ============================================================
-- VSCODE
-- ============================================================

local vscodeWindows = {
    { "Save As", true, 715, 375 },
    { "Open File", true, 595, 395 },
    { "Open Folder", true, 595, 395 },
}

for _, item in ipairs(vscodeWindows) do
    hl.window_rule({
        name = "vscode-" .. item[1]:lower():gsub(" ", "-"),
        match = {
            class = "^(code)$",
            title = "^" .. item[1] .. "$",
        },
        float = item[2],
        size = { item[3], item[4] },
    })
end

-- ============================================================
-- FILE MANAGER
-- ============================================================

hl.window_rule({
    name = "pcmanfm-float",
    match = { class = "^(pcmanfm-qt)$" },
    float = true,
})

hl.window_rule({
    name = "lxqt-archiver-float",
    match = { class = "^(lxqt-archiver)$" },
    float = true,
})

hl.window_rule({
    name = "file-roller-float",
    match = { class = "^(org.gnome.FileRoller)$" },
    float = true,
})

hl.window_rule({
    name = "pcmanfm-properties-size",
    match = {
        class = "^(pcmanfm-qt)$",
        title = "^File Properties$",
    },
    size = { 590, 390 },
})

hl.window_rule({
    name = "pcmanfm-preferences-size",
    match = {
        class = "^(pcmanfm-qt)$",
        title = "^Preferences$",
    },
    size = { 590, 390 },
})

-- ============================================================
-- QVIEW
-- ============================================================

hl.window_rule({
    name = "qview-maximize",
    match = { class = "^(com.interversehq.qView)$" },
    maximize = true,
})

-- ============================================================
-- OBS
-- ============================================================

hl.window_rule({
    name = "obs-filters-float",
    match = {
        class = "^(com.obsproject.Studio)$",
        title = "^Filters for.*$",
    },
    float = true,
})

hl.window_rule({
    name = "obs-settings-size",
    match = {
        class = "^(com.obsproject.Studio)$",
        title = "^Settings$",
    },
    size = { 810, 520 },
})

hl.window_rule({
    name = "obs-remux-size",
    match = {
        class = "^(com.obsproject.Studio)$",
        title = "^Remux Recordings$",
    },
    size = { 595, 395 },
})

-- ============================================================
-- VESKTOP / VENCORD
-- ============================================================

hl.window_rule({
    name = "vesktop-quickcss",
    match = {
        class = "^(vesktop)$",
        title = "^Vencord QuickCSS Editor$",
    },
    float = true,
    size = { 595, 395 },
})

-- ============================================================
-- TIMESHIFT
-- ============================================================

hl.window_rule({
    name = "timeshift-float",
    match = { class = "^(Timeshift-gtk)$" },
    float = true,
})

-- ============================================================
-- TERMINAL
-- ============================================================

hl.window_rule({
    name = "kitty-center",
    match = {
        class = "^(kitty)$",
        title = "^(zsh)$",
    },
    center = true,
})

-- ============================================================
-- ONLYOFFICE
-- ============================================================

hl.window_rule({
    name = "onlyoffice-no-blur",
    match = { class = "^(ONLYOFFICE Desktop Editors)$" },
    no_blur = true,
    border_size = 0,
})

-- ============================================================
-- HYPRLAND SHARE PICKER
-- ============================================================

hl.window_rule({
    name = "hyprland-share-picker",
    match = { class = "^(hyprland-share-picker)$" },
    float = true,
    size = { 500, 290 },
})

-- ============================================================
-- LAYER RULES
-- ============================================================

hl.layer_rule({
    name = "no-anim-for-selection",
    match = { namespace = "^selection$" },
    no_anim = true,
})
