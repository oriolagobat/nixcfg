_: {
    programs.git = {
        enable = true;

        ignores = [
            "**/.DS_Store"
        ];

        settings = {
            user = {
                name = "Oriol Agost Batalla";
                email = "github@agost.com";
            };
            github.user = "orioagobat";
        };

        # signing = {
        #     signByDefault = true;
        #     format = "openpgp";
        #     key = "";
        # }
    };
}
