{config, sops-nix, user, hostName, ...}: {
  imports = [
    sops-nix.darwinModules.sops
  ];
  sops = {
    defaultSopsFile = ../secrets/${hostName}.yaml;
    age.sshKeyPaths = [
      "/Users/${user}/.ssh/sops-${hostName}"
    ];
    secrets.githubToken = { };
    templates."nix-access-tokens.conf" = {
      content = ''
        access-tokens = ${config.sops.placeholder.githubToken}
      '';
      owner = user;
      mode = "0400";
    };
  };
}