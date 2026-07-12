{ ... }:

{
    programs.oh-my-posh = {
        enable = true;
        enableBashIntegration = true;
        # useTheme = "half-life";
        configFile =  builtins.readFile ../dotfiles/omp/theme.json;
    };
}
