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
  "nnoremap <F5> :GundoToggle<CR>
  nnoremap <F5> :TagbarToggle<CR>
  nnoremap <F6> :NERDTreeMirrorToggle<CR>

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
    noremap <leader>f <C-F>
    noremap <leader>u <C-U>

  " tab-navigation
    map <leader>tt :tabnew<cr>
    map <leader>tn :tabnext<cr>
    map <leader>tp :tabprevious<cr>
    map <leader>tf :tabfirst<cr>
    map <leader>tl :tablast<cr>
    map <leader>tm :tabmove
    "map <leader>to :tabonly<cr>
    "map <leader>te :tabedit
 
  " buffer-navigation
    map <leader>bn :bnext<cr>
    map <leader>bp :bprev<cr>
    map <leader>bd :bdelete<cr>
    map <leader>bf :bfirst<cr>
    map <leader>bl :blast<cr>
    map <leader>ba :bad

  " mappings for split-window navigation
  " with resizing
    map <silent> <C-h> <C-w>5<
    map <silent> <C-j> <C-W>5-
    map <silent> <C-k> <C-W>5+
    map <silent> <C-l> <C-w>5>

" code-foo
syntax enable 			"enable syntax-highlighting by default
set ruler

"if version > 720
	set relativenumber "display how far away each line is from the current one, instead absolute line number
"else
	"set number
"endif    

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



  if has("gui_running")
    set guioptions=-t " hide toolbar
    set gcr=n-v-c:block-Cursor/block-Cursor-blinkon0-blinkoff0,i-ci:hor30-Cursor-blinkwait500-blinkon500-blinkoff500
    set gfn=Menlo:h12 " set font

    "universal settings in MacVim GUI
    let guiColorScheme = "PartyBee"
    if (exists("guiColorScheme"))
      colorscheme PartyBee
      set cursorline
    else
      colorscheme default            " load colorscheme default
    endif
  else
    " ------------------------------------------------------------------
    " Solarized Colorscheme Config
    " ------------------------------------------------------------------
    let g:solarized_termtrans=0
    let g:solarized_degrade=0
    let g:solarized_bold=1
    let g:solarized_underline=1
    let g:solarized_italic=1
    let g:solarized_termcolors=16
    let g:solarized_contrast="normal"
    let g:solarized_visibility="low"
    let g:solarized_menu=1
    let g:solarized_diffmode="high" "default value is normal

    set background=dark
    colorscheme solarized
  endif


" tabs & spaces 
	 set expandtab "use spaces for indentation (instead of tabs)
	 set tabstop=2
	 set softtabstop=2
	 set shiftwidth=2

" NerdTreeTabs-Config
if has("NERDTree")
  let g:nerdtree_tabs_open_on_console_startup = 0
  let g:nerdtree_tabs_open_on_gui_startup = 0
endif

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

" vimux
  " Prompt for a command to run
  "<Leader>vp :VimuxPromptCommand<CR>

" load scripts
  source $VIM/scripts/arrowkeysAsTextshifters.vim
  source $VIM/scripts/shell.vim
  source $VIM/bundle/solarized/autoload/togglebg.vim
