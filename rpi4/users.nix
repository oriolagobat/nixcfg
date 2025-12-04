{ config, user, ... }: {
  sops.secrets.userPwd.neededForUsers = true;

  users = {
    mutableUsers = false;
    users."${user}" = {
      isNormalUser = true;
      hashedPasswordFile = config.sops.secrets.userPwd.path;
      extraGroups = [ "wheel" ];
      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFvDT+VInpmTuxYjLXzyE+3Mn3IjI4asm0aS7O3SDH97 oriolagobat@lift"
      ];
    };
  };
}