{ config, ... }:

{
  services.pocket-id = {
    enable = true;

    settings = {
      APP_URL = "https://auth.home.agost.info";

      HOST = "127.0.0.1";
      PORT = 1411;

      TRUST_PROXY = true;
      ALLOW_INSECURE_CALLBACK_URLS = false;
      ANALYTICS_DISABLED = true;
    };

    credentials = {
      ENCRYPTION_KEY =
        config.sops.secrets.pocketIdEncryptionKey.path;
    };
  };
}