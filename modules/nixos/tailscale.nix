{config, ...}:
{

  services.tailscale = {
    enable = true;
    useRoutingFeatures = "server";
    authKeyFile = config.sops.secrets.tailscaleKey.path;
    extraSetFlags = [
      "--advertise-exit-node"
    ];
  };
}