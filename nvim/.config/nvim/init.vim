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
Plug 'morhetz/gruvbox'
    let g:gruvbox_improved_warnings = 1
Plug 'gorodinskiy/vim-coloresque'
Plug 'Yggdroot/indentLine'
    let g:indentLine_char='┆'
Plug 'bling/vim-airline'
    let g:airline_powerline_fonts = 1
    let g:airline_theme='gruvbox'
    let g:airline_section=' '
    let g:airline_left_sep = ' '
    let g:airline_right_sep = ' '
Plug 'vim-airline/vim-airline-themes'
Plug 'Valloric/MatchTagAlways'
    let g:mta_filetypes = {
        \ 'html' : 1,
        \ 'xhtml' : 1,
        \ 'xml' : 1,
        \ 'jinja' : 1,
        \ 'javascript.jsx': 1,
        \}
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
    map <c-g> :Goyo<cr>

""""""""""""
"  Syntax  "
""""""""""""
Plug 'sheerun/vim-polyglot'
    let g:javascript_plugin_jsdoc = 1
Plug 'samuelsimoes/vim-jsx-utils'
    nnoremap <leader>ea :call JSXEncloseReturn()<CR>
    nnoremap <leader>ei :call JSXEachAttributeInLine()<CR>
    nnoremap <leader>ee :call JSXExtractPartialPrompt()<CR>
    nnoremap <leader>ec :call JSXChangeTagPrompt()<CR>
    nnoremap vat :call JSXSelectTag()<CR>

Plug 'benekastah/neomake'
autocmd! BufWritePost * if &ft != 'java' | Neomake
let g:neomake_warning_sign={'text': '⚠', 'texthl': 'SyntasticWarningSign'}
    let g:neomake_error_sign={'text': '✖' , 'texthl': 'SyntasticErrorSign'}
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
Plug 'kana/vim-textobj-user'
Plug 'reedes/vim-textobj-quote'
    augroup textobj_quote
        autocmd!
        autocmd FileType markdown call textobj#quote#init()
        autocmd FileType textile call textobj#quote#init()
        autocmd FileType text call textobj#quote#init({'educate': 0})
    augroup END
Plug 'vim-pandoc/vim-pandoc', { 'for': [ 'pandoc', 'markdown' ] }
Plug 'vim-pandoc/vim-pandoc-syntax', { 'for': [ 'pandoc', 'markdown' ] }
Plug 'fatih/vim-go', { 'for': 'go' }
    let g:go_fmt_experimental = 1
    let g:go_fmt_command = "goimports"
    au FileType go nmap <leader>gb <Plug>(go-doc-browser)
Plug 'Konfekt/FastFold'
Plug 'lervag/vimtex'
  let g:tex_flavor = 'latex'
  let g:vimtex_indent_enabled = 0

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
    let g:UltiSnipsSnippetsDir="~/.config/nvim/UltiSnips"
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
    nnoremap <leader><cr> :FZF<cr>
Plug 'junegunn/fzf.vim'
    nnoremap <silent> <leader>b :Buffers<CR>
Plug 'jiangmiao/auto-pairs'
Plug 'shougo/deoplete.nvim'
    let g:deoplete#omni_patterns = {}
    let g:deoplete#omni_patterns.java = '[^. *\t]\.\w*'
    let g:deoplete#ignore_sources = {}
    let g:deoplete#ignore_sources.java = ['tag']
    let g:deoplete#enable_at_startup = 1
Plug 'zchee/deoplete-go', { 'do': 'make', 'for': 'go' }
Plug 'pbogut/deoplete-padawan', { 'for': 'php' }
Plug 'zchee/deoplete-clang'
    let g:deoplete#sources#clang#libclang_path = '/usr/lib/libclang.so'
    let g:deoplete#sources#clang#clang_header = '/usr/lib/clang'
Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'] }
    au FileType javascript,jsx,javascript.jsx setl omnifunc=tern#Complete
    let g:deoplete#omni#functions = {}
    let g:deoplete#omni#functions.javascript = [
        \ 'tern#Complete',
        \ 'jspc#omni'
    \]
Plug 'zchee/deoplete-jedi'
    let deoplete#sources#jedi#show_docstring = 1
Plug 'phildawes/racer'

"""""""""""
"  Other  "
"""""""""""
Plug 'restore_view.vim'
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
nmap <c-q> :q<cr>
imap <c-s> <esc>:w<cr>

" Insert semi-colon at end of line
" inoremap <leader>; <C-o>A;
inoremap <leader>; <ESC>A;

" Move to end of line while in insert
inoremap <c-f> <esc>A

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
    nnoremap <buffer> <leader>eM :JavaImpl<cr>
    nnoremap <buffer> <leader>eg :JavaGet<cr>
    nnoremap <buffer> <leader>es :JavaSet<cr>
    nnoremap <buffer> <leader>eF :JavaSearch<cr>
endfunction
autocmd FileType java :call EclimMappings()
autocmd BufWritePre *.java :Validate

" Remove search higlight
nmap <silent> <BS>  :nohlsearch<CR>

" Focus on split
noremap <leader>o :only<CR>

" Quicker folding
noremap <space> za

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                End Mappings                                 "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                    Look                                     "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Keep status line visible
set laststatus=2

" Set colorscheme
let g:gruvbox_italic=1
let g:gruvbox_invert_selection=0
colorscheme gruvbox
set background=dark

set guioptions=

" Character for vertical split
set fillchars=vert:│,fold:-

" Language indepenent indentation
filetype plugin indent on

" Full colour
" let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors

" Show line numbers and length
set number
set textwidth=79

" Disable wrapping
set nowrap
set formatoptions-=t

" highlight ColorColumn guibg=gray
" highlight OverLength ctermbg=red ctermfg=white guibg=#fb4934
" match OverLength /\%81v.\+/
" autocmd FileType java match OverLength /\%101v.\+/

" Italic comments
highlight Comment gui=italic

" Show invisible characters
set invlist
set listchars=tab:▸\ ,eol:¬,trail:⋅,extends:❯,precedes:❮

" JSX
let g:xml_syntax_folding = 0

set guicursor=

autocmd VimResized * execute "normal! \<c-q>="
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
autocmd FileType html,css,scss,javascript,json :setlocal sw=2 ts=2 sts=2

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

" Code folding
set foldmethod=syntax

" Clear trailing whitespace in selected file types on save
autocmd BufWritePre *.py,*.jsx?,*.hs,*.html,*.css,*.scss :%s/\s\+$//e

" Close preview window after deoplete completion
autocmd CompleteDone * pclose!

" Auto source on write
autocmd! BufWritePost init.vim source %
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 End General                                 "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
