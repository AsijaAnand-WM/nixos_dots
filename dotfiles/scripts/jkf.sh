#!/usr/bin/env bash
choose="$(fd --hidden --no-ignore --absolute-path . | dmenu -b -i -l 15 \
                                                        -p 'project:'   \
                                                        -nb '#0d0401' \
                                                        -nf '#ebdbb2' \
                                                        -sb '#403833' \
                                                        -sf '#ebdbb2' )"

# [[ -z $choose ]] && 
if [[ -d $choose ]]; then
    cd "$choose" || exit
elif [[ -f $choose ]]; then
    dir="${choose%/*}"
    if [[ $dir == "$choose" ]]; then
        nvim "$choose"
    else
        cd "$dir" || exit
        git_dir="$(git rev-parse --show-toplevel)"
        git_err="${git_dir%%:*}"
        echo "$dir"
        echo "$git_dir"
        echo "$git_err"
        echo "$choose"
        if [[ $git_err == "fatal" ]]; then
            nvim "$choose"
            exit 0
        else
            cd "$git_dir" || exit
            nvim "${choose}"
        fi
    fi
fi
