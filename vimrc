" pathogen config
	call pathogen#runtime_append_all_bundles() 
	call pathogen#helptags() 

" general settings
	set nocompatible
	let $VIMHOME="~/.vim/"
	set hidden                     " change buffer without saving
	set noswapfile                 " don't create swap files
	set autoread                   " Set to auto read when a file is changed from the outside
	set backspace=indent,eol,start " Intuitive backspacing.
	set vb t_vb=                   " turn off any errorbell/flash/something
  set nobackup
  set nowritebackup
  set nowrap

  let guiColorScheme = "BusyBee"
  if (exists("guiColorScheme"))
    colorscheme BusyBee 		       " load colorscheme BusyBee
    set cursorline
  else
    colorscheme default            " load colorscheme default
  endif

" autocommands and some other magic
  if has("autocmd")
    autocmd! bufwritepost vimrc source ~/.vimrc " when vimrc is edited, reload it
    filetype plugin indent on                   " currently used because of NERDcommenter
  endif

" Key Mappings
  let mapleader =   ","  " remap leader key
	let g:mapleader = ","  " remap leader key in MacVim GUI
  noremap ; :

  " in insert-mode
  "===============
    " tab to keyword-completion
    inoremap <tab> <C-N>
    inoremap <S-tab> <C-P>

    " remap jj to ESC
    inoremap jj <ESC>

  " in normal mode
  "===============
    " tab to scroll a few lines up/down
    noremap <tab> <C-E>
    noremap <S-tab> <C-Y>

  " tab-navigation
    map <leader>tt :tabnew<cr>
    map <leader>to :tabonly<cr>
    map <leader>tn :tabnext<cr>
    map <leader>tp :tabprevious<cr>
    map <leader>tf :tabfirst<cr>
    map <leader>tl :tablast<cr>
    map <leader>tm :tabmove 
    map <leader>te :tabedit 

  " mappings for split-window navigation
  " with resizing
    noremap <c-h> <c-w>=<c-w>h<c-w>20>
    noremap <c-l> <c-w>=<c-w>l<c-w>20>
    "noremap <c-w>h <c-w>20<<c-w>h<c-w>20>
    "noremap <c-w>l <c-w>20<<c-w>l<c-w>20>
    nnoremap <C-j> :exe "resize " . (winheight(0) * 3/2)<CR>
    nnoremap <C-k> :exe "resize " . (winheight(0) * 2/3)<CR>
    "nnoremap <C-l> :exe "resize " . (winwidth(0) * 2/3)<c-l><CR>
    "nnoremap <C-h> :exe "resize " . (winwidth(0) * 3/2)<c-h><CR>

" code-foo
	syntax on 			"enable syntax-highlighting by default
  if version >= 700
    set relativenumber "display how far away each line is from the current one, instead absolute line number
  else
    set number
  endif    
	set ruler

" tabs & spaces 
	set expandtab "use spaces for indentation (instead of tabs)
	set tabstop=2
  set softtabstop=2
  set shiftwidth=2

" indentation
	set smartindent
  "set autoindent

" folding
	set foldmethod=manual "set folding-method

" search (and replace)
	" make searches use normal regexes
	set ignorecase 			" all-lowercase string = search is case-insensitive
	set smartcase 			" string with some uppercased letters = search is case-sensitive
	set incsearch 			" highlight searchresults while typing
	set hlsearch  			" highlight searchresults generally

	" map <leader><space> to clear highlighted searchresults when done
	nnoremap <leader><space> :noh<cr>

" command-line
	set cmdheight=2  " height of the commd line
	set laststatus=2 " Show the status line all the time
	set showcmd      " show commands
	set history=700  " remember 700 steps for history


" settings in MacVim GUI
  if has("gui_running")
    set co=174        " set cols to fill the whole screen on 17" MBP
    set lines=57      " set lines to fill the whole screen on 17" MBP
    set gfn=Menlo:h18 " set font
    set guioptions=-t " hide toolbar
    set gcr=n-v-c:block-Cursor/block-Cursor-blinkwait300-blinkon200-blinkoff0,i-ci:hor30-Cursor-blinkwait300-blinkon200-blinkoff0
  endif


" Function Smart_TabComplete for smart keyword completion with <Tab>
  function! Smart_TabComplete()
    let line = getline('.')                         " curline
    let substr = strpart(line, -1, col('.')+1)      " from start to cursor
    let substr = matchstr(substr, "[^ \t]*$")       " word till cursor
    if (strlen(substr)==0)                          " nothing to match on empty string
      return "\<tab>"
    endif
    let has_period = match(substr, '\.') != -1      " position of period, if any
    let has_slash = match(substr, '\/') != -1       " position of slash, if any
    if (!has_period && !has_slash)
      return "\<C-X>\<C-P>"                         " existing text matching
    elseif ( has_slash )
      return "\<C-X>\<C-F>"                         " file matching
    else
      return "\<C-X>\<C-O>"                         " plugin matching
    endif
  endfunction
	
" map the key
"inoremap <tab> <c-r>=Smart_TabComplete()<CR>

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
    vmap <silent> <Left> <
    vmap <silent> <Right> >
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
 
    " disable modified versions we are not using
		nnoremap  <C-Up>     <NOP>
		nnoremap  <C-Down>   <NOP>
    nnoremap  <C-Left>   <NOP>
    nnoremap  <C-Right>  <NOP>
		vnoremap  <C-Up>     <NOP>
		vnoremap  <C-Down>   <NOP>
    vnoremap  <C-Left>   <NOP>
    vnoremap  <C-Right>  <NOP>
    inoremap  <C-Up>     <NOP>
    inoremap  <C-Down>   <NOP>
    inoremap  <C-Left>   <NOP>
    inoremap  <C-Right>  <NOP>
  endfunction
 
  call SetArrowKeysAsTextShifters()
" End setting the Arrow-Keys as Text-Shiters
nnoremap <F5> :GundoToggle<CR>
