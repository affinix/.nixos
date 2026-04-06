{ config, lib, pkgs, inputs, ... }: {
    home.username = lib.mkDefault "kaiccc";
    home.homeDirectory = lib.mkDefault "/home/${config.home.username}";

    programs.git = {
        enable = true;
        settings.user = {
            email = "imaffinix@gmail.com";
            name = "Kaibo Cao";
        };
    };

    programs.home-manager.enable = true;

    home.stateVersion = "25.11";
}
