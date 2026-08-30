{ pkgs, ... }:

{
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  time.timeZone = "Europe/Madrid";

  environment.systemPackages = with pkgs; [
    git
    vim
    curl
    wget
    htop
  ];
}