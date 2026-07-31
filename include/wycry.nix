{pkgs, ...}:

pkgs.writeShellScriptBin "jkf" ''
    choose="$(fd --hidden --no-ignore . "$HOME/" | dmenu -b -i -l 15 \
                            -p 'project:'   \
                            -nb '#0d0401' \
                            -nf '#ebdbb2' \
                            -sb '#403833' \
                            -sf '#ebdbb2' )"

    [[ -z $choose ]] && exit 0
    nvim "$choose"
    ''

