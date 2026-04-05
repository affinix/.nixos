{ pkgs, inputs, ... }: {
    imports = with inputs.stylix.homeModules; [ stylix ];
    home.packages = with pkgs; [
        base16-schemes
    ];

    stylix = {
        enable = true;
        base16Scheme = ./theme.yaml;

        image = pkgs.fetchurl {
            url = "https://i.imgur.com/quUxX4e.jpeg";
            hash = "sha256-tvySwf2WNqxmIGyGqdozELxHHUPxdRhI2UWVw7lYZKQ=";
        };

        fonts.monospace = {
            package = pkgs.nerd-fonts.jetbrains-mono;
            name = "JetBrainsMono Nerd Font";
        };

        cursor = {
            name = "Apple Cursor";
            package = pkgs.apple-cursor;
            size = 16;
        };

        targets.zed.enable = true;
        targets.waybar.enable = true;
        targets.kitty.enable = true;
        targets.firefox.profileNames = [ "kaiccc" ];

        targets.hyprland.hyprpaper.enable = false;
        targets.hyprland.colors.enable = false;
    };
}
