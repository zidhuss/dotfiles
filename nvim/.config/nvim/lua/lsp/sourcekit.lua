local M = {}

M.setup = function(on_attach, capabilities)
	require("lspconfig").sourcekit.setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

return M
