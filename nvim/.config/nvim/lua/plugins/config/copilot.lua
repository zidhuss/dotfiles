vim.defer_fn(function()
	require("copilot").setup({
		filetypes = {
			markdown = true,
			gitcommit = true,
			gitrebase = true,
		},
		method = "getCompletionsCycling",
		suggestion = { enabled = false },
		panel = { enabled = false },
	})
end, 100)
