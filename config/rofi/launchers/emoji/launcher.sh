#!/usr/bin/env bash

## Author  : Aditya Shakya
## Mail    : adi1090x@gmail.com
## Github  : @adi1090x
## Twitter : @adi1090x

# >> Created and tested on : rofi 1.6.0-1

theme="emoji"
dir="$HOME/.config/rofi/launchers/emoji"
rofi -show emoji -modi emoji -theme $dir/"$theme"

