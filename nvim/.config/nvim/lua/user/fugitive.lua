local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- expects fugitive plugin
keymap("n", "<leader>gi", ":Git<CR>", opts)
keymap("n", "<leader>gd", ":Gvdiffsplit!<CR>", opts)
keymap("n", "<leader>gs", ":Git diff --cached<CR>", opts)
keymap("n", "<leader>gb", ":Git blame<CR>", opts)
keymap("n", "<leader>gc", ":Git commit<CR>", opts)
keymap("n", "<leader>go", ":Git checkout", opts)
keymap("n", "<leader>gp", ":Git push<CR>", opts)
keymap("n", "<leader>gl", ":Git pull<CR>", opts)
keymap("n", "<leader>gg", ":Git log --oneline --decorate --graph<CR>", opts)

