{ ... }: {
  services = {
    openssh.enable = true;
    fwupd.enable = false;
    tailscale = {
      enable = true;
      useRoutingFeatures = "both";
    };
    # calibre-web = {
    #   enable = true;
    #   options = {
    #     enableBookConversion = true;
    #     enableBookUploading = true;
    #   };
    # };
  };
}