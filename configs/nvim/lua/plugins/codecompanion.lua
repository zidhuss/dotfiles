return {
	"olimorris/codecompanion.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	opts = {
		adapters = {
			copilot = function()
				return require("codecompanion.adapters").extend("copilot", {
					schema = {
						model = {
							default = "claude-3.7-sonnet",
						},
					},
				})
			end,
		},
	},
}
