" [This file is symlinked to ~/.vimrc]

" ==============  META & GENERAL  =================

set nocompatible                    " Use Vim settings, rather than Vi settings (much better!).
                                    " This must be first, because it changes
                                    " other settings as a side effect
set lazyredraw                      " Don't redraw while executing macros (good performace config)
set ttyfast                         " Quicker scrolling (less or no lag)
set exrc                            " Force sourcing of .vimrc in working directory
let mapleader=","                   " Change leader to a comma because the backslash is
                                    " too far away. That means all \x commands
                                    " turn into ,x. The mapleader has to be
                                    " set before vim-plug starts loading all the
                                    " plugins.
let g:mapleader=","                 " ---------------- || -------------------
let g:maplocalleader="-"

set title                           " Make xterm inherit title from filename
set showmode                        " Show current mode down the bottom
set ttimeoutlen=0                   " Instant switching between modes

"No annoying sound on errors
set noerrorbells
set novisualbell

" Properly disable sound on errors on MacVim
if has("gui_macvim")
    autocmd GUIEnter * set vb t_vb=
endif

" Ensure that vim starts with a server, if it is
" possible from vimscript
if empty(v:servername) && exists('*remote_startserver')
  call remote_startserver('VIM')
endif

" -----------  vim-plug Initialization  -----------
" Automatic installation of vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source "~/.vimrc"
endif

" This loads all the plugins specified in ~/.vim/vim-plugs.vim
" Use vim-plug plugin to manage all other plugins
if filereadable(expand("~/.vim/vim-plugs.vim"))
  source ~/.vim/vim-plugs.vim
endif
au BufNewFile,BufRead *.vim-plug set filetype=vim


" =================== APPEARANCE  =================

" -------------------  Themes  --------------------
" Make vim use our base16 color scheme
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

"Also, make airline use our base16 color scheme
let g:airline_theme='base16'

" ============  STATUS LINE & COMMANDS  ===========
"set shell=bash\ -i                  " Set interactive bash as the default Vim shell
set history=1000                    " Store lots of :cmdline history
set wildmenu                        " Show command-suggestions when pressing [tab]
set wildmode=full                   " When showing command-suggestions; show all matching
                                    " commands
set showcmd                         " Show incomplete cmds down the bottom

" Smart mappings on the command line
cno $h e ~/
cno $d e ~/Desktop/
cno $j e ./
cno $c e <C-\>eCurrentFileDir("e")<cr>

" Format the status line
"set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

" ================  FONTS & ENCODING =============
" Set utf8 as standard encoding
set encoding=utf8
" Support for vim-devicons and other icons
set guifont=Sauce\ Code\ Pro\ Medium\ Nerd\ Font\ Complete:h13

" ==================  NAVIGATION  ================

" --------------------  Mouse  --------------------
set mouse=a                         " Enable mouse point-and-click in vim
let g:NERDTreeMouseMode=3           " Enable mouse click in NERDTree

" Scrolling
set scrolloff=8                     " Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1


" -------------------  Cursor  --------------------
set gcr=a:blinkon0                  " Disable cursor blink
set cursorline                      " Highlight cursorline

" Don't move the cursor when leaving insert mode
" (WARNING: This may cause certain vim-plugs to misbehave)
au InsertLeave * call cursor([getpos('.')[1], getpos('.')[2]+1])

" Jump to last known cursor position when reopening a file
"         ( Position is saved to ~/.viminfo )
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif

" -------------------  Search  --------------------
set incsearch                       " Find the next match as we type the search
set hlsearch                        " Highlight searches by default
set ignorecase                      " Ignore case when searching...
set smartcase                       " ...unless we type a capital


" -------------------  Folds  ---------------------
set foldmethod=indent               "fold based on indent
set foldnestmax=3                   "deepest fold is 3 levels
set nofoldenable                    "dont fold by default


" ==========  FILES & TEXT MANIPULATION  ===========
set autoread                        " Reload files changed outside vim
set hidden                          " This makes vim act like all other editors;
                                    " buffers can exist in the background
                                    " without being in a window
                                    " http://items.sjbach.com/319/configuring-vim-right
set backspace=indent,eol,start      " Allow backspace in insert mode
set whichwrap+=<,>,h,l              " =================== || ========================

" -------------  Swap Files & Backups  -------------
" Disable creation of swap files & backups because
" they are more annoying than helpful
set noswapfile
set nobackup
set nowb

" --------------------  Undo  ----------------------
set undofile                        " Save undos after file closes
set undodir=~/.vim/.undo//          " Directory in which to save history
set undolevels=1000                 " Max number of undos to store
set undoreload=10000                " Max number of lines in undo-file

" ------------------  Clipboard  ------------------
set clipboard=unnamedplus           " Use system clipboard

" ====================  LINES  ====================

" Enable a hybrid of relative line numbering and absolute line numbering
set relativenumber
set number

" ----------------  Word wrapping  ----------------
" As default, do not wrap words (annoying when writing code):
set nowrap                          " Don't wrap lines
set linebreak                       " Wrap lines at convenient points

" Wrap lines correctly when editing text:
au BufRead,BufNewFile *.txt,*.tex,*.md,*.markdown,*.html set wrap linebreak nolist textwidth=0 wrapmargin=0 formatoptions-=t
" => [EXPLANATION]
"set wrap                            " Word wrap visually (do not change text in buffer)
"set linebreak                       " Only wrap at a character in the breakat option
"set nolist                          " List disables linebreak
"set textwidth=0                     " Prevent Vim from automatically inserting line breaks
"                                    " in newly inserted text.
"set wrapmargin=0                    " ====================== || ===========================
"set formatoptions-=t                " Prevent Vim from automatically reformat when typing on
"                                    " existing lines.

" ----------------  Indentation  ----------------
set autoindent                      " Automatically indent text
set smartindent                     " Does the right thing (mostly)
                                    " in programs
set smarttab                        " Use tabs for indentation and
                                    " spaces for alignment
set shiftwidth=2                    " Indenting is 2 spaces
set softtabstop=-1                  " Width of softtabs (-1 => same as tabstop)
set tabstop=2                       " Tab characters [\t] appear 2 spaces wide
"set expandtab                       " Don't use actual tab character
set cindent                         " Stricter rules for C programs

" Map <Tab> to indent and <Shift> + <Tab> to de-indent
" Command mode:
nnoremap <Tab> >>
nnoremap <S-Tab> <<
" Insert mode: [TODO: DOES NOT CURRENTLY WORK!]
inoremap <S-Tab> <C-d>
" Tab and backtab in visual-mode:
vnoremap <Tab> >>
vnoremap <S-Tab> <<


" Auto indent pasted text
nnoremap p p=`]<C-o>
nnoremap P P=`]<C-o>

filetype plugin on
filetype indent on

" Display tabs and trailing spaces visually
set list listchars=tab:\⋮\ ,trail:·

" =====================  SYNTAX  ===================
syntax on                           " Turn on syntax highlighting


" ================  CUSTOM SETTINGS ================
so ~/.vim/settings.vim
