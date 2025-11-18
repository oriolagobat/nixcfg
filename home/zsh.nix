{pkgs, lib, ...}: {
    programs.zsh = {
        enable = true;
        enableCompletion = true;
        autosuggestion.enable = true;
        syntaxHighlighting.enable = true;
        defaultKeymap = "viins";
        oh-my-zsh = {
            enable = true;
            plugins = [
                "git"
                "z"
                "sudo"
                "colored-man-pages"
                "uv"
            ];
        };
        shellAliases = {
            ga = "git add .";
            gc = "git commit";
            gp = "git push";
            gs = "git status";
            gpu = "git pull";
            grh = "git reset --hard HEAD";
            gspu = "git stash push";
            gspo = "git stash pop";
            gch = "git checkout";
            gpf = "git push --force";
            grc = "git rebase --continue";
            ls = "${lib.getExe pkgs.lsd}";
            cat = "${lib.getExe pkgs.bat}";
            switch = "sudo darwin-rebuild switch --flake /etc/nix-darwin";
        };

        siteFunctions = {
            nixs = ''
                nix shell "nixpkgs#$1"
            '';
        };
    };
}
