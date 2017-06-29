#!/bin/bash

# Download the repo to ~/dotfiles
DOT=~/dotfiles
echo "Downloading the dotfiles-repository to $DOT"
git clone git@github.com:leiklier/dotfiles.git $DOT
cd $DOT
git submodule update --init # Pull all submodules

# Back up old dotfiles to ~/dotfiles.old
OLD=~/dotfiles.old
echo "Backing up all old dotfiles to $OLD and symlinking new dotfiles to home-directory"
cd ~
mkdir $OLD

# =============== Bash ==============
# Backup:
mv .bash_logout $OLD
mv .bash_profile $OLD
mv .bashrc $OLD

# Link new dotfiles:
ln -s ${DOT}/bash/runcoms/bash_logout .bash_logout
ln -s ${DOT}/bash/runcoms/bash_profile .bash_profile
ln -s ${DOT}/bashrc .bashrc

# =============== Zsh ===============
# Backup:
mv .oh-my-zsh $OLD
mv .zlogin $OLD
mv .zlogout $OLD
mv .zprofile $OLD
mv .zshenv $OLD
mv .zshrc $OLD

# Link new dotfiles:
ln -s ${DOT}/zsh/oh-my-zsh .oh-my-zsh
ln -s ${DOT}/zsh/runcoms/zlogin .zlogin
ln -s ${DOT}/zsh/runcoms/zlogout .zlogout
ln -s ${DOT}/zsh/runcoms/zprofile .zprofile
ln -s ${DOT}/zsh/runcoms/zshenv .zshenv
ln -s ${DOT}/zshrc .zshrc

# =============== git =================
# Backup:
mv .gitconfig $OLD
mv .gitignore $OLD

# Link new dotfiles:
ln -s ${DOT}/git/gitconfig .gitconfig
ln -s ${DOT}/git/gitignore .gitignore

# ============== tmux =================
# Backup:
mv .tmux $OLD
mv .tmux.conf $OLD

# Link new dotfiles:
ln -s ${DOT}/tmux .tmux
ln -s ${DOT}/tmux.conf .tmux.conf

# ============== vim ===================
# Backup:
mv .vim $OLD
mv .vimrc $OLD
mv .inputrc $OLD

# Link new dotfiles:
ln -s ${DOT}/vim .vim
ln -s ${DOT}/vimrc .vimrc
ln -s ${DOT}/vimify/inputrc .inputrc

# ============= emacs ====================
# Backup:
mv .emacs.d $OLD
mv .spacemacs $OLD

# Link new dotfiles:
ln -s ${DOT}/emacs.d .emacs.d
ln -s ${DOT}/spacemacs .spacemacs


# =============== Install plugins with vundle: =======
vim +PluginInstall +qall

# Finished! Inform user:
echo "SUCCESS!\n"
echo "Leik Lima-Eriksen's dotfile-repo has been successfully installed in your home-directory\n"
echo "Your old dotfiles have been moved to ~/dotfiles.old. You may delete this directory at any time\n"
echo "To update, run\ncd ~/dotfiles && git pull origin"

