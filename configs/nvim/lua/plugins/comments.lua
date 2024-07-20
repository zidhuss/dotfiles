return {
	{
		"numToStr/Comment.nvim",
		opts = {

			pre_hook = function(...)
				return require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook()(...)
			end,
		},
		dependencies = {
			"JoosepAlviste/nvim-ts-context-commentstring",
			opts = {
				enable_autocmd = false,
			},
		},
	},
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
