{ user, home-manager, nixvim, ... }:
{
    imports = [
        home-manager.nixosModules.home-manager 
        {
            useglobalpkgs = true;
            useuserpackages = true;
            users.${user} = ./home.nix;
            extraspecialargs = { inherit nixvim; };
        }
    ];
}