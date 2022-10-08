local M = {}

M.setup = function(on_attach, capabilities)
	require("lspconfig").tsserver.setup({
		on_attach = function(client, bufnr)
			-- prefer prettier rather than tsserver for formatting
			client.server_capabilities.documentFormattingProvider = false

			on_attach(client, bufnr)
		end,
		capabilities = capabilities,
	})

	require("lspconfig").eslint.setup({ on_attach = on_attach })
end

return M
