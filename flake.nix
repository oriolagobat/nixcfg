{
    description = "oriolgobat's NixOS configuration";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

        nix-darwin = {
            url = "github:nix-darwin/nix-darwin/master";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        home-manager = {
            url = "github:nix-community/home-manager/master";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        nix-homebrew.url = "github:zhaofengli/nix-homebrew";

        nixvim = {
            url = "github:nix-community/nixvim";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        nixos-generators = {
            url = "github:nix-community/nixos-generators";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = {
        self,
        nixpkgs,
        nix-darwin,
        home-manager,
        nix-homebrew,
        nixvim,
        nixos-generators,
    }: 
    let 
        user = "oriolagobat";
    in
    {
        darwinConfigurations = {
            taln = nix-darwin.lib.darwinSystem {
                system = "x86_64-darwin";
                modules = [
                    ./hosts/taln/configuration.nix
                ];
                specialArgs = { inherit home-manager nix-homebrew nixvim user; hostName = "taln";};
            };
            lift = nix-darwin.lib.darwinSystem {
                system = "aarch64-darwin";
                modules = [
                    ./hosts/lift/configuration.nix
                ];
                specialArgs = { inherit home-manager nix-homebrew nixvim user; hostName = "lift";};
            };
        };
        nixosConfigurations = {
            syl = {
                system = "aarch64-linux";
                modules = [
                    ./hosts/syl/configuration.nix
                ];
                specialArgs = { inherit nixos-generators user; hostName = "syl"; };
            };
        };

        packages.aarch64-linux = {
            syl-iso = nixos-generators.nixosGenerate {
            system = "aarch64-linux";
            modules = [
                ./hosts/syl/configuration.nix
            ];
            specialArgs = { hostName = "syl"; };
            format = "sd-aarch64-installer";
            };
        };
    };
}
