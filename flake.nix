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
    };

    outputs = {
        self,
        nixpkgs,
        nix-darwin,
        home-manager,
        nix-homebrew,
        nixvim,
    }: 
    let 
        user = "oriolagobat";

        mkNixosHost = { hostName, system, extraModules ? [ ] }:
            nixpkgs.lib.nixosSystem {
                inherit system;
                modules = [
                ./hosts/${hostName}/configuration.nix
                ] ++ extraModules;
                specialArgs = { inherit user hostName; };
            };
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
            syl = mkNixosHost {
                hostName = "syl";
                system = "aarch64-linux";
            };

            syl-sd = mkNixosHost {
                hostName = "syl";
                system = "aarch64-linux";
                extraModules = [
                    "${nixpkgs}/nixos/modules/installer/sd-card/sd-image-aarch64.nix"
                    { disabledModules = [ "profiles/base.nix" ]; }
                ];
            };
        };

        packages.aarch64-darwin.syl-sd-image =
            self.nixosConfigurations.syl-sd.config.system.build.sdImage;
    };
}
