#!/bin/bash

FILE="$HOME/.cache/eww_launch.audio"
CFG="$HOME/.config/eww/audio"
EWW=`which eww`

# check eww daemon

if [[ ! `pidof eww` ]]; then
    eww daemon
    sleep 1
fi

# open widgets
run_eww() {
    ${EWW} --config "$CFG" open-many \
        audio_ctl
}

if [[ ! -f "$FILE" ]]; then
    touch "$FILE"
    run_eww
else
    ${EWW} --config "$CFG" close audio_ctl
    rm "$FILE"
fi
