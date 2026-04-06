{ pkgs, inputs, ... }: {
    programs.foot = {
        enable = true;
        settings = {
            main.shell = "fish";
        };
    };
}
