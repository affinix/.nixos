{ lib, inputs, outputs, ... }: {
    imports = [
        ./users
        inputs.home-manager.nixosModules.home-manager
    ];

    home-manager = {
        # useUserPackages = true;
        extraSpecialArgs = { inherit inputs outputs; };
    };

    nixpkgs = {
        config = {
            allowUnfree = true;
        };
    };

    nix = {
        settings = {
            experimental-features = "nix-command flakes";
            trusted-users = [
                "root"
                "kaiccc"
            ];
        };
        gc = {
            automatic = true;
            options = "--delete-older-than 30d";
        };
    };
}
