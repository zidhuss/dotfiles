" ░▀█▀░█▀█░▀█▀░▀█▀░░░░█░█░▀█▀░█▄█
" ░░█░░█░█░░█░░░█░░░░░▀▄▀░░█░░█░█
" ░▀▀▀░▀░▀░▀▀▀░░▀░░▀░░░▀░░▀▀▀░▀░▀
"
" Author: zidhuss
" Repo: https://github.com/zidhuss/dotfiles
" URL: http://zidhuss.tech

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   Plugins                                   "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin()
""""""""""
"  Look  "
""""""""""
Plug 'morhetz/gruvbox'
    let g:gruvbox_improved_warnings = 1
    let g:gruvbox_italic=1
    let g:gruvbox_invert_selection=0
    let g:gruvbox_sign_column='bg0'
Plug 'gorodinskiy/vim-coloresque'
Plug 'Yggdroot/indentLine'
    let g:indentLine_char='┆'
    let g:indentLine_concealcursor=''
Plug 'bling/vim-airline'
    let g:airline_powerline_fonts = 1
    let g:airline_theme='huss'
    let g:airline_section=' '
    let g:airline_left_sep = ' '
    let g:airline_right_sep = ' '
    let g:airline_skip_empty_sections = 1
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#ale#error_symbol = ''
    let g:airline#extensions#ale#warning_symbol = ''
    let g:airline#extensions#ale#show_line_numbers = 0
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
Plug 'fatih/vim-go', { 'for': 'go', 'do': ':GoInstallBinaries' }
    let g:go_fmt_fail_silently = 0
    let g:go_fmt_experimental = 1
    let g:go_fmt_command = 'goimports'
    let g:go_fmt_autosave = 1
    " let g:go_auto_sameids = 1
    " let g:go_auto_type_info = 1
    au FileType go nmap <leader>gb <Plug>(go-doc-browser)
    au Filetype go nmap <leader>ga <Plug>(go-alternate-edit)
    au Filetype go nmap <leader>gah <Plug>(go-alternate-split)
    au Filetype go nmap <leader>gav <Plug>(go-alternate-vertical)
    au Filetype go nmap <leader>f :GoFmt<cr>
    au FileType go nmap <F10> :GoTest -short<cr>
    au FileType go nmap <F9> :GoCoverageToggle -short<cr>
" Plug 'sheerun/vim-polyglot'
"     let g:javascript_plugin_jsdoc = 1
"     let g:polyglot_disabled = ['latex', 'go', 'xml'] " vimtex & vim-go
Plug 'samuelsimoes/vim-jsx-utils'
    nnoremap <leader>ea :call JSXEncloseReturn()<CR>
    nnoremap <leader>ei :call JSXEachAttributeInLine()<CR>
    nnoremap <leader>ee :call JSXExtractPartialPrompt()<CR>
    nnoremap <leader>ec :call JSXChangeTagPrompt()<CR>
    nnoremap vat :call JSXSelectTag()<CR>
Plug 'amadeus/vim-xml'
Plug 'pangloss/vim-javascript'
	let g:javascript_plugin_jsdoc = 1
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'peitalin/vim-jsx-typescript'
Plug 'w0rp/ale'
    let g:ale_sign_error=' ●'
    let g:ale_sign_warning=' ●'
    let g:ale_sign_column_always = 1
    let g:ale_c_parse_compile_commands = 1
    let g:ale_fix_on_save = 1
    let g:ale_fixers = {
    \   'cpp': [
    \       'clang-format',
    \       'remove_trailing_lines',
    \       'trim_whitespace',
    \   ],
    \   'typescript': [
    \       'prettier',
    \       'remove_trailing_lines',
    \       'trim_whitespace',
    \   ],
    \   'python': [
    \       'black',
    \   ],
    \}
    let g:ale_disable_lsp = 1
Plug 'tpope/vim-endwise'
    let g:endwise_no_mappings=1
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'

Plug 'rstacruz/sparkup'
    let g:sparkupArgs='--no-last-newline'
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
Plug 'lervag/vimtex', { 'for': [ 'tex', 'latex' ] }
  let g:tex_flavor = 'latex'
  let g:vimtex_indent_enabled = 0
  let g:vimtex_compiler_program = 'nvr'
  let g:vimtex_view_method = 'zathura'
  let g:vimtex_quickfix_enabled = 0
  nnoremap <localleader>lt :call vimtex#fzf#run()<cr>
" Plug 'Konfekt/FastFold'

"""""""""
"  Git  "
"""""""""
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
    let g:gitgutter_sign_added='┃'
    let g:gitgutter_sign_modified='┃'
    let g:gitgutter_sign_removed='◢'
    let g:gitgutter_sign_removed_first_line='◥'
    let g:gitgutter_sign_modified_removed='◢'
    set signcolumn=yes

""""""""""""""
"  Snippets  "
""""""""""""""
Plug 'SirVer/ultisnips'
    let g:UltiSnipsExpandTrigger='<c-j>'
    let g:UltiSnipsJumpForwardTrigger='<c-d>'
    let g:UltiSnipsJumpBackwardTrigger='<c-u>'
    let g:UltiSnipsSnippetsDir='~/.config/nvim/UltiSnips'
