local buf_keymap = vim.api.nvim_buf_set_keymap
local M = {}

M.setup = function()

    local signs_text = {
        [vim.diagnostic.severity.ERROR] = '',
        [vim.diagnostic.severity.WARN] = '',
        [vim.diagnostic.severity.HINT] = '',
        [vim.diagnostic.severity.INFO] = '',
    }

    local diag_config = {
        virtual_text = true,
        signs = { text = signs_text }, -- show signs
        severity_sort = true,
        float = {
            focusable = false,
            style = "minimal",
            border = "rounded",
            source = "always",
            header = "",
            prefix = "",
        },
    }

    vim.diagnostic.config(diag_config)

    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.buf.signature_help, {
        border = "rounded",
    })
end

local function lsp_keymaps(bufnr)
    local opts = { noremap = true, silent = true }
    buf_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>zz", opts)
    buf_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover({border='rounded'})<CR>", opts)
    -- buf_keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
    buf_keymap(bufnr, "n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
    buf_keymap(bufnr, "n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
    buf_keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
    buf_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    vim.cmd [[ command! Format execute "lua vim.lsp.buf.format{async=true}" ]]
end

local function lsp_auto_diagnostic_hover(bufnr)
    vim.api.nvim_create_autocmd("CursorHold", {
        buffer = bufnr,
        callback = function()
            local opts = {
                focusable = false,
                close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
                scope = "cursor",
            }
            vim.diagnostic.open_float(nil, opts)
        end
    })
end

M.on_attach = function(_, bufnr)
    lsp_keymaps(bufnr)
    lsp_auto_diagnostic_hover(bufnr)
end

return M
