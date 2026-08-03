#!/usr/bin/env bash

choose="$(printf "zen\nzathura\nwallpaper\nshutdown\nreboot\nkill" | dmenu -b -i -l 15 \
                        -p 'sys:'   \
                        -nb '#0d0401' \
                        -nf '#ebdbb2' \
                        -sb '#403833' \
                        -sf '#ebdbb2' )"

[[ -z $choose ]] && exit 0

if [[ $choose == "zen" ]]; then
    zen
elif [[ $choose == "zathura" ]]; then
    book="$(fd -tf . "$HOME/RES" | dmenu -b -i -l 15 \
                        -p 'sys:'   \
                        -nb '#0d0401' \
                        -nf '#ebdbb2' \
                        -sb '#403833' \
                        -sf '#ebdbb2' )"
    [[ -z $book ]] && exit 0
    zathura --fork "$book"
elif [[ $choose == wallpaper ]]; then
    img="$(fd -tf . "$HOME/nixos_dots/bg/" | dmenu -b -i -l 15 \
                            -p 'wallpaper:'   \
                            -nb '#0d0401' \
                            -nf '#ebdbb2' \
                            -sb '#403833' \
                            -sf '#ebdbb2' )"

    [[ -z $img ]] && exit 0
    pkill swaybg &> /dev/null
    swaybg -i "$img" &> /dev/null
elif [[ $choose == "shutdown" ]]; then
    shutdown now
elif [[ $choose == "reboot" ]]; then
    reboot
elif [[ $choose == "kill" ]]; then
    process="$(ps -eo pid=,comm= | dmenu -b -i -l 15 \
                        -p 'kill:'    \
                        -nb '#0d0401' \
                        -nf '#ebdbb2' \
                        -sb '#403833' \
                        -sf '#ebdbb2' |
                        awk '{ print $1 }'
    )"
    [[ -z $process ]] && exit 0
    kill "${process}" &> /dev/null
else
    kitty -- bash -c "$choose; exec bash"
fi
