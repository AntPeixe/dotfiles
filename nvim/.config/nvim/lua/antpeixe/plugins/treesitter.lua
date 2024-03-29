return {
    "nvim-treesitter/nvim-treesitter",
    dependencies = { "nvim-treesitter/nvim-treesitter-context", "nvim-treesitter/nvim-treesitter-refactor" },
    event = "BufReadPost",
    build = function()
        require("nvim-treesitter.install").update({ with_sync = true })
    end,
    config = function()
        local configs = require("nvim-treesitter.configs")
        configs.setup {
            ensure_installed = "all",
            sync_install = false,
            auto_install = true,
            ignore_install = { "" },                       -- List of parsers to ignore installing
            highlight = {
                enable = true,                             -- false will disable the whole extension
                disable = { "" },                          -- list of language that will be disabled
                additional_vim_regex_highlighting = false, -- required for catppuccin
            },
            indent = { enable = true },
            refactor = {
                highlight_definitions = {
                    enable = true,
                    clear_on_cursor_move = false, -- Set to false if you have an `updatetime` of ~100.
                },
            },
        }
    end
}
