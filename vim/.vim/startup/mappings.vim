" Unmap arrow keys
no <down> <Nop>
no <left> <Nop>
no <right> <Nop>
no <up> <Nop>
ino <down> <Nop>
ino <left> <Nop>
ino <right> <Nop>
ino <up> <Nop>

" Easier movement between panes
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Clipboard yank and paste
map <leader>y "+y
map <leader>p "+p

" Faster saving
nmap <C-s> :w<cr>
imap <C-s> <esc>:w<cr>

" Write read only files
cnoremap sudow w !sudo tee % >/dev/null<cr>:e!<cr><cr>

" Clear search highlights
nmap <silent> <leader>/ :nohlsearch<CR>

    
