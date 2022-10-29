if vim.g.started_by_firenvim then
	vim.o.laststatus = 0
	vim.o.cmdheight = 0
	vim.o.guifont = "FuraCode Nerd Font:h18"
end

vim.api.nvim_create_autocmd("BufEnter", { pattern = { "github.com_*.txt" }, command = "set filetype=markdown" })

vim.g.firenvim_config = {
	globalSettings = { alt = "all" },
	localSettings = {
		[".*"] = {
			cmdline = "neovim",
			content = "text",
			priority = 0,
			selector = "textarea",
			takeover = "never",
		},
		["https?://mail.google.com/"] = { takeover = "never", priority = 1 },
		["https?://discord.com/"] = { takeover = "never", priority = 1 },
		["https?://github.com/"] = { takeover = "always", priority = 1 },
	},
}
