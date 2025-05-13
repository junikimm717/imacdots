#!/bin/sh

if ! test -z "$MODE"; then
  sketchybar --set $NAME label="$MODE"
  exit
fi

sketchybar --set $NAME label="tiling"
