-- let g:tmux_navigator_no_mappings = 1
-- let g:tmux_navigator_save_on_switch = 1
-- nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
-- nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
-- nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
-- nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
-- nnoremap <silent> <c-\> :TmuxNavigatePrevious<cr>

vim.g.tmux_navigator_no_mappings = 1
vim.g.tmux_navigator_save_on_switch = 1

vim.api.nvim_set_keymap('n', '<c-h>', ':TmuxNavigateLeft<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<c-j>', ':TmuxNavigateDown<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<c-k>', ':TmuxNavigateUp<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<c-l>', ':TmuxNavigateRight<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<c-h>', ':TmuxNavigatePrevious<cr>', {noremap = true, silent = true})


-- faster saving
vim.api.nvim_set_keymap('n', '<c-s>', ':w<CR>', {})
vim.api.nvim_set_keymap('n', '<c-q>', ':q<CR>', {})
vim.api.nvim_set_keymap('i', '<c-s>', '<esc>:w<CR>', {})
