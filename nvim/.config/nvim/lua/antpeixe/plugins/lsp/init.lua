local luals_settings = require("antpeixe.plugins.lsp.settings.lua_ls")
local pyright_settings = require("antpeixe.plugins.lsp.settings.pyright")
local gopls_settings = require("antpeixe.plugins.lsp.settings.gopls")

return {
    -- nvim-lspconfig
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "mason-org/mason.nvim",
            { "mason-org/mason-lspconfig.nvim", version="^1.0.0" }
        },
        opts = {
            servers = {
                lua_ls = luals_settings,
                pyright = pyright_settings,
                rust_analyzer = {},
                gopls = gopls_settings,
            },
        },
        config = function(_, opts)
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

            local on_attach = require("antpeixe.plugins.lsp.handler").on_attach

            local servers = opts.servers
            require("mason-lspconfig").setup({
              ensure_installed = vim.tbl_keys(servers),
              handlers = {
                function(server_name)
                  require("lspconfig")[server_name].setup({
                    capabilities = capabilities,
                    on_attach = on_attach,
                    settings = servers[server_name],
                    filetypes = (servers[server_name] or {}).filetypes,
                  })
                end,
              },
            })
            require("antpeixe.plugins.lsp.handler").setup()
        end,
    },
}