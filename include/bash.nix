{ ... }:

{
    programs.bash = {
        enable = true;

        shellAliases = {
            home_test = "echo I am _19";
            tx = "tmux";
            jk = "nvim";

            nrs = "sudo nixos-rebuild switch --flake /home/_19/nixos_dots/.#neunzehnte --impure";
            nixclean = "nix-collect-garbage --delete-older-than 10d";
        };

        initExtra = ''
            export EDITOR=nvim
            export SUDO_EDITOR=nvim
            '';
    };
}
