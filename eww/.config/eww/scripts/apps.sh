#!/bin/bash

if [[ "$1" == "--kitty" ]]; then
    kitty --working-directory ~ &

elif [[ "$1" == "--browser" ]]; then
    firefox &

elif [[ "$1" == "--files" ]]; then
    thunar ~ &

elif [[ "$1" == "--discord" ]]; then
    discord &

elif [[ "$1" == "--mail" ]]; then
    firefox --new-tab "https://mail.google.com"

elif [[ "$1" == "--pow" ]]; then
    xfce4-power-manager-settings &

elif [[ "$1" == "--nm" ]]; then
    networkmanager_dmenu

fi
