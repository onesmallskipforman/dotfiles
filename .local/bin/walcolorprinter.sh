#!/bin/bash

# inspired by pywal16's 'palette()' function
# https://github.com/eylles/pywal16/blob/master/pywal/colors.py#L419-L430
NUM=$1
TEXT=${2:-'Sample Text'}

[ $NUM -gt 7 ] && NUM=$(echo "8;5;$NUM")
echo -e "\033[1;3${NUM}m${TEXT}\033[0m"

# test
# seq 0 15 | xargs -I{} walcolorprinter.sh {} yeah

# print all colors
#
# leading 1; is bold, 0; (or omission) is normal
# 30-38 are normal foreground colors
# 38;5;0-8 are lighter foreground colors in wal
# 40-48 are normal background colors
# 48;5;0-8 are lighter background colors in wal
# seq 0 7  | xargs -I{} echo -e "\033[1;3{}m $TEXT \033[0m"
# seq 8 15 | xargs -I{} echo -e "\033[1;38;5;{}m $TEXT \033[0m"
