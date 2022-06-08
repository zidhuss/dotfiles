require("neotest").setup({
	adapters = {
		require("neotest-vim-test")({
			ignore_file_types = { "python", "vim", "lua" },
		}),
	},
})
