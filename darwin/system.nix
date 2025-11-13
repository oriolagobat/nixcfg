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
        nixpkgsRelease = "unstable";
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
            NSGlobalDomain = {
                "com.apple.mouse.tapBehavior" = 1; # Enable tap to click
                "com.apple.springing.delay" = 0.5;
                "com.apple.springing.enabled" = true;
                "com.apple.swipescrolldirection" = false;
                AppleInterfaceStyle = "Dark";
                ApplePressAndHoldEnabled = false; # Disable press-and-hold for keys in favor of key repeat
                AppleShowAllExtensions = true;
                AppleShowAllFiles = true;
                NSWindowShouldDragOnGesture = true; # Allow dragging windows by clicking anywhere
            };
            screencapture = {
                include-date = false;
                target = "clipboard";  # Save screenshots to clipboard
            };
            trackpad.Clicking = true;
        };
    };
}