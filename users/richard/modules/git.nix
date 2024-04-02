{ config, ... }:

{
    programs.git = {
        enable = true;
        extraConfig = {
            user = {
                name = "Richard Vock";
                email = "nrtn@posteo.net";
            };
            init.defaultBranch = "main";
            pull.rebase = true;
            color = {
                old = "#FF7733";
                new = "#BBCC52";
                context = "normal";
                meta = "normal";
                frag = "#36A3D9";
            };
        };
        # difftastic = {
        #     enable = true;
        #     background = "dark";
        #     color = "always";
        # };
    };
}
