{ ... }:

{
    programs.bash = {
        enable = true;

        shellAliases = {
            home_test = "echo I am _19";
            tx  = "tmux";
            jkf = "nvim $(fd | fzf --reverse)";
            bt  = "bluetui";
            tp  = "tmux popup";
            sl  = "swaylock -c 000000";
            z   = "zathura";
            v   = "nvim";
            diff = "colordiff -y";

            "."  = "cd ..";
            ".." = "cd ../..";

            nrs = "sudo nixos-rebuild switch --flake /home/_19/nixos_dots/.#neunzehnte --impure";
            nixclean = "nix-collect-garbage --delete-older-than 10d";
        };

        initExtra = ''
            stty -ixon
            shopt -s autocd
            export EDITOR=nvim
            export SUDO_EDITOR=nvim
            '';
    };
}
