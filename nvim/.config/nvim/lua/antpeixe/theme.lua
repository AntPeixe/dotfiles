local set = vim.opt
-- theme

set.background = "dark" -- dark background
vim.cmd [[highlight Normal guibg=none]] -- transparent background

-- column 121 highlight
vim.cmd [[highlight ColorColumn ctermbg=1]]
set.colorcolumn = "80,120"

local catppuccin_ok, catppuccin = pcall(require, "catppuccin")
if not catppuccin_ok then
    return
end

vim.g.catppuccin_flavour = 'mocha'
local colors = require("catppuccin.palettes").get_palette()
catppuccin.setup({
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

    custom_highlights = {
        CursorLine = { bg = colors.surface0 },
        LineNr = { fg = colors.lavender }, -- all LineNr equal to CursorLineNr
    }

})

vim.cmd [[colorscheme catppuccin]]