Plug 'honza/vim-snippets'
    let g:snips_author='zidhuss'

""""""""""""""""
"  Navigation  "
""""""""""""""""
Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
    nmap <f8> :TagbarToggle<cr>
Plug 'christoomey/vim-tmux-navigator'
    let g:tmux_navigator_no_mappings = 1
    " let g:tmux_navigator_save_on_switch = 1
    nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
    nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
    nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
    nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
    nnoremap <silent> <c-\> :TmuxNavigatePrevious<cr>
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
    map <leader>n :NERDTreeToggle<CR>

""""""""""""""""
"  Completion  "
""""""""""""""""
set omnifunc=syntaxcomplete#Complete
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
    nnoremap <silent> <f1> :Help<CR>
    nnoremap <silent> <leader>b :Buffers<CR>
    nnoremap <silent> <leader>l :Lines<cr>
    nnoremap <silent> <leader>t :Tags<cr>
Plug 'jiangmiao/auto-pairs'
Plug 'ncm2/float-preview.nvim'
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
    " Use K to show documentation in preview window
    nnoremap <silent> K :call <SID>show_documentation()<CR>
    " Use `[g` and `]g` to navigate diagnostics
    nmap <silent> [g <Plug>(coc-diagnostic-prev)
    nmap <silent> ]g <Plug>(coc-diagnostic-next)
    " Remap for rename current word
    nmap <leader>rn <Plug>(coc-rename)
    " Remap keys for gotos
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)
    " Use <c-space> to trigger completion.
    inoremap <silent><expr> <c-space> coc#refresh()

    " Fix autofix problem of current line
    nmap <leader>qf  <Plug>(coc-fix-current)

    " use `:OR` for organize import of current buffer
    command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')


function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction


" Plug 'shougo/deoplete.nvim'
"     let g:deoplete#enable_camel_case = 1
"     let g:deoplete#omni_patterns = {}
"     let g:deoplete#omni_patterns.java = '[^. *\t]\.\w*'
"     let g:deoplete#ignore_sources = {}
"     let g:deoplete#ignore_sources.java = ['tag']
"     let g:deoplete#enable_at_startup = 1
" Plug 'zchee/deoplete-go', { 'do': 'make', 'for': 'go' }
" Plug 'pbogut/deoplete-padawan', { 'for': 'php' }
" Plug 'zchee/deoplete-clang', { 'for': [ 'c', 'cpp' ] }
"     let g:deoplete#sources#clang#libclang_path = '/usr/lib/libclang.so'
"     let g:deoplete#sources#clang#clang_header = '/usr/lib/clang'
" Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }
" Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'] }
"     au FileType javascript,jsx,javascript.jsx setl omnifunc=tern#Complete
"     let g:deoplete#omni#functions = {}
"     let g:deoplete#omni#functions.javascript = [
"         \ 'tern#Complete',
"         \ 'jspc#omni'
"     \]
" Plug 'zchee/deoplete-jedi', { 'for': 'python' }
"     let deoplete#sources#jedi#show_docstring = 1
" Plug 'phildawes/racer', { 'for': 'rust' }

"""""""""""
"  Other  "
"""""""""""
Plug 'vim-scripts/restore_view.vim'
    set viewoptions-=options
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'reedes/vim-pencil', { 'on': 'PencilToggle' }
    map <c-p> :PencilToggle<cr>

call plug#end()

" Only works down here
" call deoplete#custom#source('_', 'matchers', ['matcher_full_fuzzy'])
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

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

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
noremap <space> zA

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                End Mappings                                 "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                    Look                                     "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Keep status line visible
set laststatus=2

" Set colorscheme
colorscheme basic
set background=light

set guioptions=

" Character for vertical split
set fillchars=vert:│,fold:·

" Language indepenent indentation
filetype plugin indent on

" 24bit colour
set termguicolors

" Show line numbers and length
set number
set textwidth=79

" Disable wrapping
set nowrap
set formatoptions-=t

" Italic comments
highlight Comment gui=italic

" Easily identify which line I'm writing on
set cursorline

" 80 characters per line
set colorcolumn=80

" Show invisible characters
set invlist
set listchars=tab:▸\ ,eol:¬,trail:⋅,extends:❯,precedes:❮

" JSX
let g:xml_syntax_folding = 0

" Allow other cursors in terminal
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
autocmd FileType html,css,scss,javascript,json,typescript,typescript.tsx :setlocal sw=2 ts=2 sts=2

" Use clang-format for C/C++
autocmd FileType c,cpp setlocal equalprg=clang-format

" LaTeX settings
autocmd FileType tex :setlocal wrap colorcolumn= linebreak

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
scriptencoding utf-8

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
set nofoldenable

" Terminal bi-directional support
set termbidi

" Clear trailing whitespace in selected file types on save
autocmd BufWritePre *.py,*.(j|t)sx?,*.hs,*.html,*.css,*.scss :%s/\s\+$//e

" Close preview window after deoplete completion
"autocmd CompleteDone * pclose!

" Use floating preview instead
set completeopt-=preview

" Never conceal under cursor
set concealcursor=

" Auto source on write
autocmd! BufWritePost init.vim source %
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 End General                                 "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
