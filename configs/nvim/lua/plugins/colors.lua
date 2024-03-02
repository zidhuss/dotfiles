return {
	{
		"zidhuss/scrivener",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("scrivener")
		end,
		dependencies = {
			"rktjmp/lush.nvim",
		},
	},

	{
		"cormacrelf/dark-notify",
		config = function()
			require("dark_notify").run({})
		end,
	},
}
