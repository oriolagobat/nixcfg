{ config, pkgs, ...}:
{
  services.caddy = {
    enable = true;

    package = pkgs.caddy.withPlugins {
      plugins = [
        "github.com/caddy-dns/porkbun@v0.3.1"
      ];

      hash = "sha256-YmKKk5sSOVtv3fwF3kLZtxGL8YpQmHLR59eOcFnhfUo="
    };

    virtualHosts = {
      "jelly.home.agost.info".extraConfig = ''
        tls {
          dns porkbun {
            api_key {env.PORKBUN_API_KEY}
            api_secret_key {env.PORKBUN_API_SECRET_KEY}
          }
        }

        reverse_proxy 127.0.0.1:8096
      '';

      "seer.home.agost.info".extraConfig = ''
        tls {
          dns porkbun {
            api_key {env.PORKBUN_API_KEY}
            api_secret_key {env.PORKBUN_API_SECRET_KEY}
          }
        }

        reverse_proxy 127.0.0.1:5055
      '';
    };
  };

  networking.firewall.allowedTCPPorts = [
    80
    443
  ];

  systemd.services.caddy.serviceConfig.EnvironmentFile =
    config.sops.templates."caddy-porkbun.env".path;
}