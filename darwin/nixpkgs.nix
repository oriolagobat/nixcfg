_: {
    nixpkgs = {
        config.allowUnfree = true;
        overlays = [
            # FIXME: Remove temporary overlay when https://github.com/NixOS/nixpkgs/issues/461406 is released
            (final: prev: {
                fish = prev.fish.overrideAttrs (old: {
                    doCheck = false;
                });
            })
        ];
    };
}