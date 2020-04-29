#!/bin/zsh

# Start graphical server on tty1 if not already running.
[ "$(tty)" = "/dev/tty1" ] && ! ps -e | grep -qw Xorg && exec startx "$XDG_CONFIG_HOME/X11/xinitrc"
