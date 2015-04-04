" =====================================
" ZidHuss .vimrc file
"
" =====================================



" =====================================
" Functions
" =====================================

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" Load bindings
source ~/.vim/startup/mappings.vim


" =====================================
" Plugins and Vundle
" =====================================

set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
" Plugin 'klen/python-mode'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
" Plugin 'altercation/vim-colors-solarized'
Plugin 'edkolev/tmuxline.vim'
Plugin 'christoomey/vim-tmux-navigator'
" Plugin 'scrooloose/syntastic'

call vundle#end()


" =====================================
" Edit the look
" =====================================

" Show line numbers and length
set number
set tw=79
set nowrap
set fo-=t
set colorcolumn=80
highlight ColorColumn ctermbg=03

" Show whitespace
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/

" Colour scheme
" set t_Co=256
set background=dark
let base16colorspace=256
colorscheme base16-eighties


" Enable syntax highlighting
filetype off
filetype plugin indent on
syntax on

" Use spaces instead of tabs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

" Help with search
set hlsearch
set incsearch
set ignorecase
set smartcase

" Disable backup and swap files
set nobackup
set nowritebackup
set noswapfile

" Enable cold folding
set foldmethod=indent
set foldlevel=99

" Show statusline always
set laststatus=2

" Deal with hidden buffers
set hidden

" Auto read changed files
set autoread

" Airline settings
let g:airline_powerline_fonts = 1
let g:airline_theme='base16'
let g:airline_section=' '
let g:airline_left_sep = ' '
let g:airline_right_sep = ' '

" Nerd commenter settings
let NERDSpaceDelims=1

" More natural split opening
set splitbelow
set splitright

" Fix Tmux colors
set term=screen-256color

" Tmux airline sep
let g:tmuxline_separators = {
    \ 'left' : '',
    \ 'left_alt': '',
    \ 'right' : '',
    \ 'right_alt' : '',
    \ 'space' : ' '}

" " Syntastic settings
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0

" Tmux Navigator setings
let g:tmux_navigator_no_mappings = 1
let g:tmux_navigator_save_on_switch = 1
nnoremap <silent> {Left-mapping} :TmuxNavigateLeft<cr>
nnoremap <silent> {Down-Mapping} :TmuxNavigateDown<cr>
nnoremap <silent> {Up-Mapping} :TmuxNavigateUp<cr>
nnoremap <silent> {Right-Mapping} :TmuxNavigateRight<cr>
nnoremap <silent> {Previous-Mapping} :TmuxNavigatePrevious<cr>
