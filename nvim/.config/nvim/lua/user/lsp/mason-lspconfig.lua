local status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok then
	return
end

mason_lspconfig.setup({
    ensure_installed = { "sumneko_lua", "pyright" },
    automatic_installation = true,
})

local opts = {
    on_attach = require("user.lsp.handler").on_attach,
    capabilities = require("user.lsp.handler").capabilities,
}

mason_lspconfig.setup_handlers({
    function (server_name)
        require("lspconfig")[server_name].setup(opts)
    end,

    ["pyright"] = function ()
        local pyright_opts = require("user.lsp.settings.pyright")
        opts = vim.tbl_deep_extend("force", pyright_opts, opts)
        require("lspconfig").pyright.setup(opts)
    end,

    ["sumneko_lua"] = function ()
        local sumneko_lua_settings = require("user.lsp.settings.sumneko_lua")
        opts = vim.tbl_deep_extend("force", sumneko_lua_settings, opts)
        require("lspconfig").sumneko_lua.setup(opts)
    end
})
