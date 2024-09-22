# Start graphical server on tty1 if not already running.
# exec startx "$XDG_CONFIG_HOME/X11/xinitrc"
[ "$(tty)" = "/dev/tty1" ] && exec startx "$XINITRC"
[ "$(tty)" = "/dev/tty2" ] && exec river
[ "$(tty)" = "/dev/tty3" ] && exec Hyprland
