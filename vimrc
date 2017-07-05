" [This file is symlinked to ~/.vimrc]

" ====================  META  ====================

set nocompatible                  " Use Vim settings, rather than Vi settings (much better!).
                                  " This must be first, because it changes
                                  " other settings as a side effect
set exrc                          " Force sourcing of .vimrc in working directory
let mapleader=","                   " Change leader to a comma because the backslash is
                                    " too far away. That means all \x commands
                                    " turn into ,x. The mapleader has to be
                                    " set before vundle starts loading all the
                                    " plugins.

set showmode                      " Show current mode down the bottom
set visualbell                    " No sounds

" -----------  Vundle Initialization  -----------
" This loads all the plugins specified in ~/.vim/vundles.vim
" Use Vundle plugin to manage all other plugins
if filereadable(expand("~/.vim/vundles.vim"))
  source ~/.vim/vundles.vim
endif
au BufNewFile,BufRead *.vundle set filetype=vim


" ===================  COMMANDS  ==================
set history=1000                    " Store lots of :cmdline history
set showcmd                         " Show incomplete cmds down the bottom


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

" -------------------  Search  --------------------
set incsearch                       " Find the next match as we type the search
set hlsearch                        " Highlight searches by default
set ignorecase                      " Ignore case when searching...
set smartcase                       " ...unless we type a capital


" -------------------  Folds  ---------------------
set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default


" ==========  FILES & TEXT MANIPULATION  ===========
set autoread                        " Reload files changed outside vim
set hidden                          " This makes vim act like all other editors;
                                    " buffers can exist in the background
                                    " without being in a window
                                    " http://items.sjbach.com/319/configuring-vim-right
set backspace=indent,eol,start      " Allow backspace in insert mode

" ------------  Turn Off Swap Files  --------------
set noswapfile
set nobackup
set nowb

" --------------  Persistent Undo  ----------------
" Keep undo history across sessions, by storing in file.
" Only works all the time.
if has('persistent_undo') && !isdirectory(expand('~').'/.vim/backups')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

" ------------------  Clipboard  ------------------
set clipboard=unnamedplus           " Use system clipboard

" ====================  LINES  ====================

" Enable a hybrid of relative line numbering and absolute line numbering
set relativenumber
set number

" ----------------  Indentation  ----------------
set autoindent                      " Automatically indent text
set smartindent                     " Does the right thing (mostly)
                                    " in programs
set smarttab                        " Use tabs for indentation and
                                    " spaces for alignment
set shiftwidth=2                    " Indenting is 2 spaces
set softtabstop=-1                  " Width of softtabs (-1 => same as tabstop)
set tabstop=2                       " Tab characters [\t] appear 2 spaces wide
set expandtab                       " Don't use actual tab character
set cindent                         " Stricter rules for C programs

" Map [shift] + [tab] to "backtab" (de-indent)
" Command mode:
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
set list listchars=tab:\ \ ,trail:·

set nowrap                          "Don't wrap lines
set linebreak                       "Wrap lines at convenient points

" =====================  SYNTAX  ===================
syntax on                           " Turn on syntax highlighting


" ================  CUSTOM SETTINGS ================
so ~/dotfiles/vim/settings.vim
