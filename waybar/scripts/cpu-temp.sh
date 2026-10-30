#!/usr/bin/env bash

TEMP=$(cat /sys/class/thermal/thermal_zone0/temp 2>/dev/null)

if [ -z "$TEMP" ]; then
    echo "N/A"
    exit 0
fi

TEMP=$(awk "BEGIN {printf \"%.0f\", $TEMP/1000}")

if [ "$TEMP" -ge 80 ]; then
    CLASS="critical"
elif [ "$TEMP" -ge 70 ]; then
    CLASS="warning"
else
    CLASS="good"
fi

printf '{"text":"%s°C","class":"%s","tooltip":"CPU temperature: %s°C"}\n' \
    "$TEMP" "$CLASS" "$TEMP"
