#!/bin/sh

# Get xrandr query if DP-2 is connected
q=$(xrandr -q | grep DP-2)

if [[ $q == *disconnected* ]]; then
    # Script for single monitor
    xrandr --output LVDS-1 --mode 1366x768 --pos 0x0 --rotate normal
else
    xrandr --output LVDS-1 --mode 1366x768 --pos 0x312 --rotate normal --output DP-2 --primary --mode 1920x1080 --pos 1366x0 --rotate normal
fi
