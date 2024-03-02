local conditions = require("heirline.conditions")
local utils = require("heirline.utils")
local shared = require("plugins.config.heirline.shared")

local ActiveWinBar = {
	condition = conditions.is_active,
	shared.FileNameBlock,
	-- utils.surround({ "", "" }, "diag_warn", FileNameBlock),
}

local InactiveWinBar = {
	shared.FileName,
}

local winbar = {
	init = function(self)
		local pwd = vim.fn.getcwd(0) -- Present working directory.
		local current_path = vim.api.nvim_buf_get_name(0)
		local filename

		local os_sep = package.config:sub(1, 1)

		if current_path == "" then
			pwd = vim.fn.fnamemodify(pwd, ":~")
			current_path = nil
			filename = " [No Name]"
		elseif current_path:find(pwd, 1, true) then
			filename = vim.fn.fnamemodify(current_path, ":t")
			current_path = vim.fn.fnamemodify(current_path, ":~:.:h")
			pwd = vim.fn.fnamemodify(pwd, ":~") .. os_sep
			if current_path == "." then
				current_path = nil
			else
				current_path = current_path .. os_sep
			end
		else
			pwd = nil
			filename = vim.fn.fnamemodify(current_path, ":t")
			current_path = vim.fn.fnamemodify(current_path, ":~:.:h") .. os_sep
		end

		self.pwd = pwd
		self.current_path = current_path -- The opened file path relevant to pwd.
		self.filename = filename
	end,
	fallthrough = false,
	ActiveWinBar,
	InactiveWinBar,
	-- hl = { fg = "bright_fg" },
	hl = utils.get_highlight("statusline"),
}

return winbar
