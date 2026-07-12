{ pkgs, zen-browser, ... }:

{
    home.packages = with pkgs; [

        bat
        bluetui #
        # chromium
        brave   #
        btop
        cmus
        colordiff
        devenv
        entr
        fd
        ffmpeg
        fsel    #
        gimp    
        gittype #
        gitu    #
        glow    #
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
        typst
        waybar
        wev      #
        wiremix
        yt-dlp   #

        zen-browser.packages.${pkgs.system}.default
    ];
}
