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
  set tags+=tags;/

  let guiColorScheme = "BusyBee"
  if (exists("guiColorScheme"))
    colorscheme BusyBee 		       " load colorscheme BusyBee
    set cursorline
  else
    colorscheme default            " load colorscheme default
  endif

" autocommands and some other magic
  if has("autocmd")
    autocmd! bufwritepost ~/.vimrc source ~/.vimrc " when vimrc is edited, reload it
    filetype plugin indent on                   " currently used because of NERDcommenter
  endif

" Key Mappings
  let mapleader =   ","  " remap leader key
	let g:mapleader = ","  " remap leader key in MacVim GUI
  noremap ; :
  nnoremap <F5> :GundoToggle<CR>

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
    map <silent> <C-h> <C-w>5<
    map <silent> <C-j> <C-W>5-
    map <silent> <C-k> <C-W>5+
    map <silent> <C-l> <C-w>5>

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
    " set co=120
    " set lines=44
    set guifont=Ubuntu\ Mono\ 12
    set guioptions=-t " hide toolbar
    set gcr=n-v-c:block-Cursor/block-Cursor-blinkon0-blinkoff0,i-ci:hor30-Cursor-blinkwait500-blinkon500-blinkoff500
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
	
"inoremap <tab> <c-r>=Smart_TabComplete()<CR>
map <Leader>r :w\|php -r %<cr>
map <Leader>t :w\|php -l %<cr>

source ~/dotvim/arrowkeysAsTextshifters
