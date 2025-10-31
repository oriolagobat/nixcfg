{user, pkgs, ...} :
{
    users.users."${user}" = {
        description = "Oriol Agost Batalla";
        home = "/Users/${user}";
        name = "Oriol Agost Batalla";
        shell = pkgs.zsh;
    };
}