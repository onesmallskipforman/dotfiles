#!/bin/sh

# per https://github.com/polybar/polybar/issues/763

# Terminate already running bar instances
# killall -q polybar
polybar-msg cmd quit

# Wait until the processes have been shut down
# using $USER as $UID is not defined in dash
while pgrep -u $USER -x polybar >/dev/null; do sleep 1; done

polybar --list-monitors | cut -d":" -f1 | while IFS=$'\n' read m; do
    MONITOR=$m polybar --quiet --reload mybar &
done

# until pgrep -u $USER -x polybar >/dev/null; do pgrep -u $USER -x polybar; done
# pgrep -u $USER -x polybar

# block script until bars are actually running
until polybar-msg cmd show; do
  sleep 0.1
done

echo "Polybar launched..."
