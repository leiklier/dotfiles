" ========================================
" Vim plugin configuration
" ========================================
"
" This file contains the list of plugin installed using vundle plugin manager.
" Once you've updated the list of plugin, you can run vundle update by issuing
" the command :BundleInstall from within vim or directly invoking it from the
" command line with the following syntax:
" vim --noplugin -u vim/vundles.vim -N "+set hidden" "+syntax on" +BundleClean! +BundleInstall +qall
" Filetype off is required by vundle
filetype off

set rtp+=~/.vim/bundle/vundle/
set rtp+=~/.vim/vundles/ "Submodules
call vundle#rc()

" let Vundle manage Vundle (required)
Plugin 'VundleVim/Vundle.vim'

" dotfiles' vundles are split up by category into smaller files
" This reduces churn and makes it easier to fork. See
" ~/.vim/vundles/ to edit them:
runtime first_loaded.vundle             " Plugins that should be loaded before all other plugins
runtime textmanipulation.vundle         " Plugins that makes manipulating text easier
runtime navigation.vundle               " Plugins that makes navigating files and text easier
runtime languages.vundle
runtime git.vundle
runtime appearance.vundle
runtime textobjects.vundle
runtime vim-improvements.vundle
runtime last_loaded.vundle              " Plugins that should be loaded after all other plugins

" The plugins listed in ~/.vim/.vundles.local will be added here to
" allow the user to add vim plugins to dotfiles without the need for a fork.
if filereadable(expand("~/dotfiles/vim/.vundles.local"))
  source ~/dotfiles/vim/.vundles.local
endif

"Filetype plugin indent on is required by vundle
filetype plugin indent on
