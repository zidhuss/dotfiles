return {
	{
		"glacambre/firenvim",
		lazy = not vim.g.started_by_firenvim,
		build = function()
			vim.fn["firenvim#install"](0)
		end,
		config = function()
			if vim.g.started_by_firenvim then
				vim.o.laststatus = 0
				vim.o.guifont = "Berkeley Mono:h18"
				vim.api.nvim_create_autocmd(
					"BufEnter",
					{ pattern = { "github.com_*.txt" }, command = "set filetype=markdown" }
				)
			end

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
					["https?://github.com/"] = {
						takeover = "always",
						selector = "textarea:not([id='read-only-cursor-text-area'])",
						priority = 1,
					},
				},
			}
		end,
	},
}
