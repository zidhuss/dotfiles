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

  -- colour scheme
  use {'rktjmp/lush.nvim'}
  use {'zidhuss/scrivener'}

  -- leader keys
  use {'AckslD/nvim-whichkey-setup.lua', requires = {'liuchengxu/vim-which-key'}}

  -- snippets
  use {'hrsh7th/vim-vsnip'}
  use {'hrsh7th/vim-vsnip-integ'}
  use {'golang/vscode-go'}

  -- indent lines
  use {'lukas-reineke/indent-blankline.nvim', disabled = true}

  -- TODO: using to quickly get formatting
  use {'dense-analysis/ale'}

end)
