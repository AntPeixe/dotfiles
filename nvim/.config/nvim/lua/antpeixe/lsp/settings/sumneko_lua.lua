return {
    settings = {
        Lua = {
            diagnostics = {
                globals = {'vim'}   -- recognize vim global
            },
            workspace = {
                -- server aware of Neovim runtime files
                checkThirdParty = false,
                library = vim.api.nvim_get_runtime_file("", true)
            },
        },
    }
}
