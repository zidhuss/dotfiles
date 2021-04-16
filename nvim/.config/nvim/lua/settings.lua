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
vim.bo.tabstop = 4
vim.bo.softtabstop = 4
vim.bo.shiftwidth = 4
vim.bo.expandtab = true

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
