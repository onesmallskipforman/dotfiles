#!/bin/bash

W=$(xdotool getactivewindow)
S1=$(xprop -id ${W} |awk '/WM_CLASS/{print $4}')
# S2='"Firefox"'

if [ $S1 = '"Alacritty"' ]
then xte "keyup $1" "keyup Super_L" "keydown Control_L" "keydown Shift_L" "key $1" "keyup Shift_L" "keyup Control_L" "keydown Super_L"
else xte "keyup $1" "keyup Super_L" "keydown Control_L"                   "key $1"                 "keyup Control_L" "keydown Super_L"
# else xte "key Control_L"
fi
