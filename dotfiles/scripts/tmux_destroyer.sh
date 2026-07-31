#!/usr/bin/env bash

choose="$({
            echo "all"
            tmux ls
                } | dmenu -b -i -l 15 \
                        -p 'project:'   \
                        -nb '#0d0401' \
                        -nf '#ebdbb2' \
                        -sb '#403833' \
                        -sf '#ebdbb2' )"

[[ -z $choose ]] && exit 0

if [[ $choose == "all" ]]; then
    tmux kill-server
else
    tmux kill-session -t "$choose"
fi
