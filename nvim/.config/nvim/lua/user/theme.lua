local set = vim.opt
-- theme

set.background = "dark"                 -- dark background
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
        native_lsp = {
            enabled = true,
        },
        neotree = {
            enabled = true,
            show_root = true,
            transparent_panel = false,
        },
    },
    custom_highlights = {
        CursorLine = { bg = colors.surface0 },
        LineNr = { fg = colors.lavender },  -- all LineNr equal to CursorLineNr
    }
})

vim.cmd [[colorscheme catppuccin]]



-- local colorscheme = "gruvbox"
-- local gruvbox_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
-- if not gruvbox_ok then
--     print("Colorscheme " .. colorscheme .. " not found")
-- else  -- gruvbox theme exists so we can set a couple options
--     vim.g["gruvbox_italic"] = 1             -- enable italics
--     vim.g["gruvbox_sign_column"] = "bg0"    -- no background for signcolumn
-- end

