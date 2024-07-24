return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	config = function()
		local wk = require("which-key")
		wk.setup({
			plugins = { spelling = true },
		})
		wk.add({
			{ "<leader>f", group = "nvim-tree" },
			{ "<leader>g", group = "git" },
			{ "<leader>s", group = "search" },
			{ "<leader>sc", group = "commands" },
			{ "<leader>t", group = "test" },
		})

		wk.add({
			"<leader>g",
			group = "git",
			mode = "v",
		})
	end,
}
