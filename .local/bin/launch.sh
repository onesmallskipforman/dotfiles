#!/bin/sh

#===============================================================================
# CONFIGURING YABAI/SKHD
#===============================================================================

function displaymode() {
  if [ "$1" = "on" ]; then
    yabai -m config active_window_border_color 0xffa89984
    yabai -m config normal_window_border_color 0xffa89984
    yabai -m config insert_window_border_color 0xffa89984
    yabai -m config active_window_opacity 0.9
    yabai -m config normal_window_opacity 0.9
  elif [ "$1" = "off" ]; then
    yabai -m config active_window_border_color 0xffa89984
    yabai -m config normal_window_border_color 0xff3c3836
    yabai -m config insert_window_border_color   0xffd75f5f
    yabai -m config active_window_opacity 1.0
    yabai -m config normal_window_opacity 0.9
  fi
}

function reset() {
  launchctl kickstart -k "gui/${UID}/homebrew.mxcl.yabai" && skhd --reload
}

#===============================================================================
# LAUNCHING PROGRAMS
#===============================================================================

function launch_instance() {
  # test script
  # from https://github.com/noperator/dotfiles/blob/master/.config/kitty/launch_instance.sh

  FOCUSED_WINDOW=$(yabai -m query --windows --window)

  # If launching _from_ a focused kitty window, open the new kitty window with the same working directory. The socket is required to use control messages to grab the working directory of the focused kitty window; more details in kitty's [documentation](https://sw.kovidgoyal.net/kitty/invocation.html?highlight=socket#cmdoption-kitty-listen-on).
  FOCUSED_WINDOW_APP=$(jq '.app' -r <<< "$FOCUSED_WINDOW")
  # if [[ "$FOCUSED_WINDOW_APP" == 'kitty' ]]; then
  #     DIR=$(/Applications/Kitty.app/Contents/MacOS/kitty @ --to unix:/tmp/mykitty ls | jq '.[] | select(.is_focused==true) | .tabs[] | select(.is_focused==true) | .windows[] | .cwd' -r)
  # else
  #     DIR="$HOME"
  # fi


  # Adapted a few changes from yanzhang0219's [script](https://github.com/koekeishiya/yabai/issues/413#issuecomment-604072616) to leverage yabai [signals](https://github.com/koekeishiya/yabai/wiki/Commands#automation-with-rules-and-signals) to move the new kitty window to the focused display, rather than the display the first kitty window was launched from.
  FOCUSED_WINDOW_DISPLAY=$(echo "$FOCUSED_WINDOW" | jq .display)
  FOCUSED_WINDOW_ID=$(echo "$FOCUSED_WINDOW" | jq .id)
  yabai -m signal --add \
      action="yabai -m signal --remove temp_move_kitty;
              YABAI_WINDOW_DISPLAY=\$(yabai -m query --windows --window $YABAI_WINDOW_ID | jq .display);
              if ! [[ \$YABAI_WINDOW_DISPLAY == $FOCUSED_WINDOW_DISPLAY ]]; then
                  yabai -m window \$YABAI_WINDOW_ID --warp $FOCUSED_WINDOW_ID;
                  yabai -m window --focus \$YABAI_WINDOW_ID;
              fi" \
      app=Alacritty \
      event=window_created \
      label=temp_move_kitty

  # Launch new kitty window; the temporary signal above will move it to the focused display.
  # /Applications/Kitty.app/Contents/MacOS/kitty --listen-on unix:/tmp/mykitty --single-instance --directory "$DIR" "$@"
  # /Applications/Kitty.app/Contents/MacOS/kitty --listen-on unix:/tmp/mykitty --hold --single-instance --directory ~ $@ &
  open -na /Applications/kitty.app/ --args -1 -d ~ $@
  # open -na /Applications/Alacritty.app --args -e $@
}

function mission_control() {
  # activate mission control
  last=$(cliclick p); cliclick m:0,0; yabai -m space --toggle mission-control; cliclick m:$last
}

function safecmd() {
  # open window for app and wait for window to appear
  # echo "${@:2}"
  prelen="$(yabai -m query --windows | jq --arg APP "$1" '. | map(select(.app == $APP)) | length')"
  eval "${@:2}"
  postlen="$(yabai -m query --windows | jq --arg APP "$1" '. | map(select(.app == $APP)) | length')"

  while [ $prelen -ge $postlen ]; do
    postlen="$(yabai -m query --windows | jq --arg APP "$1" '. | map(select(.app == $APP)) | length')"
  done
}

function superterm() {
  safecmd kitty launch_instance "$@"
}

