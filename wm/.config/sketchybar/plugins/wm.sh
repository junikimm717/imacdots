#!/bin/sh

if ! test -z "$MODE"; then
  sketchybar --set $NAME label="$MODE"
  exit
fi

LABEL=""

case "$(yabai -m query --spaces --space | jq '.type')" in
  '"bsp"')
    LABEL="bsp"
  ;;
  '"float"')
    LABEL="float"
  ;;
  '"stack"')
    LABEL="stack"
  ;;
esac

sketchybar --set $NAME label="$LABEL"
