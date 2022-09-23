local status_ok, _ = pcall(require, "nvim-treesitter")
if not status_ok then
  return
end

local configs = require("nvim-treesitter.configs")
configs.setup {
  ensure_installed = "all",
  sync_install = false,
  auto_install = true,
  ignore_install = { "" },  -- List of parsers to ignore installing
  highlight = {
    enable = true,          -- false will disable the whole extension
    disable = { "" },       -- list of language that will be disabled
    additional_vim_regex_highlighting = false,  -- required for catppuccin
  },

  -- indent = { enable = true, disable = { "yaml" } },

  textobjects = {  -- for nvim-treesitter-textobjects
    select = {
      enable = true,
      lookahead = true,     -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
      },
      -- You can choose the select mode (default is charwise 'v')
      selection_modes = {
        ['@parameter.outer'] = 'v', -- charwise
        ['@function.outer'] = 'V', -- linewise
        ['@class.outer'] = '<c-v>', -- blockwise
      },
      include_surrounding_whitespace = false,
    },
  },
}

local ts_ctx_status, ts_ctx = pcall(require, 'treesitter-context')
if ts_ctx_status then
    ts_ctx.setup {
        separator = '-',
        patterns = {
            python = {
                'with'
            },
        },
    }
end
