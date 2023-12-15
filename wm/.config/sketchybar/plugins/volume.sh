#!/bin/sh

# The volume_change event supplies a $INFO variable in which the current volume
# percentage is passed to the script.

if test -z "$INFO"; then
  INFO="$(/usr/bin/osascript -e "get volume settings" | cut -d ',' -f1 | tr -dc [[:digit:]])"
fi

VOLUME=$INFO

sketchybar --set $NAME label="$VOLUME%"
