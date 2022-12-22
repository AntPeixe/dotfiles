require "antpeixe.dap.ui"
require "antpeixe.dap.settings"

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap
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

