#/bin/sh

function screenRecord() {
  # local current_sink=$(wpctl status -n | grep '\*.*sink.*vol' | sed 's/^[^\.]*\. \|\[.*//g').monitor
  local current_sink=$(wpctl status -n | grep '\*.*sink.*vol' | sed 's/^[^0-9]*\|\..*//g')
  local monitor_opts="$1"
  local RES=$1
  local POS=$2
  local DIR=~/Videos
  local OUT="$DIR/$(date +"%Y_%m_%d_%I_%M_%p").mkv"
  mkdir -p $DIR
  ffmpeg -f x11grab \
    -framerate 30 \
    -s $RES -i $POS \
    -f pulse -i $current_sink \
    $OUT
}

function screenRecordMonitor() {
  # set -e
  # -s 1920x1080 -i :0.0+1920,0 \
  xrandr \
    | grep -w connected \
    | sed 's/\([0-9]*x[0-9]*\)+\([0-9]*\)+\([0-9]*\).*/\1 :0.0+\2,\3/g;s/connected \|primary //g' \
    | fzf \
      --select-1 \
      --height=~100% \
      --header="Please select a Monitor to Record" \
      --cycle \
      --reverse \
      --with-nth=1 \
      --bind 'esc:abort,enter:become(source screenRecord.sh; screenRecord {2} {3})+abort'
  # TODO: figure out how to get the esc:abort feature without having to call the next command within fzf
  # i imagine this will be some combination of set -e/set -o pipefail/etc
}
