#!/bin/bash

killall conky
sleep 2s

conky -c $HOME/.config/conky/Kochab/Kochab.conf &> /dev/null &
