" ░▀█▀░█▀█░▀█▀░▀█▀░░░░█░█░▀█▀░█▄█
" ░░█░░█░█░░█░░░█░░░░░▀▄▀░░█░░█░█
" ░▀▀▀░▀░▀░▀▀▀░░▀░░▀░░░▀░░▀▀▀░▀░▀
"
" Author: zidhuss
" Repo: https://github.com/zidhuss/dotfiles
" URL: http://zidhuss.me

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   Plugins                                   "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin()
""""""""""
"  Look  "
""""""""""
Plug 'dylanaraps/crayon'
Plug 'gorodinskiy/vim-coloresque'
Plug 'Yggdroot/indentLine'
    let g:indentLine_char='┆'
Plug 'bling/vim-airline'
    let g:airline_powerline_fonts = 1
    let g:airline_theme='crayon'
    let g:airline_section=' '
    let g:airline_left_sep = ' '
    let g:airline_right_sep = ' '
Plug 'junegunn/goyo.vim'
    map <leader>g :Goyo<cr>

""""""""""""
"  Syntax  "
""""""""""""
Plug 'sheerun/vim-polyglot'
Plug 'benekastah/neomake'
    autocmd! BufWritePost * Neomake
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-commentary'
Plug 'rstacruz/sparkup'
    let g:sparkupArgs="--no-last-newline"
Plug 'reedes/vim-wordy'
Plug 'suan/vim-instant-markdown'
Plug 'xuhdev/vim-latex-live-preview'
    let g:livepreview_previewer = 'zathura'

"""""""""
"  Git  "
"""""""""
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

""""""""""""""
"  Snippets  "
""""""""""""""
Plug 'SirVer/ultisnips'
    let g:UltiSnipsExpandTrigger="<c-j>"
    let g:UltiSnipsJumpForwardTrigger="<c-d>"
    let g:UltiSnipsJumpBackwardTrigger="<c-u>"
Plug 'honza/vim-snippets'
    let g:snips_author="zidhuss"

""""""""""""""""
"  Navigation  "
""""""""""""""""
Plug 'majutsushi/tagbar'
    nmap <f8> :TagbarToggle<cr>
Plug 'christoomey/vim-tmux-navigator'
    let g:tmux_navigator_no_mappings = 1
    " let g:tmux_navigator_save_on_switch = 1
    nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
    nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
    nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
    nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
    nnoremap <silent> <c-\> :TmuxNavigatePrevious<cr>

""""""""""""""""
"  Completion  "
""""""""""""""""
Plug 'Valloric/YouCompleteMe'
    let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
    let g:ycm_confirm_extra_conf = 0
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
    let g:fzf_action = {
    \ 'ctrl-m': 'e',
    \ 'ctrl-t': 'tabedit',
    \ 'alt-j':  'botright split',
    \ 'alt-k':  'topleft split',
    \ 'alt-h':  'vertical topleft split',
    \ 'alt-l':  'vertical botright split' }
    map <leader><cr> :FZF<cr>
Plug 'jiangmiao/auto-pairs'
" Plug 'shougo/deoplete.nvim'
"     let g:deoplete#enable_at_startup = 1

"""""""""""
"  Other  "
"""""""""""
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'reedes/vim-pencil'
    map <c-p> :PencilToggle<cr>

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 End Plugins                                 "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   Mappings                                  "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Unmap arrow keys
no <down> <Nop>
no <left> <Nop>
no <right> <Nop>
no <up> <Nop>
ino <down> <Nop>
ino <left> <Nop>
ino <right> <Nop>
ino <up> <Nop>

" Clipboard yank and paste
map <leader>y "+y
map <leader>p "+p

" Write over read-only files
cnoremap sudow w !sudo tee % >/dev/null<cr>:e!<cr><cr>

" Faster saving
nmap <c-s> :w<cr>
imap <c-s> <esc>:w<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                End Mappings                                 "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                    Look                                     "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Keep status line visible
set laststatus=2

" Set colorscheme
colorscheme crayon

" Language indepenent indentation
filetype plugin indent on

" Full colour
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Show line numbers and length
set number
set textwidth=79

" Disable wrapping
set nowrap
set formatoptions-=t

" Column to signal max width
set colorcolumn=80
highlight ColorColumn ctermfg=14

" Show extra whitespace at the end of the line
highlight default ExtraWhitespace ctermbg=darkred guibg=darkred
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  End Look                                   "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   Syntax                                    "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

" HTML, JS, CSS indent 2 spaces
autocmd FileType html,css,scss :setlocal sw=2 ts=2 sts=2
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 End Syntax                                  "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   General                                   "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set timeout to 0
set notimeout
set nottimeout

" Smarter searching
set ignorecase
set smartcase

" Remove mouse support
set mouse=

" Auto read changed files
set autoread

" Deal with hidden buffers
set hidden

" No backups or swap file
set noswapfile
set nobackup
set nowritebackup

" More natural split opening
set splitbelow
set splitright
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 End General                                 "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
