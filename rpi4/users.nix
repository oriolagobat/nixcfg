{ user, ... }: {
  users = {
    mutableUsers = false;
    users."${user}" = {
      isNormalUser = true;
      password = "Changeme123";  # FIXME: Grab this from secrets
      extraGroups = [ "wheel" ];
    };
  };
}