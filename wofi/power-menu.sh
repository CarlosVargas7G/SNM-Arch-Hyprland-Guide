#!/usr/bin/env bash

CHOICE=$(printf '%s\n' \
    '⏻  Apagar' \
    '↻  Reiniciar' \
    '󰒲  Suspender' \
    '󰗽  Cerrar sesión' |
    wofi --dmenu \
         --prompt 'Power' \
         --style "$HOME/.config/wofi/style.css")

case "$CHOICE" in
    '⏻  Apagar')        systemctl poweroff ;;
    '↻  Reiniciar')     systemctl reboot ;;
    '󰒲  Suspender')     systemctl suspend ;;
    '󰗽  Cerrar sesión') hyprctl dispatch exit ;;
esac
