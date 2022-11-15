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
keymap("n", "n", "nzz", opts)  -- on search center screen but keep cursor column

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Buffers
keymap("n", "<leader>w", ":bwipeout<CR>", opts)
keymap("n", "<leader>W", ":%bwipeout<CR>", opts)

-- Paste over without lossing registry (from ThePrimeagen dotfiles)
keymap("x", "<leader>p", "\"_dP", opts)


-- ####################
-- ## Plugin related ##
-- ####################

-- <leader>+e to open vertical explorer
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- Git
keymap("n", "<leader>gi", ":Git<CR>", opts)
keymap("n", "<leader>gd", ":Gvdiffsplit!<CR>", opts)
keymap("n", "<leader>gs", ":Git diff --cached<CR>", opts)
keymap("n", "<leader>gb", ":Git blame<CR>", opts)
keymap("n", "<leader>gc", ":Git commit<CR>", opts)
keymap("n", "<leader>go", ":Git checkout", opts)
keymap("n", "<leader>gp", ":Git push<CR>", opts)
keymap("n", "<leader>gl", ":Git pull<CR>", opts)
keymap("n", "<leader>gg", ":Git log --oneline --decorate --graph<CR>", opts)

-- Telescope
keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>fr", ":Telescope grep_string<CR>", opts)
keymap("n", "<leader>fg", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)

-- DAP
keymap("n", "<F5>", ":DapContinue<CR>", opts)
keymap("n", "<F1>", ":DapStepOver<CR>", opts)
keymap("n", "<F2>", ":DapStepInto<CR>", opts)
keymap("n", "<F3>", ":DapStepOut<CR>", opts)
keymap("n", "<F12>", ":DapTerminate<CR>", opts)
keymap("n", "<leader>b", ":DapToggleBreakpoint<CR>", opts)
keymap("n", "<leader>bl", ":lua require'dap'.clear_breakpoints()<CR>", opts)
keymap("n", "<leader>B", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint Condition: '))<CR>", opts)
keymap("n", "<leader>dp", ":lua require'dap-python'.test_method()<CR>", opts)
-- toggle won't close the repl correctly use open and close
keymap("n", "<leader>D", ":lua require'dapui'.close();require'dap'.repl.close()<CR>", opts)

