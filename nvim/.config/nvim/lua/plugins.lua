local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
  execute 'packadd packer.nvim'
end

vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile' -- Auto compile when there are changes in plugins.lua

require('packer').init({display = {auto_clean = false}, git = {timeout = 180, clone_timeout = 180}})

return require('packer').startup(function(use)

  -- package manager
  use {'wbthomason/packer.nvim'}

  use 'christoomey/vim-tmux-navigator'

  -- firefox integration
  use {'glacambre/firenvim', run = function() vim.fn['firenvim#install'](0) end}

  -- LSP plugins
  use 'neovim/nvim-lspconfig'
  use 'glepnir/lspsaga.nvim'
  use 'kosayoda/nvim-lightbulb'

  -- plain colours
  use 'andreypopp/vim-colors-plain'

  -- text completion
  use 'hrsh7th/nvim-compe'

  -- tpope the man
  use 'tpope/vim-commentary'
  use 'tpope/vim-surround'
  use "tpope/vim-unimpaired"

  -- telescope
  use {'nvim-telescope/telescope.nvim', requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}}

  -- treesitter
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use {'nvim-treesitter/playground'}

  -- markdown
  use {'iamcco/markdown-preview.nvim', run = 'cd app && npm install'}

  -- diffconflicts
  use {'whiteinge/diffconflicts'}

  -- auto pairs
  use {"steelsojka/pears.nvim"}
  require"pears".setup(function(conf)
    conf.preset "tag_matching"
    conf.on_enter(function(pear_handle)
      if vim.fn.pumvisible() == 1 and vim.fn.complete_info().selected ~= -1 then
        vim.api.nvim_feedkeys(vim.fn['compe#confirm']('<CR>'), "n", true)
      else
        pear_handle()
      end
    end)
  end)

  -- colour scheme
  use {'rktjmp/lush.nvim'}
  use {'zidhuss/scrivener'}

  -- disagnostics menu
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function() require("trouble").setup {} end
  }

  -- higlight comments
  use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function() require("todo-comments").setup {} end
  }

  -- gitsigns
  -- TODO: needs sign highlighting
  -- use {
  --   'lewis6991/gitsigns.nvim',
  --   requires = {'nvim-lua/plenary.nvim'},
  --   config = function() require('gitsigns').setup() end
  -- }

  -- leader keys
  use {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup {
        plugins = {
          spelling = {
            enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
            suggestions = 20 -- how many suggestions should be shown in the list?
          }
        }
      }
    end
  }

  -- snippets
  use {'hrsh7th/vim-vsnip'}
  use {'hrsh7th/vim-vsnip-integ'}
  use {'golang/vscode-go'}
  use {'dsznajder/vscode-es7-javascript-react-snippets'}

  -- indent lines
  -- use {'lukas-reineke/indent-blankline.nvim', disabled = true}

  -- TODO: using to quickly get formatting
  use {'dense-analysis/ale'}

end)
