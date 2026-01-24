# Start graphical server on tty1 if not already running.
[ "$(tty)" = "/dev/tty1" ] && exec startx "$XINITRC" # -- -ardelay 225 -arinterval 30 # https://github.com/SFTtech/xautocfg?tab=readme-ov-file#alternative-setup-ideas
[ "$(tty)" = "/dev/tty2" ] && exec river
[ "$(tty)" = "/dev/tty3" ] && exec Hyprland
