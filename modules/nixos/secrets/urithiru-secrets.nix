{ sops-nix, config, user, hostName, ... }:

{
  imports = [
    sops-nix.nixosModules.sops
  ];

  sops = {
    defaultSopsFile = ../../../secrets/urithiru.yaml;

    age.sshKeyPaths = [
      "/home/${user}/.ssh/${hostName}-secrets"
    ];

    secrets.userPwd = {
      neededForUsers = true;
    };

    secrets.tailscaleKey = {};
    secrets.porkbunApiKey = {};
    secrets.homepageSeerrKey = {};
    secrets.homepageRadarrKey = {};
    secrets.homepageSonarrKey = {};
    secrets.homepageJellyfinKey = {};
    secrets.porkbunApiSecretKey = {};
    secrets.pocketIdEncryptionKey = {};
    secrets.pocketIdCaddyClientId = {};
    secrets.pocketIdCaddyClientSecret = {};

    templates."caddy-porkbun.env".content = ''
      PORKBUN_API_KEY=${config.sops.placeholder.porkbunApiKey}
      PORKBUN_API_SECRET_KEY=${config.sops.placeholder.porkbunApiSecretKey}

      POCKET_ID_CLIENT_ID=${config.sops.placeholder.pocketIdCaddyClientId}
      POCKET_ID_CLIENT_SECRET=${config.sops.placeholder.pocketIdCaddyClientSecret}
    '';
    
    templates."homepage.env".content = ''
      HOMEPAGE_VAR_JELLYFIN_KEY=${config.sops.placeholder.homepageJellyfinKey}
      HOMEPAGE_VAR_SEERR_KEY=${config.sops.placeholder.homepageSeerrKey}
      HOMEPAGE_VAR_SONARR_KEY=${config.sops.placeholder.homepageSonarrKey}
      HOMEPAGE_VAR_RADARR_KEY=${config.sops.placeholder.homepageRadarrKey}
    '';
  };
}