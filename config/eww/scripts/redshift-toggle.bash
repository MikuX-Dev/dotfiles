#!/usr/bin/env bash

FILE="$HOME/.cache/redshift_launch"
if [[ ! -f "$FILE" ]]; then
  touch "$FILE"
  redshift &
  dunstctl close
  dunstify -i "$HOME/.config/eww/assets/images/nightmode-on.png" "Nightmode" "Nightmode has been turned on"
else
  killall redshift &
  rm "$FILE"
  dunstctl close
  dunstify -i "$HOME/.config/eww/assets/images/nightmode-off.png" "Nightmode" "Nightmode has been turned off"
fi

# vim:ft=bash:nowrap
