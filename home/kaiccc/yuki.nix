{ pkgs, config, ... }: {
    imports = [
        ./home.nix
        ../common

        ../features/desktop
        ../features/cli
    ];

    wayland.windowManager.hyprland = {
        settings = {
            monitor = [
                "HDMI-A-3,2560x1440@144,auto,1"
            ];
        };
    };
}
