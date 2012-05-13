" Maintainer:	Paul Appelt
" Version:      1.2
" Last Change:	May, 10th 2012
" Credits:      This is a modification of BusyBee.vim color scheme

set background=dark

hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "partybee"

hi Cursor       guifg=NONE    guibg=#ff0705 gui=NONE
hi CursorLine   guifg=NONE    guibg=#2D2D2D gui=NONE
hi CursorColumn guifg=NONE    guibg=#2D2D2D gui=NONE
hi MatchParen   guifg=#D0FFC0 guibg=#808080 gui=BOLD
hi Pmenu        guifg=#444444 guibg=#1A1A1A gui=NONE
hi PmenuSel     guifg=#FFFFFF guibg=#303030 gui=BOLD

" chrome colors
hi LineNr       guifg=#808080 guibg=#202020 gui=NONE
hi StatusLine   guifg=#D3D3D5 guibg=#3D3D3D gui=NONE
hi StatusLineNC guifg=#939395 guibg=#3D3D3D gui=NONE
hi VertSplit    guifg=#3D3D3D guibg=#3D3D3D gui=NONE
hi Folded       guifg=#A0A8B0 guibg=NONE    gui=NONE
hi Visual       guifg=NONE    guibg=#3c414c gui=NONE
hi Title        guifg=#FFFFFF guibg=NONE	gui=NONE
hi TabLine      guifg=#828282 guibg=#5C5C5C gui=NONE
hi TabLineSel   guifg=#FFFFFF guibg=#7A7A7A gui=BOLD
hi TabLineFill  guifg=#3D3D3D

" Syntax highlighting
hi Normal       guifg=#E2E2E5 guibg=#202020 gui=NONE
hi NonText      guifg=#808080 guibg=#202020 gui=NONE
hi String       guifg=#808080 guibg=NONE    gui=NONE  
hi Comment      guifg=#808080 guibg=NONE    gui=ITALIC
hi Todo         guifg=#FF6400 guibg=#000000 gui=ITALIC
hi Boolean                                  gui=BOLD
hi Identifier   guifg=#E69C35 guibg=NONE    gui=NONE  
hi Function     guifg=#FF6400 guibg=NONE    gui=NONE  
hi Type         guifg=#838383 guibg=NONE    gui=NONE  
hi Statement    guifg=#838383 guibg=NONE    gui=NONE  
hi Keyword      guifg=#FF6400 guibg=NONE    gui=NONE  
hi Constant     guifg=#FF6400 guibg=NONE    gui=NONE  
hi Number       guifg=#FF6400 guibg=NONE    gui=NONE  
hi Special      guifg=#FF6400 guibg=NONE    gui=NONE  
hi PreProc      guifg=#FF6400 guibg=NONE    gui=NONE  

" Directory Colors
hi Directory  guifg=#808080 guibg=#202020 gui=NONE

" ColumnMargin
hi ColumnMargin guifg=#FF0000 guibg=#202020 gui=NONE ctermfg=244 ctermbg=235

"hi SpecialKey   guifg=#808080 guibg=#343434 gui=NONE
