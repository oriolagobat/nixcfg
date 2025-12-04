{ ... }: {
  services = {
    openssh.enable = true;
    fwupd.enable = false;
    tailscale = {
      enable = true;
      useRoutingFeatures = "both";
    };
    calibre-web = {  # TODO: This works but I need to open the port with firewall (check notes)
      enable = true;
      listen.port = 8083;
      options = {
        enableBookConversion = true;
        enableBookUploading = true;
      };
    };
  };
}