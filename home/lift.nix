_: {
  programs.zsh.shellAliases = {
    switch = "nh darwin switch /etc/nix-darwin";
    update = "cd /etc/nix-darwin && nix flake update && switch";
    uri-switch = "nh os switch /etc/nix-darwin -H urithiru --build-host urithiru --target-host urithiru --use-substitutes";
  };
}
