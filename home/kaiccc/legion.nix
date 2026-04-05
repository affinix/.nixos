{ config, ... }: {
    imports = [
        ./home.nix
        ../common

        ../features/desktop
        ../features/cli
    ];

    wayland.windowManager.hyprland = {
        settings = {
            monitor = [
                "HDMI-A-1,2560x1440@144,auto,1"
                "eDP-1, disable"
            ];
        };
    };
}
