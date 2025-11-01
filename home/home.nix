_: {
    imports = [
        ./packages.nix
        ./bat.nix
        ./lsd.nix
        ./ripgrep-all.nix
        ./zoxide.nix
        ./zsh.nix
    ];

    home.stateVersion = "25.05";
}