return {
    "tpope/vim-fugitive", -- git bar and commands
    keys = {
        { "<leader>gi", ":Git<CR>" },
        { "<leader>gd", ":Gvdiffsplit!<CR>" },
        { "<leader>gs", ":Git diff --cached<CR>" },
        { "<leader>gb", ":Git blame<CR>" },
        { "<leader>gc", ":Git commit<CR>" },
        { "<leader>go", ":Git checkout" },
        { "<leader>gp", ":Git push<CR>" },
        { "<leader>gl", ":Git pull<CR>" },
    }
}
