{ ... }:

{
    programs.git = {
        enable = true;
        settings = {
            user = {
                name  = "asija anand";
                email = "asija.anand.official@gmail.com";
            };
            init.defaultbranch = "main";
        };
    };
}
