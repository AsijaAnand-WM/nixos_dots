{ ... }:

{
    programs.oh-my-posh = {
        enable = true;
        enableBashIntegration = true;
        # useTheme = "half-life";
        configFile =  ../dotfiles/omp/theme.json;
    };
}
