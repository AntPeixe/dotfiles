return {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "neovim/nvim-lspconfig" },
    event = "BufReadPost",
    config = function()
        require("lspconfig.ui.windows").default_options.border = "rounded"
        local mason_lspconfig = require("mason-lspconfig")

        mason_lspconfig.setup({
            ensure_installed = { "lua_ls", "pyright", "rust_analyzer", "gopls" },
            automatic_installation = true,
        })

        local opts = {
            on_attach = require("antpeixe.plugins.lsp.handler").on_attach,
            capabilities = require("antpeixe.plugins.lsp.handler").capabilities,
        }

        mason_lspconfig.setup_handlers({
            function(server_name)
                require("lspconfig")[server_name].setup(opts)
            end,
            ["pyright"] = function()
                local pyright_opts = require("antpeixe.plugins.lsp.settings.pyright")
                opts = vim.tbl_deep_extend("force", pyright_opts, opts)
                require("lspconfig").pyright.setup(opts)
            end,
            ["lua_ls"] = function()
                local lua_ls_settings = require("antpeixe.plugins.lsp.settings.lua_ls")
                opts = vim.tbl_deep_extend("force", lua_ls_settings, opts)
                require("lspconfig").lua_ls.setup(opts)
            end,
            ["gopls"] = function()
                local gopls_opts = require("antpeixe.plugins.lsp.settings.gopls")
                opts = vim.tbl_deep_extend("force", gopls_opts, opts)
                require("lspconfig").gopls.setup(opts)
            end
        })
        require("antpeixe.plugins.lsp.handler").setup()
    end
}
