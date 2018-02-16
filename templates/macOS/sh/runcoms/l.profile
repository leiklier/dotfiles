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

####################################################################
# ==> ETC VARIABLES                                                #
####################################################################

# ==> plnxr - Poloniex trading cli-tool

export POLONIEX_API_KEY="3QRF11TA-AI632CZJ-9LE4M1QV-660PKNOD"
export POLONIEX_API_SECRET="2d473cb94c2e813cfb49518865b60c9d023c7fac97c38713ff4fb34db3519fd5bb1536b257e1adb10d99ebf5085c04d2c6f85e32a9d8c5eafc8cbaa0b82cbbc8"
