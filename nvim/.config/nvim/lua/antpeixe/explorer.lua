local status_ok, tree = pcall(require, "nvim-tree")
if not status_ok then
    return
end

tree.setup {
    git = {
        ignore = false
    },
}

-- <leader>+e to open vertical explorer
local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

