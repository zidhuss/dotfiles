
-- firevim markdown on github
vim.cmd 'autocmd BufEnter github.com_*.txt set filetype=markdown'
require("plugins")
require("mappings")
require("lsp")
require("settings")
