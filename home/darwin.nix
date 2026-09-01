{ user, home-manager, nixvim, ... }:
{
    imports = [
        home-manager.darwinmodules.home-manager 
        {
            home-manager.useglobalpkgs = true;
            home-manager.useuserpackages = true;
            home-manager.users.${user} = ./home.nix;
            home-manager.extraspecialargs = { inherit nixvim; };
        }
    ];
}