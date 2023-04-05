return { 
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap", "theHamsta/nvim-dap-virtual-text" },
    keys = {
        { "<F5>",       ":DapContinue<CR>" },
        { "<F1>",       ":DapStepOver<CR>" },
        { "<F2>",       ":DapStepInto<CR>" },
        { "<F3>",       ":DapStepOut<CR>" },
        { "<F12>",      ":DapTerminate<CR>" },
        { "<leader>b",  ":DapToggleBreakpoint<CR>" },
        { "<leader>bl", ":lua require'dap'.clear_breakpoints()<CR>" },
        { "<leader>B",  ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint Condition: '))<CR>" },
        -- toggle won't close the repl correctly use open and close
        { "<leader>D",  ":lua require'dapui'.close();require'dap'.repl.close()<CR>" },
    },
    config = function()
        local dap = require("dap")

        -- Catppuccin style
        local sign = vim.fn.sign_define
        sign("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = "" })
        sign("DapBreakpointCondition", { text = "●", texthl = "DapBreakpointCondition", linehl = "", numhl = "" })
        sign("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = "" })

        local dapui = require("dapui")

        dapui.setup({
            layouts = {
                {
                    elements = {
                        { id = "breakpoints", size = 0.1 },
                        { id = "watches",     size = 0.15 },
                        { id = "scopes",      size = 0.5 },
                        { id = "stacks",      size = 0.25 },
                    },
                    size = 0.45,
                    position = "right",
                },
                {
                    elements = {
                        { id = "repl",    size = 0.5 },
                        { id = "console", size = 0.5 },
                    },
                    size = 0.25,
                    position = "bottom",
                },
            },
            controls = {
                enabled = false,
            },
        })

        dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open({})
        end

        local dapvt = require("nvim-dap-virtual-text")
        dapvt.setup { enable_commands = false }
    end
}
