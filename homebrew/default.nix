_: {
    homebrew = {
        enable = true;

        onActivation = {
            autoUpdate = true;
            upgrade = true;
            # cleanup = "zap";   # TODO: After all wanted casks are specified uncomment
        };

        casks = import ./casks.nix;
    };
}