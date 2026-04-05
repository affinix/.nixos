{ pkgs, ... }: {
    programs.zed-editor = {
        enable = true;
        extensions = [ "nix" "toml" ];

        userSettings = {
            session = {
                trust_all_worktrees = true;
            };

            terminal = {
                shell = {
                    program = "fish";
                };
            };

            tab_size = 4;

            languages = {
                "TypeScript" = {
                    language_servers = [
                        "deno"
                        "!typescript-language-server"
                        "!vtsls"
                        "!eslint"
                    ];
                    formatter = "language_server";
                };
            };
        };
    };
}
