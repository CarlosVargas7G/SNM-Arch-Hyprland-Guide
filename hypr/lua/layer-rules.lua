-- REGLAS DE CAPAS
-- Mantener Waybar estática durante las transiciones.

hl.layer_rule({
    name = "waybar-static",
    match = {
        namespace = "waybar",
    },
    no_anim = true,
})
