local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

return {
	capabilities = capabilities,
	filetypes = { "html", "htmldjango", "templ" },
}
