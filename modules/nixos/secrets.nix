{ sops-nix, user, hostName, ... }:

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
    secrets.tailscaleKey = {
      neededForServices = true;
    };
  };
}