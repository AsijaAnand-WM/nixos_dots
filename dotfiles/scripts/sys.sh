#!/usr/bin/env bash

choose="$(printf "shutdown\nreboot\nkill\npkill" | dmenu -b -i -l 15 \
                        -p 'sys:'   \
                        -nb '#0d0401' \
                        -nf '#ebdbb2' \
                        -sb '#403833' \
                        -sf '#ebdbb2' )"

[[ -z $choose ]] && exit 0

if [[ $choose == "shutdown" ]]; then
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
    process="$(ps -eo pid=,comm= | dmenu -b -i -l 15 \
                        -p 'pkill:'   \
                        -nb '#0d0401' \
                        -nf '#ebdbb2' \
                        -sb '#403833' \
                        -sf '#ebdbb2' |
                        awk '{ print $2 }'
    )"
    [[ -z $process ]] && exit 0
    pkill "${process}" &> /dev/null
fi

