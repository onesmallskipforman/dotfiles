#!/bin/sh


# TODO: add option to turn on/off bluetooth in this menu
bluetoothctl devices | fzf --cycle --reverse --bind 'esc:abort,enter:execute(echo {})+abort' | awk '{print $2}' | xargs bluetoothctl connect
