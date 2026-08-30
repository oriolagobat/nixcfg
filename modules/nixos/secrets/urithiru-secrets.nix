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
    secrets.porkbunApiSecretKey = {};

    templates."caddy-porkbun.env".content = ''
      PORKBUN_API_KEY=${config.sops.placeholder.porkbunApiKey}
      PORKBUN_API_SECRET_KEY=${config.sops.placeholder.porkbunApiSecretKey}
    '';
  };
}