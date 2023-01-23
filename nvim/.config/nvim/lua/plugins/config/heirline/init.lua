local heirline = require("heirline")
local conditions = require("heirline.conditions")
local utils = require("heirline.utils")

local function setup_colors()
	local palette = require("lush_theme.scrivener.palette")

	local bg = vim.opt.background:get()

	local s = palette.light
	if bg == "dark" then
		s = palette.dark
	end

	local colors = {
		blue = utils.get_highlight("Function").fg,

		green = s.green.hex,
		purple = s.purple.hex,
		cyan = s.cyan.hex,
		norm = s.norm.hex,

		diag_warn = utils.get_highlight("DiagnosticWarn").fg,
		diag_error = utils.get_highlight("DiagnosticError").fg,
		diag_hint = utils.get_highlight("DiagnosticHint").fg,
		diag_info = utils.get_highlight("DiagnosticInfo").fg,
		statusline_bg = utils.get_highlight("StatusLine").bg,
		statusline_fg = utils.get_highlight("StatusLine").fg,
	}
	return colors
end

heirline.load_colors(setup_colors())

-- Reload colours on theme change
vim.api.nvim_create_augroup("Heirline", { clear = true })
vim.api.nvim_create_autocmd("ColorScheme", {
	group = "Heirline",
	desc = "Refresh heirline colors",
	callback = function()
		heirline.reset_highlights()
		heirline.load_colors(setup_colors())
	end,
})

vim.api.nvim_create_autocmd("BufWritePost", {
	group = "Heirline",
	desc = "Source heirline config on save",
	pattern = "plugins/config/heirline.lua",
	command = "source <afile>",
})

vim.api.nvim_create_autocmd("User", {
	pattern = "HeirlineInitWinbar",
	callback = function(args)
		local buf = args.buf
		local buftype = vim.tbl_contains({ "prompt", "nofile", "help", "quickfix" }, vim.bo[buf].buftype)
		local filetype = vim.tbl_contains({
			"gitcommit",
			"fugitive",
			"markdown",
			"NeogitStatus",
			"NeogitPopup",
			"NeogitCommitMessage",
		}, vim.bo[buf].filetype)
		if buftype or filetype then
			vim.opt_local.winbar = nil
		end
	end,
})

local statusline = require("plugins.config.heirline.statusline")
local statuscolumn = require("plugins.config.heirline.statuscolumn")
local winbar = require("plugins.config.heirline.winbar")

heirline.setup({
	statusline = statusline,
	winbar = winbar,
	statuscolumn = statuscolumn,
})
