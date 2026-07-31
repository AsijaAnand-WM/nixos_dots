{ ... }:

{
    programs.fastfetch = {
        enable = true;
        settings = {
            logo = {
                source = "nixos_small";
                padding = {
                    right = 1;
                };
            };
            display = {
                size = {
                    binaryPrefix = "si";
                };
                color = "#403833";
                separator = "  ";
            };
            modules = [
            {
                type = "datetime";
                key = "Date";
                format = "{1}-{3}-{11}";
            }
            {
                type = "datetime";
                key = "Time";
                format = "{14}:{17}:{20}";
            }
                "break"

                "os"
                "host"
                "kernel"
                "uptime"
                "packages"

                "break"

                "cpu"
                "gpu"
                "memory"
                "swap"
                "disk"

                "break"

                "shell"
                "terminal"
                "wm"
                "de"
                "display"
                "theme"
                "icons"
                "cursor"

                "break"

                "player"
                "media"
                ];
        };

    };
}
