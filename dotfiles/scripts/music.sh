#!/usr/bin/env bash

choose="$({
            echo "download"
            fd -tf . "$HOME/music/" 
            } | dmenu -b -i -l 15 \
                        -p 'music:'   \
                        -nb '#0d0401' \
                        -nf '#ebdbb2' \
                        -sb '#403833' \
                        -sf '#ebdbb2' )"

[[ -z $choose ]] && exit 0

if [[ $choose == "download" ]]; then
    link="$(wl-paste)"
    link_cleaned="${link%%&list*}"
    continue="$(echo "continue" | dmenu -b -i -l 15 \
                            -p "$link_cleaned:"   \
                            -nb '#0d0401' \
                            -nf '#ebdbb2' \
                            -sb '#403833' \
                            -sf '#ebdbb2' )"

    [[ -z $continue ]] && exit 0
    cd "$HOME/music" || exit 0
    yt-dlp -f ba "$link_cleaned"
    notify-send "Download Done"
else
    pkill ffplay &>/dev/null
    ffplay  \
        -nodisp   \
        -autoexit \
        -loop 0   \
        -loglevel quiet \
        "$choose" \
        &> /dev/null
fi
