local status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok then
	return
end

mason_lspconfig.setup({
    ensure_installed = { "lua_ls", "pyright", "rust_analyzer" },
    automatic_installation = true,
})

local opts = {
    on_attach = require("antpeixe.lsp.handler").on_attach,
    capabilities = require("antpeixe.lsp.handler").capabilities,
}

mason_lspconfig.setup_handlers({
    function (server_name)
        require("lspconfig")[server_name].setup(opts)
    end,

    ["pyright"] = function ()
        local pyright_opts = require("antpeixe.lsp.settings.pyright")
        opts = vim.tbl_deep_extend("force", pyright_opts, opts)
        require("lspconfig").pyright.setup(opts)
    end,

    ["lua_ls"] = function ()
        local lua_ls_settings = require("antpeixe.lsp.settings.lua_ls")
        opts = vim.tbl_deep_extend("force", lua_ls_settings, opts)
        require("lspconfig").lua_ls.setup(opts)
    end
})
