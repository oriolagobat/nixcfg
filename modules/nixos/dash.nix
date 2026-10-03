{ config, ... }:
{
  services.homepage-dashboard = {
    enable = true;
    listenPort = 8082;
    openFirewall = false;
    allowedHosts = "dash.home.agost.info,localhost:8082,127.0.0.1:8082";
    environmentFiles = [ config.sops.templates."homepage.env".path ];

    settings = {
      title = "Urithiru";
      description = "Watch, request, and keep track of your media.";
      theme = "dark";
      color = "zinc";
      headerStyle = "clean";
      useEqualHeights = true;
      statusStyle = "dot";
      layout = [
        { Media = { tab = "Media"; style = "row"; columns = 3; header = false; }; }
        { "Coming up" = { tab = "Media"; style = "row"; columns = 1; }; }
        { Automation = { tab = "Admin"; style = "row"; columns = 2; }; }
      ];
    };

    customCSS = ''
      body {
        background: radial-gradient(ellipse at top left, #183044 0%, #11151c 55%, #0c1016 100%) !important;
      }
      #page_container { max-width: 1280px; margin-inline: auto; }
      .service {
        border: 1px solid rgba(255, 255, 255, 0.08);
        border-radius: 16px;
        box-shadow: 0 8px 24px rgba(0, 0, 0, 0.12);
      }
    '';

    widgets = [
      { greeting = { text = "Urithiru"; text_size = "3xl"; }; }
      { resources = { label = "System"; cpu = true; memory = true; }; }
      { resources = { label = "System disk"; disk = "/"; }; }
      { resources = { label = "Media storage"; disk = "/data"; }; }
    ];

    services = [
      {
        Media = [
          {
            Jellyfin = {
              icon = "jellyfin.svg";
              href = "https://jelly.home.agost.info";
              description = "Watch your library";
              widget = {
                type = "jellyfin";
                url = "http://127.0.0.1:8096";
                key = "{{HOMEPAGE_VAR_JELLYFIN_KEY}}";
                fields = [ "movies" "series" "episodes" ];
                enableBlocks = true;
                enableNowPlaying = true;
                enableMediaControl = false;
              };
            };
          }
          {
            Seerr = {
              icon = "jellyseerr.svg";
              href = "https://seer.home.agost.info";
              description = "Discover and request";
              widget = {
                type = "seerr";
                url = "http://127.0.0.1:5055";
                key = "{{HOMEPAGE_VAR_SEERR_KEY}}";
                fields = [ "pending" "processing" "available" ];
              };
            };
          }
          {
            Transmission = {
              icon = "transmission.svg";
              href = "https://downloads.home.agost.info/transmission/web/";
              description = "Downloads, speeds, and progress";
              widget = {
                type = "transmission";
                url = "http://127.0.0.1:9091";
                fields = [ "leech" "download" "seed" "upload" ];
              };
            };
          }
        ];
      }
      {
        "Coming up" = [
          {
            Releases = {
              icon = "mdi-calendar-month";
              description = "Upcoming episodes and movies";
              widget = {
                type = "calendar";
                view = "agenda";
                maxEvents = 8;
                showTime = false;
                integrations = [
                  {
                    type = "sonarr";
                    service_group = "Automation";
                    service_name = "Sonarr";
                    color = "sky";
                    baseUrl = "https://sonarr.home.agost.info";
                  }
                  {
                    type = "radarr";
                    service_group = "Automation";
                    service_name = "Radarr";
                    color = "amber";
                    baseUrl = "https://radarr.home.agost.info";
                  }
                ];
              };
            };
          }
        ];
      }
      {
        Automation = [
          {
            Sonarr = {
              icon = "sonarr.svg";
              href = "https://sonarr.home.agost.info";
              description = "TV automation and import troubleshooting";
              widget = {
                type = "sonarr";
                url = "http://127.0.0.1:8989";
                key = "{{HOMEPAGE_VAR_SONARR_KEY}}";
                enableQueue = false;
              };
            };
          }
          {
            Radarr = {
              icon = "radarr.svg";
              href = "https://radarr.home.agost.info";
              description = "Movie automation and import troubleshooting";
              widget = {
                type = "radarr";
                url = "http://127.0.0.1:7878";
                key = "{{HOMEPAGE_VAR_RADARR_KEY}}";
                enableQueue = false;
              };
            };
          }
        ];
      }
    ];
  };
}
