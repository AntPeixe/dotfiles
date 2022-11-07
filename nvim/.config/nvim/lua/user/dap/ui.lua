local dap_status_ok, dap = pcall(require, "dap")
if not dap_status_ok then
    return
end

-- Catppuccin style
local sign = vim.fn.sign_define
sign("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = ""})
sign("DapBreakpointCondition", { text = "●", texthl = "DapBreakpointCondition", linehl = "", numhl = ""})
sign("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = ""})

local dapui_status_ok, dapui = pcall(require, "dapui")
if not dapui_status_ok then
    return
end

dapui.setup({
    layouts = {
        {
            elements = {
                { id = "watches", size = 0.2 },
                { id = "scopes", size = 0.5 },
                { id = "stacks", size = 0.3 },
            },
            size = 0.2,
            position = "left",
        },
        {
            elements = {
                { id = "breakpoints", size = 0.2 },
                { id = "repl", size = 0.5 },
                { id = "console", size = 0.3 },
            },
            size = 0.3,
            position = "right",
        },
    },

    controls = {
        enabled = false,
    },
})

dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open({})
end

local dapvt_status_ok, dapvt = pcall(require, "nvim-dap-virtual-text")
if dapvt_status_ok then
    dapvt.setup { enable_commands = false }
end
