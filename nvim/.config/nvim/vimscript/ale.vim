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
    \   'python': [
    \       'black',
    \   ],
    \   'c#': [
    \       'uncrustify',
    \   ],
    \}
    let g:ale_disable_lsp = 1
    let g:ale_set_highlights = 0

    let g:ale_linters = {}
    let g:ale_linters_explicit = 1
