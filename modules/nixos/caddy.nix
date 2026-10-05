{ config, pkgs, ... }:
let
  tlsConfig = ''
    tls {
      dns porkbun {
        api_key {env.PORKBUN_API_KEY}
        api_secret_key {env.PORKBUN_API_SECRET_KEY}
      }

      propagation_delay 30s
      propagation_timeout 10m
    }
  '';

  mkCaddyHost = subdomain: port: {
    name = "${subdomain}.home.agost.info";
    value.extraConfig = ''
      ${tlsConfig}

      reverse_proxy 127.0.0.1:${toString port}
    '';
  };

  mkProtectedCaddyHost = subdomain: port: {
    name = "${subdomain}.home.agost.info";
    value.extraConfig = ''
      ${tlsConfig}

      route /caddy-security/* {
        authenticate with myportal
      }

      @tailscale remote_ip 100.64.0.0/10

      route {
        handle @tailscale {
          reverse_proxy 127.0.0.1:${toString port}
        }

        handle {
          authorize with mypolicy
          reverse_proxy 127.0.0.1:${toString port}
        }
      }
    '';
  };
in
{
  services.caddy = {
    enable = true;

    globalConfig = ''
      debug

      order authenticate before respond
      order authorize before reverse_proxy

      security {
        oauth identity provider generic {
          delay_start 3
          realm generic
          driver generic
          client_id {env.POCKET_ID_CLIENT_ID}
          client_secret {env.POCKET_ID_CLIENT_SECRET}
          scopes openid email profile
          base_auth_url https://auth.home.agost.info
          metadata_url https://auth.home.agost.info/.well-known/openid-configuration
        }

        authentication portal myportal {
          crypto default token lifetime 3600
          enable identity provider generic
          cookie insecure off

          transform user {
            match realm generic
            action add role user
          }
        }

        authorization policy mypolicy {
          set auth url /caddy-security/oauth2/generic
          allow roles user
          inject headers with claims
        }
      }
    '';

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

      (mkProtectedCaddyHost "dash" 8082)
      (mkProtectedCaddyHost "downloads" 9091)
      (mkProtectedCaddyHost "seer" 5055)
      (mkProtectedCaddyHost "sonarr" 8989)
      (mkProtectedCaddyHost "bazarr" 6767)
      (mkProtectedCaddyHost "radarr" 7878)
      (mkProtectedCaddyHost "adguard" 3000)
      (mkProtectedCaddyHost "prowlarr" 9696)
      (mkProtectedCaddyHost "tokendrain" 8742)
    ];
  };

  networking.firewall.allowedTCPPorts = [
    80
    443
  ];

  systemd.services.caddy.serviceConfig.EnvironmentFile =
    config.sops.templates."caddy-porkbun.env".path;
}