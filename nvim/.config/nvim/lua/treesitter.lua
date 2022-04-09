require'nvim-treesitter.configs'.setup {
  ensure_installed = 'maintained',
  -- TODO seems to be broken
  -- ignore_install = O.treesitter.ignore_install,
  highlight = {
    enable = true -- false will disable the whole extension
  },
  -- indent = {enable = true, disable = {"python", "html", "javascript"}},
  indent = {enable = {"javascriptreact"}},
  autotag = {enable = true},
  endwise = {enable = true},
  matchup = {enable = true},
  -- rainbow = {enable = O.treesitter.rainbow.enabled},
  -- context_commentstring = {enable = true, config = {javascriptreact = {style_element = '{/*%s*/}'}}}
  -- refactor = {highlight_definitions = {enable = true}}
}

