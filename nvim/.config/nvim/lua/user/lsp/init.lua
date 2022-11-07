local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
    return
end

require('lspconfig.ui.windows').default_options.border = 'rounded'

require "user.lsp.mason-lspconfig"
require("user.lsp.handler").setup()
