local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
    return
end

require('lspconfig.ui.windows').default_options.border = 'rounded'

require "antpeixe.lsp.mason-lspconfig"
require("antpeixe.lsp.handler").setup()