-- ============================================================
-- AUTOSTART
-- Waybar se añadirá después de validar Hyprland.
-- ============================================================

hl.on("hyprland.start", function()

    -- DBUS
    hl.exec_cmd(
        "dbus-update-activation-environment --systemd --all"
    )

    hl.exec_cmd(
        "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
    )

    hl.exec_cmd(
        "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
    )

    -- NOTIFICACIONES
    hl.exec_cmd("dunst")

    -- INACTIVIDAD
    -- hypridle se inicia mediante systemd; no duplicar aquí.

    -- POLKIT
    -- llamada vacía eliminada

    -- DISPOSITIVOS EXTRAIBLES
    hl.exec_cmd(
        "udiskie --file-manager=dolphin --no-automount"
    )

    -- CURSOR
    hl.exec_cmd(
        "gsettings set org.gnome.desktop.interface cursor-theme 'macOS'"
    )

    hl.exec_cmd(
        "gsettings set org.gnome.desktop.interface cursor-size 24"
    )

    hl.exec_cmd("hyprctl setcursor macOS 24")

    -- PORTAPAPELES
    hl.exec_cmd(
        "wl-paste --type text --watch cliphist store"
    )

    hl.exec_cmd(
        "wl-paste --type image --watch cliphist store"
    )

    -- GTK
    hl.exec_cmd(
        'gsettings set org.gnome.desktop.interface gtk-theme "Catppuccin-Mocha"'
    )

    hl.exec_cmd(
        'gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"'
    )

    hl.exec_cmd(
        "gsettings set org.gnome.desktop.interface icon-theme 'Tela-circle-dracula-light'"
    )

    -- NAUTILUS / TERMINAL
    -- llamada vacía eliminada

    -- FONDO
    hl.exec_cmd("hyprpaper")

    -- WAYBAR
    hl.exec_cmd("waybar")

end)
