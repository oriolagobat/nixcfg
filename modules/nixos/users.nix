{ config, user, pkgs, ... }:

{
  users = {
    mutableUsers = false;

    users."${user}" = {
      isNormalUser = true;
      shell = pkgs.zsh;

      hashedPasswordFile =
        config.sops.secrets.userPwd.path;

      extraGroups = [
        "wheel"
      ];

      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMq9Ayue9ebiyLAomBGhH5I7bZ8u+w8VAihVFmF4juJM oriolagobat@lift"
      ];
    };
  };

  programs.zsh.enable = true;

  security.sudo.enable = true;
}
