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

	-- text completion
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
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
		config = function()
			require("plugins.config.cmp")
		end,
	},

	-- tpope the man
	"tpope/vim-commentary",
	"tpope/vim-surround",
	"tpope/vim-unimpaired",
	"tpope/vim-rails",
	"tpope/vim-repeat",

	-- treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",

		dependencies = {
			"nvim-treesitter/playground",
			"JoosepAlviste/nvim-ts-context-commentstring",
			"nvim-treesitter/nvim-treesitter-context",
			"nvim-treesitter/nvim-treesitter-textobjects",
			"windwp/nvim-ts-autotag",
		},

		config = function()
			require("plugins.config.treesitter")
		end,
	},

	{
		"windwp/nvim-autopairs",
		config = {},
	},
	"andymass/vim-matchup",
	{

		"RRethy/nvim-treesitter-endwise",
		ft = { "ruby", "lua", "vimscript", "bash", "elixir" },
	},

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

	-- gitsigns
	{
		"lewis6991/gitsigns.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("plugins.config.gitsigns")
		end,
	},

	-- lazyigt
	"kdheepak/lazygit.nvim",

	-- link on github
	{
		"ruifm/gitlinker.nvim",
		dependencies = "nvim-lua/plenary.nvim",
		config = {},
	},

	-- snippets
	"saadparwaiz1/cmp_luasnip",
	"L3MON4D3/LuaSnip",
	"rafamadriz/friendly-snippets",

	-- indent lines
	{
		"lukas-reineke/indent-blankline.nvim",
		config = { show_current_context = true },
	},

	{
		"nvim-neotest/neotest",
		lazy = true,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"nvim-neotest/neotest-python",
			"vim-test/vim-test",
			"antoinemadec/FixCursorHold.nvim",
			"olimorris/neotest-rspec",
			"haydenmeade/neotest-jest",
			"nvim-neotest/neotest-go",
			"nvim-neotest/neotest-plenary",
			{ "zidhuss/neotest-minitest", dir = "~/src/nvim-neotest/neotest-minitest", dev = true },
		},
		config = function()
			require("plugins.config.neotest")
		end,
	},

	{
		"zbirenbaum/copilot-cmp",
		event = "VimEnter",
		dependencies = {
			"hrsh7th/nvim-cmp",
			"zbirenbaum/copilot.lua",
		},
		config = function()
			require("plugins.config.copilot")
		end,
	},

	{
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			require("plugins.config.nullls")
		end,
	},
	-- beancount syntax
	"nathangrigg/vim-beancount",

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
