return {
	{
		"mfussenegger/nvim-lint",
		config = function()
			require("lint").linters_by_ft = {
				html = { "stylelint" },
				css = { "stylelint" },
				scss = { "stylelint" },
			}

			vim.api.nvim_create_autocmd({ "BufReadPost", "InsertLeave", "TextChanged", "FocusGained" }, {
				callback = function()
					require("lint").try_lint()
				end,
			})
		end,
	},
}
