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

