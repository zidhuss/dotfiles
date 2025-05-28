return {
	-- LSP plugins
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
	},

	-- SchemaStore
	{
		"b0o/schemastore.nvim",
		lazy = true,
	},

	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {},
	},

	{
		"nvimdev/lspsaga.nvim",
		event = "LspAttach",
		config = function()
			require("lspsaga").setup({})
		end,
	},

	-- show lsp progress
	{
		"j-hui/fidget.nvim",
		event = "LspAttach",
		opts = {},
	},

	"tpope/vim-surround",
	"tpope/vim-unimpaired",
	{
		"tpope/vim-rails",
		ft = { "ruby", "rspec", "ruby.rake", "eruby", "rbs" },
	},
	"tpope/vim-repeat",

	-- diagnostics menu
	{
		"folke/trouble.nvim",
		dependencies = "kyazdani42/nvim-web-devicons",
		opts = {},
		cmd = { "Trouble" },
		keys = {
			{
				"<leader>xx",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Diagnostics (Trouble)",
			},
			{
				"<leader>xX",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "Buffer Diagnostics (Trouble)",
			},
			{
				"<leader>cs",
				"<cmd>Trouble symbols toggle focus=false<cr>",
				desc = "Symbols (Trouble)",
			},
			{
				"<leader>cl",
				"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
				desc = "LSP Definitions / references / ... (Trouble)",
			},
			{
				"<leader>xl",
				"<cmd>Trouble loclist toggle<cr>",
				desc = "Location List (Trouble)",
			},
			{
				"<leader>xq",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "Quickfix List (Trouble)",
			},

			{
				"[q",
				function()
					if require("trouble").is_open() then
						require("trouble").prev({ skip_groups = true, jump = true })
					else
						local ok, err = pcall(vim.cmd.cprev)
						if not ok then
							vim.notify(err, vim.log.levels.ERROR)
						end
					end
				end,
				desc = "Previous trouble/quickfix item",
			},
			{
				"]q",
				function()
					if require("trouble").is_open() then
						require("trouble").next({ skip_groups = true, jump = true })
					else
						local ok, err = pcall(vim.cmd.cnext)
						if not ok then
							vim.notify(err, vim.log.levels.ERROR)
						end
					end
				end,
				desc = "Next trouble/quickfix item",
			},
		},
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
		main = "ibl",
		tag = "v3.8.2",
		---@module "ibl"
		---@type ibl.config
		opts = {
			indent = {
				char = "·",
				tab_char = "│",
			},
			scope = {
				show_start = false,
				show_end = false,
			},
		},
	},

	-- beancount syntax
	{
		"nathangrigg/vim-beancount",
		ft = "beancount",
	},

	{
		"akinsho/flutter-tools.nvim",
		ft = "dart",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"stevearc/dressing.nvim", -- optional for vim.ui.select
		},
		opts = {
			flutter_lookup_cmd = "dirname $(which flutter)", -- example "dirname $(which flutter)" or "asdf where flutter"
			lsp = {
				on_attach = function(client, bufnr)
					require("lsp.callbacks").on_attach(client, bufnr)
				end,
			},
		},
	},

	{
		"preservim/vim-textobj-quote",
		dependencies = {
			"kana/vim-textobj-user",
		},
		ft = { "markdown" },
	},

	{
		"zeioth/garbage-day.nvim",
		event = "VeryLazy",
		opts = {
			grace_period = 30 * 60,
		},
	},
}
