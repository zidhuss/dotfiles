function! FormatLua(buffer) abort
    return {
    \   'command': 'lua-format'
    \}
endfunction

execute ale#fix#registry#Add('lua-format', 'FormatLua', ['lua'], 'lua-format for lua')


" let g:ale_sign_column_always = 1
let g:ale_c_parse_compile_commands = 1
let g:ale_fix_on_save = 1
let g:ale_fixers = {
            \   '*': [
            \       'remove_trailing_lines',
            \       'trim_whitespace',
            \   ],
            \   'cpp': [
            \       'clang-format',
            \   ],
            \   'typescript': [
            \       'prettier',
            \   ],
            \   'typescriptreact': [
            \       'prettier',
            \   ],
            \   'javascript': [
            \       'prettier',
            \   ],
            \   'javascriptreact': [
            \       'prettier',
            \   ],
            \   'css': [
            \       'prettier',
            \   ],
            \   'scss': [
            \       'prettier',
            \   ],
            \   'python': [
            \       'black',
            \       'isort',
            \   ],
            \   'cs': [
            \       'dotnet-format',
            \   ],
            \   'lua': [
            \       'stylua',
            \   ],
            \   'ruby': [
            \       'rubocop',
            \   ],
            \   'sql': [
            \       'pgformatter',
            \   ],
            \   'go': [
            \       'gofmt',
            \       'goimports',
            \   ],
            \   'json': [
            \       'fixjson',
            \   ],
            \}
let g:ale_disable_lsp = 1
let g:ale_set_highlights = 0

let g:ale_sql_pgformatter_options = '-g'

let g:ale_linters = {}
let g:ale_linters_explicit = 1
