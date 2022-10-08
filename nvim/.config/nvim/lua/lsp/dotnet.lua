local M = {}

local pid = vim.fn.getpid()
local omnisharp_bin = "/usr/bin/omnisharp"

M.setup = function(on_attach, capabilities)
	require("lspconfig").omnisharp.setup({
		on_attach = on_attach,
		capabilities = capabilities,
		cmd = { omnisharp_bin, "--languageserver", "--hostPID", tostring(pid) },
	})
end

return M
