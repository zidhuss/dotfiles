require('plugins')
require('mappings')
require('lsp')
require('settings')

-- firevim markdown on github
vim.cmd 'autocmd BufEnter github.com_*.txt set filetype=markdown'

vim.cmd('source ~/.config/nvim/vimscript/ale.vim')
