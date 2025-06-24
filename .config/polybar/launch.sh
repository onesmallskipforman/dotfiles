#!/bin/sh

# per https://github.com/polybar/polybar/issues/763

# Terminate already running bar instances
# killall -q polybar
polybar-msg cmd quit

# Wait until the processes have been shut down
# using $USER as $UID is not defined in dash
while pgrep -u $USER -x polybar >/dev/null; do sleep 1; done

DPI=$(xdpyinfo | grep resolution | grep -o '[0-9]\+x[0-9]\+' | tr 'x' ' ')
export DPIX=$(echo $DPI | awk '{print $1}')
export DPIY=$(echo $DPI | awk '{print $2}')

polybar --list-monitors | cut -d":" -f1 | while IFS=$'\n' read m; do
    MONITOR=$m polybar --quiet --reload mybar &
done

echo "Polybar launched..."
