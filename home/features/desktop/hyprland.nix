{ pkgs, ... }: {
    home.packages = with pkgs; [
        wpaperd
        hyprshot
    ];

    programs.fuzzel.enable = true;

    services.wpaperd = {
        enable = true;
    };

    wayland.windowManager.hyprland = {
        enable = true;
        xwayland.enable = true;

        settings = {
            cursor = {
                no_hardware_cursors = true;
            };

            exec-once = [
                "waybar"
            ];

            # Enviroment Variable
            env = [
                "XCURSOR_SIZE,16"
                "HYPRCURSOR_SIZE,16"
            ];

            # Aesthetics
            general = {
                gaps_in = 5;
                gaps_out = 5;

                border_size = 2;

                layout = "dwindle";
            };

            decoration = {
                rounding = 10;

                blur = {
                    enabled = true;
                    size = 3;
                    passes = 1;
                };
            };

            animations = {
                enabled = false;
            };

            dwindle = {
                pseudotile = true;
                preserve_split = true;
            };

            master = {
                new_status = "master";
            };

            # input
            input = {
                kb_layout = "us";
                follow_mouse = 1;
                sensitivity = -0.2;

                touchpad = {
                    natural_scroll = true;
                    clickfinger_behavior = 1;
                    scroll_factor = 0.5;
                };
            };

            # binds
            "$mainMod" = "SUPER";
            "$terminal" = "foot";
            "$menu" = "fuzzel";

            bind = [
                "$mainMod, Q, exec, $terminal"
                "$mainMod, C, killactive,"
                "$mainMod, M, exit,"
                "$mainMod, V, togglefloating,"
                "$mainMod, R, exec, $menu"
                "$mainMod, P, pseudo,"
                "$mainMod, J, togglesplit,"
                "$mainMod, left, movefocus, l"
                "$mainMod, right, movefocus, r"
                "$mainMod, up, movefocus, u"
                "$mainMod, down, movefocus, d"
                "$mainMod, 1, workspace, 1"
                "$mainMod, 2, workspace, 2"
                "$mainMod, 3, workspace, 3"
                "$mainMod, 4, workspace, 4"
                "$mainMod, 5, workspace, 5"
                "$mainMod, 6, workspace, 6"
                "$mainMod, 7, workspace, 7"
                "$mainMod, 8, workspace, 8"
                "$mainMod, 9, workspace, 9"
                "$mainMod, 0, workspace, 10"
                "$mainMod SHIFT, 1, movetoworkspace, 1"
                "$mainMod SHIFT, 2, movetoworkspace, 2"
                "$mainMod SHIFT, 3, movetoworkspace, 3"
                "$mainMod SHIFT, 4, movetoworkspace, 4"
                "$mainMod SHIFT, 5, movetoworkspace, 5"
                "$mainMod SHIFT, 6, movetoworkspace, 6"
                "$mainMod SHIFT, 7, movetoworkspace, 7"
                "$mainMod SHIFT, 8, movetoworkspace, 8"
                "$mainMod SHIFT, 9, movetoworkspace, 9"
                "$mainMod SHIFT, 0, movetoworkspace, 10"
                "$mainMod, S, exec, hyprshot -m region --clipboard-only"
            ];

            bindel = [
                ",XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
                ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
                ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
                ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
                ",XF86MonBrightnessUp, exec, brightnessctl s 10%+"
                ",XF86MonBrightnessDown, exec, brightnessctl s 10%-"
            ];

            # window rules
            windowrule = [
                "suppressevent maximize, class:.*"
            ];
        };
    };
}
