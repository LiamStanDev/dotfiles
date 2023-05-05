#!/bin/bash

FILE="$HOME/.cache/eww_launch.calendar"
CFG="$HOME/.config/eww/calendar"
EWW=`which eww`

# check eww daemon

if [[ ! `pidof eww` ]]; then
    eww daemon
    sleep 1
fi

# open widgets
run_eww() {
    ${EWW} --config "$CFG" open-many \
        calendar
}

if [[ ! -f "$FILE" ]]; then
    touch "$FILE"
    run_eww
else
    ${EWW} --config "$CFG" close calendar
    rm "$FILE"
fi
