-- hidden buffers
vim.o.hidden = true

-- no backups or swap file
vim.o.swapfile = false
vim.o.backup = false
vim.o.writebackup = false

vim.wo.number = true
vim.o.cursorline = true

-- smarter searching
vim.o.smartcase = true
vim.o.ignorecase = true
-- natural split openings
vim.o.splitbelow = true
vim.o.splitright = true

-- spaces for tabs
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

vim.o.shiftround = true

vim.o.spell = true

-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noselect"

-- use tabs in Go code
vim.api.nvim_create_autocmd("FileType", { pattern = { "go" }, command = "setlocal noexpandtab" })

vim.o.termguicolors = true
vim.o.background = "light"
vim.cmd("colorscheme scrivener")

-- If connecting over SSH then use the dark theme.
if vim.env.SSH_CONNECTION then
	vim.o.background = "dark"
end

vim.cmd("set invlist")
vim.cmd("set listchars=tab:▸\\ ,eol:¬,trail:⋅,extends:❯,precedes:❮")

vim.cmd("set signcolumn=yes")

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "html", "css", "scss", "javascript", "json", "typescript", "typescriptreact", "yaml", "jsonnet", "lua" },
	command = "setlocal sw=2 ts=2 sts=2",
})

vim.fn.sign_define(
	"LspDiagnosticsSignError",
	{ texthl = "LspDiagnosticsSignError", text = "", numhl = "LspDiagnosticsSignError" }
)
vim.fn.sign_define(
	"LspDiagnosticsSignWarning",
	{ texthl = "LspDiagnosticsSignWarning", text = "", numhl = "LspDiagnosticsSignWarning" }
)
vim.fn.sign_define(
	"LspDiagnosticsSignHint",
	{ texthl = "LspDiagnosticsSignHint", text = "", numhl = "LspDiagnosticsSignHint" }
)
vim.fn.sign_define(
	"LspDiagnosticsSignInformation",
	{ texthl = "LspDiagnosticsSignInformation", text = "", numhl = "LspDiagnosticsSignInformation" }
)
--
