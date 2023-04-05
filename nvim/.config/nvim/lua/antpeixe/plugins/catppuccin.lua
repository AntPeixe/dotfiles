return {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,    -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
        vim.g.catppuccin_flavour = "mocha"
        vim.cmd([[colorscheme catppuccin]])
    end,
    opts = {
        {
            transparent_background = true,
            term_colors = true,
            compile = {
                enabled = true,
            },
            styles = {
                comments = { "italic" },
                conditionals = {},
                loops = {},
                functions = { "bold" },
                keywords = {},
                strings = {},
                variables = {},
                numbers = {},
                booleans = {},
                properties = {},
                types = {},
                operators = {},
            },
            integrations = {
                gitsigns = true,
                treesitter = true,
                telescope = true,
                nvimtree = true,
                native_lsp = {
                    enabled = true,
                },
                dap = {
                    enabled = true,
                    enable_ui = true, -- enable nvim-dap-ui
                }
            },
        }
    }
}
