#!/bin/sh

# Hardware specs (from 'xinput' and 'xrandr')
INPUT_SCREEN="LVDS-1"
OUTPUT_SCREEN="DP-2"

# Always disable fingering
FINGER=$(xinput | grep Finger | grep id= |cut -f 2 |cut -f 2 -d = | tr -d '[:space:]')
xinput disable $FINGER

# Get Pen and Eraser Id
PEN=$(xinput | grep "Pen (0)" | grep id= |cut -f 2 |cut -f 2 -d = | tr -d '[:space:]')
ERASER=$(xinput | grep "Eraser (0)" | grep id= |cut -f 2 |cut -f 2 -d = | tr -d '[:space:]')

function touch {
    xinput $1 $PEN
    xinput $1 $ERASER
    xinput --map-to-output $PEN $OUTPUT_SCREEN
    xinput --map-to-output $ERASER $OUTPUT_SCREEN
}

function inverted_mode {
    # Invert the input screen and output screen
    xrandr --output "$INPUT_SCREEN" --rotation inverted
    xrandr --output "$OUTPUT_SCREEN" --rotation inverted

    touch enable

    # Revert the rotation of the output screen but retain the calibration matrix
    sleep 0.5s && xrandr --output "$OUTPUT_SCREEN" --rotation normal
 }

function normal_mode {
    # Normalize the input screen and output screen
    xrandr --output "$INPUT_SCREEN" --rotation normal
    xrandr --output "$OUTPUT_SCREEN" --rotation normal
    touch enable
}

function disabled_mode {
    # Normalize the input screen and output screen
    xrandr --output "$INPUT_SCREEN" --rotation normal
    xrandr --output "$OUTPUT_SCREEN" --rotation normal
    touch disable
}

if [ $# -eq 0 ]; then
    echo "Usage: $0 [disabled|touch_all|touch_pen|touch_finger|normal]"
else
    case $1 in
        enable_normal)
            normal_mode
            ;;
        enable_inverted)
            inverted_mode
            ;;
        disable)
            disabled_mode
            ;;
    esac
fi
