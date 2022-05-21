local treesitter = require('nvim-treesitter.configs')

treesitter.setup {
  ensure_installed = 'all',
  ignore_install = {'phpdoc'},
  highlight = {
    enable = true -- false will disable the whole extension
  },
  indent = {enable = true},
  autotag = {enable = true},
  endwise = {enable = true},
  matchup = {enable = true},
  context_commentstring = {enable = true}
}

require('treesitter-context').setup {enabled = true}
