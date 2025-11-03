{pkgs, ...}: {
    programs.neovim = {
        enable = true;
        defaultEditor = true;
        viAlias = true;
        vimAlias = true;
        vimdiffAlias = true;
        plugins = with pkgs.vimPlugins; [
            packer-nvim
            {
                plugin = material-nvim;
                config = ''
                    lua << END
                    require('material').setup({
                        lualine_style = 'default'
                    })
                    vim.g.material_style = "palenight"
                    vim.cmd 'colorscheme material'
                    END
                '';
            }
            {
                plugin = lualine-nvim;
                config = ''
                    lua << END
                    require('lualine').setup{
                        options = {
                            theme = 'auto'
                        }
                    }
                    END
                '';
            }
            {
                plugin = autoclose-nvim;
                config = ''
                    lua << END
                    require("autoclose").setup({
                        keys = {
                            ["<"] = { escape = false, close = true, pair = "<>"},
                            ["("] = { escape = false, close = true, pair = "()"},
                            ["["] = { escape = false, close = true, pair = "[]"},
                            ["{"] = { escape = false, close = true, pair = "{}"},

                            [">"] = { escape = true, close = false, pair = "<>"},
                            [")"] = { escape = true, close = false, pair = "()"},
                            ["]"] = { escape = true, close = false, pair = "[]"},
                            ["}"] = { escape = true, close = false, pair = "{}"},

                            ['"'] = { escape = true, close = true, pair = '""'},
                            ["`"] = { escape = true, close = true, pair = "``"},
                        }
                    })
                    END
                '';
            }
            easymotion
            {
                plugin = lsp-zero-nvim;
                config = ''
                    lua << END
                        local lsp = require('lsp-zero').preset({})
                        lsp.on_attach(function(client, bufnr)
                        lsp.default_keymaps({buffer = bufnr})
                        end)
                        require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
                        lsp.setup()
                    END
                '';
            }
        ];
        extraLuaConfig = ''
            --- Base config
            vim.opt.number = true
            vim.opt.relativenumber = true
            vim.opt.ignorecase = true
            vim.opt.smartcase = true
            vim.opt.hlsearch = false
            vim.opt.incsearch = true
            vim.opt.wrap = true
            vim.opt.breakindent = true
            vim.opt.tabstop = 4
            vim.opt.softtabstop = 4
            vim.opt.shiftwidth = 4
            vim.opt.expandtab = true
            vim.opt.smartindent = true
            vim.o.clipboard = unnamedplus
            vim.o.termguicolors = true
            vim.opt.scrolloff = 8


            -- Keybindings
            function map(mode, lhs, rhs, opts)
                local options = { noremap = true }
                if opts then
                    options = vim.tbl_extend("force", options, opts)
                end
                vim.api.nvim_set_keymap(mode, lhs, rhs, options)
            end
            vim.g.mapleader = ' '
            vim.g.maplocaleader = ' '
            map("i", "<C-g>", "<Esc>")
            map("v", "<C-g>", "<Esc>")
            map("n", "<Leader>fs", ":wq<CR>") -- Write file and quit
            map("n", "<Leader>fd", ":qa!<CR>") -- Discard file
            map("n", "<Leader>fw", ":w<CR>") -- Write file
            map("n", "<C-d>", "<C-d>zz")
            map("n", "<C-u>", "<C-u>zz")
            map("n", "n", "nzzzv")
            map("n", "N", "Nzzzv")
            map("n", "Q", "<NOP>")
            vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
        '';
    };
}