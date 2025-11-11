{user, nix-homebrew, ...}: let
    userCasks = import ./casks.nix;
    in {
        imports = [
            ../../darwin
            (import ../../homebrew {inherit userCasks;} )
            ../../home/darwin.nix
            (nix-homebrew.darwinModules.nix-homebrew)
        ];

        nix-homebrew = {
            enable = true;
            user = user;
            enableRosetta = true;
        };
}
