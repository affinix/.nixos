{ pkgs, inputs, ... }: {
    imports = [
        ./hyprland.nix
        ./waybar
        ./zed.nix
        ./stylix
        ./terminal
    ];

    programs.firefox.enable = true;
    programs.vesktop.enable = true;
}
