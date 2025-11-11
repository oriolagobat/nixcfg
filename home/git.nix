_: {
    programs.git = {
        enable = true;

        ignores = [
            "**/.DS_Store"
        ];

        settings = {
            user = {
                name = "Oriol Agost Batalla";
                email = "oriolagobat@gmail.com";
            };
            github.user = "oriolagobat";
        };

        # signing = {
        #     signByDefault = true;
        #     format = "openpgp";
        #     key = "";
        # }
    };
}
