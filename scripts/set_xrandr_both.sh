#!/usr/bin/env bash
# TODO:
# Automate the detection of screen names (even possibly use arandr instead of this script)
# Simplify the ugly if/elif/else below
# Store xrandr's output instead of running the commands multiple times

PRIMARY="eDP1"
SECONDARY_1="HDMI1"
SECONDARY_2="HDMI2"
SECONDARY_3="VIRTUAL1"

if (xrandr | grep "$SECONDARY_1 connected"); then
    xrandr --output $SECONDARY_2 --off
    xrandr --output $SECONDARY_3 --off
    xrandr --output $PRIMARY --primary --auto --output $SECONDARY_1 --auto --left-of $PRIMARY
elif (xrandr | grep "$SECONDARY_2 connected"); then
    xrandr --output $SECONDARY_1 --off
    xrandr --output $SECONDARY_3 --off
    xrandr --output $PRIMARY --primary --auto --output $SECONDARY_2 --auto --left-of $PRIMARY
elif (xrandr | grep "$SECONDARY_3 connected"); then
    xrandr --output $SECONDARY_1 --off
    xrandr --output $SECONDARY_2 --off
    xrandr --output $PRIMARY --primary --auto --output $SECONDARY_3 --auto --left-of $PRIMARY
else
    xrandr --output $SECONDARY_1 --off
    xrandr --output $SECONDARY_2 --off
    xrandr --output $SECONDARY_3 --off
    xrandr --output $PRIMARY --primary --auto
fi
