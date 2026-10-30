#!/usr/bin/env bash

DIR="$HOME/Pictures/Screenshots"
mkdir -p "$DIR"
FILE="$DIR/$(date +%Y-%m-%d_%H-%M-%S).png"

case "$1" in
    screen)
        grim "$FILE" || exit 1
        ;;
    area)
        GEOMETRY=$(slurp) || exit 0
        [ -n "$GEOMETRY" ] || exit 0
        grim -g "$GEOMETRY" "$FILE" || exit 1
        ;;
    *)
        notify-send "Captura" "Modo de captura desconocido"
        exit 1
        ;;
esac

wl-copy --type image/png < "$FILE"

if [ "$1" = "area" ]; then
    swappy -f "$FILE" &
fi

notify-send "Captura guardada" "Guardada y copiada al portapapeles"
