return {
    "kyazdani42/nvim-tree.lua",
    cmd = "NvimTree",
    opts = {
        git = {
            ignore = false
        },
        sync_root_with_cwd = true,
    },
    keys = {
        { "<leader>e", ":NvimTreeFindFileToggle<CR>" },
    }
}
