return {
    "kyazdani42/nvim-tree.lua",
    cmd = "NvimTree",
    opts = {
        git = {
            ignore = false
        },
    },
    keys = {
        { "<leader>e", ":NvimTreeFindFileToggle<CR>" },
    }
}
