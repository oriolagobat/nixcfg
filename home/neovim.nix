_: {
    programs.neovim = {
        enable = true;
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