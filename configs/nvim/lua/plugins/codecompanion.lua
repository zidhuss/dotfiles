return {
	{
		"olimorris/codecompanion.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		opts = {
			adapters = {},
		},
	},
	{
		"OXY2DEV/markview.nvim",
		lazy = false,
		opts = {
			preview = {
				filetypes = { "markdown", "codecompanion" },
				ignore_buftypes = {},
			},
		},
	},
}
