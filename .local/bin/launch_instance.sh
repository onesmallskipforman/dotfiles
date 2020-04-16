#!/bin/bash

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
