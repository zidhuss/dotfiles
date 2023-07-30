local M = {}

-- Runs when buffer attaches to language server
M.on_attach = function(client, bufnr)
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end
	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end

	buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Mappings.
	local opts = { noremap = true, silent = true }
	buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
	buf_set_keymap("n", "K", "<Cmd>lua require('lspsaga.hover').render_hover_doc()<CR>", opts)
	buf_set_keymap("n", "gi", "<cmd>Trouble lsp_implementations<CR>", opts)
	buf_set_keymap("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
	buf_set_keymap("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
	buf_set_keymap("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
	buf_set_keymap("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
	buf_set_keymap("n", "<space>rn", '<cmd>lua require("lspsaga.rename").rename()<CR>', opts)
	buf_set_keymap("n", "gr", "<cmd>Trouble lsp_references<cr>", opts)
	buf_set_keymap("n", "<space>e", "<cmd>Lspsaga show_line_diagnostics<cr>", opts)
	buf_set_keymap("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opts)
	buf_set_keymap("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<cr>", opts)

	buf_set_keymap("n", "<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)

	-- experimental
	buf_set_keymap("n", "<c-u>", '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(-1)<CR>', {})
	buf_set_keymap("n", "<c-d>", '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(1)<CR>', {})
	buf_set_keymap("n", "gs", "<cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>", opts)
	buf_set_keymap("n", "gh", "<cmd>lua require'lspsaga.provider'.lsp_finder()<CR>", opts)
end

-- Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

return M
