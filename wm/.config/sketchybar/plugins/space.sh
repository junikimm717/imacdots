#!/bin/sh

# The $SELECTED variable is available for space components and indicates if
# the space invoking this script (with name: $NAME) is currently selected:
# https://felixkratz.github.io/SketchyBar/config/components#space----associate-mission-control-spaces-with-an-item

if test "$SELECTED" = "true"; then
sketchybar --set $NAME background.drawing="$SELECTED" highlight_color=0xfff38ba8 icon.color=0xfff38ba8
else
sketchybar --set $NAME background.drawing="$SELECTED" highlight_color=0xffffffff icon.color=0xffffffff
fi

