" -----------------------------------------------------------------------------
" File: huss.vim
" Description: Basic colorscheme for vim
" Author: Hussien Al Abry <zidhussein@gmail.com>
" Source: https://github.com/zidhuss/dotfiles
" Last Modified: 13 Nov 2018
" -----------------------------------------------------------------------------

" Supporting code -------------------------------------------------------------
" Initialisation: {{{

if version > 580
  hi clear
  if exists("syntax_on")
    syntax reset
  endif
endif

let g:colors_name='gruvbox'

if !(has('termguicolors') && &termguicolors)
    && !has('gui_running')
    && &t_Co != 256
  finish
endif

" }}}

" Palette: {{{
"  setup pallete dictionairy
let s:palette = {}

" fill with absolute colours
let s:pallete.white = ['#ffffff', 255]
let s:pallete.black = ['#000000', 254]

hi! link NonText '#2c2c2c'
" }}}




" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker:
