{ ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos/boot/urithiru-boot.nix

    ../../modules/nixos/base.nix
    ../../modules/nixos/ssh.nix
  ];

  networking.hostName = "urithiru";



  system.stateVersion = "26.05";
}