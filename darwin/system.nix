{ user, ... }:
{
    system = {
        primaryUser = user;
        stateVersion = "6";
        keyboard = {
            enableKeyMapping = true;
            remapCapsLockToControl = true;
        };
        startup.chime = false;
        defaults = {
            dock = {
                autohide = true;
                enable-spring-load-actions-on-all-items = true;
                magnification = true;
                # minimize-to-application = true;
                persistent-apps = [ ];
                persistent-others = [
                    "/Users/${user}/Downloads"
                ];
                show-recents = false;
            };
        };
    };
}