#!/bin/sh

# Extend display when an external monitor is connected.
# Turn off external output when the monitor is disconnected.
# This script is meant to be triggered by an udev rule.
# Only considers the case of a single external monitor.

# Position of the laptop relative to the monitor.
position="right"

int=$(xrandr | grep -oP "(.*?)(?= connected)" | sed -n 1p)
ext=$(xrandr | grep -oP "(.*?)(?= connected)" | sed -n 2p)

if [ $(xrandr | grep -oP "(.*?)(?= connected)" | wc -l) -gt 1 ]; then
	xrandr --output $int --auto --${position}-of $ext --output $ext --auto
else
	xrandr --output $ext --off --output $int --auto
fi

sh ~/.fehbg
