{ ... }: {
  services = {
    openssh.enable = true;
    fwupd.enable = false;
    tailscale = {
      enable = true;
      useRoutingFeatures = "both";
    };
    calibre-web = {
      enable = true;
      listen = {
        ip = "0.0.0.0";
        port = 8083;
      };
      options = {
        enableBookConversion = true;
        enableBookUploading = true;
      };
    };
  };
}