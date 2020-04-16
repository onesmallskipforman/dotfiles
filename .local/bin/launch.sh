#!/bin/sh

#===============================================================================
# FLASHY FUNCTIONS
#===============================================================================

function superkitty() {
  bash launch_instance.sh "$@"
}

function showoff () {
  skhd -k "alt + shift - u"
  yabai -m space --create
  yabai -m space --focus last
  superkitty zsh -is eval neofetch --kitty ~/.local/share/wallpapers/sunman.jpeg --size 300px \&\& figlet Hello, Skipper
  superkitty zsh -is eval gotop
  superkitty zsh -is eval asciiquarium
  superkitty zsh -is eval tty-clock -ct
  superkitty zsh -is eval pipes.sh

  yabai -m window first --insert south
  superkitty zsh -is eval lf

  # feh ~/.local/share/wallpapers/sunman.jpeg
}

function battlestation() {

  yabai -m signal --add event=window_created app="kitty" label=bskitty \
    action="yabai -m window \$YABAI_WINDOW_ID --display 3"

  yabai -m signal --add event=window_created app="Code" label=bscode \
    action="yabai -m window \$YABAI_WINDOW_ID --display 2"

  yabai -m signal --add event=window_created app="Brave Browser" label=bsbrave \
    action="yabai -m window \$YABAI_WINDOW_ID --display 1"

  last3="$(yabai -m query --displays --display 3 | jq '.spaces[-1]')"
  last2="$(yabai -m query --displays --display 2 | jq '.spaces[-1]')"
  last1="$(yabai -m query --displays --display 1 | jq '.spaces[-1]')"

  [ ! -z "$(yabai -m query --spaces --display 3 | jq '.[-1].windows[]')" ] && \
    yabai -m space "${last3}" --create && yabai -m space --focus "$(( $last3 + 1 ))" || \
    yabai -m space --focus "$last3"
  [ ! -z "$(yabai -m query --spaces --display 2 | jq '.[-1].windows[]')" ] && \
    yabai -m space "${last2}" --create && yabai -m space --focus "$(( $last2 + 1 ))" || \
    yabai -m space --focus "$last2"
  [ ! -z "$(yabai -m query --spaces --display 1 | jq '.[-1].windows[]')" ] && \
    yabai -m space "${last1}" --create && yabai -m space --focus "$(( $last1 + 1 ))" || \
    yabai -m space --focus "$last1"

  code -n
  open -na Brave\ Browser
  /Applications/kitty.app/Contents/MacOS/kitty -1 -d ~ zsh -i

  # yabai -m signal --remove bskitty
  # yabai -m signal --remove bsbrave
  # yabai -m signal --remove bscode

}

function displaymode() {
  if [ "$1" = "on" ]; then
    yabai -m config active_window_border_color 0xffa89984
    yabai -m config normal_window_border_color 0xffa89984
    yabai -m config active_window_opacity 0.9
    yabai -m config normal_window_opacity 0.9
  elif [ "$1" = "off" ]; then
    yabai -m config active_window_border_color 0xffa89984
    yabai -m config normal_window_border_color 0xff3c3836
    yabai -m config active_window_opacity 1.0
    yabai -m config normal_window_opacity 0.9
  fi
}

#===============================================================================
# KEYPRESS SIMULATION
#===============================================================================

# escape key
function escape_press() {
  # skhd -k "escape"
  osascript -e "tell application \"System Events\" to key code 53"
}

#===============================================================================
# PROGRAM LAUNCHERS
#===============================================================================

# activate mission control
function mission_control() {
  last=$(cliclick p); cliclick m:0,0; yabai -m space --toggle mission-control; cliclick m:$last
}

#===============================================================================
# WINDOW TRAVEL
#===============================================================================

# focus window (options: prev, next, first, last, recent, mouse, largest, smallest, north, south, east, west, window id)
function focus_window() {
  yabai -m window --focus "$1"
}

# swap window
function swap_window() {
  yabai -m window --swap "$1"
}

# mirror on axis (x-axis, y-axis)
function mirror() {
  yabai -m space --mirror "$1"
}

#===============================================================================
# EXISTING SPACE MANAGEMENT
#===============================================================================

# focus space (options: number, next, prev, first, last)
function focus_space() {
  # osascript -e 'quit app "Mission Control"'
  yabai -m space --focus "$1"
}

# move space
function move_space() {
  yabai -m space --move "$1"
}

# focus space while mission control is open
function focus_space_mc() {
  escape_press; sleep 0.3; focus_space "$1"
}

# move space while mission control is open
function move_space_mc() {
  escape_press; sleep 0.3; move_space "$1"
}

#===============================================================================
# CREATING AND DESTROYING SPACES
#===============================================================================

# create new space
function newspace() {
  yabai -m space --create
}

# create new space and focus on new space
function newspace_focus() {
  yabai -m space --create
  index="$(yabai -m query --spaces --display |
           jq 'map(select(."native-fullscreen" == 0))[-1].index')"
  yabai -m space --focus "${index}"
}

# create new space, and move focused window
function newspace_window() {
  WIN_ID=$(yabai -m query --windows --window | jq .id)
  yabai -m space --create
  index="$(yabai -m query --spaces --display |
           jq 'map(select(."native-fullscreen" == 0))[-1].index')"
  yabai -m window "${WIN_ID}" --space "${index}"
}

# create new space, move focused window, and focus on new space
function newspace_window_focus() {
  WIN_ID=$(yabai -m query --windows --window | jq .id)
  yabai -m space --create
  index="$(yabai -m query --spaces --display |
           jq 'map(select(."native-fullscreen" == 0))[-1].index')"
  yabai -m window "${WIN_ID}" --space "${index}"
  yabai -m space --focus "${index}"
}


