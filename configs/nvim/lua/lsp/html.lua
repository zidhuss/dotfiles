local M = {}

M.setup = function(on_attach, capabilities)
	require("lspconfig").html.setup({
		on_attach = on_attach,
		capabilities = capabilities,
		filetypes = { "html", "htmldjango" },
	})

	require("lspconfig").emmet_language_server.setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

return M
