#!/usr/bin/env bash

choose="$(fd -tf . "$HOME/nixos_dots/bg/" | dmenu -b -i -l 15 \
                        -p 'wallpaper:'   \
                        -nb '#0d0401' \
                        -nf '#ebdbb2' \
                        -sb '#403833' \
                        -sf '#ebdbb2' )"

[[ -z $choose ]] && exit 0
pkill swaybg &> /dev/null
swaybg -i "$choose" &> /dev/null
