#!/bin/sh

#===============================================================================
# KEYPRESS SIMULATION
#===============================================================================

# escape key
function escape_press() {
  osascript -e "tell application \"System Events\" to key code 53"
}

#===============================================================================
# PROGRAM LAUNCHERS
#===============================================================================

# activate mission control
function mission_control() {
  last=$(cliclick p); cliclick m:0,0; open -a Mission\ Control; cliclick m:$last
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



# move window to space (options: number, next, prev, first, last)
function space_window() {
  WIN_ID=$(yabai -m query --windows --window | jq .id)
  yabai -m window "${WIN_ID}" --space "$1"
}

# move focused window, and focus space
function focus_space_window() {
  WIN_ID=$(yabai -m query --windows --window | jq .id)
  yabai -m window "${WIN_ID}" --space "$1"
  yabai -m space --focus "$1"
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

# use env variable

# if none of the apps on current window are kitty, warp to last

# TODO: make version that supports supplying your own space index
function safelaunch() {
  # really only for commands that open new windows

  # grab all ids of app and current space index
  IDS1=$(yabai -m query --windows | jq -r --arg APP "$1" '. | map(select(.app == $APP).id)')
  spaceindex="$(yabai -m query --spaces --space | jq .index)"

  # track number of app windows before and after running command
  prelen="$(yabai -m query --windows | jq --arg APP "$1" '. | map(select(.app == $APP)) | length')"

  # echo "${@:2}"
  eval "${@:2}" &

  postlen="$(yabai -m query --windows | jq --arg APP "$1" '. | map(select(.app == $APP)) | length')"
  while [ $prelen -ge $postlen ]; do
    postlen="$(yabai -m query --windows | jq --arg APP "$1" '. | map(select(.app == $APP)) | length')"
  done

  # find id of the new window
  IDS2=$(yabai -m query --windows | jq -r --arg APP "$1" '. | map(select(.app == $APP).id)')
  NEWID=$(jq -n --argjson i1 "$IDS1" --argjson i2 "$IDS2" '$i2 | map(select(. | IN($i1 | .[]) | not ))[0]')

  # move new window to focused space and focus back on space
  yabai -m window "$NEWID" --space "${spaceindex}"
  yabai -m window --focus "$NEWID"

  # id="$(yabai -m query --windows --window | jq .id)"
  # yabai -m window --focus "${id}"

  # work in progress
  # grab current window id
  # grap new window id
  # warp new into current if not already a direct child
  # currentindex="$(yabai -m query --spaces --space | jq .index)"
  # if [ $spaceindex != currentindex ]
  # then
  #   yabai -m window --warp last
  # fi

}


function superkitty () {
  # echo $1
  safelaunch "kitty" /Applications/kitty.app/Contents/MacOS/kitty -1 -d ~ zsh -c \"$@\"

  # this version allows for listening
  # /Applications/kitty.app/Contents/MacOS/kitty -1 -d ~ --listen-on unix:/tmp/mykitty zsh -c \"$@\"
}

function supercode () {
  safelaunch "Code" code -n "$1"
}

function superff () {
  safelaunch "Firefox" open -na Firefox --args '--new-window' "$1" &
}

# buggy atm. I think it's due to space in the app name
# function superbrave () {
#   safelaunch "Brave\ Browser" open -na "/Applications/Brave\ Browser.app/" &
# }

function safelaunch_s() {
  # really only for commands that open new windows

  # grab all ids of app and current space index
  IDS1=$(yabai -m query --windows | jq -r --arg APP "$2" '. | map(select(.app == $APP).id)')

  echo "$1"
  spaceindex="$1"

  # track number of app windows before and after running command
  prelen="$(yabai -m query --windows | jq --arg APP "$2" '. | map(select(.app == $APP)) | length')"

  eval "${@:3}" &

  postlen="$(yabai -m query --windows | jq --arg APP "$2" '. | map(select(.app == $APP)) | length')"
  while [ $prelen -ge $postlen ]; do
    postlen="$(yabai -m query --windows | jq --arg APP "$2" '. | map(select(.app == $APP)) | length')"
  done

  # find id of the new window
  IDS2=$(yabai -m query --windows | jq -r --arg APP "$2" '. | map(select(.app == $APP).id)')
  NEWID=$(jq -n --argjson i1 "$IDS1" --argjson i2 "$IDS2" '$i2 | map(select(. | IN($i1 | .[]) | not ))[0]')

  # move new window to focused space and focus back on space
  yabai -m window "$NEWID" --space "${spaceindex}"
  # yabai -m window --focus "$NEWID"

  # id="$(yabai -m query --windows --window | jq .id)"
  # yabai -m window --focus "${id}"

  # work in progress
  # grab current window id
  # grap new window id
  # warp new into current if not already a direct child
  # currentindex="$(yabai -m query --spaces --space | jq .index)"
  # if [ $spaceindex != currentindex ]
  # then
  #   yabai -m window --warp last
  # fi

}

function superkitty_s () {
  # echo $1
  safelaunch_s "$1" "kitty" /Applications/kitty.app/Contents/MacOS/kitty -1 -d ~ zsh -c \""${@:2}"\"
}

function supercode_s () {
  safelaunch_s "$1" "Code" code -n "$2"
}

function superff_s () {
  safelaunch_s "$1" "Firefox" open -na Firefox --args '--new-window' "$2" &
}






function showoff () {
  yabai -m space --create
  yabai -m space --focus last
  superkitty zsh -is eval '\"neofetch --kitty ~/Projects/Dotfiles/sunman.jpeg --size 300px; figlet Hello, Skipper\"'
  superkitty zsh -is eval gotop
  superkitty zsh -is eval asciiquarium
  superkitty zsh -is eval tty-clock -ct
  superkitty zsh -is eval pipes.sh

  yabai -m window --focus first
  superkitty zsh -is eval lf
  # sleep 1

  # feh ~/Desktop/sunman.jpeg
}

function battlestation () {

  # new desktops on all displays
  # ndisplays=$(yabai -m query --displays | jq '. | length')

  # yabai -m space --create
  # yabai -m space --create
  # yabai -m space --create

  yabai -m display --focus 1

  current="$(yabai -m query --displays --display | jq '.index')"
  while [ "$current" -ne 1 ]; do
    current="$(yabai -m query --displays --display | jq '.index')"
  done

  yabai -m space --create
  last="$(yabai -m query --displays | jq '.[] | select(.index == 1).spaces[-1]')"
  yabai -m space --focus "${last}"

  current="$(yabai -m query --spaces --space | jq '.index')"
  while [ "$current" -ne "$last" ]; do
    current="$(yabai -m query --spaces --space | jq '.index')"
  done

  superkitty "zsh -i"

  yabai -m display --focus 2

  current="$(yabai -m query --displays --display | jq '.index')"
  while [ "$current" -ne 2 ]; do
    current="$(yabai -m query --displays --display | jq '.index')"
  done

  yabai -m space --create
  last="$(yabai -m query --displays | jq '.[] | select(.index == 2).spaces[-1]')"
  yabai -m space --focus "${last}"

  current="$(yabai -m query --spaces --space | jq '.index')"
  while [ "$current" -ne "$last" ]; do
    current="$(yabai -m query --spaces --space | jq '.index')"
  done

  superff

  yabai -m display --focus 3

  current="$(yabai -m query --displays --display | jq '.index')"
  while [ "$current" -ne 2 ]; do
    current="$(yabai -m query --displays --display | jq '.index')"
  done

  yabai -m space --create
  last="$(yabai -m query --displays | jq '.[] | select(.index == 3).spaces[-1]')"
  yabai -m space --focus "${last}"

  current="$(yabai -m query --spaces --space | jq '.index')"
  while [ "$current" -ne "$last" ]; do
    current="$(yabai -m query --spaces --space | jq '.index')"
  done

  # supercode

}



function battlestation_s () {

  # new desktops on all displays
  # ndisplays=$(yabai -m query --displays | jq '. | length')

  # yabai -m space --create
  # yabai -m space --create
  # yabai -m space --create

  orig="$(yabai -m query --displays --display | jq '.index')"

  max="$(yabai -m query --displays --space | jq '.spaces | max')"
  yabai -m space --create
  yabai -m space --create
  yabai -m space --create

  superff_s "$(( $max+1 ))"
  supercode_s "$(( $max+2 ))"
  # superkitty_s "$(( $max+2 ))" "zsh -i eval nvim"
  superkitty_s "$(( $max+3 ))" "zsh -i"


  yabai -m space "$(( $max+1 ))" --display 1
  yabai -m space "$(( $max+2 ))" --display 2
  yabai -m space "$(( $max+3 ))" --display 3

  yabai -m space --focus "$(yabai -m query --displays | jq --argjson o "$orig" '.[] | select(.index == $o) | .spaces | max')"

  # last="$(yabai -m query --displays | jq '.[] | select(.index == 1).spaces[-1]')"
  # superkitty_s "$last" "zsh -i"

  # last="$(yabai -m query --displays | jq '.[] | select(.index == 1).spaces[-1]')"
  # superkitty_s "$last" "zsh -i"

  # last="$(yabai -m query --displays | jq '.[] | select(.index == 2).spaces[-1]')"
  # superff_s "$last"


  # supercode

}


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





# make kitty window, return id
# loop: make kitty window as child of id, return id


# the behavior is the same everywhere. we will just make sure we can warp to current space (display) when we insert a terminal, since terminal insertion is so common
# extend to a keybinding for quickly opening a safari window (command n and send)


# if child of parent window already, dont warp; else warp
# YOU NEED THIS TO WORK IN ALL EDGE CASES
# FOR NOW FILL IN GAPS WITH EASY WINDOW MOVEMENT

# come up with some fixed yabai hierarchy for work/coding setup





# function kittylaunch_i () {
#   # relearn how to insert variables into titles
#   prelen="$(yabai -m query --windows | jq '. | map(select(.title == "kitty")) | length')"
#   parentid="$(yabai -m query --windows --window | jq .id)"
#   # displayindex="$(yabai -m query --displays --display | jq .index)"
#   # kitty --single-instance zsh -is eval "$1" # with zshrc setup
#   # /Applications/kitty.app/Contents/MacOS/kitty -o allow_remote_control=yes --single-instance -d ~ "$1" &
#   /Applications/kitty.app/Contents/MacOS/kitty -o allow_remote_control=yes --single-instance -d ~ "$1" &

#   postlen="$(yabai -m query --windows | jq '. | map(select(.title == "kitty")) | length')"
#   yabai -m --focus "${index}"
#   while [ $prelen -ge $postlen ]
#   do
#     postlen="$(yabai -m query --windows | jq '. | map(select(.title == "kitty")) | length')"
#     yabai -m --focus "${index}"
#   done
#   yabai -m window --warp "${parentid}"
# }

# yabai -m query --spaces --space | jq .index

# function kittylaunch_i () {
#   prelen="$(yabai -m query --spaces --window | jq '.[].windows | length')"
#   index="$(yabai -m query --spaces --display | jq 'map(select(."native-fullscreen" == 0))[-1].index')"
#   # kitty --single-instance zsh -is eval "$1" # with zshrc setup
#   /Applications/kitty.app/Contents/MacOS/kitty -o allow_remote_control=yes --single-instance -d ~ zsh -c "$1; zsh -i" &
#   postlen="$(yabai -m query --spaces --window | jq '.[].windows | length')"
#   yabai -m --focus "${index}"
#   while [ $prelen -ge $postlen ]
#   do
#     postlen="$(yabai -m query --spaces --window | jq '.[].windows | length')"
#     yabai -m --focus "${index}"
#   done
# }


# # add in mechanism to focus to last launched kitty between these to prevent clicking elsewhere from being a problem
# kittylaunch_i asciiquarium
# kittylaunch_i gotop
# kittylaunch_i "tty-clock -ct"
# kittylaunch_i pipes.sh


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
