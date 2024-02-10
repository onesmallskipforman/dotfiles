#!/bin/sh



# TODO: eventually would like to get this working with wireplumber,
# but there isn't a good equivalent for lising all sinks as a list


pactl list short sinks | awk '{print $2}' | fzf --cycle --reverse --bind 'esc:abort,enter:execute(echo {})+abort' | xargs pactl set-default-sink
# pactl list short sinks | awk '{print $2}' | rofi -dmenu | xargs pactl set-default-sink
