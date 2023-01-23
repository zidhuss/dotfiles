local conditions = require("heirline.conditions")
local shared = require("plugins.config.heirline.shared")

local Ruler = {
	-- %L = number of lines in the buffer
	-- %c = column number
	-- %P = percentage through file of displayed window
	provider = "%7(%3L%):%2c %P",
}

local LSPActive = {
	condition = conditions.lsp_attached,
	update = { "LspAttach", "LspDetach" },

	provider = function()
		local names = {}
		for _, server in pairs(vim.lsp.buf_get_clients(0)) do
			if server.name ~= "null-ls" and server.name ~= "copilot" then
				table.insert(names, server.name)
			end
		end
		return " [" .. table.concat(names, " ") .. "]"
	end,
	hl = { fg = "green", bg = "statusline_bg" },
}

local Diagnostics = {
	condition = conditions.has_diagnostics,

	static = {
		error_icon = vim.fn.sign_getdefined("DiagnosticSignError")[1].text,
		warn_icon = vim.fn.sign_getdefined("DiagnosticSignWarn")[1].text,
		info_icon = vim.fn.sign_getdefined("DiagnosticSignInfo")[1].text,
		hint_icon = vim.fn.sign_getdefined("DiagnosticSignHint")[1].text,
	},

	init = function(self)
		self.errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
		self.warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
		self.hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
		self.info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
	end,

	update = { "DiagnosticChanged", "BufEnter" },
	-- hl = utils.get_highlight("StatusLine"),
	{
		provider = "![",
	},
	{
		provider = function(self)
			-- 0 is just another output, we can decide to print it or not!
			return self.errors > 0 and (self.error_icon .. self.errors .. " ")
		end,
		hl = { fg = "diag_error" },
	},
	{
		provider = function(self)
			return self.warnings > 0 and (self.warn_icon .. self.warnings .. " ")
		end,
		hl = { fg = "diag_warn" },
	},
	{
		provider = function(self)
			return self.info > 0 and (self.info_icon .. self.info .. " ")
		end,
		hl = { fg = "diag_info" },
	},
	{
		provider = function(self)
			return self.hints > 0 and (self.hint_icon .. self.hints)
		end,
		hl = { fg = "diag_hint" },
	},
	{
		provider = "]",
	},
}

local GitBranch = {
	condition = conditions.is_git_repo,

	init = function(self)
		self.status_dict = vim.b.gitsigns_status_dict
	end,

	static = {
		branch_icon = "",
	},

	{
		provider = function(self)
			return " " .. self.branch_icon .. " " .. self.status_dict.head .. " "
		end,
	},

	hl = { fg = "statusline_fg", bg = "statusline_bg", bold = true },
}

local statusline = {
	shared.FileNameBlock,
	shared.Space,
	GitBranch,
	shared.Space,
	Diagnostics,
	shared.Align,
	LSPActive,
	shared.Space,
	Ruler,
}

return statusline
