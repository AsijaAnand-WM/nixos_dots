{ pkgs, unstable, ... }:

{
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
                  p.javascript
                  p.typescript
            ]))
        ];

    };
}
