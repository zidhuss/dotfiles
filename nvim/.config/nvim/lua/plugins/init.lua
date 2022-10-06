local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
	execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
	execute("packadd packer.nvim")
end

vim.cmd("autocmd BufWritePost plugins.lua PackerCompile") -- Auto compile when there are changes in plugins.lua

require("packer").init({ display = { auto_clean = false }, git = { timeout = 180, clone_timeout = 180 } })

return require("packer").startup(function(use)
	-- package manager
	use({ "wbthomason/packer.nvim" })

	use("christoomey/vim-tmux-navigator")

	-- firefox integration
	use({
		"glacambre/firenvim",
		run = function()
			vim.fn["firenvim#install"](0)
		end,
		config = require("plugins.config.firenvim"),
	})

	-- LSP plugins
	use("neovim/nvim-lspconfig")
	use("tami5/lspsaga.nvim")
	use({ "kosayoda/nvim-lightbulb", config = require("plugins.config.lightbulb") })

	-- show lsp progress
	use({
		"j-hui/fidget.nvim",
		config = require("plugins.config.fidget"),
	})

	-- plain colours
	use("andreypopp/vim-colors-plain")

	-- text completion
	use({
		"hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-nvim-lsp-signature-help",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-emoji",
			"hrsh7th/cmp-cmdline",
			"petertriho/cmp-git",
			"ray-x/cmp-treesitter",
			"onsails/lspkind.nvim",
		},
		config = require("plugins.config.cmp"),
	})

	-- tpope the man
	use("tpope/vim-commentary")
	use("tpope/vim-surround")
	use("tpope/vim-unimpaired")
	use("tpope/vim-rails")

	-- telescope
	use({
		"nvim-telescope/telescope.nvim",
		requires = { "nvim-lua/popup.nvim", "nvim-lua/plenary.nvim", "nvim-telescope/telescope-ui-select.nvim" },
		config = require("plugins.config.telescope"),
	})

	-- treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",

		requires = {
			"nvim-treesitter/playground",
			"JoosepAlviste/nvim-ts-context-commentstring",
			"nvim-treesitter/nvim-treesitter-context",
			"nvim-treesitter/nvim-treesitter-textobjects",
		},

		config = require("plugins.config.treesitter"),
	})

	use({ "lewis6991/spellsitter.nvim", config = require("plugins.config.spellsitter") })

	use({ "windwp/nvim-autopairs", config = require("plugins.config.autopairs") })
	use({ "andymass/vim-matchup" })
	use({ "RRethy/nvim-treesitter-endwise" })

	-- markdown
	use({
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	})

	-- diffconflicts
	use({ "whiteinge/diffconflicts" })

	-- colour scheme
	use({ "rktjmp/lush.nvim" })
	use({ "zidhuss/scrivener" })

	use({
		"cormacrelf/dark-notify",
		config = require("plugins.config.darknotify"),
	})

	-- disagnostics menu
	use({ "folke/trouble.nvim", requires = "kyazdani42/nvim-web-devicons", config = require("plugins.config.trouble") })

	-- higlight comments
	use({
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = require("plugins.config.todocomments"),
	})

	-- file explorer
	use({
		"kyazdani42/nvim-tree.lua",
		requires = {
			"kyazdani42/nvim-web-devicons", -- optional, for file icon
		},
		config = require("plugins.config.nvimtree"),
	})

	-- debugging
	-- use 'mfussenegger/nvim-dap'

	-- gitsigns
	use({
		"lewis6991/gitsigns.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		config = require("plugins.config.gitsigns"),
	})

	-- lazyigt
	use("kdheepak/lazygit.nvim")

	-- link on github
	use({ "ruifm/gitlinker.nvim", requires = "nvim-lua/plenary.nvim", config = require("plugins.config.gitlinker") })

	-- leader keys
	use({ "folke/which-key.nvim", config = require("plugins.config.whichkey") })

	-- snippets
	use({ "saadparwaiz1/cmp_luasnip" })
	use({ "L3MON4D3/LuaSnip" })
	use({ "rafamadriz/friendly-snippets" })

	use({
		"rmagatti/auto-session",
		config = require("plugins.config.autosession"),
	})

	-- indent lines
	use({ "lukas-reineke/indent-blankline.nvim", config = require("plugins.config.indentblankline") })

	use({
		"nvim-neotest/neotest",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"nvim-neotest/neotest-python",
			"vim-test/vim-test",
			"antoinemadec/FixCursorHold.nvim",
			"olimorris/neotest-rspec",
		},
		config = require("plugins.config.neotest"),
	})

	use({ "zbirenbaum/copilot.lua", config = require("plugins.config.copilot") })
	use({
		"zbirenbaum/copilot-cmp",
	})

	use({
		"jose-elias-alvarez/null-ls.nvim",
		config = require("plugins.config.nullls"),
	})
	-- beancount syntax
	use({ "nathangrigg/vim-beancount" })

	use({
		"pwntester/octo.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
			"kyazdani42/nvim-web-devicons",
		},
		config = require("plugins.config.octo"),
	})
end)
