local set = vim.opt
-- theme
set.termguicolors = true    -- true colors
set.cursorline = true       -- highlight cursor line
set.showmode = false        -- don't show mode

set.background = "dark"                 -- dark background
vim.cmd [[highlight Normal guibg=none]] -- transparent background

-- column 121 highlight
vim.cmd [[highlight ColorColumn ctermbg=1]]
set.colorcolumn = "121"

local catppuccin_ok, catppuccin = pcall(require, "catppuccin")
if not catppuccin_ok then
    return
end

vim.g.catppuccin_flavour = 'mocha'
local colors = require("catppuccin.palettes").get_palette()
catppuccin.setup({
    transparent_background = true,
    term_colors = true,
    integrations = {
        gitgutter = true,
    },
    custom_highlights = {
        CursorLine = { bg = colors.surface0 },
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

