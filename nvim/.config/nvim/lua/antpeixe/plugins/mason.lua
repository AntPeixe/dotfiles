return {
    "mason-org/mason.nvim",
    lazy= true,
    version = "^1.0.0",
    opts = {
        ui = {
            border = "rounded",
            icons = {
                package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = "✗"
            }
        }
    }
}