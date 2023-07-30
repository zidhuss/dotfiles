return {
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
			-- snippets
			"saadparwaiz1/cmp_luasnip",
			"L3MON4D3/LuaSnip",
		},
		cmd = { "CmpStatus " },
		event = "InsertEnter",
		config = function()
			require("plugins.config.cmp")
		end,
	},

	{
		"L3MON4D3/LuaSnip",
		lazy = true,
		dpendencies = {
			"rafamadriz/friendly-snippets",
		},
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()
		end,
	},

	{
		"zbirenbaum/copilot-cmp",
		lazy = true,
		dependencies = {
			"hrsh7th/nvim-cmp",
			"zbirenbaum/copilot.lua",
		},
	},

	{
		"zbirenbaum/copilot.lua",
		lazy = true,
		opts = {
			filetypes = {
				markdown = true,
				gitcommit = true,
				gitrebase = true,
			},
			method = "getCompletionsCycling",
			suggestion = { enabled = false },
			panel = { enabled = false },
		},
	},
}
