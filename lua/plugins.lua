-- Install Packer automatically if it's not installed(Bootstraping)
-- Hint: string concatenation is done by `..`
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end
local packer_bootstrap = ensure_packer()


-- Reload configurations if we modify plugins.lua
-- Hint
--     <afile> - replaced with the filename of the buffer being manipulated
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- THEME
  use { "catppuccin/nvim", as = "catppuccin" }

  -- GIT STUFF
  use { "lewis6991/gitsigns.nvim" }


  -- BROWSER
  use {
    'glacambre/firenvim',
    run = function() vim.fn['firenvim#install'](0) end
  }

  use "xiyaowong/transparent.nvim"

  -- NAVIGATION
  use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    }
  }

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.x',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  use {
    'ThePrimeagen/harpoon',
    requires = {
      "nvim-lua/plenary.nvim"
    }
  }

  use({
    "epwalsh/obsidian.nvim",
    tag = "*", -- recommended, use latest release instead of latest commit
    requires = {
      -- Required.
      "nvim-lua/plenary.nvim",

      -- see below for full list of optional dependencies 👇
    },
    config = function()
      require("obsidian").setup({
        workspaces = {
          {
            name = "personal",
            path = "/Users/mattsivak/Library/Mobile Documents/iCloud~md~obsidian/Documents/ŠKOLA/",
          },
          {
            name = "work",
            path = "/Users/mattsivak/Library/Mobile Documents/iCloud~md~obsidian/Documents/MAIN/",
          },
        },
      })
    end,
  })

  -- KEYBINDINGS
  use "folke/which-key.nvim"

  -- VISUAL
  use { 'stevearc/dressing.nvim' }

  use({
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    setup = function() vim.g.mkdp_filetypes = { "markdown" } end,
    ft = { "markdown" },
  })

  use {
    'VonHeikemen/fine-cmdline.nvim',
    requires = {
      { 'MunifTanjim/nui.nvim' }
    }
  }

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

  use {
    'goolord/alpha-nvim',
    requires = { 'nvim-tree/nvim-web-devicons' },
  }

  use({
    "folke/drop.nvim",
    event = "VimEnter",
  })

  use 'rcarriga/nvim-notify'

  -- SHARE
  use 'https://github.com/jbyuki/instant.nvim'

  -- LSP
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'hrsh7th/cmp-cmdline' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'L3MON4D3/LuaSnip' },
    }
  }

  use "folke/trouble.nvim"

  use {
    'nvim-treesitter/nvim-treesitter',
  }

  -- UTILITY
  use {
    "windwp/nvim-autopairs",
  }

  use 'mbbill/undotree'

  use {
    "github/copilot.vim",
  }

  -- RANDOM

  use 'echasnovski/mini.nvim'

  -- MUST BE AT A BOTTOM!!!
  if packer_bootstrap then
    require('packer').sync()
  end
end)
