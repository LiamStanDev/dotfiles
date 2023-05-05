#!/bin/bash

FILE="$HOME/.cache/eww_launch.weather"
CFG="$HOME/.config/eww/weather"
EWW=`which eww`

# check eww daemon

if [[ ! `pidof eww` ]]; then
    eww daemon
    sleep 1
fi

# open widgets
run_eww() {
    ${EWW} --config "$CFG" open-many \
        weather
}

if [[ ! -f "$FILE" ]]; then
    touch "$FILE"
    run_eww
else
    ${EWW} --config "$CFG" close weather
    rm "$FILE"
fi
