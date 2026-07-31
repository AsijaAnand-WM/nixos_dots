#!/usr/bin/env bash

choose="$(fd -td . "$HOME/FullStackOpen/" | dmenu -b -i -l 15 \
                        -p 'Music:'   \
                        -nb '#0d0401' \
                        -nf '#ebdbb2' \
                        -sb '#403833' \
                        -sf '#ebdbb2' )"

echo $choose
if [[ -z $choose ]]; then
    exit 0
fi

if [ -n "$TMUX" ]; then
    tmux new-session -Ad -s "$choose" -c "$choose"
    tmux switch-client -t "$choose"
else
    tmux new-session -A -s "$choose" -c "$choose"
fi
