{
    description = "˖⁺‧₊˚✦";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
        nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

        stylix.url = "github:danth/stylix/release-25.11";

        home-manager = {
            url = "github:nix-community/home-manager/release-25.11";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = { self, home-manager, nixpkgs, nixpkgs-unstable, ... } @ inputs:
    let
        inherit (self) outputs;
    in {
        nixosConfigurations = {
            legion = nixpkgs.lib.nixosSystem {
                specialArgs = { inherit inputs outputs; };
                modules = [./hosts/legion];
            };

            yuki = nixpkgs.lib.nixosSystem {
                specialArgs = { inherit inputs outputs; };
                modules = [./hosts/yuki];
            };
        };

        homeConfigurations = {
            "kaiccc@legion" = home-manager.lib.homeManagerConfiguration {
                pkgs = nixpkgs.legacyPackages."x86_64-linux";
                extraSpecialArgs = { inherit inputs outputs; };
                modules = [./home/kaiccc/legion.nix];
            };
        };


        homeConfigurations = {
            "kaiccc@yuki" = home-manager.lib.homeManagerConfiguration {
                pkgs = nixpkgs.legacyPackages."x86_64-linux";
                extraSpecialArgs = { inherit inputs outputs; };
                modules = [./home/kaiccc/yuki.nix];
            };
        };
    };
}
