# Author: Leik Lima-Eriksen
# Created: June 2017

#!/bin/bash

# CONSTANTS:
OLD_DEFAULT=~/dotfiles.old
DOT_DEFAULT=~/dotfiles

# ==================== Configuration / User input ===========================

# ======== Display information ==========

echo "
#############################################################
#############################################################
###                                                       ###
###                  Leik Lima-Eriksen's                  ###
###                                                       ###
###                       Dotfiles                        ###
###                                                       ###
#############################################################
#############################################################
"


# Output some important info about this script:
echo "
You are about to download and install the dotfiles belonging to
Leik Lima-Eriksen. Many of the settings are very personal, and might
not fit your style. My dotfiles will replace those already available
in you home-directory. You may choose to save a backup to ${OLD}
during the installation process.
"

# ============ Accept user input ===========

# Choose installation-destination:
echo "Please enter the directory in which the repository should be cloned:"
echo "(Default: ${DOT_DEFAULT}. Press [ENTER] for default)"

read DOT_INPUT

# Use $DOT_INPUT if string was inserted; else use DOT_DEFAULT
if [ ${#DOT_INPUT} -gt 0 ]
then
  DOT="${DOT_INPUT}/dotfiles"
else
  DOT=$DOT_DEFAULT
fi

# [TODO] Prompt if user want a backup of dotfiles:
while true; do
  read -p "Do you want to backup dotfiles?" yn
  case $yn in
    [Yy]* ) BACKUP=true; OLD=$OLD_DEFAULT; break;;
    [Nn]* ) BACKUP=false; OLD="/tmp/dotfiles.old"; break;;
    * ) echo "Please answer [y]es or [n]o.";;
  esac
done

# ======== Display a summary of settings =======
echo "
Please review your settings before beginning the installation:

Installation destination:   $DOT
"
# Show backup-path if user selected to take backup:
if $BACKUP
then
  echo "Old dotfiles will be stored in    ${OLD}"
else
  echo "Old dotfiles will be moved to ${OLD}. This directory will be
  deleted on next boot"
fi


# ================== Abort installation? =====================
while true; do
  read -p "\n\nDo you wish to proceed?" yn
  case $yn in
    [Yy]* ) break;;
    [Nn]* ) exit;;
    * ) echo "Please answer [y]es or [n]o.";;
  esac
done

# ================= Installation of dotfiles: =================

# Download the repo to $DOT
echo "Downloading the dotfiles-repository to $DOT"
git clone git@github.com:leiklier/dotfiles.git $DOT
cd $DOT
git submodule update --init # Pull all submodules

#=======================  Back up old dotfiles to $OLD ==============================
echo "Backing up all old dotfiles to $OLD and symlinking new dotfiles to home-directory"
cd ~
mkdir $OLD

# ================ Sh ===============
# Backup:
mv .profile $OLD

# Link new dotfiles:
ln -s ${DOT}/sh/runcoms/profile .profile

# =============== Bash ==============
# Backup:
mv .bash_it $OLD

mv .bash_logout $OLD
mv .bash_profile $OLD
mv .bash_aliases $OLD
mv .bashrc $OLD

# Link new dotfiles:
ln -s ${DOT}/bash/bash_it .bash_it

ln -s ${DOT}/bash/runcoms/bash_logout .bash_logout
ln -s ${DOT}/bash/runcoms/bash_profile .bash_profile
ln -s ${DOT}/bash/runcoms/bash_aliases .bash_aliases
ln -s ${DOT}/bashrc .bashrc


# =============== Zsh ===============
# Backup:
mv .oh-my-zsh $OLD
mv .zfunctions $OLD

mv .zlogin $OLD
mv .zlogout $OLD
mv .zprofile $OLD
mv .zshenv $OLD
mv .zshrc $OLD

# Link new dotfiles:
ln -s ${DOT}/zsh/oh-my-zsh .oh-my-zsh

ln -s ${DOT}/zsh/runcoms/zfunctions .zfunctions
ln -s ${DOT}/zsh/runcoms/zlogin .zlogin
ln -s ${DOT}/zsh/runcoms/zlogout .zlogout
ln -s ${DOT}/zsh/runcoms/zprofile .zprofile
ln -s ${DOT}/zsh/runcoms/zshenv .zshenv
ln -s ${DOT}/zshrc .zshrc

# =============== git =================
# Backup:
mv .gitconfig $OLD
mv .gitconfig.local $OLD
mv .gitignore $OLD

# Link new dotfiles:
ln -s ${DOT}/git/gitconfig .gitconfig
ln -s ${DOT}/git/gitconfig.local .gitconfig.local
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

# Compile YouCompleteMe with all targets:
cd ~/.vim/bundle/YouCompleteMe && ./install.py --all

# ==================== Finished! ======================
# Inform user:
echo "SUCCESS!\n"
echo "Leik Lima-Eriksen's dotfile-repo has been successfully installed in your home-directory\n"
echo "Your old dotfiles have been moved to ${OLD}. You may delete this directory at any time\n"
echo "To update, run\ncd ~/dotfiles && git pull origin"

