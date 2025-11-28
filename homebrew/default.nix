{userCasks ? [], ... }: {
  homebrew = {
		enable = true;

		onActivation = {
				autoUpdate = true;
				upgrade = true;
				cleanup = "zap";
		};


		# This will be the only CLI tool installed via Homebrew
		# This is because mas is required to install Mac App Store apps
		# and it has to be installed via Homebrew
		brews = ["mas"];

		casks = import ./casks.nix ++ userCasks;

		masApps = import ./mas.nix;
  };
}
