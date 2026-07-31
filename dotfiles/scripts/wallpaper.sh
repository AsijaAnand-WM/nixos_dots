#!/usr/bin/env bash

choose="$(fd -tf . "$HOME/nixos_dots/bg/" | dmenu -b -i -l 15 \
                        -p 'Wallpaper:'   \
                        -nb '#0d0401' \
                        -nf '#ebdbb2' \
                        -sb '#403833' \
                        -sf '#ebdbb2' )"

if [[ -z $choose ]]; then
    exit 0
fi

pkill swaybg &> /dev/null
swaybg -i "$choose" &> /dev/null
