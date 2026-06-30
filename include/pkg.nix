{ pkgs, zen-browser, ... }:

{
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
        glow
        gimp
        wev
        wiremix
        gittype
        gomi
        calcure
        presenterm
        gitu
	fsel
        zen-browser.packages.${pkgs.system}.default
    ];
}
