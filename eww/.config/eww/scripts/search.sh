#!/bin/bash

if [[ "$1" == "--full" ]]; then
    pkill rofi || rofi -show drun -theme ~/.config/rofi/launchers/type-3/style-3.rasi

elif [[ "$1" == "--small" ]]; then
    pkill rofi || rofi -show drun -theme ~/.config/rofi/launchers/type-1/style-6.rasi
fi
