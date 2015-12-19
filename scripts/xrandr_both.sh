#!/bin/bash -e
# -e: If any command in the script fails (i.e. returns a non-zero exist status), then the whole script immediately fails
# This script always keeps the primary monitor on and uses a secondary monitor when available

# TODO: Put in proper git branch. USED BY PERSONAL AND WORK LAPTOPS.

PRIMARY="eDP1"
SECONDARY_1="HDMI1"
SECONDARY_2="VIRTUAL1"

if (xrandr | grep "$SECONDARY_1 connected"); then
    xrandr --output $SECONDARY_2 --off
    xrandr --output $PRIMARY --primary --auto --output $SECONDARY_1 --auto --left-of $PRIMARY
elif (xrandr | grep "$SECONDARY_2 connected"); then
    xrandr --output $SECONDARY_1 --off
    xrandr --output $PRIMARY --primary --auto --output $SECONDARY_2 --auto --left-of $PRIMARY
else
    xrandr --output $SECONDARY_1 --off
    xrandr --output $SECONDARY_2 --off
    xrandr --output $PRIMARY --primary --auto
fi
