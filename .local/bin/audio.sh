#!/bin/sh

# TODO: eventually would like to get this working with wireplumber's wpctl,
# but there isn't a good equivalent for lising all sinks as a list

pactl list short sinks \
  | awk '{print $2}' \
  | fzf --cycle --reverse --height=~100% \
  | xargs pactl set-default-sink
