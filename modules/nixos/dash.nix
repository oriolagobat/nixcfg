{ config, ... }:
{
  services.homepage-dashboard = {
    enable = true;
    listenPort = 8082;
    openFirewall = false;
    allowedHosts = "dash.home.agost.info,localhost:8082,127.0.0.1:8082";

    environmentFiles = [
      config.sops.templates."homepage.env".path
    ];

    settings = {
      title = "Urithiru";
      theme = "dark";
      color = "slate";
    };

    widgets = [
      {
        resources = {
          cpu = true;
          memory = true;
          disk = [ "/" "/data" ];
        };
      }
    ];

    services = [
      {
        Media = [
          {
            Jellyfin = {
              href = "https://jelly.home.agost.info";
              widget = {
                type = "jellyfin";
                url = "http://127.0.0.1:8096";
                key = "{{HOMEPAGE_VAR_JELLYFIN_KEY}}";
                enableBlocks = true;
                enableNowPlaying = true;
                enableMediaControl = false;
              };
            };
          }
          {
            Seerr = {
              href = "https://seer.home.agost.info";
              widget = {
                type = "seerr";
                url = "http://127.0.0.1:5055";
                key = "{{HOMEPAGE_VAR_SEERR_KEY}}";
              };
            };
          }
          {
            Sonarr = {
              href = "https://sonarr.home.agost.info";
              widget = {
                type = "sonarr";
                url = "http://127.0.0.1:8989";
                key = "{{HOMEPAGE_VAR_SONARR_KEY}}";
                enableQueue = true;
              };
            };
          }
          {
            Radarr = {
              href = "https://radarr.home.agost.info";
              widget = {
                type = "radarr";
                url = "http://127.0.0.1:7878";
                key = "{{HOMEPAGE_VAR_RADARR_KEY}}";
                enableQueue = true;
              };
            };
          }
        ];
      }
    ];
  };
}