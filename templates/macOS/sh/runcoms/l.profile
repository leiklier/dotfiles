# ~/.l.profile: executed by the command interpreter for login shells.
# the ".l"-prefix indicates that this file is a local file only, 
# and is not tracked by git in the $DOT-directory. 
# Changes made in this file will persist when updating the dotfiles-repository

#######################################################
# ==> $PATH                                           #
#######################################################

# -----------

# DESCRIPTION:
# $PATH is an file location related environment variable.
# When one types a command to run, the system looks for it in the directories 
# specified by PATH in the order specified.

# -----------

# USAGE:
# Here the $PATH should be set. Each part of it should be 
# described with its content/purpose

# -----------

# Anaconda
export PATH=/usr/local/anaconda3/bin:$PATH

# Metasploit
export PATH=/opt/metasploit-framework/bin:$PATH

# TeX
export PATH=/Library/TeX/texbin:$PATH



# ------------------------------------------------------------------
# [Tell vim to use sh-syntax for this file. Should be the last line]
# vim: filetype=sh
