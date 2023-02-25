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

  indent = { enable = true },
}
