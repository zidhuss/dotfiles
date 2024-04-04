local M = {}

M.setup = function(on_attach, capabilities)
	require("lspconfig").sourcekit.setup({
		on_attach = function(client, bufnr)
			on_attach(client, bufnr)
			client.server_capabilities.documentFormattingProvider = true
		end,
		capabilities = capabilities,
	})
end

return M
