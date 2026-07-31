#!/usr/bin/env bash

link="$(wl-paste)"
link_cleaned="${link%%&list*}"
choose="$(echo "download" | dmenu -b -i -l 15 \
                        -p "$link_cleaned:"   \
                        -nb '#0d0401' \
                        -nf '#ebdbb2' \
                        -sb '#403833' \
                        -sf '#ebdbb2' )"

[[ -z $choose ]] && exit 0

if [[ $choose == "download" ]]; then
    cd "$HOME/music" || exit 0
    yt-dlp -f ba "$link_cleaned"
    notify-send "Download Done"
fi

