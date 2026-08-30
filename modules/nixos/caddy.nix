{
  services.caddy = {
    enable = true;

    virtualHosts = {
      "http://jelly.home.agost.info".extraConfig = ''
        reverse_proxy 127.0.0.1:8096
      '';

      "http://seer.home.agost.info".extraConfig = ''
        reverse_proxy 127.0.0.1:5055
      '';
    };
  };

  networking.firewall.allowedTCPPorts = [
    80
    443
  ];
}