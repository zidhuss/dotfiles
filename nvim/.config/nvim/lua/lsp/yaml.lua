local M = {}

M.setup = function(on_attach, capabilities)
	require("lspconfig").yamlls.setup({
		on_attach = on_attach,
		settings = {
			yaml = {
				schemaStore = {
					enable = false,
					url = "",
				},
				schemas = require("schemastore").yaml.schemas({}),

				format = { enable = false },
			},
		},
		capabilities = capabilities,
	})
end

return M
