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
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/goyo.vim'
    map <leader>g :Goyo<cr>

""""""""""""
"  Syntax  "
""""""""""""
Plug 'sheerun/vim-polyglot'
    let g:jsx_ext_required = 1
Plug 'benekastah/neomake'
    autocmd! BufWritePost * if &ft != 'java' | Neomake
    " autocmd! BufWritePost * Neomake
    let g:neomake_javascript_enabled_makers = ['eslint']
    let g:neomake_java_javac_maker = {
        \ 'args': ['-d', '/tmp']
        \ }
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-commentary'
Plug 'rstacruz/sparkup'
    let g:sparkupArgs="--no-last-newline"
Plug 'reedes/vim-wordy'
Plug 'vim-pandoc/vim-pandoc', { 'for': [ 'pandoc', 'markdown' ] }
Plug 'vim-pandoc/vim-pandoc-syntax', { 'for': [ 'pandoc', 'markdown' ] }
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'lervag/vimtex'
  let g:tex_flavor = 'latex'
  let g:vimtex_indent_enabled=0

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
Plug 'scrooloose/nerdtree'
    map <leader>n :NERDTreeToggle<CR>

""""""""""""""""
"  Completion  "
""""""""""""""""
set omnifunc=syntaxcomplete#Complete
" Plug 'Valloric/YouCompleteMe'
"     let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
"     let g:ycm_confirm_extra_conf = 0
"     let g:ycm_autoclose_preview_window_after_insertion = 1
    let g:EclimCompletionMethod = 'omnifunc'
    let g:EclimProjectTreeAutoOpen = 1
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
Plug 'shougo/deoplete.nvim'
    let g:deoplete#omni_patterns = {}
    let g:deoplete#omni_patterns.java = '[^. *\t]\.\w*'
    let g:deoplete#ignore_sources = {}
    let g:deoplete#ignore_sources.java = ['tag']
    let g:deoplete#enable_at_startup = 1
Plug 'zchee/deoplete-go', { 'do': 'make', 'for': 'go' }
Plug 'zchee/deoplete-clang'
    let g:deoplete#sources#clang#libclang_path = '/usr/lib/libclang.so'
    let g:deoplete#sources#clang#clang_header = '/usr/lib/clang'
Plug 'carlitux/deoplete-ternjs'
    au FileType javascript,jsx,javascript.jsx setl omnifunc=tern#Complete

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

" Insert semi-colon at end of line
" inoremap <leader>; <C-o>A;
inoremap <leader>; <ESC>A;

" Deoplete tab and shift tab
inoremap <silent><expr> <Tab>
  \ pumvisible() ? "\<C-n>" :
  \ "<Tab>"
inoremap <silent><expr> <S-Tab>
  \ pumvisible() ? "\<C-p>" :
  \ "<S-Tab>"

" Eclim Functions
function! EclimMappings()
    nnoremap <buffer> <leader>ei :JavaImport<cr>
    nnoremap <buffer> <leader>eI :JavaImportOrganize<cr>
    nnoremap <buffer> <leader>ec :JavaCorrect<cr>
    nnoremap <buffer> <leader>ed :JavaDocPreview<cr>
    nnoremap <buffer> <leader>eD :JavaDocSearch<cr>
    nnoremap <buffer> <leader>ef :%JavaFormat<cr>
    nnoremap <buffer> <leader>en :JavaNew 
    nnoremap <buffer> <leader>em :JavaGetSet<cr>
    nnoremap <buffer> <leader>eg :JavaGet<cr>
    nnoremap <buffer> <leader>es :JavaSet<cr>
endfunction
autocmd FileType java :call EclimMappings()
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 End Syntax                                  "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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
highlight ColorColumn guibg=gray

" Show extra whitespace at the end of the line
" highlight default ExtraWhitespace ctermbg=red guibg=red
" au InsertLeave * match ExtraWhitespace /\s\+$/

" Italic comments
highlight Comment gui=italic

" Show invisible characters
set list

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
autocmd FileType html,css,scss,javascript :setlocal sw=2 ts=2 sts=2

" Gradle Groovy
au BufNewFile,BufRead *.gradle set ft=groovy

" SQL Syntax
au BufNewFile,BufRead sql* set ft=sql

" Go Syntax highlighting
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

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

" Clear trailing whitespace in selected file types on save
autocmd BufWritePre *.py,*.js,*.hs,*.html,*.css,*.scss :%s/\s\+$//e

" Close preview window after deoplete completion
autocmd CompleteDone * pclose!
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 End General                                 "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
