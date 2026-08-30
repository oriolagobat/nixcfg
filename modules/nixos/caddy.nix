{
  services.caddy = {
    enable = true;

    virtualHosts = {
      "jelly.agost.info".extraConfig = ''
        reverse_proxy 127.0.0.1:8096
      '';

      "seer.agost.info".extraConfig = ''
        reverse_proxy 127.0.0.1:5055
      '';
    };
  };

  networking.firewall.allowedTCPPorts = [
    80
    443
  ];
}