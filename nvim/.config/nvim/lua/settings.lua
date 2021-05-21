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

-- use tabs in Go code
vim.cmd [[ autocmd FileType go :setlocal noexpandtab ]]

vim.o.termguicolors = true
vim.cmd('colorscheme scrivener')
vim.o.background = 'dark'

vim.cmd('set invlist')
vim.cmd('set listchars=tab:▸\\ ,eol:¬,trail:⋅,extends:❯,precedes:❮')

vim.cmd('set signcolumn=yes')

-- markdown in firenvim on github: TODO: not working atm
-- vim.cmd('au BufEnter github.com_*.txt set filetype=markdown')

-- remove status bar when neovim is opened in a browser.
-- if vim.g.started_by_firenvim then
--     vim.o.laststatus = false
-- end

-- lsp lightbulb
vim.cmd [[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]]

vim.cmd [[ autocmd FileType html,css,scss,javascript,json,typescript,typescriptreact,yaml,jsonnet,lua :setlocal sw=2 ts=2 sts=2 ]]

vim.fn.sign_define("LspDiagnosticsSignError",
                   {texthl = "LspDiagnosticsSignError", text = "", numhl = "LspDiagnosticsSignError"})
vim.fn.sign_define("LspDiagnosticsSignWarning",
                   {texthl = "LspDiagnosticsSignWarning", text = "", numhl = "LspDiagnosticsSignWarning"})
vim.fn.sign_define("LspDiagnosticsSignHint",
                   {texthl = "LspDiagnosticsSignHint", text = "", numhl = "LspDiagnosticsSignHint"})
vim.fn.sign_define("LspDiagnosticsSignInformation",
                   {texthl = "LspDiagnosticsSignInformation", text = "", numhl = "LspDiagnosticsSignInformation"})
--
-- symbols for autocomplete
vim.lsp.protocol.CompletionItemKind = {
  "   (Text) ", "   (Method)", "   (Function)", "   (Constructor)", " ﴲ  (Field)", "[] (Variable)",
  "   (Class)", " ﰮ  (Interface)", "   (Module)", " ?  (Property)", "   (Unit)", "   (Value)",
  "   (Enum)", "   (Keyword)", " ﬌  (Snippet)", "   (Color)", "   (File)", "   (Reference)",
  "   (Folder)", "   (EnumMember)", " ﲀ  (Constant)", " ﳤ  (Struct)", "   (Event)", "   (Operator)",
  "   (TypeParameter)"
}
