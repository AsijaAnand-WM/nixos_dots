#!/usr/bin/env bash

choose="$(printf "shutdown\nreboot\nkill" | dmenu -b -i -l 15 \
                        -p 'SYS:'   \
                        -nb '#0d0401' \
                        -nf '#ebdbb2' \
                        -sb '#403833' \
                        -sf '#ebdbb2' )"

if [[ -z $choose ]]; then
    exit 0
fi

if [[ $choose == "shutdown" ]]; then
    shutdown now
elif [[ $choose == "reboot" ]]; then
    reboot
else
    process="$(printf "" | dmenu -b -i -l 15 \
                        -p 'KILL:'   \
                        -nb '#0d0401' \
                        -nf '#ebdbb2' \
                        -sb '#403833' \
                        -sf '#ebdbb2')"
    if [[ -z $process ]]; then
        exit 0
    fi
    pkill "$process" &> /dev/null
fi

