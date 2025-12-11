{ config, ... }: {
    nix = {
        enable = true;
        channel.enable = false;
        linux-builder = {
            enable = true;
            ephemeral = true;
            systems = [ "aarch64-linux" ];
            config = {
                virtualisation = {
                    darwin-builder = {
                        diskSize = 40 * 1024;
                        memorySize = 8 * 1024;
                    };
                    cores = 6;
                };
            };
        };
        optimise = {
            automatic = true;
            interval = [
                {
                    Hour = 10;
                    Minute = 00;
                    Weekday = 1;
                }
            ];
        };
        settings = {
            experimental-features = [ "nix-command" "flakes" ];
            trusted-users = [ "@admin" ];
        };
    };
    environment.variables.NIX_USER_CONF_FILES = "${config.sops.templates."nix-access-tokens.conf".path}";
}