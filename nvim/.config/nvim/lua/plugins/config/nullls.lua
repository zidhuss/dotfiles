local null_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

require("null-ls").setup({
	sources = {
		formatting.trim_newlines,
		formatting.trim_whitespace,
		formatting.stylua,
		formatting.black,
		formatting.isort,
		formatting.prettier,
		formatting.rubocop,
		-- formatting.bean_format,
		formatting.clang_format,
		formatting.fixjson,
		formatting.gofmt,
		formatting.goimports,
		formatting.pg_format,
		diagnostics.vale,
	},

	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.formatting_sync()
				end,
			})
		end
	end,
})
