" Vim color file
" Maintainer:	Mikel Ward <mikel@mikelward.com>
" Last Change:	2008 Jan 16

" Remove all existing highlighting and set the defaults.
highlight clear

" Load the syntax highlighting defaults, if it's enabled.
"if exists("syntax_on")
"	syntax reset
"endif

let colors_name = "basic"

" Remove all highlighting
highlight clear Constant
highlight clear Number
highlight clear Statement
highlight clear PreProc
highlight clear Type
highlight clear Special
highlight clear Identifier

highlight clear String
highlight clear Comment
highlight clear Error
highlight clear LineNr
highlight clear NonText
highlight clear SpecialKey

" Set up some simple non-intrusive colors
if &background ==# 'light'
    highlight Normal guifg=#000000 guibg=#ffffff
    highlight String term=underline cterm=NONE ctermfg=DarkGreen guifg=DarkGreen
    highlight Comment term=bold cterm=NONE ctermfg=DarkBlue guifg=Grey70
    highlight Error term=reverse cterm=NONE ctermfg=DarkRed guifg=DarkRed
    highlight LineNr term=bold cterm=NONE ctermfg=DarkYellow
    highlight NonText term=bold cterm=NONE ctermfg=DarkYellow guifg=Grey70
    highlight SpecialKey term=bold cterm=NONE ctermfg=DarkYellow
    highlight Pmenu term=bold guibg=#dfe1e5 guifg=#172b4d
    highlight PmenuSel term=bold guibg=#f4f5f7
    highlight ColorColumn guibg=Grey90
    highlight GreenSign ctermfg=142 guifg=#00875a
    highlight RedSign ctermfg=167 guifg=#bf2600
    highlight AquaSign ctermfg=108 guifg=#00b8d9
    highlight YellowSign ctermfg=108 guifg=#ff8b00
    highlight BlueSign ctermfg=108 guifg=#0747a6
    highlight! link GitGutterAdd GreenSign
    highlight! link GitGutterChange AquaSign
    highlight! link GitGutterChangeDelete AquaSign
    highlight! link GitGutterDelete RedSign
    highlight! link ALEErrorSign RedSign
    highlight! link ALEWarningSign YellowSign
    highlight! link ALEInfoSign BlueSign
else
	highlight String term=underline cterm=NONE ctermfg=Magenta
	highlight Comment term=bold cterm=NONE ctermfg=Cyan
	highlight Error term=reverse cterm=NONE ctermbg=Red
	highlight LineNr term=bold cterm=NONE ctermfg=Yellow
	highlight NonText term=bold cterm=NONE ctermfg=Yellow
	highlight SpecialKey term=bold cterm=NONE ctermfg=Yellow
endif

