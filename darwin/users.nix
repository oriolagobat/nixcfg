{user, pkgs, ...} :
{
    users.users.${user} = {
        description = "Oriol Agost Batalla";
        home = "/Users/${user}";
        shell = pkgs.zsh;
        uid = 501;
    };
}