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
		opts = {},
		cmd = { "TroubleToggle", "Trouble" },
		keys = {
			{ "<leader>xx", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Document Diagnostics (Trouble)" },
			{ "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace Diagnostics (Trouble)" },
			{ "<leader>xl", "<cmd>TroubleToggle loclist<cr>", desc = "Location List (Trouble)" },
			{ "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", desc = "Quickfix List (Trouble)" },
			{
				"[q",
				function()
					if require("trouble").is_open() then
						require("trouble").previous({ skip_groups = true, jump = true })
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

	-- higlight comments
	{
		"folke/todo-comments.nvim",
		dependencies = "nvim-lua/plenary.nvim",
		opts = {},
		cmd = { "TodoTrouble", "TodoTelescope" },
		event = { "BufReadPost", "BufNewFile" },
		keys = {
			{ "<leader>xt", "<cmd>TodoTrouble<cr>", desc = "Todo (Trouble)" },
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
			lsp = {
				on_attach = function(client, bufnr)
					require("lsp.callbacks").on_attach(client, bufnr)
				end,
			},
		},
	},
}
