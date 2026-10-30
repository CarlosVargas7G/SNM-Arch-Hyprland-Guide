#!/bin/bash

if [[ "$1" == "--toggle" ]]; then
    case "$(powerprofilesctl get)" in
        performance)
            powerprofilesctl set balanced
            ;;
        balanced)
            powerprofilesctl set power-saver
            ;;
        power-saver)
            powerprofilesctl set performance
            ;;
    esac
fi

profile=$(powerprofilesctl get)

case "$profile" in
    performance)
        icon="󰓅"
        tooltip="Performance"
        class="performance"
        ;;
    balanced)
        icon="󰗑"
        tooltip="Balanced"
        class="balanced"
        ;;
    power-saver)
        icon="󰾆"
        tooltip="Power Saver"
        class="power-saver"
        ;;
    *)
        icon="󰾆"
        tooltip="$profile"
        class="unknown"
        ;;
esac

printf '{"text":"%s","tooltip":"Power profile: %s","class":"%s"}\n' \
    "$icon" "$tooltip" "$class"
