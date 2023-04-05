return {
    "mfussenegger/nvim-dap-python",
    dependencies = { "rcarriga/nvim-dap-ui" },
    keys = {
        { "<leader>dp", ":lua require'dap-python'.test_method()<CR>" },
    },
    config = function()
        local dappy = require("dap-python")
        dappy.setup(os.getenv("HOME") .. "/.local/share/nvim/mason/packages/debugpy/venv/bin/python")
        dappy.test_runner = "pytest"
    end
}
