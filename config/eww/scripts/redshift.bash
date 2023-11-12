#!/usr/bin/env bash

icon() {
  FILE="$HOME/.cache/redshift_launch"
  if [[ ! -f "$FILE" ]]; then
    echo ""
  else
    echo ""
  fi
}

case "$1" in
  --toggle)
    eval "$HOME/.config/eww/scripts/redshift-toggle.bash"
    ;;
  --icon)
    icon
    ;;
  *)
    echo "Invalid Option!"
    ;;
esac

# vim:ft=bash:nowrap
