#!/bin/sh

# TODO: add option to turn on/off bluetooth in this menu
bluetoothctl devices \
  | fzf --cycle --reverse \
  | awk '{print $2}' \
  | xargs -r bluetoothctl connect
