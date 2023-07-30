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
		cmd = { "CmpStatus" },
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
		"zbirenbaum/copilot.lua",
		cmd = { "Copilot" },
		event = "InsertEnter",
		opts = {
			filetypes = {
				markdown = true,
				gitcommit = true,
				gitrebase = true,
			},
			method = "getCompletionsCycling",
			suggestion = {
				enabled = true,
				auto_trigger = true,
				keymap = {
					accept = "<c-y>",
					next = "<c-n>",
					prev = "<c-p>",
					dismiss = "<c-e>",
				},
			},
			panel = { enabled = false },
		},
	},
}
