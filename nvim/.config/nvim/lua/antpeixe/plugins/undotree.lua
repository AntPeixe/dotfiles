return {
    "mbbill/undotree",
    dependencies = { "nvim-lua/plenary.nvim" },
    lazy = true,
    cmd = "UndotreeToggle",
    config = function ()
        vim.g["undotree_WindowLayout"] = 2
        vim.g["undotree_SetFocusWhenToggle"] = 1
        vim.g["undotree_SplitWidth"] = 30
        vim.g["undotree_DiffpanelHeight"] = 15
        vim.g["undotree_ShortIndicators"] = 1
    end
}
