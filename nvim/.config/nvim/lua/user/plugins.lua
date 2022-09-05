local fn = vim.fn

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
  use "vim-airline/vim-airline"             -- colored status/tabline bar
  use "vim-airline/vim-airline-themes"      -- theme for airline
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
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icons
    },
  }



end)

-- tabline config
vim.g["airline_section_z"] = "%p%% %#__accent_bold#%l%#__restore__#%#__accent_bold#/%L%#__restore__#:%v"
vim.g["airline#extensions#tabline#enabled"] = 1
vim.g["airline#extensions#tabline#formatter"] = "unique_tail_improved"

vim.g["gruvbox_italic"] = 1         -- enable italics
vim.cmd [[colorscheme gruvbox]]     -- theme

return packer_start
