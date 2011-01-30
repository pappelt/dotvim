set nocompatible
set hidden 			"change buffer without saving
set noswapfile			"don't create swap files
set autoread			"Set to auto read when a file is changed from the outside
set history=700			"remember 700 steps for history
set showcmd			"show commands

"tabs & spaces
set shiftwidth=2
set tabstop=2

set foldmethod=indent "set folding-method

"settings in MacVim GUI
if has("gui_running")
  set gfn=Menlo:h16		"set font
  set guioptions=-t		"hide toolbar
endif

colorscheme desert 		"load colorscheme

" When vimrc is edited, reload it
autocmd! bufwritepost vimrc source ~/.vim_runtime/vimrc

set incsearch 			"highlight searchresults while typing
set hlsearch  			"highlight searchresults generally

set number 			"show linenumbers
set backspace=indent,eol,start  "Intuitive backspacing.
set cmdheight=2			"height of the commd line
set laststatus=2                "Show the status line all the time

syntax on 			"enable syntax-highlighting by default
let mapleader = "," 		"remap leader key
let g:mapleader = "," 		"remap leader key in MacVim GUI

"Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

"if MySys() == "mac"
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
"endif

" Tab mappings.
map <leader>tt :tabnew<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>to :tabonly<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprevious<cr>
map <leader>tf :tabfirst<cr>
map <leader>tl :tablast<cr>
map <leader>tm :tabmove

set foldcolumn=1 "show folds
