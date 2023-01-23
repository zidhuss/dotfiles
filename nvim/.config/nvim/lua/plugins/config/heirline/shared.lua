local utils = require("heirline.utils")

local icons = {
	powerline = {
		-- 
		vertical_bar_thin = "│",
		vertical_bar = "┃",
		block = "█",
		----------------------------------------------
		left = "",
		left_filled = "",
		right = "",
		right_filled = "",
		----------------------------------------------
		slant_left = "",
		slant_left_thin = "",
		slant_right = "",
		slant_right_thin = "",
		----------------------------------------------
		slant_left_2 = "",
		slant_left_2_thin = "",
		slant_right_2 = "",
		slant_right_2_thin = "",
		----------------------------------------------
		left_rounded = "",
		left_rounded_thin = "",
		right_rounded = "",
		right_rounded_thin = "",
		----------------------------------------------
		trapezoid_left = "",
		trapezoid_right = "",
		----------------------------------------------
		line_number = "",
		column_number = "",
	},
	padlock = "",
	circle_small = "●",
	circle = "",
	circle_plus = "",
	dot_circle_o = "",
	circle_o = "⭘",
}

local FileNameBlock = {
	-- let's first set up some attributes needed by this component and it's children
	init = function(self)
		self.filename = vim.api.nvim_buf_get_name(0)
	end,
	hl = { fg = "cyan", bg = "statusline_bg" },
}

local FileIcon = {
	init = function(self)
		local filename = self.filename
		local extension = vim.fn.fnamemodify(filename, ":e")
		self.icon, self.icon_color =
			require("nvim-web-devicons").get_icon_color(filename, extension, { default = true })
	end,
	provider = function(self)
		return self.icon and (self.icon .. " ")
	end,
	hl = function(self)
		return { fg = self.icon_color }
	end,
}

local FileName = {
	init = function(self)
		self.lfilename = vim.fn.fnamemodify(self.filename, ":.")
		if self.lfilename == "" then
			self.lfilename = "[No Name]"
		end
	end,
	hl = { fg = "norm" },

	flexible = 2,

	{
		provider = function(self)
			return self.lfilename
		end,
	},
	{
		provider = function(self)
			return vim.fn.pathshorten(self.lfilename)
		end,
	},
}

local FileFlags = {
	{
		condition = function()
			return vim.bo.modified
		end,
		provider = "[+]",
		hl = { fg = "green" },
	},
	{
		condition = function()
			return not vim.bo.modifiable or vim.bo.readonly
		end,
		provider = "",
	},
}

-- let's add the children to our FileNameBlock component
FileNameBlock = utils.insert(
	FileNameBlock,
	FileIcon,
	FileName,
	unpack(FileFlags), -- A small optimisation, since their parent does nothing
	{ provider = "%<" } -- this means that the statusline is cut here when there's not enough space
)

local M = {
	Align = { provider = "%=" },
	FileName = FileName,
	FileNameBlock = FileNameBlock,
	Null = { provider = "" },
	Space = setmetatable({ provider = " " }, {
		__call = function(_, n)
			return { provider = string.rep(" ", n) }
		end,
	}),
	ReadOnly = {
		condition = function()
			return not vim.bo.modifiable or vim.bo.readonly
		end,
		provider = icons.padlock,
	},
}

return M
