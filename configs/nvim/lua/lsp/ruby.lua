local M = {}

M.setup = function(on_attach, capabilities)
	require("lspconfig").solargraph.setup({ on_attach = on_attach, capabilities = capabilities })
end

return M
