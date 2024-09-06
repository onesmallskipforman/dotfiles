#!/bin/sh
# based on https://github.com/bakkesmodorg/BakkesMod2-Plugins/issues/2
# Set RL launch options to "script.sh & %command%"

# rocket league wine paths and injector script
COMPATDATA=$HOME/.steam/steam/steamapps/compatdata/252950
PROTON="$(sed -n 4p "$COMPATDATA"/config_info | xargs -d '\n' dirname)"
WINEPREFIX=$COMPATDATA/pfx; C=$WINEPREFIX/drive_c
BAKKESMOD="$C/Program Files/BakkesMod/BakkesMod.exe"
LOG="$C/users/steamuser/AppData/Roaming/bakkesmod/bakkesmod/bakkesmod.log"

# Start BakkesMod when RL Starts, either WINEESYNC=1 OR WINEFSYNC=1
until pgrep -x RocketLeague.ex; do sleep 1; done; truncate -s0 "$LOG"
WINEESYNC=1 WINEPREFIX=$WINEPREFIX "$PROTON"/bin/wine64 "$BAKKESMOD" & PID=$!

# Kill BakkesMod process once initialized
until grep "BakkesMod initialized" "$LOG"; do sleep 1; done; kill $PID
