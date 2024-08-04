#!/bin/sh
# based on https://github.com/bakkesmodorg/BakkesMod2-Plugins/issues/2
# Set RL launch options to `"/path/to/this/script.sh" & %command%`

# rocket league wine paths and injector script
RLDIR=$HOME/.steam/debian-installation/steamapps/compatdata/252950
WINECFG=$RLDIR/pfx
C=$WINECFG/drive_c
BAKKESMOD="$C/Program Files/BakkesMod/BakkesMod.exe"
PROTON="$(sed -n 4p "$RLDIR"/config_info | xargs -d '\n' dirname)"

# Start BakkesMod when RL Starts, either WINEESYNC=1 OR WINEFSYNC=1
until pgrep -x RocketLeague.ex; do sleep 1; done
WINEESYNC=1 WINEPREFIX="$WINECFG" "$PROTON"/bin/wine64 "$BAKKESMOD" &

# Kill BakkesMod process once initialized
LOG="$C/users/steamuser/Application Data/bakkesmod/bakkesmod/bakkesmod.log"
truncate -s0 "$LOG"
until grep "BakkesMod initialized" "$LOG"; do sleep 1; done
killall -e BakkesMod.exe
