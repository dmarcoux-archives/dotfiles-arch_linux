#!/usr/bin/env bash
# This script switches between the primary and secondary monitors keeping only one on

PRIMARY="eDP-1"
SECONDARY_1="HDMI-1"

if (xrandr | grep "$SECONDARY_1 disconnected"); then
    xrandr --output $SECONDARY_1 --off --output $PRIMARY --auto
else
    xrandr --output $PRIMARY --off --output $SECONDARY_1 --auto
fi
