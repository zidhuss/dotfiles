return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	config = function()
		local wk = require("which-key")
		wk.setup({
			plugins = { spelling = true },
		})
		wk.register({
			["<leader>g"] = { name = "+git" },
			["<leader>f"] = { name = "+nvim-tree" },
			["<leader>s"] = { name = "+search", c = { name = "+commands" } },
			["<leadert>"] = { name = "+test" },
		})

		wk.register({
			["<leader>g"] = { name = "+git" },
		}, { mode = "v" })
	end,
}
