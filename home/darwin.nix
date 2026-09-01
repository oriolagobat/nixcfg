{ user, home-manager, nixvim, ... }:
{
    imports = [
        home-manager.darwinModules.home-manager 
        {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.${user} = ./home.nix;
            home-manager.extraSpecialArgs = { inherit nixvim; };
        }
    ];
}