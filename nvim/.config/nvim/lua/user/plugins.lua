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

-- Use pop-up window for packer
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Plugins
local packer_start = packer.startup(function(use)

  -- packer can manage itself
  use "wbthomason/packer.nvim"

  -- faster loading
  use 'lewis6991/impatient.nvim'

  -- dependencies for a variety of plugings
  use "nvim-lua/popup.nvim"
  use "nvim-lua/plenary.nvim"
  use 'kyazdani42/nvim-web-devicons'

  -- theme
  use {
    'catppuccin/nvim',
    as = 'catppuccin',
    run = ':CatppuccinCompile'
  }
  use 'nvim-lualine/lualine.nvim'
  use 'kyazdani42/nvim-tree.lua'

  -- git
  use "tpope/vim-fugitive"        -- git bar and commands
  use 'lewis6991/gitsigns.nvim'

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
  use "neovim/nvim-lspconfig"

  -- telescope
  use 'nvim-telescope/telescope.nvim'
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
  }
  use 'nvim-treesitter/nvim-treesitter-context'

  -- comment toggling
  use 'numToStr/Comment.nvim'

  -- nicer notifications
  use 'rcarriga/nvim-notify'

  -- debugging
  use {
      'rcarriga/nvim-dap-ui',
      requires = 'mfussenegger/nvim-dap'
  }
  use 'theHamsta/nvim-dap-virtual-text'
  use 'mfussenegger/nvim-dap-python'

end)

return packer_start
