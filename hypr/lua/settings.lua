-- ============================================================
-- GENERAL
-- ============================================================

hl.config({
    general = {
        border_size = 1,
        gaps_in = 2,
        gaps_out = 4,
        layout = "dwindle",
        col = {
            inactive_border = "rgb(000000)",
            active_border = "rgb(cdd6f4)",
        },

        snap = {
            enabled = true,
            window_gap = 5,
            monitor_gap = 5,
        },
    },

    -- ========================================================
    -- DECORATION
    -- ========================================================

    decoration = {
        rounding = 10,
        fullscreen_opacity = 1,
        dim_inactive = true,
        dim_strength = 0.15,

        blur = {
            enabled = true,
            size = 6,
            passes = 3,
        },

        shadow = {
            enabled = false,
            range = 1,
            render_power = 4,
            sharp = false,
            color = "rgba(000000bf)",
            offset = { 3, 3 },
            scale = 1,
        },
    },

    -- ========================================================
    -- INPUT
    -- ========================================================

    input = {
        kb_layout = "latam",
        kb_options = "grp:win_space_toggle",

        sensitivity = 0,
        follow_mouse = 1,
        force_no_accel = true,

        touchpad = {
            natural_scroll = true,
        },
    },

    -- ========================================================
    -- MISC
    -- ========================================================

    misc = {
        disable_hyprland_logo = true,
        disable_splash_rendering = true,
        font_family = "JetBrainsMono Nerd Font",
        force_default_wallpaper = 0,
        animate_manual_resizes = true,
        focus_on_activate = true,
    },

    xwayland = {
        force_zero_scaling = true,
    },

    cursor = {
        inactive_timeout = 0,
        hide_on_key_press = false,
    },

    ecosystem = {
        no_update_news = true,
    },

    debug = {
        disable_logs = false,
    },
})
