{user, hostName, ...}:
{
    imports = [
        ./environment.nix
        ./networking.nix
        ./nix.nix
        ./nixpkgs.nix
        ./security.nix
        ./system.nix
        ./users.nix
    ];
}