#!/usr/bin/env bash

choose="$({
            echo "delete"
            fd -td . "$HOME/FullStackOpen/"
            } | dmenu -b -i -l 15 \
                        -p 'project:'   \
                        -nb '#0d0401' \
                        -nf '#ebdbb2' \
                        -sb '#403833' \
                        -sf '#ebdbb2' )"

[[ -z $choose ]] && exit 0

if [[ $choose == "delete" ]]; then
    what_to_del="$({
                echo "all"
                tmux ls
                    } | dmenu -b -i -l 15 \
                            -p 'project:'   \
                            -nb '#0d0401' \
                            -nf '#ebdbb2' \
                            -sb '#403833' \
                            -sf '#ebdbb2' )"

    [[ -z $what_to_del ]] && exit 0

    if [[ $what_to_del == "all" ]]; then
        tmux kill-server
    else
        tmux kill-session -t "${what_to_del%%:*}"
    fi
else
    if [[ -n "$TMUX" ]]; then
        tmux new-session -Ad -s "$choose" -c "$choose"
        tmux switch-client -t "$choose"
    else
        tmux new-session -A -s "$choose" -c "$choose"
    fi
fi
