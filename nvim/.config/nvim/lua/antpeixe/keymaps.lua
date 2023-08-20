local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- set leader to Space
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- <leader>+l to clear search
keymap("n", "<leader>l", ":nohl<CR>:echo 'Search Cleared'<CR>", opts)

-- use ctrl to simplify split moving
keymap("n", "<C-J>", "<C-W><C-J>", opts)
keymap("n", "<C-K>", "<C-W><C-K>", opts)
keymap("n", "<C-L>", "<C-W><C-L>", opts)
keymap("n", "<C-H>", "<C-W><C-H>", opts)

-- center screen on vertical movement
keymap("n", "<C-D>", "<C-D>z.", opts)
keymap("n", "<C-U>", "<C-U>z.", opts)
keymap("n", "n", "nzz", opts) -- on search center screen but keep cursor column
keymap("n", "N", "Nzz", opts) -- on search backwards center screen but keep cursor column

-- Buffers
keymap("n", "<leader>w", ":bwipeout<CR>", opts)
keymap("n", "<leader>W", ":%bwipeout<CR>", opts)

-- Terminal
keymap("t", "<Esc>", "<C-\\><C-n>", opts)

-- ThePrimeagen dotfiles
-- Paste over without lossing registry
keymap("x", "<leader>p", "\"_dP", opts)

-- yank to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- move selected lines up and down
keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)

keymap("n", "<leader>t", "idate<Esc>!!sh<CR>", opts)
