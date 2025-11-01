{pkgs, ...}: {
    programs.zsh = {
        enable = true;
        enableCompletion = true;
        autosuggestion.enable = true;
        syntaxHighlighting.enable = true;
        defaultKeymap = "viins";
        oh-my-zsh = {
            enable = true;
            theme = "powerlevel10k/powerlevel10k";
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
            gspu = "git stash push";
            gspo = "git stash pop";
            gch = "git checkout";
            gpf = "git push --force";
            ls = "${pkgs.lsd}/bin/lsd";
            cat = "${pkgs.bat}/bin/bat";
            cd = "${pkgs.zoxide}/bin/zoxide";
        };
    };
}