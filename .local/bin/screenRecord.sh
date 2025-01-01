#/bin/sh

# NOTE: for some reason audio recording does not work when using pipewire-media-session on desktop. only wireplumber works
# pipewire-media-session does work on laptop. not sure why
function screenRecord() {
  # use the name instead of the number because there are inconsistencies in the number between pactl and wpctl
  # local current_sink=$(wpctl status -n | grep '\*.*alsa_output' | sed 's/^[^\.]*\. \|\[.*//g').monitor
  local current_sink=$(cat ~/.config/pulse/*-default-sink).monitor
  # local current_sink=$(wpctl status -n | grep '\*.*sink.*vol' | sed 's/^[^0-9]*\|\..*//g')
  # local current_sink=$(wpctl status -n | grep '\*.*alsa_output' | sed 's/^[^0-9]*\|\..*//g')
  local monitor_opts="$1"
  local RES=$1
  local POS=$2
  local DIR=~/Videos
  local OUT="$DIR/$(date +%Y_%m_%d--%H-%M-%S_maim).mkv"
  mkdir -p $DIR
  ffmpeg -f x11grab \
    -framerate 25 \
    -s $RES -probesize 42M -thread_queue_size 4096 -i $POS \
    -f pulse -thread_queue_size 4096 -i $current_sink \
    $OUT
}
# -thread_queue_size 16 \

function screenRecordMonitor() {
  # set -e
  # -s 1920x1080 -i :0.0+1920,0 \
  xrandr \
    | grep -w connected \
    | sed 's/\([0-9]*x[0-9]*\)+\([0-9]*\)+\([0-9]*\).*/\1 :0.0+\2,\3/g;s/connected \|primary //g' \
    | fzf \
      --height=~100% \
      --header="Please select a Monitor to Record" \
      --cycle \
      --reverse \
      --with-nth=1 \
      --bind 'esc:abort,enter:become(source screenRecord.sh; screenRecord {2} {3})+abort,one:become(source screenRecord.sh; screenRecord {2} {3})+abort'
  # TODO: figure out how to get the esc:abort feature without having to call the next command within fzf
  # i imagine this will be some combination of set -e/set -o pipefail/etc
}
