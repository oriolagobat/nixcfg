{ nixarr, lib, ... }:

{
  imports = [
    nixarr.nixosModules.default
  ];

  services.transmission.settings = {
    rpc-host-whitelist = lib.strings.concatStringsSep "," [
      "transmission.agost.info"
      "127.0.0.1"
      "localhost"
    ];
  };

  services.flaresolverr.enable = true;

  users.users.jellyfin.extraGroups = [ "render" ];

  nixarr = {
    enable = true;

    mediaDir = "/data/nixarr/media";
    stateDir = "/data/nixarr/media/.state/nixarr";

    jellyfin.enable = true;

    transmission.enable = true;

    bazarr.enable = true;
    prowlarr.enable = true;
    radarr.enable = true;
    sonarr.enable = true;
    jellyseerr.enable = true;
  };
}