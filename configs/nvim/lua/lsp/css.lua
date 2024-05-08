local M = {}

local util = require("lspconfig/util")

M.setup = function(on_attach, capabilities)
	require("lspconfig").cssls.setup({ on_attach = on_attach, capabilities = capabilities })

	require("lspconfig").tailwindcss.setup({
		on_attach = on_attach,
		capabilities = capabilities,
		root_dir = util.root_pattern(
			"tailwind.config.js",
			"tailwind.config.cjs",
			"tailwind.config.mjs",
			"tailwind.config.ts",
			"postcss.config.js",
			"postcss.config.cjs",
			"postcss.config.mjs",
			"postcss.config.ts"
		),
	})
end

return M
