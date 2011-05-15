" pathogen config
	call pathogen#runtime_append_all_bundles() 
	call pathogen#helptags() 

" general settings
	set nocompatible
	let $VIMHOME = "~/.vim/"
	set hidden 			"change buffer without saving
	set noswapfile			"don't create swap files
	set autoread			"Set to auto read when a file is changed from the outside
	set backspace=indent,eol,start  "Intuitive backspacing.
	set vb t_vb= "turn off any errorbell/flash/something
	colorscheme BusyBee 		"load colorscheme

" autocommands and some other magic
	autocmd! bufwritepost vimrc source ~/.vim/vimrc "when vimrc is edited, reload it
	"au FocusLost * :wa "save all buffers on lost focus
	filetype plugin on " currently used because of NERDcommenter

" Key Mappings
	let mapleader = "," 		"remap leader key
	let g:mapleader = "," 		"remap leader key in MacVim GUI

	" mapping tab to keyword-completion
	inoremap <tab> <C-P>
	inoremap <S-tab> <C-N>

	" remap jj to ESC in insert-mode
	inoremap jj <ESC>

	" mappings for tab-navigation
	map <leader>tt :tabnew<cr>
	map <leader>te :tabedit
	"map <leader>tc :tabclose<cr>
	map <leader>to :tabonly<cr>
	map <leader>tn :tabnext<cr>
	map <leader>tp :tabprevious<cr>
	map <leader>tf :tabfirst<cr>
	map <leader>tl :tablast<cr>
	map <leader>tm :tabmove

	"mappings for split-window navigation
	"with resizing
	noremap <c-w>h <c-w>=<c-w>h<c-w>20>
	noremap <c-w>l <c-w>=<c-w>l<c-w>20>

	" arrow-key masochism
	"inoremap  <Up>     <NOP>
	"inoremap  <Down>   <NOP>
	"inoremap  <Left>   <NOP>
	"inoremap  <Right>  <NOP>
	"noremap   <Up>     <NOP>
	"noremap   <Down>   <NOP>
	"noremap   <Left>   <NOP>
	"noremap   <Right>  <NOP>

	" move by screen line instead by file line
	nnoremap j gj
	nnoremap k gk
	vnoremap j gj
	vnoremap k gk

" code-foo
	syntax on 			"enable syntax-highlighting by default
	"show linenumbers (doesn't work in conjunction with set relativenumber)
	"but is also not necessary because you always can jump to a
	"specific line (stated in an errormessage for example) with :{linenumber}<cr>
	"set number
	"display how far away each line is from the current one, instead of showing the absolute line number
	set relativenumber
	set ruler
	"set undofile

" tabs & spaces
	set tabstop=2
	set shiftwidth=2
	set noexpandtab
	set autoindent

" folding
	set foldmethod=manual "set folding-method
	"set foldcolumn=1 "show folds

" search (and replace)
	" make searches use normal regexes
	" i currently don't get how this should help me
	"nnoremap / /\v
	"vnoremap / /\v
	set ignorecase 			"all-lowercase string = search is case-insensitive
	set smartcase 			"string with some uppercased letters = search is case-sensitive
	set incsearch 			"highlight searchresults while typing
	set hlsearch  			"highlight searchresults generally

	" map <leader><space> to clear highlighted searchresults when done
	nnoremap <leader><space> :noh<cr>

" command-line
set cmdheight=2			"height of the commd line
set laststatus=2                "Show the status line all the time
set showcmd			"show commands
set history=700			"remember 700 steps for history


" settings in MacVim GUI
if has("gui_running")
  set gfn=Menlo:h16		"set font
  set guioptions=-t		"hide toolbar
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
