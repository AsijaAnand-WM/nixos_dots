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

# Kanata - Remap
    # boot.kernelModules = [ "uinput" ];
    # hardware.uinput.enable = true;

    services.kanata = {
        enable = true;
        keyboards = {
            "kbd" = {
                devices = [ "/dev/input/by-path/platform-i8042-serio-0-event-kbd" ];
                config = ''
                    ;; global configuration options
                  
                    ;; define keys that will be modified (all keys still processed)
                    (defsrc
                     esc
                     grv
                     caps
                     a s d f g h j k l scln
                     lalt spc ralt
                    )

                    ;; default/base layer modifications always active
                    (deflayer default
                     @esc
                     @grv
                     @cap
                     @a @s @d @f _ _ @j @k @l @scln
                     esc _ bspc
                    )

                    ;; shifted layer activated by holding CAPS lock
                    (deflayer cap-mod
                     _
                     _
                     _
                     _ _ _ _ _ left down up rght _
                     _ bspc _
                    )

                    ;; values used by multiple changes
                    (defvar
                     tap-time 200
                     hold-time 250
                    )

                    ;; remapping between physical keys and functionality
                    (defalias
                     esc (tap-hold-press $tap-time $hold-time esc caps)
                     grv (tap-hold-press $tap-time $hold-time S-grv grv)
                     capsword (caps-word 2000)
                     cap (tap-hold-press $tap-time $hold-time @capsword (layer-toggle cap-mod))
                     a (tap-hold $tap-time $hold-time a lmet)
                     s (tap-hold $tap-time $hold-time s lalt)
                     d (tap-hold $tap-time $hold-time d lsft)
                     f (tap-hold $tap-time $hold-time f lctl)
                     j (tap-hold $tap-time $hold-time j rctl)
                     k (tap-hold $tap-time $hold-time k rsft)
                     l (tap-hold $tap-time $hold-time l lalt)
                     scln (tap-hold $tap-time $hold-time scln lmet)
                    )

                    '';
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
