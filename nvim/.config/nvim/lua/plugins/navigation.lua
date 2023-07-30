return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/popup.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-ui-select.nvim",
		},
		config = function()
			require("plugins.config.telescope")
		end,
		keys = {
			{
				"<leader><cr>",
				function()
					require("telescope.builtin").find_files()
				end,
				desc = "find files",
			},
			{
				"<leader>sf",
				function()
					require("telescope.builtin").find_files()
				end,
				desc = "find files",
			},
			{
				"<leader>sb",
				function()
					require("telescope.builtin").buffers()
				end,
				desc = "find buffers",
			},
			{
				"<leader>sh",
				function()
					require("telescope.builtin").help_tags()
				end,
				desc = "help tags",
			},
			{
				"<leader>sr",
				function()
					require("telescope.builtin").resume()
				end,
				desc = "resume search",
			},
			{
				"<leader>ss",
				function()
					require("telescope.builtin").live_grep()
				end,
				desc = "search with grep",
			},
			{
				"<leader>st",
				function()
					require("telescope.builtin").treesitter()
				end,
				desc = "treesitter symbols",
			},
			{
				"<leader>sw",
				function()
					require("telescope.builtin").grep_string()
				end,
				desc = "search word with grep",
			},
			{
				"<leader>sch",
				function()
					require("telescope.builtin").command_history()
				end,
				desc = "search command history",
			},
		},
	},

	-- file explorer
	{
		"kyazdani42/nvim-tree.lua",
		dependencies = {
			"kyazdani42/nvim-web-devicons", -- optional, for file icon
		},
		config = {
			view = { side = "right" },
		},
		keys = {
			{
				"<leader>ft",
				"<Cmd>NvimTreeToggle<cr>",
				desc = "toggle",
			},
			{
				"<leader>ff",
				"<Cmd>NvimTreeFocus<cr>",
				desc = "focus",
			},
			{
				"<leader>fo",
				"<Cmd>NvimTreeFindFile<cr>",
				desc = "open file in tree",
			},
		},
	},
}
