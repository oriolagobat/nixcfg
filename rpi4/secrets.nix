{ sops-nix, user, hostName, ...}: {
  imports = [
    sops-nix.nixosModules.sops
  ];
  sops = {
    defaultSopsFile = ../secrets/${hostName}.yaml;
    age.sshKeyPaths = [
      "/home/${user}/.ssh/id_ed25519"
    ];
    # secrets.userPwd = {};
    secrets.test = {};
  };
}