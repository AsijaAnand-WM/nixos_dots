#!/usr/bin/env bash

choose="$(fd -tf . "$HOME/music/" | dmenu -b -i -l 15 \
                        -p 'music:'   \
                        -nb '#0d0401' \
                        -nf '#ebdbb2' \
                        -sb '#403833' \
                        -sf '#ebdbb2' )"

[[ -z $choose ]] && exit 0

pkill ffplay &>/dev/null
ffplay  \
    -nodisp   \
    -autoexit \
    -loop 0   \
    -loglevel quiet \
    "$choose" \
    &> /dev/null
