return {
	{
		"lewis6991/gitsigns.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("plugins.config.gitsigns")
		end,
	},

	{
		"kdheepak/lazygit.nvim",
		keys = {
			{
				"<leader>gg",
				"<cmd>LazyGit<cr>",
				desc = "lazygit",
			},
			{
				"<leader>gf",
				"<cmd>LazyGitFilterCurrentFile<CR>",
				desc = "lazygit filter file",
			},
		},
	},

	-- link on github
	{
		"ruifm/gitlinker.nvim",
		dependencies = "nvim-lua/plenary.nvim",
		opts = {
			mappings = nil,
		},
		keys = {
			{
				"<leader>gy",
				function()
					require("gitlinker").get_buf_range_url("n")
				end,
				mode = "n",
				desc = "copy link to line on github",
			},
			{
				"<leader>gy",
				function()
					require("gitlinker").get_buf_range_url("v")
				end,
				mode = "v",
				desc = "copy link to range on github",
			},
		},
	},
}
