#!/bin/sh

# ln -sf ~/.screenlayout/display_setup.sh /usr/local/bin/display_setup.sh

# Screen variables
INTERNAL="LVDS1"
EXTERNAL="DP2"

# Extract the ids of touch inputs
FINGER=$(xinput | grep "Finger touch" | grep id= |cut -f 2 |cut -f 2 -d = | tr -d '[:space:]')
PEN=$(xinput | grep "Pen eraser" | grep id= |cut -f 2 |cut -f 2 -d = | tr -d '[:space:]')
ERASER=$(xinput | grep "Pen stylus" | grep id= |cut -f 2 |cut -f 2 -d = | tr -d '[:space:]')


function default {
    # Setup the screen layout, initially invert external
    xrandr --output $INTERNAL --mode 1366x768 --pos 0x312 --rotate inverted
    xrandr --output $EXTERNAL --primary --mode 1920x1080 --pos 1366x0 --rotate inverted

    # Disable fingering
    xinput disable $FINGER

    # Enable pen and eraser
    xinput enable $PEN
    xinput enable $ERASER

    # Map to external
    xinput --map-to-output $PEN $EXTERNAL
    xinput --map-to-output $ERASER $EXTERNAL

    xrandr --output $EXTERNAL --rotate normal
}

if [ $# -eq 0 ]; then
    default
fi
