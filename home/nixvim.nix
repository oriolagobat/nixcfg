{nixvim, ...}: {
  imports = [ nixvim.homeModules.nixvim ];

  programs.nixvim = {
    enable = true;
    clipboard.register = "unnamedplus";
    # colorschemes.onedark.enable = true;
  };
}
