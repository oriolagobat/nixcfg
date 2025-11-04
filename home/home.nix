_: {
    imports = [
        ./packages.nix
        ./bat.nix
        ./difftastic.nix
        ./direnv.nix
        ./git.nix
        ./lsd.nix
        # ./neovim.nix
        ./nixvim.nix
        ./packages.nix
        ./ripgrep-all.nix
        ./zoxide.nix
        ./zsh.nix
    ];

    home.stateVersion = "25.05";
}
