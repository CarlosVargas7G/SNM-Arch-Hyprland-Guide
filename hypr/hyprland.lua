-- Configuración modular Hyprland 0.57
local home = assert(os.getenv("HOME"), "HOME no está definido")
local base = home .. "/.config/hypr/lua/"
dofile(base .. "environment.lua")
dofile(base .. "settings.lua")
dofile(base .. "monitors.lua")
dofile(base .. "animations.lua")
dofile(base .. "window-rules.lua")
dofile(base .. "layer-rules.lua")
dofile(base .. "keybinds.lua")
dofile(base .. "startup.lua")
