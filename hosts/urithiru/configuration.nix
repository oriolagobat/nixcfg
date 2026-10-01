{ ... }:

{
  imports = [
    ../../home/nixos.nix
    ./hardware-configuration.nix
    ../../modules/nixos/ssh.nix
    ../../modules/nixos/base.nix
    ../../modules/nixos/caddy.nix
    ../../modules/nixos/users.nix
    ../../modules/nixos/nixarr.nix
    ../../modules/nixos/adguard.nix
    ../../modules/nixos/tailscale.nix
    ../../modules/nixos/pocket-id.nix
    ../../modules/nixos/boot/urithiru-boot.nix
    ../../modules/nixos/swap/urithiru-swap.nix
    ../../modules/nixos/secrets/urithiru-secrets.nix
    ../../modules/nixos/filesystems/urithiru-filesystems.nix
  ];

  networking.hostName = "urithiru";
  system.stateVersion = "26.05";
}