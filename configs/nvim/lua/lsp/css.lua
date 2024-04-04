local M = {}

M.setup = function(on_attach, capabilities)
	require("lspconfig").cssls.setup({ on_attach = on_attach, capabilities = capabilities })

	require("lspconfig").tailwindcss.setup({ on_attach = on_attach, capabilities = capabilities })
end

return M
