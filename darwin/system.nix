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
                # minimize-to-application = true;  # This makes the minimized application appear in the app itself.
                persistent-apps = [ ];
                persistent-others = [
                    "/Users/${user}/Downloads"
                ];
                show-recents = false;
            };
            finder = {
                AppleShowAllExtensions = true;
                AppleShowAllFiles = true;
                FXDefaultSearchScope = "SCcf"; # Search the current folder by default
                FXEnableExtensionChangeWarning = false;
                NewWindowTarget = "Home";
                ShowPathbar = true;
            };
            loginwindow = {
                GuestEnabled = false;
                DisableConsoleAccess = true;
            };
            magicmouse.MouseButtonMode = "TwoButton";
            menuExtraClock = {
                Show24Hour = true;
                ShowAMPM = false;
            };
        };
    };
}