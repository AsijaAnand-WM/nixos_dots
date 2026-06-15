{ config, pkgs, unstable, ... }:

{
	home.username = "_19";
	home.homeDirectory = "/home/_19";
	home.stateVersion = "26.05";

	home.packages = with pkgs; [
        fd
        bat
        ripgrep
        ripgrep-all
		bluetui
		ffmpeg
		brave
        waybar
        tmux
        blender
        nodejs
        zotero
        foliate
        obsidian
        gimp
	];

	programs.bash = {
		enable = true;

		shellAliases = {
			home_test = "echo I am _19";
			tx = "tmux";
			jk = "nvim";
            br = "broot";
            
            nrs = "sudo nixos-rebuild switch --flake /home/_19/nixos_dots/.#neunzehnte --impure";
            nixclean = "nix-collect-garbage --delete-older-than 10d";
		};

		initExtra = ''
            # set -o vi
            export EDITOR=nvim
			export SUDO_EDITOR=nvim
		'';
	};

    programs.oh-my-posh = {
        enable = true;
        enableBashIntegration = true;
        useTheme = "half-life";
    };

    programs.delta = {
        enable = true;
        enableGitIntegration = true;
        options = {
            dark = true;
            true-color = "always";
            line-numbers = true;
            side-by-side = true;
        };
    };

    programs.fzf = {
        enable = true;
        enableBashIntegration = true;
    };

    programs.broot = {
        enable = true;
        settings.modal = true;
        enableBashIntegration = true;
    };

    programs.kitty = {
        enable = true;

		font = {
			name = "JetBrainsMono Nerd Font";
			size = 11;
		};

		themeFile = "zenbones_dark";

		settings = {
			window_padding_width = 4;
			background_opacity = "0.9";

			cursor_trail = 10;
			cursor_trail_start_threshold = 0;
			cursor_trail_decay = "0.01 0.05";
		};
		
		shellIntegration.enableBashIntegration = true;
	};

	programs.neovim = {
		enable = true;
		package = unstable.neovim-unwrapped;
		defaultEditor = true;

		viAlias = true;
		vimAlias = true;
		vimdiffAlias = true;

		initLua = builtins.readFile ./dotfiles/nvim/init.lua;

        extraPackages = with pkgs; [
            lua-language-server
            nixd
            clang-tools
        ];

		plugins = [
			(pkgs.vimPlugins.nvim-treesitter.withPlugins (p: [ 
				p.c 
				p.cpp
				p.nix
				p.lua
			]))
		];

    };

    programs.git = {
        enable = true;
        settings = {
            user = {
                name  = "Asija Anand";
                email = "asija.anand.official@gmail.com";
            };
            init.defaultBranch = "main";
        };
    };

    home.file.".config/sway".source = ./dotfiles/sway;
    home.file.".config/waybar".source = ./dotfiles/waybar;
    home.file.".config/tmux".source = ./dotfiles/tmux;

}
