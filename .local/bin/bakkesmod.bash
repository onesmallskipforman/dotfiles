#!/usr/bin/env bash
# based on https://github.com/bakkesmodorg/BakkesMod2-Plugins/issues/2
# Set RL launch options to `"/path/to/this/script.sh" & %command%`

# function sleeploop { while eval $@ 2>/dev/null; do sleep 1; done; }
# Set Wineprefix for Rocket League
RLDIR=$HOME/.steam/debian-installation/steamapps/compatdata/252950
WINECFG=$RLDIR/pfx; C=$WINECFG/drive_c

# injector script
BAKKESMOD="$C/Program Files/BakkesMod/BakkesMod.exe"

# Proton Path, $HOME/.steam/debian-installation/steamapps/common/<ver>/<dir>
PROTON="$(sed -n 4p "$RLDIR"/config_info | xargs -d '\n' dirname)"

# Start BakkesMod when RL Starts
while ! killall -0 RocketLeague.ex 2>/dev/null; do sleep 1; done

# Open BakkesMod with wineprefix+proton, either WINEESYNC=1 OR WINEFSYNC=1
WINEESYNC=1 WINEPREFIX="$WINECFG" "$PROTON"/bin/wine64 "$BAKKESMOD" &

# Kill BakkesMod process once initialized
LOG="$C/users/steamuser/Application Data/bakkesmod/bakkesmod/bakkesmod.log"
truncate -s0 "$LOG"; while ! grep "BakkesMod initialized" "$LOG" 2>/dev/null; do sleep 1; done
killall BakkesMod.exe
