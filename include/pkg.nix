{ pkgs, zen-browser, ... }:

{
    home.packages = with pkgs; [

        fastfetch
        bat
        bluetui #
        # chromium
        brave   #
        btop
        caligula
        cmus
        colordiff
        deno
        devenv
        entr
        fd
        ffmpeg
        fsel    #
        gimp    
        gittype #
        gitu    #
        glow    
        gnumake
        gnuplot #
        gomi    #
        lf
        moreutils
        nodejs
        parallel
        presenterm
        raylib   #
        ripgrep
        ripgrep-all  #
        swaybg
        tealdeer
        tmux
        tree
        typst
        waybar
        wev      #
        wiremix
        yt-dlp   #
        # dmenu
        # (pkgs.dmenu.overrideAttrs (old: {
        #     patches = [
        #         ./patches/fuzzy.diff
        #         ./patches/fuzzy_highlight.diff
        #     ];
        # }))
        (dmenu.override {
             patches = [
                 ./patches/fuzzy.diff
             ];
         })
        pass
        figlet
        secretspec
        hurl
        libnotify

        gzdoom
        freedoom
        steam-run
        vkquake
        ironwail

        zen-browser.packages.${pkgs.system}.default
    ];
}
