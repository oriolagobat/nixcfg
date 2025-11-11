{pkgs, nixvim, ...}: {
  imports = [ nixvim.homeModules.nixvim ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    colorscheme = "material-palenight";
    clipboard.register = "unnamedplus";

    opts = {
      number = true;
      relativenumber = true;
      ignorecase = true;
      smartcase = true;
      hlsearch = true;
      incsearch = true;
      wrap = true;
      breakindent = true;
      tabstop = 4;
      softtabstop = 4;
      shiftwidth = 4;
      expandtab = true;
      smartindent = true;
      scrolloff = 8;
    };

    globals = {
      mapleader = " ";
      maplocalloader = " ";
    };

    keymaps = [
      {
        mode = ["i" "v"];
        key = "<C-g>";
        action = "<esc>";
      }
      {
        mode = "n";
        key = "<Leader>fs";
        action = ":wq<CR>";
      }
      {
        mode = "n";
        key = "<Leader>fd";
        action = ":qa!<CR>";
      }
      {
        mode = "n";
        key = "<Leader>fw";
        action = ":w<CR>";
      }
      {
        mode = "n";
        key = "<C-d>";
        action = "<C-d>zz";
      }
      {
        mode = "n";
        key = "<C-u>";
        action = "<C-u>zz";
      }
      {
        mode = "n";
        key = "n";
        action = "nzzzv";
      }
      {
        mode = "n";
        key = "N";
        action = "Nzzzv";
      }
      {
        mode = "n";
        key = "<leader>s";
        action = "[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]";
      }
    ];

    plugins = {
      lualine = {
        enable = true;
        settings = {
          options = {
            theme = "auto";
          };
        };
      };
      autoclose = {
        enable = true;
        settings = {
          keys = {
            "<" = { escape = false; close = true;  pair = "<>"; };
            ">" = { escape = true; close = false; pair = "<>"; };

            "(" = { escape = false; close = true; pair = "()"; };
            ")" = { escape = true; close = false; pair = "()"; };

            "[" = { escape = false; close = true; pair = "[]"; };
            "]" = { escape = true; close = false; pair = "[]"; };

            "{" = { escape = false; close = true; pair = "{}"; };
            "}" = { escape = true; close = false; pair = "{}"; };

            "\"" = { escape = true; close = true; pair = "\"\""; };
            "`" = { escape = true; close = true; pair = "``"; };
          };
        };
      };
    };

    extraPlugins = with pkgs.vimPlugins; [
      easymotion
      material-nvim
    ];

    plugins.lsp = {
      enable = true;
      servers = {
        nil_ls.enable = true;
        bashls.enable = true;
      };
    };

    lsp.keymaps = [
            {
              key = "gd";
              lspBufAction = "definition";
            }
            {
              key = "gt";
              lspBufAction = "type_definition";
            }
            {
              key = "gi";
              lspBufAction = "implementation";
            }
    ];
  };
}
