local shared = require("plugins.config.heirline.shared")

local LineNumbers = {
	provider = function()
		if vim.v.virtnum ~= 0 then
			return ""
		end

		return vim.v.lnum
	end,
}

local Signs = { provider = "%s" }

local Folds = { provider = "%C" }

local statuscolumn = {
	LineNumbers,
	shared.Align,
	shared.Space,
	Signs,
	Folds,
}

return statuscolumn
