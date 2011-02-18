" general settings
set nocompatible
set hidden 			"change buffer without saving
set noswapfile			"don't create swap files
set autoread			"Set to auto read when a file is changed from the outside
let $VIMHOME = "~/.vim/"
autocmd! bufwritepost vimrc source ~/.vim_runtime/vimrc " When vimrc is edited, reload it
set backspace=indent,eol,start  "Intuitive backspacing.
colorscheme desert 		"load colorscheme

"code-foo
syntax on 			"enable syntax-highlighting by default
set number 			"show linenumbers
set ruler

"tabs & spaces
set shiftwidth=2
set tabstop=2

"folding
set foldmethod=manual "set folding-method
"set foldcolumn=1 "show folds

"highlighting searchresults
set incsearch 			"highlight searchresults while typing
set hlsearch  			"highlight searchresults generally

"command-line
set cmdheight=2			"height of the commd line
set laststatus=2                "Show the status line all the time
set showcmd			"show commands
set history=700			"remember 700 steps for history

"Key Mappings
let mapleader = "," 		"remap leader key
let g:mapleader = "," 		"remap leader key in MacVim GUI

"mappings for tab-navigation
map <leader>tt :tabnew<cr>
map <leader>te :tabedit
"map <leader>tc :tabclose<cr>
map <leader>to :tabonly<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprevious<cr>
map <leader>tf :tabfirst<cr>
map <leader>tl :tablast<cr>
map <leader>tm :tabmove

"settings in MacVim GUI
if has("gui_running")
  set gfn=Menlo:h16		"set font
  set guioptions=-t		"hide toolbar
endif

"NERDcommenter
filetype plugin on

"smart keyword completion with <Tab>
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
"map the key
inoremap <tab> <c-r>=Smart_TabComplete()<CR>
