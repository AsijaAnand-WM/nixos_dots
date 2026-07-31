#!/usr/bin/env bash

# pkill ffplay 2>/dev/null || true && ls $HOME/music/ | dmenu -b -i -l 15 -p 'Music:' -nb '#0d0401' -nf '#ebdbb2' -sb '#403833' -sf '#ebdbb2' | xargs -r -INAME ffplay -nodisp -autoexit -loop 0 -loglevel quiet $HOME/music/'NAME' &

pid=$(pgrep ffplay)
choose="$(ls "$HOME/music/" | dmenu -b -i -l 15 \
                        -p 'Music:'   \
                        -nb '#0d0401' \
                        -nf '#ebdbb2' \
                        -sb '#403833' \
                        -sf '#ebdbb2' )"

if [[ -z $choose ]]; then
    exit 0
fi

if [[ -n $pid ]]; then
    kill "$pid"
fi

ffplay  \
    -nodisp   \
    -autoexit \
    -loop 0   \
    -loglevel quiet \
    "$HOME/music/$choose"
