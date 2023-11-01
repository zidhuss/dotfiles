local M = {}

M.setup = function(on_attach, capabilities)
	require("lspconfig").yamlls.setup({
		on_attach = on_attach,
		settings = { yaml = { schemas = { kubernetes = { "k8s/*", "k8s.yaml" } }, format = { enable = false } } },
		capabilities = capabilities,
	})
end

return M
