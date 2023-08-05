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
