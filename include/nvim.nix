{ pkgs, unstable, ... }:

{
    programs.neovim = {
        enable = true;
        package = unstable.neovim-unwrapped;
        defaultEditor = true;

        viAlias = true;
        vimAlias = true;
        vimdiffAlias = true;

        initLua = builtins.readFile ../dotfiles/nvim/init.lua;

        extraPackages = with pkgs; [
            lua-language-server
            nixd
            clang-tools
            bash-language-server
            vscode-css-languageserver
            superhtml
            typescript-language-server
            svelte-language-server
            astro-language-server
            tailwindcss-language-server
            marksman
            gopls
            zls
            clojure-lsp
            tinymist
            wgsl-analyzer
            glsl_analyzer
            vscode-json-languageserver
            yaml-language-server
            beam29Packages.expert
            basedpyright
            rust-analyzer
            taplo
        ];

        plugins = [
            (pkgs.vimPlugins.nvim-treesitter.withPlugins (p: [ 
                  p.c 
                  p.cpp
                  p.nix
                  p.lua
                  p.javascript
                  p.typescript
                  p.hurl
            ]))
        ];

    };
}
