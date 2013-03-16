" pathogen config
execute pathogen#infect()

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
"set tags+=tags;/

" autocommands and some other magic
if has("autocmd")
  " disable all autocmds for the current group, to counter multiple execution
  autocmd!
  " general autocmds
  "autocmd! BufNewFile,BufReadPre *.php* :map <Leader>t :w\|:!php -l %<cr>
  "autocmd! BufNewFile,BufReadPre *.php* :map <Leader>r :w\|:!phpunit %<cr>
  "autocmd! BufWinEnter *.php* let w:m2=matchadd('ColumnMargin', "'\%>80v.\+', -1) " highlight lines longer than 79 chars
  "autocmd FileType NERD_tree_1 setlocal winwidth=80 " currently not working
  filetype plugin indent on                   " currently used by NERDcommenter
  augroup vimrc_autocmds
    "autocmd BufEnter * highlight OverLength ctermbg=darkgrey
    "autocmd BufEnter * match OverLength /\%74v.*/
  augroup END
endif

" follow the leaders
" Key Mappings
  let mapleader =   ","  " remap leader key
  let g:mapleader = ","  " remap leader key in MacVim GUI

" solarized
  " toggle light/dark background for solarized theme
  map <leader>s :ToggleBG<CR>

" vimux
  " Prompt for a command to run map
  map<Leader>vp :VimuxPromptCommand<CR>

  " Run last command executed by VimuxRunCommand
  map <Leader>vl :VimuxRunLastCommand<CR>

  " Close vim tmux runner opened by VimuxRunCommand
  map <Leader>vq :VimuxCloseRunner<CR>

" fuzzyfinder
  map <leader>f :FufTaggedFile<cr>
  map <leader>C :FufChangeList<cr>
  map <leader>F :FufFile<cr>
  map <leader>b :FufBuffer<cr>
  map <leader>j :FufJumpList<cr>

" ctags
  " jump to class under cursor
  map <leader><space> <C-]> 

" map <leader><space> to clear highlighted searchresults when done
  nnoremap <leader>h :noh<cr>

" additional views
  nnoremap <leader>t :TagbarToggle<CR>
  nnoremap <leader>n :NERDTreeToggle<CR>
  nnoremap <leader>N :NERDTreeMirrorToggle<CR>

" convenience
  map <leader>w :w<cr>
  " remap jj to ESC
  "inoremap jj <ESC>
  noremap ; :

  set pastetoggle=<F8>

  inoremap <tab> <C-N>
  inoremap <S-tab> <C-P>

  " tab to scroll a few lines up/down
  noremap <tab> <C-E>
  noremap <S-tab> <C-Y>

" tabs, buffers & splits
  " tab-navigation
  map <leader>, :tabnext<cr>
  map <leader>. :tabprevious<cr>
  map <leader>tf :tabfirst<cr>
  map <leader>tl :tablast<cr>
  map <leader>tm :tabmove
  map <leader>te :tabedit
  map <leader>tt :tabnew<cr>
  "map <leader>to :tabonly<cr>

  " buffer-navigation
  noremap <C-n> :bnext<cr>
  noremap <C-b> :bprev<cr>
  map <leader>ba :bad
  map <leader>bd :bdelete<cr>
  map <leader>bf :bfirst<cr>
  map <leader>bl :blast<cr>

  " resize splits
  map <silent> <C-h> <C-w>15<
  map <silent> <C-j> <C-W>15-
  map <silent> <C-k> <C-W>15+
  map <silent> <C-l> <C-w>15>

" code-foo
  " enable syntax-highlighting by default
  syntax enable 			

" folding
  "set foldmethod=manual "set folding-method

" search (and replace)
  " make searches use normal regexes
  set ignorecase 			" all-lowercase string = search is case-insensitive
  set smartcase 			" string with some uppercased letters = search is case-sensitive
  set incsearch 			" highlight searchresults while typing
  set hlsearch  			" highlight searchresults generally

" command-line
  set cmdheight=1  " height of the commd line
  set laststatus=2 " Show the status line all the time
  set showcmd      " show commands
  set history=700  " remember 700 steps for history
  set ruler
  set cursorline
  set relativenumber

" tabs & spaces 
  set expandtab "use spaces for indentation (instead of tabs)
  set tabstop=2
  set softtabstop=2
  set shiftwidth=2

" NerdTree-Config
  let g:NERDTreeDirArrows=0 " don't use fancy arrows
  let NERDTreeWinSize = 40 " need. moar. letturs.
  let NERDTreeShowBookmarks = 1

" cscope
  "if has("cscope")
    "set csto=0                                   
    "set cst
    "set nocsverb
    "" add any database in current directory
    "if filereadable("cscope.out")
      "cs add cscope.out
      "" else add database pointed to by environment
    "elseif $CSCOPE_DB != ""
      "cs add $CSCOPE_DB
    "endif

    "set cscopequickfix=s-,c-,d-,i-,t-,e-
    "set csverb
  "endif

  set tags=~/dev/renego/renego.tags


" load scripts
  source $VIM/scripts/arrowkeysAsTextshifters.vim
  source $VIM/bundle/vim-colors-solarized/autoload/togglebg.vim

" Abbreviations
  abbr vd var_dump(

" colors & gui-settings
  set background=dark
  colorscheme solarized

  if has("gui_running")
    set guioptions=-t " hide toolbar
    set gcr=n-v-c:block-Cursor/block-Cursor-blinkon0-blinkoff0,i-ci:hor30-Cursor-blinkwait500-blinkon500-blinkoff500
    set gfn="Source Code Pro":h14 " set font
  endif
