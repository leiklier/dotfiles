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
plugins+=(zsh-autosuggestions)

# > zsh-completions - additional completion definitions
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
# ==> ACTIVATE MISC SYSTEMS   #
###############################

# ==> Improved completion system
zstyle :compinstall filename ${HOME}/.zshrc
zstyle ':completion:*' list-colors "${(@s.:.)LS_COLORS}"
autoload -Uz compinit && compinit
autoload -Uz bashcompinit && bashcompinit

# ==> Prompt system
autoload -U promptinit; promptinit


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

###-begin-pm2-completion-###
### credits to npm for the completion file model
#
# Installation: pm2 completion >> ~/.bashrc  (or ~/.zshrc)
#

COMP_WORDBREAKS=${COMP_WORDBREAKS/=/}
COMP_WORDBREAKS=${COMP_WORDBREAKS/@/}
export COMP_WORDBREAKS

if type complete &>/dev/null; then
  _pm2_completion () {
    local si="$IFS"
    IFS=$'\n' COMPREPLY=($(COMP_CWORD="$COMP_CWORD" \
                           COMP_LINE="$COMP_LINE" \
                           COMP_POINT="$COMP_POINT" \
                           pm2 completion -- "${COMP_WORDS[@]}" \
                           2>/dev/null)) || return $?
    IFS="$si"
  }
  complete -o default -F _pm2_completion pm2
elif type compctl &>/dev/null; then
  _pm2_completion () {
    local cword line point words si
    read -Ac words
    read -cn cword
    let cword-=1
    read -l line
    read -ln point
    si="$IFS"
    IFS=$'\n' reply=($(COMP_CWORD="$cword" \
                       COMP_LINE="$line" \
                       COMP_POINT="$point" \
                       pm2 completion -- "${words[@]}" \
                       2>/dev/null)) || return $?
    IFS="$si"
  }
  compctl -K _pm2_completion + -f + pm2
fi
###-end-pm2-completion-###
