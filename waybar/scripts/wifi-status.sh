#!/usr/bin/env bash

IFACE=$(iw dev 2>/dev/null | awk '$1=="Interface"{print $2; exit}')

if [ -z "$IFACE" ]; then
    printf '{"text":"󰖪","tooltip":"Wi-Fi: no disponible","class":"disconnected"}\n'
    exit 0
fi

STATE=$(cat "/sys/class/net/$IFACE/operstate" 2>/dev/null)

if [ "$STATE" != "up" ]; then
    printf '{"text":"󰖪","tooltip":"Wi-Fi: desconectado","class":"disconnected"}\n'
    exit 0
fi

SSID=$(iw dev "$IFACE" link 2>/dev/null | awk -F': ' '/SSID:/{print $2}')
SIGNAL=$(iw dev "$IFACE" link 2>/dev/null | awk '/signal:/{print int($2)}')

if [ -z "$SSID" ]; then
    printf '{"text":"󰖪","tooltip":"Wi-Fi: desconectado","class":"disconnected"}\n'
    exit 0
fi

if [ "$SIGNAL" -ge -50 ]; then
    ICON="󰤨"
elif [ "$SIGNAL" -ge -60 ]; then
    ICON="󰤥"
elif [ "$SIGNAL" -ge -70 ]; then
    ICON="󰤢"
else
    ICON="󰤟"
fi

printf '{"text":"%s","tooltip":"Wi-Fi: %s (%s dBm)","class":"connected"}\n' \
    "$ICON" "$SSID" "$SIGNAL"
