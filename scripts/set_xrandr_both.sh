#!/usr/bin/env bash -e
# -e: If any command in the script fails (i.e. returns a non-zero exist status), then the whole script immediately fails
# This script always keeps the primary monitor on and uses a secondary monitor when available

PRIMARY="eDP-1"
SECONDARY_1="HDMI-1"

if (xrandr | grep "$SECONDARY_1 connected"); then
    xrandr --output $PRIMARY --primary --auto --output $SECONDARY_1 --auto --left-of $PRIMARY
else
    xrandr --output $SECONDARY_1 --off
    xrandr --output $PRIMARY --primary --auto
fi
