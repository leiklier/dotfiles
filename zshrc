#################################
# ==> FIXES                     #
#################################

# => Prevent TRAMP in emacs from crashing
# ( remote access to this computer )
[[ $TERM == "dumb" ]] && unsetopt zle && PS1='$ ' && return

#################################
# ==> META OH-MY-ZSH            #
#################################

# => PATH to the oh-my-zsh installation
export ZSH=~/.oh-my-zsh

# => PATH to custom zsh-files, such as custom plugins
ZSH_CUSTOM=$HOME/.zsh_custom

# => UPDATES
# > Allow oh-my-zsh to automatically update itself without prompting
DISABLE_UPDATE_PROMPT=true

################################
# ==> APPEARANCE               #
################################

# => THEME
ZSH_THEME=""                   # Disabled in order to use the Pure theme

# => Show WAITING DOTS whilst waiting for <tab>-completion
COMPLETION_WAITING_DOTS="true"

# => set DEFAULT_USER
# ( This hides "user@hostname" from prompt when logged in )
DEFAULT_USER="leiklier"

################################
# ==> PLUGINS                  #
################################

# => OH-MY ZSH Plugins
# [DECLARE $plugins]
plugins=()

# > base16-shell - Terminal theming
plugins+=(base16-shell)

# > zsh-syntax-highlighting - highlight syntax in zsh
plugins+=(zsh-syntax-highlighting)

# > per-directory-history - history follows the $PWD
plugins+=(per-directory-history)

# > zsh-autosuggestions - fish-like autosuggestions based on command history
plugins+=(zsh-completions)

# > z - intelligent jumping between directories
plugins+=(z)

# > git - handy aliases and shorthands for git
plugins+=(git)

# zsh-nvm - Node Version Manager
plugins+=(zsh-nvm)

# extract - defines a function called 'extract' that extracts the archive file you pass it
plugins+=(extract)

###############################
# ==> COMPLETIONS             #
###############################

# TODO: Document this section
zstyle :compinstall filename '/Users/fd0/.zshrc'
zstyle ':completion:*' list-colors "${(@s.:.)LS_COLORS}"
autoload -Uz compinit
compinit
autoload -Uz bashcompinit
bashcompinit

autoload -U compinit && compinit

###############################
# ==> ADDITIONAL CONFIG       #
###############################

# => Misc from $DOT
for config_file (${DOT}/zsh/runcoms/interactive/*.zsh) source $config_file

# => iTerm Shell Integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"


###############################
# ==> LOCAL CONFIG            #
###############################

if [ -e $HOME/.l.zshrc ]; then
  . $HOME/.l.zshrc
fi




     ##########################################################################
###### [WARNING: Please do not put anything below these sections of the file] ######
     ##########################################################################

###############################
# ==> LOAD OH-MY-ZSH          #
###############################

source $ZSH/oh-my-zsh.sh

###############################
# ==> LOAD PURE THEME         #
###############################

prompt pure

