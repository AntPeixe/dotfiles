return {
    -- mason-lspconfig
    {
        "mason-org/mason-lspconfig.nvim",
        version="^1.0.0",
        dependencies = {
            "mason-org/mason.nvim",
            "neovim/nvim-lspconfig",
        },
        opts = function()

            local lsphandler = require("antpeixe.plugins.lsp.handler")
            local luals_settings = require("antpeixe.plugins.lsp.settings.lua_ls")
            local pyright_settings = require("antpeixe.plugins.lsp.settings.pyright")
            local gopls_settings = require("antpeixe.plugins.lsp.settings.gopls")

            local servers = {
                lua_ls = luals_settings,
                pyright = pyright_settings,
                rust_analyzer = {},
                gopls = gopls_settings,
            }

            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

            lsphandler.setup()

            local default_cfg = {
              capabilities = capabilities,
              on_attach = lsphandler.on_attach,
            }

            local ret = {
              ensure_installed = vim.tbl_keys(servers),
              handlers = {
                function(server_name)
                  local cfg = vim.tbl_extend("force", default_cfg, (servers[server_name] or {}))
                  vim.lsp.enable(server_name)
                  vim.lsp.config(server_name, cfg)
                end,
              },
            }
            return ret

        end,
    },
}
