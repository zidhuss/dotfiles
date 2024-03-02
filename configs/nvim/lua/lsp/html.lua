local M = {}

M.setup = function(on_attach, capabilities)
	require("lspconfig").html.setup({
		on_attach = on_attach,
		capabilities = capabilities,
		filetypes = { "html", "htmldjango" },
	})
end

return M
