#!/bin/bash
(
  flock 200

  # Terminate already running bar instances
  killall -q polybar

  # Wait until the processes have been shut down
  while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done


  # Launch Polybar, using default config location ~/.config/polybar/config
  # if type "xrandr"; then
  #   for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
  #     MONITOR=$m polybar --reload mybar &
  #   done
  # else
  #   polybar --reload mybar &
  # fi

  export SINK=$(pactl list short sinks | awk '$7 == "RUNNING" { print $2; exit }')

  for m in $(polybar --list-monitors | cut -d":" -f1); do
      # TODO: might need to export this env var
      MONITOR=$m polybar --reload mybar &

      polybar --reload main </dev/null >/var/tmp/polybar-$m.log 2>&1 200>&- &
      disown
  done


  # polybar mybar &

  echo "Polybar launched..."
  flock -u 200
) 200>/var/tmp/polybar-launch.lock
