_: {
  services = {
    sshd.enable = true;
    fwupd.enable = false;
    # tailscale = {
    #   enable = true;
    #   useRoutingFeatures = "both";
    # };
    tailscale.enable = true;
  };
}