local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
    return
end

lualine.setup {
    options = {icons_enabled=true, theme='auto'},

    sections = {
        lualine_a = { 'branch' },
        lualine_b = { },
        lualine_c = { {'filename', file_status=true, path=1} },
        lualine_x = { 'diagnostics', 'diff' },
    },

    tabline = {
        lualine_a = { {'buffers', mode=2} },
        lualine_z = {'tabs'}
    }
}

