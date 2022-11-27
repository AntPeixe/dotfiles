local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
    return
end

local function lsp_server_name()
    -- Lsp server name .
    local function get_msg()
        local msg = 'No Active Lsp'
        local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')  -- 0 is current buffer
        local clients = vim.lsp.get_active_clients()

        if next(clients) == nil then
            return msg
        end

        for _, client in ipairs(clients) do
            local filetypes = client.config.filetypes
            if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                return client.name
            end
        end
    end

    local icon = ' LSP:'
    local color = { gui = 'bold' }
    return { get_msg, icon=icon, color=color }
end


lualine.setup {
    options = { icons_enabled = true, theme = 'auto' },

    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch' },
        lualine_c = { { 'filename', file_status = true, path = 1 }, 'diff' },
        lualine_x = { },
        lualine_y = { 'diagnostics', lsp_server_name() },
        lualine_z = { 'progress', 'location' },
    },

    tabline = {
        lualine_a = { { 'buffers', mode = 2 } },
        lualine_z = { 'tabs' }
    },

    extensions = { 'nvim-tree', 'quickfix', 'fugitive', 'nvim-dap-ui' }
}
