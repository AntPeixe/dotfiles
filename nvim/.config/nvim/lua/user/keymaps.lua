local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- set leader to Space
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- <leader>+l to clear search
keymap("n", "<leader>l", ":nohl<CR>:echo 'Search Cleared'<CR>", opts)

-- map <leader>+e to open vertical explorer
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- use ctrl to simplify split moving
keymap("n", "<C-J>", "<C-W><C-J>", opts)
keymap("n", "<C-K>", "<C-W><C-K>", opts)
keymap("n", "<C-L>", "<C-W><C-L>", opts)
keymap("n", "<C-H>", "<C-W><C-H>", opts)

keymap("n", "<C-D>", "<C-D>z.", opts)
keymap("n", "<C-U>", "<C-U>z.", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- PYTHON MAPS
-- F5 run python file
vim.cmd [[autocmd FileType python nnoremap <buffer> <F5> :w<cr>:exec '!python' shellescape(expand('%:p'), 1)<cr>]]

-- Telescope
keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>fg", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)
