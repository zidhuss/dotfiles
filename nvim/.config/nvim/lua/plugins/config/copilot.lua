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

		copilot_node_command = vim.fn.expand("$HOME") .. "/.asdf/installs/nodejs/lts-gallium/bin/node", -- Node version must be < 18
	})
end, 100)
