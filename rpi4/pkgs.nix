{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    ethtool
    networkd-dispatcher
  ];
}