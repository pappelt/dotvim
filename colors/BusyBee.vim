" Maintainer:	Patrick J. Anderson
" Version:      1.0.1
" Last Change:	February 23, 2009
" Credits:      This is a modification of Mustang.vim color scheme

set background=dark

hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "busybee"

" Vim >= 7.0 specific colors
if version >= 700
  hi CursorLine   guifg=NONE    guibg=#303030 gui=NONE ctermbg=234 ctermbg=NONE
  hi CursorColumn guifg=NONE    guibg=#303030 gui=NONE ctermbg=234 ctermbg=NONE
	hi MatchParen   guifg=#d0ffc0 guibg=#808080 gui=BOLD ctermfg=157 ctermbg=237 cterm=BOLD
  hi Pmenu        guifg=#ffffff guibg=#202020 gui=NONE ctermfg=255 ctermbg=238
  hi PmenuSel     guifg=#000000 guibg=#b1d631 gui=NONE ctermfg=0   ctermbg=148
endif

" General colors
hi Cursor       guifg=NONE    guibg=#ff0705 gui=NONE ctermbg=241 ctermbg=NONE
hi Normal       guifg=#e2e2e5 guibg=#202020 gui=NONE ctermfg=253 ctermbg=234
hi NonText      guifg=#808080 guibg=#202020 gui=NONE ctermfg=244 ctermbg=235
hi LineNr       guifg=#808080 guibg=#202020 gui=NONE ctermfg=244 ctermbg=232
hi StatusLine   guifg=#d3d3d5 guibg=#303030 gui=NONE ctermfg=253 ctermbg=238
hi StatusLineNC guifg=#939395 guibg=#303030 gui=NONE ctermfg=246 ctermbg=238
hi VertSplit    guifg=#444444 guibg=#303030 gui=NONE ctermfg=238 ctermbg=238
hi Folded       guifg=#a0a8b0 guibg=NONE    gui=NONE ctermbg=4   ctermfg=248
hi Title        guifg=#f6f3e8 guibg=NONE	  gui=BOLD ctermfg=254 cterm=BOLD
hi Visual       guifg=NONE    guibg=#3c414c gui=NONE ctermfg=254 ctermbg=4
hi SpecialKey   guifg=#808080 guibg=#343434 gui=NONE ctermfg=244 ctermbg=236

" Syntax highlighting
hi String     guifg=#808080 gui=NONE   ctermfg=148
hi Comment    guifg=#808080 gui=italic ctermfg=244
" hi Todo       guifg=#8f8f8f gui=NONE   ctermfg=245
hi Todo       guifg=#ff9f00 guibg=#202020 gui=NONE   ctermfg=NONE 
hi Boolean    guifg=#b1d631 gui=NONE   ctermfg=148
hi Identifier guifg=#b1d631 gui=NONE   ctermfg=148
hi Function   guifg=#ffff00 gui=BOLD   ctermfg=255
hi Type       guifg=#7e8aa2 gui=NONE   ctermfg=103
hi Statement  guifg=#7e8aa2 gui=NONE   ctermfg=103
hi Keyword    guifg=#ff9800 gui=NONE   ctermfg=208
hi Constant   guifg=#ff9800 gui=NONE   ctermfg=208
hi Number     guifg=#ff9800 gui=NONE   ctermfg=208
hi Special    guifg=#ff9800 gui=NONE   ctermfg=208
hi PreProc    guifg=#faf4c6 gui=NONE   ctermfg=230
