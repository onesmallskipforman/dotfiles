#!/usr/bin/env bash
# from https://github.com/bakkesmodorg/BakkesMod2-Plugins/issues/2
# and  https://github.com/CrumblyLiquid/BakkesLinux/blob/master/bakkes.sh

# Set RL launch options to `"/path/to/this/script.sh" & %command%`
# Put any other launch options before `%command%` like normal

# Set Wineprefix for Rocket League
RL_PREFIX=$HOME/.steam/debian-installation/steamapps/compatdata/252950
COMPATDATA=$RL_PREFIX/pfx

# injector script
BAKKESMOD="$COMPATDATA/drive_c/Program Files/BakkesMod/BakkesMod.exe"

# Proton Path
# should look like $HOME/.steam/debian-installation/steamapps/common/<VER>/dist
# you could also get the version from $RL_PREFIX/version
PROTON="$(sed -n 4p "$RL_PREFIX"/config_info | xargs -d '\n' dirname)"

# Start BakkesMod when RL Starts
while ! killall -0 RocketLeague.ex 2> /dev/null; do sleep 1; done

# Open BakkesMod with above wineprefix and proton
# IMPORTANT! MAKE SURE YOU ENABLE WINE E/F SYNC HERE, DEPENDING ON YOUR NEEDS!
# either WINEESYNC=1 OR WINEFSYNC=1
WINEESYNC=1 WINEPREFIX="$COMPATDATA" "$PROTON"/bin/wine64 "$BAKKESMOD" &

# Kill BakkesMod process when RL is closed
# while killall -0 RocketLeague.ex 2> /dev/null; do sleep 1; done
# killall BakkesMod.exe

# Kill BakkesMod process once initialized
LOG="$COMPATDATA/drive_c/users/steamuser/Application Data/bakkesmod/bakkesmod/bakkesmod.log"
echo "" > "$LOG"
# truncate -s0 $LOG
while ! grep "BakkesMod initialized" "$LOG" > /dev/null; do sleep 1; done
killall BakkesMod.exe
