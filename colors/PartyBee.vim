" Maintainer:	Patrick J. Anderson
" Version:      1.0.1
" Last Change:	February 23, 2009
" Credits:      This is a modification of Mustang.vim color scheme

set background=dark

hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "partybee"

" Vim >= 7.0 specific colors
if version >= 700
  hi Cursor       guifg=NONE    guibg=#ff0705 gui=NONE ctermbg=241 ctermbg=NONE
  hi CursorLine   guifg=NONE    guibg=#2D2D2D gui=NONE ctermbg=234 ctermbg=NONE
  hi CursorColumn guifg=NONE    guibg=#2D2D2D gui=NONE ctermbg=234 ctermbg=NONE
	hi MatchParen   guifg=#D0FFC0 guibg=#808080 gui=BOLD ctermfg=157 ctermbg=237 cterm=BOLD
  hi Pmenu        guifg=#444444 guibg=#1A1A1A gui=NONE ctermfg=255 ctermbg=238
  hi PmenuSel     guifg=#FFFFFF guibg=#303030 gui=BOLD ctermfg=0   ctermbg=148
endif

" chrome colors
hi LineNr       guifg=#808080 guibg=#202020 gui=NONE ctermfg=244 ctermbg=232
hi StatusLine   guifg=#D3D3D5 guibg=#3D3D3D gui=NONE ctermfg=253 ctermbg=238
hi StatusLineNC guifg=#939395 guibg=#3D3D3D gui=NONE ctermfg=246 ctermbg=238
hi VertSplit    guifg=#3D3D3D guibg=#3D3D3D gui=NONE ctermfg=238 ctermbg=238
hi Folded       guifg=#A0A8B0 guibg=NONE    gui=NONE ctermbg=4   ctermfg=248
hi Visual       guifg=NONE    guibg=#3c414c gui=NONE ctermfg=254 ctermbg=4
hi Title        guifg=#FFFFFF guibg=NONE	  gui=NONE ctermfg=254 cterm=NONE
hi TabLine      guifg=#828282 guibg=#5C5C5C
hi TabLineSel   guifg=#FFFFFF guibg=#7A7A7A gui=BOLD
hi TabLineFill  guifg=#3D3D3D

" Syntax highlighting
"hi SpecialKey   guifg=#808080 guibg=#343434 gui=NONE ctermfg=244 ctermbg=236
hi Normal       guifg=#E2E2E5 guibg=#202020 gui=NONE ctermfg=253 ctermbg=234
hi NonText      guifg=#808080 guibg=#202020 gui=NONE ctermfg=244 ctermbg=235
hi String     guifg=#808080 guibg=NONE    gui=NONE   ctermfg=148
hi Comment    guifg=#808080 guibg=NONE    gui=ITALIC ctermfg=244
" hi Todo       guifg=#8f8f8f gui=NONE   ctermfg=245
hi Todo       guifg=#FF6400 guibg=#000000 gui=ITALIC
hi Boolean    gui=BOLD
hi Identifier guifg=#E69C35 guibg=NONE    gui=NONE   ctermfg=148
hi Function   guifg=#FF6400 guibg=NONE    gui=NONE   ctermfg=255
hi Type       guifg=#838383 guibg=NONE    gui=NONE   ctermfg=103
hi Statement  guifg=#838383 guibg=NONE    gui=NONE   ctermfg=103
hi Keyword    guifg=#FF6400 guibg=NONE    gui=NONE   ctermfg=208
hi Constant   guifg=#FF6400 guibg=NONE    gui=NONE   ctermfg=208
hi Number     guifg=#FF6400 guibg=NONE    gui=NONE   ctermfg=208
hi Special    guifg=#FF6400 guibg=NONE    gui=NONE   ctermfg=208
hi PreProc    guifg=#FF6400 guibg=NONE    gui=NONE   ctermfg=230
