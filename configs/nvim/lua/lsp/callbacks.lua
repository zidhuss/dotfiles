local M = {}

-- Runs when buffer attaches to language server
M.on_attach = function(client, bufnr)
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end

	vim.api.nvim_set_option_value("omnifunc", "v:lua.vim.lsp.omnifunc", { buf = bufnr })

	-- Mappings.
	local opts = { noremap = true, silent = true }
	buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
	buf_set_keymap("n", "K", "<cmd>Lspsaga hover_doc<cr>", opts)
	buf_set_keymap("n", "gi", "<cmd>Trouble lsp_implementations<CR>", opts)
	buf_set_keymap("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
	buf_set_keymap("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
	buf_set_keymap("n", "<space>rn", "<cmd>Lspsaga rename<CR>", opts)
	buf_set_keymap("n", "gr", "<cmd>Trouble lsp_references<cr>", opts)
	buf_set_keymap("n", "<space>e", "<cmd>Lspsaga show_line_diagnostics<cr>", opts)
	buf_set_keymap("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opts)
	buf_set_keymap("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<cr>", opts)

	buf_set_keymap("n", "<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
	buf_set_keymap("n", "<space>la", "<cmd>lua vim.lsp.buf.code_action()<CR>", { desc = "code action" })

	---@param code_action_kind string
	local code_action_on_save = function(code_action_kind)
		local actions = vim.tbl_get(client.server_capabilities, "codeActionProvider", "codeActionKinds")
		if actions ~= nil and vim.tbl_contains(actions, code_action_kind) then
			vim.api.nvim_create_autocmd({ "BufWritePre" }, {
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.code_action({
						context = { only = { code_action_kind }, diagnostics = {} },
						apply = true,
					})
				end,
			})
		end
	end

	-- code_action_on_save("source.fixAll")
	code_action_on_save("source.organizeImports")
end

M.capabilities = vim.tbl_deep_extend(
	"force",
	vim.lsp.protocol.make_client_capabilities(),
	require("cmp_nvim_lsp").default_capabilities()
)

return M
