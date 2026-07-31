#!/usr/bin/env bash

# pkill ffplay 2>/dev/null || true && ls $HOME/music/ | dmenu -b -i -l 15 -p 'Music:' -nb '#0d0401' -nf '#ebdbb2' -sb '#403833' -sf '#ebdbb2' | xargs -r -INAME ffplay -nodisp -autoexit -loop 0 -loglevel quiet $HOME/music/'NAME' &

choose="$(ls "$HOME/music/" | dmenu -b -i -l 15 \
                        -p 'Music:'   \
                        -nb '#0d0401' \
                        -nf '#ebdbb2' \
                        -sb '#403833' \
                        -sf '#ebdbb2' )"

if [[ -z $choose ]]; then
    exit 0
fi

pkill ffplay &>/dev/null
ffplay  \
    -nodisp   \
    -autoexit \
    -loop 0   \
    -loglevel quiet \
    "$HOME/music/$choose" \
    &> /dev/null
