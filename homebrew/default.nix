{userCasks ? [], ... }: {
    homebrew = {
        enable = true;

        onActivation = {
            autoUpdate = true;
            upgrade = true;
            cleanup = "zap";
        };

        casks = import ./casks.nix ++ userCasks;
    };
}