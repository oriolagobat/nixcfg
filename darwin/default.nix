{user, hostName, ...}:
{
    imports = [
        ./networking.nix
        ./nix.nix
        ./nixpkgs.nix
        ./security.nix
        ./system.nix
    ];
}