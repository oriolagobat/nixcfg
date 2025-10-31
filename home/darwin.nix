{ config, user, home-manager,  ... }:
{
    imports = [
        home-manager.darwinModules.home-manager 
        {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.${user} = ./home.nix;
        }
    ];
}