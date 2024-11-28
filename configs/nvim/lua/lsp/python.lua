local M = {}

M.setup = function(on_attach, capabilities)
	require("lspconfig").pyright.setup({ on_attach = on_attach, capabilities = capabilities })

	require("lspconfig").ruff.setup({
		on_attach = function(client, bufnr)
			on_attach(client, bufnr)
			client.server_capabilities.hoverProvider = false
			client.server_capabilities.documentFormattingProvider = true
		end,
		capabilities = capabilities,
		init_options = {
			settings = {
				-- Any extra CLI arguments for `ruff` go here.
				args = {},
			},
		},
	})
end

return M
