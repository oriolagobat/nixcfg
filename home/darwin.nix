{ user, home-manager,  ... }:
{
    imports = [
        home-manager.darwinModules.home-manager 
        {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.${user} = ./home.nix;
            home-manager.backupFileExtension = ".backup";  # TODO: Remove this when migration to nix is done
        }
    ];
}