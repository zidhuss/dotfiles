local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
  execute 'packadd packer.nvim'
end

vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile' -- Auto compile when there are changes in plugins.lua

require('packer').init({display = {auto_clean = false}})

return require('packer').startup(function(use)

	use { 'wbthomason/packer.nvim' }

	use 'christoomey/vim-tmux-navigator'

	use { 'glacambre/firenvim', run = function() vim.fn['firenvim#install'](0) end }

	use 'neovim/nvim-lspconfig'

	use 'hrsh7th/nvim-compe'

	-- tpope the man
	use 'tpope/vim-commentary'
	use 'tpope/vim-surround'


	-- telescope
	use {
	  'nvim-telescope/telescope.nvim',
	  requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
	}

	-- treesitter
	use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}

end)
