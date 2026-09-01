{ ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos/boot/urithiru-boot.nix
    ../../modules/nixos/filesystems/urithiru-filesystems.nix
    ../../modules/nixos/swap/urithiru-swap.nix

    ../../modules/nixos/base.nix
    ../../modules/nixos/ssh.nix
    ../../modules/nixos/users.nix
    ../../modules/nixos/secrets/urithiru-secrets.nix

    ../../modules/nixos/tailscale.nix
    ../../modules/nixos/caddy.nix
    ../../modules/nixos/nixarr.nix
    # ../../home/nixos.nix
  ];

  networking.hostName = "urithiru";
  system.stateVersion = "26.05";
}