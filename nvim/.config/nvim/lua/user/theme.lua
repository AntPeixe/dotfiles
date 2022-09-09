local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
    return
end

lualine.setup {
    options = {icons_enabled=true, theme='auto'},
    sections = {
        lualine_c = { {'filename', file_status=true, path=0} },
        lualine_x = {'encoding', 'filetype'},
    },
    tabline = {
        lualine_a = { {'buffers', mode=2} },
        lualine_z = {'tabs'}
    }
}

local colorscheme = "gruvbox"

local gruvbox_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not gruvbox_ok then
    print("Colorscheme " .. colorscheme .. " not found")
else
    -- gruvbox theme exists so we can set a couple options
    vim.g["gruvbox_italic"] = 1             -- enable italics
    vim.g["gruvbox_sign_column"] = "bg0"    -- no background for signcolumn
end