function brave_google_search() {

  function urlencode() {
    # from https://gist.github.com/cdown/1163649
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

  open -na Brave\ Browser --new-window "http://google.com/search?q=$(urlencode $1)"
}

#===============================================================================
# FLASHY FUNCTIONS
#===============================================================================

function showoff() {

  [ ! -z "$(yabai -m query --spaces --display 3 | jq '.[-1].windows[]')" ] && \
    yabai -m space --create && yabai -m space --focus last || \
    yabai -m space --focus last

  superterm zsh -is eval "neofetch \&\& figlet Hello, Skipper" # --kitty ~/.local/share/wallpapers/sunman.jpeg --size 300px \&\& figlet Hello, Skipper
  superterm zsh -is eval gotop
  superterm zsh -is eval asciiquarium
  superterm zsh -is eval tty-clock -ct
  superterm zsh -is eval pipes.sh
  yabai -m window first --insert south && yabai -m window --focus first
  superterm zsh -is eval lf

  displaymode on

}

function battlestation() {

  yabai -m signal --add event=application_activated app="kitty" label=bskitty \
    action="yabai -m window \$YABAI_WINDOW_ID --display 3"

  yabai -m signal --add event=application_activated app="Code" label=bscode \
    action="yabai -m window \$YABAI_WINDOW_ID --display 2"

  yabai -m signal --add event=window_created app="Brave Browser" label=bsbrave \
    action="yabai -m window \$YABAI_WINDOW_ID --display 1"

  last3="$(yabai -m query --displays --display 3 | jq '.spaces[-1]')"
  last2="$(yabai -m query --displays --display 2 | jq '.spaces[-1]')"
  last1="$(yabai -m query --displays --display 1 | jq '.spaces[-1]')"

  # [ ! -z "$(yabai -m query --spaces --display 3 | jq '.[-1].windows[]')" ] && \
  #   yabai -m space "${last3}" --create && yabai -m space --focus "$(( $last3 + 1 ))" || \
  #   yabai -m space --focus "$last3"
  # [ ! -z "$(yabai -m query --spaces --display 2 | jq '.[-1].windows[]')" ] && \
  #   yabai -m space "${last2}" --create && yabai -m space --focus "$(( $last2 + 1 ))" || \
  #   yabai -m space --focus "$last2"
  # [ ! -z "$(yabai -m query --spaces --display 1 | jq '.[-1].windows[]')" ] && \
  #   yabai -m space "${last1}" --create && yabai -m space --focus "$(( $last1 + 1 ))" || \
  #   yabai -m space --focus "$last1"

  [ ! -z "$(yabai -m query --spaces --display 3 | jq '.[-1].windows[]')" ] && \
    yabai -m space "${last3}" --create
  [ ! -z "$(yabai -m query --spaces --display 2 | jq '.[-1].windows[]')" ] && \
    yabai -m space "${last2}" --create
  [ ! -z "$(yabai -m query --spaces --display 1 | jq '.[-1].windows[]')" ] && \
    yabai -m space "${last1}" --create

  last3="$(yabai -m query --displays --display 3 | jq '.spaces[-1]')"
  last2="$(yabai -m query --displays --display 2 | jq '.spaces[-1]')"
  last1="$(yabai -m query --displays --display 1 | jq '.spaces[-1]')"

  yabai -m space --focus "$last1"
  yabai -m space --focus "$last2"
  yabai -m space --focus "$last3"

  # DIR="/Users/skipper/Projects/Dotfiles/Home"
  # REMOTE="$(git -C "$DIR" config --get remote.origin.url)"

  # safecmd "Brave Browser" "open -na Brave\ Browser" --args --new-window "$REMOTE"
  # safecmd kitty           open -na /Applications/kitty.app/ --args -1 -d "$DIR"
  # safecmd Code            code -n "$DIR"

  # focus lines are not needed here. it's just to make the window opening look nicer
  yabai -m space --focus "$last1"
  safecmd "Brave Browser" "open -na Brave\ Browser"
  yabai -m space --focus "$last2"
  safecmd Code            code -n
  yabai -m space --focus "$last3"
  safecmd kitty           open -na /Applications/kitty.app/ --args -1 -d ~

  yabai -m signal --remove bskitty
  yabai -m signal --remove bsbrave
  yabai -m signal --remove bscode

}

#===============================================================================
# KEYPRESS SIMULATION
#===============================================================================

function escape_press() {
  # escape key
  # skhd -k "escape"
  osascript -e "tell application \"System Events\" to key code 53"
}

#===============================================================================
# YABAI TRICKS
#===============================================================================

function windowToSpace_ff() {
  # move window to space and follow focus
  WIN_ID=$(yabai -m query --windows --window | jq .id)
  yabai -m window "${WIN_ID}" --space "$1"
  yabai -m space --focus "$1"
  yabai -m widnow "${WIN_ID}" --focus # may not need this line
}

function newspace_focus() {
  # create new space and focus on new space
  yabai -m space --create
  index="$(yabai -m query --spaces --display |
           jq 'map(select(."native-fullscreen" == 0))[-1].index')"
  yabai -m space --focus "${index}"
}

function focus_space_mc() {
  # focus space while mission control is open
  escape_press; sleep 0.3; yabai -m space --focus "$1"
}

function clearEmptySpaces () {
  # delete spaces, go in reverse order to avoid shifting space numbers
  yabai -m query --spaces | jq '. | map(select(.windows == []).index) | reverse | .[]' | while read index; do
    yabai -m space "$index" --destroy
  done
}

function destroyCurrentSpace() {
  # destroy current space and focus on the previous
  # note that windows in a destroyed space go to the first space on a display
  index=$(yabai -m query --spaces --space | jq '.index - 1')
  mindex=$(yabai -m query --spaces --display | jq '.[0].index - 1')
  yabai -m space --destroy
  [ ! "$index" = "$mindex" ] && yabai -m space --focus "${index}"
}
