{ user, home-manager, nixvim, ... }:
{
    imports = [
        home-manager.nixosModules.home-manager
        {
            home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                users.${user} = ./home.nix;
                extraSpecialArgs = { inherit nixvim; };
            };
        }
    ];
}