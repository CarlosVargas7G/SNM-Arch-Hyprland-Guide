#!/bin/bash

case "$1" in
    -o)
        case "$2" in
            i) brightnessctl set 5%+ ;;
            d) brightnessctl set 5%- ;;
        esac
        ;;
esac
