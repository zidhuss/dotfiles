local M = {}

M.setup = function(on_attach, capabilities)
	require("typescript").setup({
		server = {
			on_attach = function(client, bufnr)
				on_attach(client, bufnr)

				local opts = { noremap = true, silent = true }

				vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", ":TypescriptGoToSourceDefinition<CR>", opts)
				vim.api.nvim_buf_set_keymap(bufnr, "n", "go", ":TypescriptAddMissingImports<CR>", opts)
				vim.api.nvim_buf_set_keymap(bufnr, "n", "gO", ":TypescriptOrganizeImports<CR>", opts)
				vim.api.nvim_buf_set_keymap(bufnr, "n", "gI", ":TypescriptRenameFile<CR>", opts)

				-- prefer prettier rather than tsserver for formatting
				client.server_capabilities.documentFormattingProvider = false
			end,
			capabilities = capabilities,
		},
	})

	require("lspconfig").eslint.setup({ on_attach = on_attach })
end

return M
