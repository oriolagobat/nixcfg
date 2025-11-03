_: {
    programs.zoxide = {
        enable = true;
        enableZshIntegration = true;
        options = ["--cmd cd" ];  # Use zoxide for cd command
    };
}