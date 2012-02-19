" Setting the Arrow-Keys as Text-Shiters
  function! DelEmptyLineAbove()
    if line(".") == 1
      return
    endif
    let l:line = getline(line(".") - 1)
    if l:line =~ '^\s*$'
      let l:colsave = col(".")
      .-1d
      silent normal! <C-y>
      call cursor(line("."), l:colsave)
    endif
  endfunction
 
  function! AddEmptyLineAbove()
    let l:scrolloffsave = &scrolloff
    " Avoid jerky scrolling with ^E at top of window
    set scrolloff=0
    call append(line(".") - 1, "")
    if winline() != winheight(0)
      silent normal! <C-e>
    endif
    let &scrolloff = l:scrolloffsave
  endfunction
 
  function! DelEmptyLineBelow()
    if line(".") == line("$")
      return
    endif
    let l:line = getline(line(".") + 1)
    if l:line =~ '^\s*$'
      let l:colsave = col(".")
      .+1d
      ''
      call cursor(line("."), l:colsave)
    endif
  endfunction
 
  function! AddEmptyLineBelow()
    call append(line("."), "")
  endfunction

" Arrow key remapping: Up/Dn = move line up/dn; Left/Right = indent/unindent
" `Ctrl-Up` and `Ctrl-Down`, instead, deletes or inserts a blank line below the current line
  function! SetArrowKeysAsTextShifters()
   " normal mode
    nmap <silent> <Left> <<
    nmap <silent> <Right> >>
    nnoremap <silent> <Up> <Esc>:call DelEmptyLineAbove()<CR>
    nnoremap <silent> <Down>  <Esc>:call AddEmptyLineAbove()<CR>
    nnoremap <silent> <C-Up> <Esc>:call DelEmptyLineBelow()<CR>
    nnoremap <silent> <C-Down> <Esc>:call AddEmptyLineBelow()<CR>
 
    " visual mode
    vmap <silent> <Left> <gv
    vmap <silent> <Right> >gv
    vnoremap <silent> <Up> <Esc>:call DelEmptyLineAbove()<CR>gv
    vnoremap <silent> <Down>  <Esc>:call AddEmptyLineAbove()<CR>gv
    vnoremap <silent> <C-Up> <Esc>:call DelEmptyLineBelow()<CR>gv
    vnoremap <silent> <C-Down> <Esc>:call AddEmptyLineBelow()<CR>gv
 
    " insert mode
    imap <silent> <Left> <C-D>
    imap <silent> <Right> <C-T>
    inoremap <silent> <Up> <Esc>:call DelEmptyLineAbove()<CR>a
    inoremap <silent> <Down> <Esc>:call AddEmptyLineAbove()<CR>a
    inoremap <silent> <C-Up> <Esc>:call DelEmptyLineBelow()<CR>a
    inoremap <silent> <C-Down> <Esc>:call AddEmptyLineBelow()<CR>a
  endfunction
  call SetArrowKeysAsTextShifters()
" End setting the Arrow-Keys as Text-Shiters
