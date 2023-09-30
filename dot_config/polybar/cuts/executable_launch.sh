#!/usr/bin/env bash

# Add this script to your wm startup file.

DIR="$HOME/.config/polybar/cuts"

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch the bars on both monitors
MONITOR=DP-3 polybar -q primary -c "$DIR"/config.ini &
MONITOR=HDMI-1 polybar -q secondary -c "$DIR"/config.ini &
