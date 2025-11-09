{user, nix-homebrew, ...}: {
    imports = [
        ../../darwin
        ../../homebrew
        ../../home/darwin.nix
        (nix-homebrew.darwinModules.nix-homebrew)
    ];


    nix-homebrew = {
        enable = true;
        user = user;
        enableRosetta = true;
        mutableTaps = false;
    };
}