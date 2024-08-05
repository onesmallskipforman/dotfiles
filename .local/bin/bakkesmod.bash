#!/bin/sh
# based on https://github.com/bakkesmodorg/BakkesMod2-Plugins/issues/2
# Set RL launch options to `"/path/to/this/script.sh" & %command%`

# rocket league wine paths and injector script
COMPATDATA=$HOME/.steam/debian-installation/steamapps/compatdata/252950
PROTON="$(sed -n 4p "$COMPATDATA"/config_info | xargs -d '\n' dirname)"
WINEPREFIX=$COMPATDATA/pfx; C=$WINEPREFIX/drive_c
BAKKESMOD="$C/Program Files/BakkesMod/BakkesMod.exe"

# Start BakkesMod when RL Starts, either WINEESYNC=1 OR WINEFSYNC=1
until pgrep -x RocketLeague.ex; do sleep 1; done
WINEESYNC=1 WINEPREFIX=$WINEPREFIX "$PROTON"/bin/wine64 "$BAKKESMOD" &

# Kill BakkesMod process once initialized
LOG="$C/users/steamuser/AppData/Roaming/bakkesmod/bakkesmod/bakkesmod.log"
truncate -s0 "$LOG"
until grep "BakkesMod initialized" "$LOG"; do sleep 1; done
killall -e BakkesMod.exe
