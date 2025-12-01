{hostName, ...} : {
  networking = {
    hostName = hostName;
    wireless = {
      enable = false;
    };
  };
}