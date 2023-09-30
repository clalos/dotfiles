#!/bin/bash

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use
polybar-msg cmd quit

# Run polybar
MONITOR=DP-3 polybar --reload primary &
MONITOR=HDMI-1 polybar --reload secondary &

echo "Bars launched..."
