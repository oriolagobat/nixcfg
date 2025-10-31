{
    description = "oriolgobat's NixOS configuration";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

        nix-darwin.url = "github:nix-darwin/nix-darwin/master";
        nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

        home-manager.url = "github:nix-community/home-manager/";
        home-manager.inputs.nixpkgs.follows = "nixpkgs";

        nix-homebrew.url = "github:zhaofengli/nix-homebrew";
    };

    outputs = inputs@{
        self,
        nixpkgs,
        nix-darwin,
        home-manager,
        nix-homebrew,
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
                    ./homebrew
                ];
                specialArgs = { inherit home-manager nix-homebrew user; hostName = "taln";};
            };
        };
    };
}