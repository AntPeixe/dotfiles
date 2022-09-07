-- Autocommand source plugins.lua on save
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Protected packer call
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Plugins
local packer_start = packer.startup(function(use)

  -- Packer can manage itself
  use "wbthomason/packer.nvim"

  use "morhetz/gruvbox"                     -- gruvbox colorscheme
  use {
    'nvim-lualine/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons'}
  }

  -- git
  use "tpope/vim-fugitive"                  -- git bar and commands
  use "airblade/vim-gitgutter"              -- git line changes

  -- completion
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'saadparwaiz1/cmp_luasnip'
  use "hrsh7th/cmp-nvim-lsp"

  -- snippets
  use 'L3MON4D3/LuaSnip'
  use 'rafamadriz/friendly-snippets'

  -- LSP
  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"
  use "neovim/nvim-lspconfig"           -- enables LSP

  use {
    'kyazdani42/nvim-tree.lua',
    requires = {'kyazdani42/nvim-web-devicons'}  -- for file icons
  }

end)

return packer_start
