local telescope = require("telescope")
local trouble = require("trouble.providers.telescope")

telescope.setup({
	defaults = {
		mappings = {
			i = { ["<c-t>"] = trouble.open_with_trouble },
			n = { ["<c-t>"] = trouble.open_with_trouble },
		},
	},
	extensions = { ["ui-select"] = {
		require("telescope.themes").get_dropdown({}),
	} },
})

telescope.load_extension("ui-select")
