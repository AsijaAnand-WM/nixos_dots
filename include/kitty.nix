{ ... }:

{    
    programs.kitty = {
        enable = true;

        font = {
            name = "JetBrainsMono Nerd Font";
            size = 11;
        };

        themeFile = "zenbones_dark";

        settings = {
            window_padding_width = 4;
            background_opacity = "0.9";

            cursor_trail = 3;
            cursor_trail_start_threshold = 0;
            cursor_trail_decay = "0.05 0.15";
        };

        shellIntegration.enableBashIntegration = true;
    };
}
