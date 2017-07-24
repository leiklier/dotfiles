# Prevent TRAMP in emacs  from crashing (remote access to this computer)
[[ $TERM == "dumb" ]] && unsetopt zle && PS1='$ ' && return

# Allow GPG2-signing in git
export GPG_TTY=$(tty)

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$HOME/bin:/usr/local/bin:/home/leiklier/anaconda3/bin:/opt/metasploit-framework/bin:/Library/TeX/texbin:$PATH

# Include "dot-*"-commands in $PATH:
export PATH=${DOT}/bin:${DOT}/bin/dot:$PATH

# Import ~/.bashrc and ~/.profile
[[ -e ~/.profile ]] && emulate sh -c 'source ~/.profile'

# Path to the oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set default user
# This hides "user@hostname" when locally logged in.
#DEFAULT_USER="leiklier"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes

# DEFAULT:
# ZSH_THEME="robbyrussell"

# CURRENT:
ZSH_THEME="" # Disabled in order to use Pure theme

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Allow oh-my-zsh to automatically update itself without prompting
DISABLE_UPDATE_PROMPT=true

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
#ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=$HOME/.zsh_custom

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(z zsh-completions autojump git  extract  zsh-syntax-highlighting base16-shell zsh-nvm)

source $ZSH/oh-my-zsh.sh

# Enable Quick Command-line File Completion
[[ -s "$HOME/.qfc/bin/qfc.sh" ]] && source "$HOME/.qfc/bin/qfc.sh"


# Enable autojump
# [ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zs# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconfig='mate ~/.zshrc'
alias ohmyzsh='mate ~/.oh-my-zsh'
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

eval $(thefuck --alias)
# The following lines were added by compinstall

#zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
#zstyle :compinstall filename '/Users/leiklier/.zshrc'

# autoload -Uz compinit
# compinit
# End of lines added by compinstall
#\\\_ COMPLETIONS _///#
zstyle :compinstall filename '/Users/fd0/.zshrc'
zstyle ':completion:*' list-colors "${(@s.:.)LS_COLORS}"
autoload -Uz compinit
compinit
autoload -Uz bashcompinit
bashcompinit

autoload -U compinit && compinit

# Additional customization (Categorized)
for config_file (${DOT}/zsh/runcoms/interactive/*.zsh) source $config_file

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

