#!/usr/bin/env bash

if [[ "$1" == "--path" ]]; then
    dolphin $2
else
    dunstify "No such option!"
fi

# vim:ft=bash:nowrap
