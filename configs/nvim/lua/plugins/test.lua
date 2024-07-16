return {
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"nvim-neotest/nvim-nio",
			"nvim-neotest/neotest-python",
			"vim-test/vim-test",
			"antoinemadec/FixCursorHold.nvim",
			"olimorris/neotest-rspec",
			"haydenmeade/neotest-jest",
			"nvim-neotest/neotest-go",
			"nvim-neotest/neotest-plenary",
			"rouge8/neotest-rust",
			{ "zidhuss/neotest-minitest", dir = "~/src/nvim-neotest/neotest-minitest" },
		},
		config = function()
			require("neotest").setup({
				adapters = {
					require("neotest-go"),
					require("neotest-plenary"),
					require("neotest-python")({
						dap = { justMyCode = false },
					}),
					require("neotest-rspec"),
					require("neotest-rust"),
					require("neotest-minitest"),
					require("neotest-jest")({
						jestCommand = "npm test --",
						jestConfigFile = "custom.jest.config.ts",
						env = { CI = true },
						cwd = function(path)
							return vim.fn.getcwd()
						end,
					}),
				},
				quickfix = {
					enabled = false,
				},
			})
		end,
		keys = {
			{
				"<leader>ta",
				function()
					require("neotest").run.run(vim.fn.expand("%"))
				end,
				desc = "test attach",
			},
			{
				"<leader>tf",
				function()
					require("neotest").run.run(vim.fn.expand("%"))
				end,
				desc = "test file",
			},
			{
				"<leader>tn",
				function()
					require("neotest").run.run()
				end,
				desc = "test nearest",
			},
			{
				"<leader>tl",
				function()
					require("neotest").run.run_last()
				end,
				desc = "test last",
			},
			{
				"<leader>ts",
				function()
					require("neotest").summary.toggle()
				end,
				desc = "toggle summary",
			},
			{
				"<leader>to",
				function()
					require("neotest").output.open({ enter = true })
				end,
				desc = "test output",
			},
		},
	},
}
