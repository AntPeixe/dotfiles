return {
    "jackMort/ChatGPT.nvim",
    dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
    event = "VeryLazy",
    -- config = function()
    --     require("chatgpt").setup()
    -- end
    opts = {
        popup_layout = {
            default = "right",
            right = {
                width = "40%",
            },
        }
    }
}
