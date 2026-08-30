{ sops-nix, config, user, hostName, ... }:

{
  imports = [
    sops-nix.nixosModules.sops
  ];

  sops = {
    defaultSopsFile = ../../secrets/${hostName}.yaml;

    age.sshKeyPaths = [
      "/home/${user}/.ssh/${hostName}-secrets"
    ];

    secrets.userPwd = {
      neededForUsers = true;
    };

    secrets.tailscaleKey = {};
    secrets.porkbun_api_key = {};
    secrets.porkbun_api_secret_key = {};

    templates."caddy-porkbun.env".content = ''
      PORKBUN_API_KEY=${config.sops.placeholder.porkbun_api_key}
      PORKBUN_API_SECRET_KEY=${config.sops.placeholder.porkbun_api_secret_key}
    '';
  };
}