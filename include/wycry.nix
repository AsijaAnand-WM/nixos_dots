{pkgs, ...}:

pkgs.writeShellScriptBin "wycry" ''
    loc="$(fd -t d . ~/FullStackOpen | fzf --reverse)"
    [ -z "$loc" ] && exit 0

    if [ -n "$TMUX" ]; then
        tmux new-session -Ad -s "$loc" -c "$loc"
        tmux switch-client -t "$loc"
    else
        tmux new-session -A -s "$loc" -c "$loc"
    fi
    ''

