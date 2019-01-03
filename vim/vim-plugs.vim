" ========================================
" Vim plugin configuration
" ========================================
"
" This file contains the list of plugin installed using vim-plug plugin manager.
set rtp+=~/.vim/vim-plugs/
call plug#begin('~/.vim/plugged')

" dotfiles' vim-plugs are split up by category into smaller files
" This reduces churn and makes it easier to fork. See
" ~/.vim/vim-plugs/ to edit them:
runtime first_loaded.vim-plug             " Plugins that should be loaded before all other plugins
runtime textmanipulation.vim-plug         " Plugins that makes manipulating text easier
runtime navigation.vim-plug               " Plugins that makes navigating files and text easier
runtime languages.vim-plug
runtime git.vim-plug
runtime appearance.vim-plug
runtime textobjects.vim-plug
runtime vim-improvements.vim-plug
runtime last_loaded.vim-plug              " Plugins that should be loaded after all other plugins

" The plugins listed in ~/.vim/l.vim-plugs.vim will be added here to
" allow the user to add vim plugins without the need for a fork.
if filereadable(expand("~/.vim/l.vim-plugs.vim"))
  source ~/.vim/l.vim-plugs.vim
endif

call plug#end()
