local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- set leader to Space
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- <leader>+l to clear search
keymap("n", "<leader>l", ":nohl<CR>:echo 'Search Cleared'<CR>", opts)

-- map <leader>+e to open vertical explorer
keymap("n", "<leader>e", ":Lex<CR>", opts)

-- use ctrl to simplify split moving
keymap("n", "<C-J>", "<C-W><C-J>", opts)
keymap("n", "<C-K>", "<C-W><C-K>", opts)
keymap("n", "<C-L>", "<C-W><C-L>", opts)
keymap("n", "<C-H>", "<C-W><C-H>", opts)

-- Resize panes with Ctrl+Arrow
-- keymap("n", "<C-Up>", ":resize +2<CR>", opts)
-- keymap("n", "<C-Down>", ":resize -2<CR>", opts)
-- keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
-- keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- PYTHON MAPS
-- Ctrl+Enter to execute script and F5 to run tests on file
vim.cmd [[autocmd FileType python nnoremap <buffer> <C-CR> :w<cr>:exec '!python' shellescape(expand('%:p'), 1)<cr>]]
vim.cmd [[autocmd FileType python nnoremap <buffer> <F5> :w<cr>:exec '!pytest' shellescape(expand('%:p'), 1)<cr>]]
