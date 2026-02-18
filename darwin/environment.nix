{user, ...}: {
    environment = {
        pathsToLink = [
            "/share/zsh" 
            "/Applications"
        ];
        systemPath = [
            "/opt/homebrew/bin"
            "/Users/${user}/.local/bin"
        ];
    };
}