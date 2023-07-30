return {
	{
		"aserowy/tmux.nvim",
		event = "VeryLazy",
		config = true,
	},

	-- firefox integration
	{
		"glacambre/firenvim",

		-- Lazy load firenvim
		-- Explanation: https://github.com/folke/lazy.nvim/discussions/463#discussioncomment-4819297
		cond = not not vim.g.started_by_firenvim,
		build = function()
			require("lazy").load({ plugins = "firenvim", wait = true })
			vim.fn["firenvim#install"](0)
		end,
		config = function()
			require("plugins.config.firenvim")
		end,
	},

	-- LSP plugins
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"jose-elias-alvarez/typescript.nvim",
		},
	},

	{ "folke/neodev.nvim" },

	"tami5/lspsaga.nvim",

	{
		"kosayoda/nvim-lightbulb",
		config = { autocmd = { enabled = true } },
	},

	-- show lsp progress
	{
		"j-hui/fidget.nvim",
		tag = "legacy",
		event = "LspAttach",
		config = {},
	},

	-- tpope the man
	"tpope/vim-commentary",
	"tpope/vim-surround",
	"tpope/vim-unimpaired",
	"tpope/vim-rails",
	"tpope/vim-repeat",

	-- diffconflicts
	{
		"whiteinge/diffconflicts",
		lazy = true,
		cmd = "DiffConflicts",
	},

	-- disagnostics menu
	{
		"folke/trouble.nvim",
		dependencies = "kyazdani42/nvim-web-devicons",
		config = {},
	},

	-- higlight comments
	{
		"folke/todo-comments.nvim",
		dependencies = "nvim-lua/plenary.nvim",
		config = {},
	},

	-- statusline
	{
		"rebelot/heirline.nvim",
		dependencies = {
			"kyazdani42/nvim-web-devicons",
			"lewis6991/gitsigns.nvim",
		},
		config = function()
			require("plugins.config.heirline")
		end,
	},

	-- debugging
	-- use 'mfussenegger/nvim-dap'

	-- indent lines
	{
		"lukas-reineke/indent-blankline.nvim",
		config = { show_current_context = true },
	},

	{
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			require("plugins.config.nullls")
		end,
	},
	-- beancount syntax
	{
		"nathangrigg/vim-beancount",
		ft = "beancount",
	},

	{
		"akinsho/flutter-tools.nvim",
		lazy = false,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"stevearc/dressing.nvim", -- optional for vim.ui.select
		},
		opts = {
			flutter_lookup_cmd = "dirname $(which flutter)", -- example "dirname $(which flutter)" or "asdf where flutter"
		},
	},
}
