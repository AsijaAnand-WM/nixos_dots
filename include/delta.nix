{ ... }:

{
    programs.delta = {
        enable = true;
        enableGitIntegration = true;
        enableJujutsuIntegration = true;
        options = {
            dark = true;
            true-color = "always";
            line-numbers = true;
            side-by-side = true;
        };
    };
}
