#!/bin/bash

case "$1" in
    -o)
        case "$2" in
            i) wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ 5%+ ;;
            d) wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%- ;;
            m) wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle ;;
        esac
        ;;
    -i)
        case "$2" in
            m) wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle ;;
        esac
        ;;
esac
