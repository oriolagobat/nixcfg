{ config, pkgs, ...}:
let
  mkCaddyHost = subdomain: port: {
    name = "${subdomain}.home.agost.info";
    value.extraConfig = ''
      tls {
        dns porkbun {
          api_key {env.PORKBUN_API_KEY}
          api_secret_key {env.PORKBUN_API_SECRET_KEY}
        }

        resolvers  9.9.9.9 149.112.112.112
      }

      reverse_proxy 127.0.0.1:${toString port}
    '';
  };
in
{
  services.caddy = {
    globalConfig = ''
      debug
    '';
    enable = true;

    package = pkgs.caddy.withPlugins {
      plugins = [
        "github.com/caddy-dns/porkbun@v0.3.1"
        "github.com/greenpau/caddy-security@v1.1.31"
      ];

      hash = "sha256-3OKm8u+qPxwePbLei4S8oQXfMiMbMWhwBllBiArF5Nw=";
    };

    virtualHosts = builtins.listToAttrs [
      (mkCaddyHost "auth" 1411)
      (mkCaddyHost "jelly" 8096)
      (mkCaddyHost "seer" 5055)
      (mkCaddyHost "adguard" 3000)
    ];
  };

  networking.firewall.allowedTCPPorts = [
    80
    443
  ];

  systemd.services.caddy.serviceConfig.EnvironmentFile =
    config.sops.templates."caddy-porkbun.env".path;
}