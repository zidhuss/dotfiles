return {
	{ "numToStr/Comment.nvim", opts = {} },
	"JoosepAlviste/nvim-ts-context-commentstring",
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
}
