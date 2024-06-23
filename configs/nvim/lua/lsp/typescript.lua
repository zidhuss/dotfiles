local M = {}

M.setup = function(on_attach, capabilities)
	require("typescript-tools").setup({
		on_attach = on_attach,
		capabilities = capabilities,
		settings = {
			expose_as_code_action = {
				"add_missing_imports",
				"remove_unused_imports",
			},
		},
	})

	require("lspconfig").biome.setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})

	require("lspconfig").eslint.setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

return M
