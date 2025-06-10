vim.lsp.enable({
	"biome",
	"clangd",
	"cssls",
	"emmet_language_server",
	"eslint",
	"gopls",
	"html",
	"jsonls",
	"lemminx",
	"lua_ls",
	"marksman",
	"nil_ls",
	"phpactor",
	"pyright",
	"regal",
	"ruff",
	"solargraph",
	"sourcekit",
	"taplo",
	"tailwindcss",
	"terraformls",
	"tinymist",
	"ts_ls",
	"yamlls",
	"zls",
})

local group = vim.api.nvim_create_augroup("LspMappings", { clear = true })
vim.api.nvim_create_autocmd("LspAttach", {
	group = group,
	callback = function(args)
		local function buf_set_keymap(...)
			vim.api.nvim_buf_set_keymap(args.buf, ...)
		end
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

		buf_set_keymap("n", "<space>la", "<cmd>lua vim.lsp.buf.code_action()<CR>", { desc = "code action" })
	end,
})
