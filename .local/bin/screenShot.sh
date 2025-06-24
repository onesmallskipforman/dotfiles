#!/bin/sh

function screenShotSelect() {
  mkdir -p ~/shots
  maim -o {-s,_} ~/shots/$(date +%Y_%m_%d--%H-%M-%S_maim).png
}

function screenShotEdit() {
  OUT=~/shots/$(date +%Y_%m_%d--%H-%M-%S_maim).png
  mkdir -p ~/shots
  maim -o -s $OUT
  gimp --no-splash $OUT
}
