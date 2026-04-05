{ config, pkgs, inputs, ... }: {
    users.users.kaiccc = {
        isNormalUser = true;
        description = "kaiccc";
        extraGroups = [ "networkmanager" "wheel" ];
        packages = [ inputs.home-manager.packages.${pkgs.system}.default ];
    };

    programs.hyprland = {
        enable = true;
        withUWSM = true;
    };

    home-manager.users.kaiccc =
        import ../../../home/kaiccc/${config.networking.hostName}.nix;
}
