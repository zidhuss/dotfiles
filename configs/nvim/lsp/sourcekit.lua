return {
	on_attach = function(client, _)
		client.server_capabilities.documentFormattingProvider = true
	end,
}
