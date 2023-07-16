local M = {}

M.setup = function(on_attach, capabilities)
	require("lspconfig").typst_lsp.setup({
		on_attach = on_attach,
		capabilities = capabilities,
		settings = {
			exportPdf = "never",
		},
	})
end

return M
