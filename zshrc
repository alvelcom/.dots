alias ls="ls --color"
alias ll="ls -l"
alias grep="grep --color"

# Set up the prompt
autoload -Uz promptinit
promptinit

autoload colors
colors

# Allow for functions in the prompt.
setopt PROMPT_SUBST

# VCS_INFO
autoload -Uz vcs_info
precmd () { vcs_info }


# Set the prompt.
#PROMPT=$'%B[%{$fg[red]%}%n%{$reset_color%}%b@%B%{$fg[cyan]%}%m%b$(prompt_git_info)%{$reset_color%}%B]%b '

PROMPT='%B[%F{red}%n%b%f@%B%F{cyan}%m%b%f%B]%b '
RPROMPT='${vcs_info_msg_0_} %F{green}%4~%f'

# Force emacs key bindings
bindkey -e

# Keep 30000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=30000
SAVEHIST=30000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

# Appends every command to the history file once it is executed
# setopt inc_append_history
# Reloads the history whenever you use it
# setopt share_history
# Remove dups from history
setopt HIST_SAVE_NO_DUPS

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

zstyle ':vcs_info:*' enable hg git svn
zstyle ':vcs_info:(hg*|git*):*' check-for-changes true

zstyle ':vcs_info:*' formats "%F{magenta}⚡%s%c%u %b%f"
zstyle ':vcs_info:*' actionformats "%F{magenta}⚡%s♯%a%c%u %b%f"
zstyle ':vcs_info:*:*' unstagedstr "⚑"
zstyle ':vcs_info:*:*'   stagedstr "♼"

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
export PATH=$PATH:~/.cabal/bin
export EDITOR=vim


### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

