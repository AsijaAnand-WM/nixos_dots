{ pkgs, zen-browser, ... }:

{
    home.packages = with pkgs; [

        bat
        bluetui #
        brave   #
        cmus
        colordiff
        entr
        fd
        ffmpeg
        fsel    #
        gimp    
        gittype #
        gitu
        glow    #
        gnuplot #
        gomi    #
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
        # chromium

        zen-browser.packages.${pkgs.system}.default
    ];
}
