{config, ...}:
{

  services.tailscale = {
    enable = true;
    useRoutingFeatures = "server";
    authKeyFile = config.age.secrets.tailscaleKey.path;
    extraSetFlags = [
      "--advertise-exit-node"
    ];
  };
}