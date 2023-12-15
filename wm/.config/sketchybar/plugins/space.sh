#!/bin/sh

# The $SELECTED variable is available for space components and indicates if
# the space invoking this script (with name: $NAME) is currently selected:
# https://felixkratz.github.io/SketchyBar/config/components#space----associate-mission-control-spaces-with-an-item

COLOR="0xffcdd6f4"
BORDER_WIDTH=2
BORDER_COLOR=0xff282828

if [ "$SELECTED" = "true" ]; then
  COLOR="0xfffabd2f"
  BORDER_COLOR="0xfffabd2f"
  BORDER_WIDTH=2
fi

sketchybar --set $NAME icon.highlight=$SELECTED \
                        label.highlight=$SELECTED \
                        icon.highlight_color=$COLOR\
                        background.border_color=$BORDER_COLOR\
                        background.border_width=$BORDER_WIDTH\
                        background.color=0xff383838
