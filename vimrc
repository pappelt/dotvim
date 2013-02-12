" pathogen config
call pathogen#runtime_append_all_bundles() 
call pathogen#helptags() 

" general settings
set nocompatible
let $VIM="~/.vim/"
set hidden                     " change buffer without saving
set noswapfile                 " don't create swap files
set autoread                   " Set to auto read when a file is changed from the outside
set backspace=indent,eol,start " Intuitive backspacing.
set vb t_vb=                   " turn off any errorbell/flash/something
set nobackup
set nowritebackup
set nowrap
set tags+=tags;/

" autocommands and some other magic
if has("autocmd")
  " disable all autocmds for the current group, to counter multiple execution
  autocmd!
  " general autocmds
  "autocmd! BufNewFile,BufReadPre *.php* :map <Leader>t :w\|:!php -l %<cr>
  "autocmd! BufNewFile,BufReadPre *.php* :map <Leader>r :w\|:!phpunit %<cr>
  "autocmd! BufWinEnter *.php* let w:m2=matchadd('ColumnMargin', '\%>80v.\+', -1)
  "autocmd FileType NERD_tree_1 setlocal winwidth=80 " currently not working
  filetype plugin indent on                   " currently used by NERDcommenter
endif

"quick-edit mode for vimrc
noremap <leader>e :e $VIM/vimrc<cr>
noremap <leader>w :w\|:so $VIM/vimrc<cr>

" Key Mappings
let mapleader =   ","  " remap leader key
let g:mapleader = ","  " remap leader key in MacVim GUI
noremap ; :

" additional views
nnoremap <leader>t :TagbarToggle<CR>
nnoremap <leader>n :NERDTreeMirrorToggle<CR>

set pastetoggle=<F8>

" TAB-Completion
inoremap <tab> <C-N>
inoremap <S-tab> <C-P>

" remap jj to ESC
inoremap jj <ESC>

" in normal mode
"===============
" tab to scroll a few lines up/down
noremap <tab> <C-E>
noremap <S-tab> <C-Y>

" f & u to scroll pagewise
noremap <leader>f <C-F>
noremap <leader>u <C-U>

" tab-navigation
nnoremap t :tabnext<cr>
nnoremap T :tabprevious<cr>

map <leader>tt :tabnew<cr>
map <leader>tf :tabfirst<cr>
map <leader>tl :tablast<cr>
map <leader>tm :tabmove

" buffer-navigation
map <leader>bn :bnext<cr>
map <leader>bp :bprev<cr>
map <leader>ba :bad
map <leader>bd :bdelete<cr>
map <leader>bf :bfirst<cr>
map <leader>bl :blast<cr>

" mappings for split-window navigation
" with resizing
map <silent> <C-h> <C-w>5<
map <silent> <C-j> <C-W>5-
map <silent> <C-k> <C-W>5+
map <silent> <C-l> <C-w>5>

" code-foo
syntax enable 			"enable syntax-highlighting by default

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
set cmdheight=1  " height of the commd line
set laststatus=2 " Show the status line all the time
set showcmd      " show commands
set history=700  " remember 700 steps for history
set ruler

if has("gui_running")
  set guioptions=-t " hide toolbar
  set gcr=n-v-c:block-Cursor/block-Cursor-blinkon0-blinkoff0,i-ci:hor30-Cursor-blinkwait500-blinkon500-blinkoff500
  set gfn=Menlo:h12 " set font
endif

set background=light
colorscheme solarized

set cursorline
set number

" tabs & spaces 
set expandtab "use spaces for indentation (instead of tabs)
set tabstop=2
set softtabstop=2
set shiftwidth=2

" NerdTreeTabs-Config
"if has("NERDTree")
  " don't use fancy arrows
  let g:NERDTreeDirArrows=0
  " don't open on startup
  let g:nerdtree_tabs_open_on_console_startup = 0
  let g:nerdtree_tabs_open_on_gui_startup = 0
"endif

" cscope
if has("cscope")
  set csto=0                                   
  set cst
  set nocsverb
  " add any database in current directory
  if filereadable("cscope.out")
    cs add cscope.out
    " else add database pointed to by environment
  elseif $CSCOPE_DB != ""
    cs add $CSCOPE_DB
  endif

  set cscopequickfix=s-,c-,d-,i-,t-,e-
  set csverb
endif


" load scripts
  source $VIM/scripts/arrowkeysAsTextshifters.vim

" Abbreviations
  abbr vd var_dump(
