-- ============================================================
-- PROGRAMAS
-- ============================================================

local mod = "SUPER"

local terminal = "kitty"
local editor = "code"
local browser = "firefox"
local fileManager = "dolphin"

local function run(command)
    return hl.dsp.exec_cmd(command)
end

local function dispatch(command)
    return run("hyprctl dispatch " .. command)
end

-- ============================================================
-- APLICACIONES
-- ============================================================

hl.bind(mod .. " + T", run(terminal))
hl.bind(mod .. " + C", run(editor))
hl.bind(mod .. " + F", run(browser))
hl.bind(mod .. " + E", run(fileManager))
hl.bind(mod .. " + Z", run("hyprlock"))

-- ============================================================
-- AUDIO
-- ============================================================

local volumeScript = "$HOME/.config/waybar/scripts/volume-control.sh"

hl.bind("XF86AudioMute",
    run(volumeScript .. " -o m"),
    { locked = true })

hl.bind("XF86AudioMicMute",
    run(volumeScript .. " -i m"),
    { locked = true })

hl.bind("XF86AudioLowerVolume",
    run(volumeScript .. " -o d"),
    { locked = true, repeating = true })

hl.bind("XF86AudioRaiseVolume",
    run(volumeScript .. " -o i"),
    { locked = true, repeating = true })

-- ============================================================
-- MULTIMEDIA
-- ============================================================

hl.bind("XF86AudioPause", run("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", run("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", run("playerctl previous"), { locked = true })
hl.bind("XF86AudioNext", run("playerctl next"), { locked = true })

-- ============================================================
-- BRILLO
-- ============================================================

local brightnessScript = "$HOME/.config/waybar/scripts/brightness-control.sh"

hl.bind("XF86MonBrightnessDown",
    run(brightnessScript .. " -o d"),
    { locked = true, repeating = true })

hl.bind("XF86MonBrightnessUp",
    run(brightnessScript .. " -o i"),
    { locked = true, repeating = true })

-- ============================================================
-- ENFOQUE DE VENTANAS
-- ============================================================

hl.bind(mod .. " + H", dispatch("movefocus l"))
hl.bind(mod .. " + L", dispatch("movefocus r"))
hl.bind(mod .. " + K", dispatch("movefocus u"))
hl.bind(mod .. " + J", dispatch("movefocus d"))

-- ALT + TAB
hl.bind("ALT + TAB", function()
    hl.dispatch(hl.dsp.window.cycle_next())
    hl.dispatch(hl.dsp.window.alter_zorder({ mode = "top" }))
end)

-- ============================================================
-- MOVER VENTANAS
-- ============================================================

hl.bind(mod .. " + SHIFT + H", dispatch("movewindow l"))
hl.bind(mod .. " + SHIFT + L", dispatch("movewindow r"))
hl.bind(mod .. " + SHIFT + K", dispatch("movewindow u"))
hl.bind(mod .. " + SHIFT + J", dispatch("movewindow d"))

-- ============================================================
-- CERRAR / MAXIMIZAR / FLOTAR
-- ============================================================

hl.bind(mod .. " + Q", hl.dsp.window.close())
hl.bind("ALT + F4", dispatch("killactive"))

hl.bind(mod .. " + M", dispatch("fullscreen 0"))
hl.bind(mod .. " + SHIFT + W", dispatch("togglefloating"))

-- ============================================================
-- REDIMENSIONAR VENTANAS
-- ============================================================

hl.bind(mod .. " + ALT + L", dispatch("resizeactive 10 0"), { repeating = true })
hl.bind(mod .. " + ALT + H", dispatch("resizeactive -10 0"), { repeating = true })
hl.bind(mod .. " + ALT + K", dispatch("resizeactive 0 -10"), { repeating = true })
hl.bind(mod .. " + ALT + J", dispatch("resizeactive 0 10"), { repeating = true })

-- ============================================================
-- RATON
-- ============================================================

hl.bind(mod .. " + mouse:272", dispatch("movewindow"), { mouse = true })
hl.bind(mod .. " + mouse:273", dispatch("resizewindow"), { mouse = true })

-- ============================================================
-- ESPACIOS DE TRABAJO
-- ============================================================

local workspaceKeys = {
    { "1", 1 },
    { "2", 2 },
    { "3", 3 },
    { "4", 4 },
    { "5", 5 },
    { "6", 6 },
    { "7", 7 },
    { "8", 8 },
    { "9", 9 },
    { "0", 10 },
}

for _, item in ipairs(workspaceKeys) do
    local key = item[1]
    local workspace = item[2]

    hl.bind(
        mod .. " + " .. key,
        hl.dsp.focus({ workspace = workspace })
    )

    hl.bind(
        mod .. " + SHIFT + " .. key,
        hl.dsp.window.move({ workspace = workspace, follow = true })
    )

    hl.bind(
        mod .. " + ALT + " .. key,
        hl.dsp.window.move({ workspace = workspace, follow = false })
    )
end

-- ============================================================
-- ESPACIOS RELATIVOS
-- ============================================================

hl.bind(mod .. " + CTRL + L", dispatch("workspace r+1"))
hl.bind(mod .. " + CTRL + H", dispatch("workspace r-1"))

hl.bind(mod .. " + CTRL + ALT + RIGHT", dispatch("movetoworkspace r+1"))
hl.bind(mod .. " + CTRL + ALT + LEFT", dispatch("movetoworkspace r-1"))

hl.bind(mod .. " + CTRL + J", dispatch("workspace empty"))

-- ============================================================
-- SCROLL ENTRE ESPACIOS
-- ============================================================

hl.bind(mod .. " + mouse_down", dispatch("workspace e+1"))
hl.bind(mod .. " + mouse_up", dispatch("workspace e-1"))

-- ============================================================
-- SPECIAL WORKSPACE
-- ============================================================

hl.bind(mod .. " + S", dispatch("togglespecialworkspace magic"))

hl.bind(
    mod .. " + SHIFT + S",
    dispatch("movetoworkspace special:magic")
)

-- ============================================================
-- CAPTURAS DE PANTALLA
-- ============================================================

local screenshot = "$HOME/.config/hypr/scripts/screenshot.sh"

hl.bind(
    mod .. " + ALT + P",
    run(screenshot .. " screen")
)

hl.bind(
    mod .. " + Print",
    run(screenshot .. " screen")
)

hl.bind(
    mod .. " + P",
    run(screenshot .. " area")
)

hl.bind(
    "Print",
    run(screenshot .. " area")
)

-- ============================================================
-- WOFI
-- ============================================================

local wofi = "wofi --show drun --style $HOME/.config/wofi/style.css"

hl.bind(mod .. " + A", run(wofi))
hl.bind(mod .. " + W", run("wtype -M ctrl w -m ctrl"))
hl.bind(mod .. " + SPACE", run(wofi))

hl.bind(
    mod .. " + V",
    run("sh -c 'cliphist list | wofi --dmenu --style ~/.config/wofi/style.css | cliphist decode | wl-copy'")
)

hl.bind(
    mod .. " + BACKSPACE",
    run("$HOME/.config/wofi/power-menu.sh")
)

-- ============================================================
-- SALIR DE HYPRLAND
-- ============================================================

hl.bind(
    mod .. " + CTRL + BACKSPACE",
    dispatch("exit")
)