#===============================================================================
# SPACE TRAVEL
#===============================================================================

# move focused window to space (options: number, next, prev, first, last)
function space_window() {
  WIN_ID=$(yabai -m query --windows --window | jq .id)
  yabai -m window "${WIN_ID}" --space "$1"
}

# move focused window, and focus window
function focus_space_window() {
  WIN_ID=$(yabai -m query --windows --window | jq .id)
  yabai -m window "${WIN_ID}" --space "$1"
  yabai -m space --focus "$1"
  yabai -m widnow "${WIN_ID}" --focus # may not need this line
}

# In development
# # move space to space
# # TODO: add conditions for jumping spaces on different desktops
# function space_space() {
#   SP_IND=$(yabai -m query --spaces --space | jq .index)
#   yabai -m space "${SP_IND}" --move "$1"
# }

# # move space to space, and focus space
# function space_space() {
#   SP_IND=$(yabai -m query --spaces --space | jq .index)
#   yabai -m space "${SP_IND}" --move "$1"
#   yabai -m space --focus "$1"
# }




















# swap windows

# change split

# rotate

# in development
# # focus window directional across all displays
# alt - h : yabai -m window --focus prev ||\
#   ((yabai -m display --focus prev || yabai -m display --focus last) && \
#   yabai -m window --focus last)

# alt - l : yabai -m window --focus next ||\
#   ((yabai -m display --focus next || yabai -m display --focus first) && \
#   yabai -m window --focus first)

# focus window directional across all desktops





#===============================================================================
# TODO
#===============================================================================

# Function to swap spaces on active displays


#===============================================================================
# DISPLAY TRAVEL
#===============================================================================

# focus space (options: number, next, prev, first, last)
function focus_display() {
  # case "$1" in
  #   "next")
  #     yabai -m display --focus next || yabai -m display --focus first
  #     ;;
  #   "prev")
  #     yabai -m space --focus prev || yabai -m space --focus last
  #     ;;
  #   *)
  #     yabai -m display --focus "$1"
  #     ;;
  # esac
  yabai -m display --focus "$1"
}

# move window to display (options: number, next, prev, first, last)
function display_window() {
  WIN_ID=$(yabai -m query --windows --window | jq .id)
  yabai -m window "${WIN_ID}" --display "$1"
}

# move focused window, and focus space
function focus_display_window() {
  WIN_ID=$(yabai -m query --windows --window | jq .id)
  yabai -m window "${WIN_ID}" --display "$1"
  yabai -m display --focus "$1"
}

# In development
# # move space to display (options: number, next, prev, first, last)
# function display_space() {
#   SP_IND=$(yabai -m query --spaces --space | jq .index)
#   yabai -m space "${SP_IND}" --display "$1"
#   yabai -m display --focus ${index}
# }

# # move focused display, and focus space
# function focus_display_space() {
#   WIN_ID=$(yabai -m query --windows --window | jq .id)
#   yabai -m window "${WIN_ID}" --display "$1"
#   yabai -m display --focus "$1"
# }



#===============================================================================
# LAUNCHERS
#===============================================================================





# TODO: focus back to original display after clearing

function clearemptydesktops () {

  # grab current visible desktops, and currently focused desktop
  # visibleids="$(yabai -m query --spaces | jq -r '. | map(select(.visible == 1).id) | .[]')"
  currentid="$(yabai -m query --spaces --space | jq .id)"

  # delete spaces
  yabai -m query --spaces | jq -c '. | map(select(.windows == []).id) | .[]' | while read clearid; do
    clearindex="$(yabai -m query --spaces | jq --argjson clearid $clearid '. | map(select(.id==$clearid))[-1].index')"
    destroydesktop "${clearindex}"
  done

  # find desktops of old visible ids, and focus

  # focus on original id
  index="$(yabai -m query --spaces | jq --argjson currentid $currentid '. | map(select(.id==$currentid))[-1].index')"
  yabai -m space --focus "${index}"
}

function destroydesktop () {
  if [ ! -z "$1" ]; then
    yabai -m space --focus "$1"
    current="$(yabai -m query --spaces --space | jq '.index')"

    while [ "$current" -ne "$1" ]; do
      current="$(yabai -m query --spaces --space | jq '.index')"
    done
  fi

  prelen="$(yabai -m query --spaces | jq '. | length')"
  yabai -m space --destroy
  postlen="$(yabai -m query --spaces | jq '. | length')"

  while [ $prelen -le $postlen ]
  do
    postlen="$(yabai -m query --windows | jq '. | map(select(.app == "kitty")) | length')"
  done
}




#===============================================================================
# Google Search
#===============================================================================

# from https://gist.github.com/cdown/1163649
function urlencode() {
    # urlencode <string>
    old_lc_collate=$LC_COLLATE
    LC_COLLATE=C

    local length="${#1}"
    for (( i=0; i<length; i++ )); do
        local c="${1:$i:1}"
        case $c in
            [a-zA-Z0-9.~_-]) printf "$c" ;;
            *) printf '%%%02X' "'$c" ;;
        esac
    done

    LC_COLLATE=$old_lc_collate
}

# from https://gist.github.com/cdown/1163649
function urldecode() {
    # urldecode <string>

    local url_encoded="${1//+/ }"
    printf '%b' "${url_encoded//%/\\x}"
}

function google() {
  open -na Brave\ Browser "http://google.com/search?q=$(urlencode $1)"
}
