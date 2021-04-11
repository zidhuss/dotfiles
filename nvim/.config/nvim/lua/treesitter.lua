require'nvim-treesitter.configs'.setup {
    ensure_installed = 'all',
    -- TODO seems to be broken
    -- ignore_install = O.treesitter.ignore_install,
    -- highlight = {
    --     enable = O.treesitter.highlight.enabled -- false will disable the whole extension
    -- },
    -- indent = {enable = true, disable = {"python", "html", "javascript"}},
    indent = {enable = {"javascriptreact"}},
    -- autotag = {enable = true},
    -- rainbow = {enable = O.treesitter.rainbow.enabled},
    -- context_commentstring = {enable = true, config = {javascriptreact = {style_element = '{/*%s*/}'}}}
    -- refactor = {highlight_definitions = {enable = true}}
}

