{ config, lib, pkgs, inputs, ... }: {
    home.username = lib.mkDefault "kaiccc";
    home.homeDirectory = lib.mkDefault "/home/${config.home.username}";

    programs.git = {
        enable = true;
        userEmail = "imaffinix@gmail.com";
        userName = "Kaibo Cao";
    };

    programs.home-manager.enable = true;

    home.stateVersion = "25.11";
}
