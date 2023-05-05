#!/bin/bash

FILE="$HOME/.cache/eww_launch.resources"
CFG="$HOME/.config/eww/resources"
EWW=`which eww`

# check eww daemon

if [[ ! `pidof eww` ]]; then
    eww daemon
    sleep 1
fi

# open widgets
run_eww() {
    ${EWW} --config "$CFG" open-many \
        resources
}

if [[ ! -f "$FILE" ]]; then
    touch "$FILE"
    run_eww
else
    ${EWW} --config "$CFG" close resources
    rm "$FILE"
fi
