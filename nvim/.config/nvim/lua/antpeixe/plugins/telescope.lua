return {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = "Telescope",
    keys = {
        { "<leader>ff", ":Telescope find_files<CR>" },
        { "<leader>fr", ":Telescope lsp_references<CR>" },
        { "<leader>fg", ":Telescope live_grep<CR>" },
        { "<leader>fb", ":Telescope buffers<CR>" },
    },
    config = function()
        telescope = require("telescope")

        local telescopeConfig = require("telescope.config")
        local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }
        table.insert(vimgrep_arguments, "--hidden") -- search in hidden/dot files.
        -- don"t search in the `.git` directory.
        table.insert(vimgrep_arguments, "--glob")
        table.insert(vimgrep_arguments, "!.git/*")

        local actions = require "telescope.actions"
        telescope.setup({
            defaults = {
                prompt_prefix = " ",
                selection_caret = " ",
                path_display = { shorten = { len = 10, exclude = { 1, -1 } } },
                vimgrep_arguments = vimgrep_arguments,
                mappings = {
                    i = {
                        ["<C-j>"] = actions.move_selection_next,
                        ["<C-k>"] = actions.move_selection_previous,
                        ["<C-u>"] = actions.preview_scrolling_up,
                        ["<C-d>"] = actions.preview_scrolling_down,
                        ["<C-c>"] = actions.close,
                        ["<CR>"] = actions.select_default,
                        ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
                        ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
                        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                    },
                    n = {
                        ["j"] = actions.move_selection_next,
                        ["k"] = actions.move_selection_previous,
                        ["gg"] = actions.move_to_top,
                        ["G"] = actions.move_to_bottom,
                        ["<C-u>"] = actions.preview_scrolling_up,
                        ["<C-d>"] = actions.preview_scrolling_down,
                        ["<esc>"] = actions.close,
                        ["<CR>"] = actions.select_default,
                        ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
                        ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
                        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                        ["?"] = actions.which_key,
                    },
                },
            },
            pickers = {
                -- Default configuration for builtin pickers goes here:
                -- picker_name = {
                --   picker_config_key = value,
                --   ...
                -- }
                -- Now the picker_config_key will be applied every time you call this
                -- builtin picker
                find_files = {
                    find_command = { "fd", "--type=file", "--hidden", "--strip-cwd-prefix", "--exclude", ".git/*" } },
            },
        })
    end
}
