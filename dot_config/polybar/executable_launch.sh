#!/bin/bash

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use
polybar-msg cmd quit

# Run polybar for all monitors returned by xrandr
MONITOR=DP-0 polybar --reload primary &
MONITOR=HDMI-0 polybar --reload secondary &

echo "Bars launched..."
