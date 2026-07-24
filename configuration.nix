{ config, pkgs, ... }:

{
    imports = [ /etc/nixos/hardware-configuration.nix ];

    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    boot.kernelPackages = pkgs.linuxPackages_latest;

    networking.hostName = "neunzehnte";
# networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

# Configure network proxy if necessary
# networking.proxy.default = "http://user:password@proxy:port/";
# networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

    networking.networkmanager.enable = true;

    time.timeZone = "Asia/Kolkata";

    i18n.defaultLocale = "en_US.UTF-8";

    i18n.extraLocaleSettings = {
        LC_ADDRESS = "en_IN";
        LC_IDENTIFICATION = "en_IN";
        LC_MEASUREMENT = "en_IN";
        LC_MONETARY = "en_IN";
        LC_NAME = "en_IN";
        LC_NUMERIC = "en_IN";
        LC_PAPER = "en_IN";
        LC_TELEPHONE = "en_IN";
        LC_TIME = "en_IN";
    };

    services.xserver.xkb = {
        layout = "us";
        variant = "";
    };

    programs.sway.enable = true;
    programs.sway.xwayland.enable = true;

    hardware.bluetooth = {
        enable = true;
        powerOnBoot = true;
    };

    programs.nix-ld.enable = true;
    programs.nix-ld.libraries = with pkgs; [
            SDL2
            alsa-lib
            flac
            libGL
            libogg
            libsndfile
            libvorbis
            libxkbcommon
            pulseaudio
            vulkan-loader
            wayland
            xorg.libX11
            xorg.libXcursor
            xorg.libXi
            xorg.libXrandr
    ];
# Kanata - Remap
    # # boot.kernelModules = [ "uinput" ];
    # # hardware.uinput.enable = true;
    # block-unmapped-keys yes
    services.kanata = {
        enable = true;
        keyboards = {
            "kbd" = {
                devices = [ "/dev/input/by-path/platform-i8042-serio-0-event-kbd" ];
                config = builtins.readFile ./dotfiles/kanata/kanata_v4.kbd;
                extraDefCfg = ''
                    process-unmapped-keys yes
                    '';
            };
        };
    };

# VM Config
    programs.dconf.enable = true;
    programs.virt-manager.enable = true;
    virtualisation.libvirtd.enable = true;

    users.users."_19" = {
        isNormalUser = true;
        description = "Asija Anand";
        extraGroups = [ "networkmanager" "wheel" "libvirtd" ];
        packages = with pkgs; [];
    };

    nixpkgs.config.allowUnfree = true;

# $ nix search wget
    environment.systemPackages = with pkgs; [
        bluez
        brightnessctl
        gcc15
        wl-clipboard
        unzip
        unrar
        (import ./include/wycry.nix { inherit pkgs; })
    ];

    fonts.packages = with pkgs; [
            nerd-fonts.jetbrains-mono	
            noto-fonts-cjk-sans  
    ];

    nix.settings.experimental-features = [ "nix-command" "flakes" ];

# Open ports in the firewall.
# networking.firewall.allowedTCPPorts = [ ... ];
# networking.firewall.allowedUDPPorts = [ ... ];
# Or disable the firewall altogether.
    networking.firewall.enable = true;

    system.stateVersion = "26.05";

}
