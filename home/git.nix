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
        };

        # signing = {
        #     signByDefault = true;
        #     format = "openpgp";
        #     key = "";
        # }
    };
}