#!/bin/sh

# The wifi_change event supplies a $INFO variable in which the current SSID
# is passed to the script.

if test -z "$INFO"; then
  INFO="$(/System/Library/PrivateFrameworks/Apple80211.framework/Resources/airport -I  | awk -F' SSID: '  '/ SSID: / {print $2}')"
fi

WIFI=${INFO:-"Not Connected"}


sketchybar --set $NAME label="${WIFI}"
