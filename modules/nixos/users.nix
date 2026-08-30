{ config, user, ... }:

{
  users = {
    mutableUsers = false;

    users."${user}" = {
      isNormalUser = true;

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

  security.sudo.enable = true;
}