{
    description = "oriolgobat's NixOS configuration";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

        nix-darwin.url = "github:nix-darwin/nix-darwin/master";
        nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

        home-manager.url = "github:nix-community/home-manager/";
        home-manager.inputs.nixpkgs.follows = "nixpkgs";
    };

    outputs = inputs@{
        self,
        nixpkgs,
        nix-darwin,
        home-manager,
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
                specialArgs = { inherit user; hostName = "taln";};
            };
        };
    };
}