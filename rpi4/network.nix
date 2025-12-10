{hostName, ...} : {
  networking = {
    hostName = hostName;
    wireless = {
      enable = false;
    };
    firewall = {
      enable = false;
    };
  };
}