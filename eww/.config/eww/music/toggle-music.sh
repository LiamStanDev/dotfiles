#!/bin/bash

FILE="$HOME/.cache/eww_launch.music"
CFG="$HOME/.config/eww/music"
EWW=`which eww`

# check eww daemon

if [[ ! `pidof eww` ]]; then
    eww daemon
    sleep 1
fi

# open widgets
run_eww() {
    ${EWW} --config "$CFG" open \
        music
}

if [[ ! -f "$FILE" ]]; then
    touch "$FILE"
    run_eww
else
    ${EWW} --config "$CFG" close music
    rm "$FILE"
fi
