-- ============================================================
-- GTK
-- ============================================================
-- ============================================================
-- XDG / WAYLAND
-- ============================================================

hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")

-- ============================================================
-- QT
-- ============================================================

hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")
hl.env("QT_QPA_PLATFORMTHEME", "qt5ct")

-- ============================================================
-- CURSOR
-- ============================================================

hl.env("HYPRCURSOR_THEME", "macOS")
hl.env("HYPRCURSOR_SIZE", "24")

hl.env("XCURSOR_THEME", "macOS")
hl.env("XCURSOR_SIZE", "24")

hl.env("QT_CURSOR_THEME", "macOS")
hl.env("QT_CURSOR_SIZE", "24")

-- ============================================================
-- MISC
-- ============================================================

hl.env(
    "SLURP_ARGS",
    '-d -b 00000066 -c ffffff -F "Atkinson Hyperlegible"'
)

hl.env("GDK_SCALE", "1")
hl.env("MOZ_ENABLE_WAYLAND", "1")
