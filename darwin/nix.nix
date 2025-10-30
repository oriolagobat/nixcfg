{ ... }:
{
    nix = {
        # optimise = {
        #     automatic = true;
        #     interval = [
        #         {
        #             Hour = 10;
        #             Minute = 00;
        #             Weekday = 1;
        #         }
        #     ];
        # };
        # settings.auto-optimise-store = true  # https://github.com/NixOS/nix/issues/7273
        enable = false; # using determinate installer
    };
}