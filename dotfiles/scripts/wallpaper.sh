#!/usr/bin/env bash

# pkill swaybg 2>/dev/null || true && ls $HOME/nixos_dots/bg/ | dmenu -b -i -l 15 -p 'Wallpaper:' -nb '#0d0401' -nf '#ebdbb2' -sb '#403833' -sf '#ebdbb2' | xargs -r -INAME swaybg -i $HOME/nixos_dots/bg/'NAME' &

choose="$(ls "$HOME/nixos_dots/bg/" | dmenu -b -i -l 15 \
                        -p 'Wallpaper:'   \
                        -nb '#0d0401' \
                        -nf '#ebdbb2' \
                        -sb '#403833' \
                        -sf '#ebdbb2' )"

if [[ -z $choose ]]; then
    exit 0
fi

pkill swaybg &> /dev/null
swaybg -i "/home/_19/nixos_dots/bg/$choose" &> /dev/null
