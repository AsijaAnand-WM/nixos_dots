{ ... }:

{    
    programs.kitty = {
        enable = true;

        font = {
            name = "JetBrainsMono Nerd Font";
            size = 11;
        };

        themeFile = "gruvbox-dark";

        settings = {
            window_padding_width = 4;
            background_opacity = "0.96";

            cursor_trail = 3;
            cursor_trail_start_threshold = 0;
            cursor_trail_decay = "0.05 0.15";

            background = "#12100f";
        };

        shellIntegration.enableBashIntegration = true;
    };
}
