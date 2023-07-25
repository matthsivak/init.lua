-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- Themes

  use { "catppuccin/nvim", as = "catppuccin" }
  use { 'rose-pine/neovim', as = 'rose-pine', }
  use { "AhmedAbdulrahman/aylin.vim", as = "aylin" }
  use { 'liuchengxu/space-vim-dark', as = "space-vim-dark" }
  use { "bluz71/vim-moonfly-colors", as = "moonfly" }
  use { "Alexis12119/nightly.nvim", as = "nightly" }
  use { "EdenEast/nightfox.nvim", as = "nightfox" }

  -- Help

  use {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 200
    end
  }

  -- Navigation

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  use { 'ThePrimeagen/harpoon' }

  use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    }
  }

  use {
    'goolord/alpha-nvim',
    requires = { 'nvim-tree/nvim-web-devicons', 'BlakeJC94/alpha-nvim-fortune' },
  }

  use {
    'phaazon/hop.nvim',
    branch = 'v2', -- optional but strongly recommended
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require 'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    end
  }

  -- LSP

  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' }, -- Required
      {                            -- Optional
        'williamboman/mason.nvim',
        run = function()
          pcall(vim.cmd, 'MasonUpdate')
        end,
      },
      { 'williamboman/mason-lspconfig.nvim' }, -- Optional

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },     -- Required
      { 'hrsh7th/cmp-nvim-lsp' }, -- Required
      { 'L3MON4D3/LuaSnip' },     -- Required
    }
  }

  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  use {
    "folke/trouble.nvim",
    requires = { "nvim-tree/nvim-web-devicons" },
  }

  -- Utility

  use 'christoomey/vim-tmux-navigator'

  use({
    'mrjones2014/dash.nvim',
    run = 'make install',
  })

  -- Required for some plugins
  use "kkharji/sqlite.lua"

  -- or, to get rolling updates
  use "mrjones2014/legendary.nvim"

  use {
    'VonHeikemen/fine-cmdline.nvim',
    requires = {
      { 'MunifTanjim/nui.nvim' }
    }
  }

  use 'preservim/nerdcommenter'

  use { "akinsho/toggleterm.nvim", tag = '*', config = function()
    require("toggleterm").setup()
  end }

  use 'mbbill/undotree'


  use 'laytan/cloak.nvim'

  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }

  -- FUN


  -- UI

  use { 'stevearc/dressing.nvim' }

  use 'rcarriga/nvim-notify'

  use { 'nvim-telescope/telescope-ui-select.nvim' }

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

  use 'nvim-tree/nvim-web-devicons' -- OPTIONAL: for file icons
  use 'lewis6991/gitsigns.nvim'     -- OPTIONAL: for git status
  --use 'romgrk/barbar.nvim'

  use 'xiyaowong/transparent.nvim'

  use "lukas-reineke/indent-blankline.nvim"
end)
