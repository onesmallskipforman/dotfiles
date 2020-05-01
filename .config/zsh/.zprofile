# Start graphical server on tty1 if not already running.
# exec startx "$XDG_CONFIG_HOME/X11/xinitrc"
[ "$(tty)" = "/dev/tty1" ] && exec startx "$XDG_CONFIG_HOME/X11/xinitrc"
