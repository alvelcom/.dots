if [ -r /proc/loadavg ] && [[ `cut -f1 -d' ' /proc/loadavg` > 3 ]]
then
    echo "zsh running in failsafe mode"
    export FAIL_SAFE=1
else
    export FAIL_SAFE=""
fi

# Set up the prompt
autoload -Uz promptinit
promptinit

autoload colors
colors

# Allow for functions in the prompt.
setopt PROMPT_SUBST

# VCS_INFO
if [ -z "$FAIL_SAFE" ]
then
    autoload -Uz vcs_info
    precmd () { vcs_info }
fi


# Set the prompt.
if ! ps -p $PPID | grep -q "mc"; then
    PROMPT='%B[%F{red}%n%b%f@%B%F{cyan}%m%b%f%B]%b '
    RPROMPT='${vcs_info_msg_0_} %F{green}%2~%f'
else
    PROMPT="> "
fi

# Force emacs key bindings
bindkey -e

autoload -U edit-command-line
zle -N edit-command-line
bindkey '^xe' edit-command-line
bindkey '^x^e' edit-command-line

# Keep 30000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=30000
SAVEHIST=30000
HISTCONTROL=ignorespace:ignoredups
HISTFILE=~/.zsh_history

# Appends every command to the history file once it is executed
# setopt inc_append_history
# Reloads the history whenever you use it
# setopt share_history
# Remove dups from history
setopt HIST_SAVE_NO_DUPS


# Use modern completion system
autoload -Uz compinit
compinit

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

if [ -z $FAIL_SAFE ]
then
    zstyle ':vcs_info:*' enable hg git svn
    zstyle ':vcs_info:(hg*|git*):*' check-for-changes true

    zstyle ':vcs_info:*' formats "%F{magenta} %c%u %b%f"
    zstyle ':vcs_info:*' actionformats "%F{magenta} ♯%a%c%u %b%f"
    zstyle ':vcs_info:*:*' unstagedstr "unst"
    zstyle ':vcs_info:*:*'   stagedstr "st"
fi

if which vim &> /dev/null; then
    export EDITOR=vim
    alias vi=vim
elif which vi &> /dev/null; then
    export EDITOR=vi
fi

stat_bin=stat
if which gstat &> /dev/null; then
    stat_bin=gstat
fi

alias ls="ls"
alias ll="ls -l"
alias grep="grep --color"
alias changedfiles="find . -type f -not -path '*/.git/*' -print0 | xargs -0 "${stat_bin}" --format '%Z :%z %n' | sort -nr | cut -d: -f2- | head -n 20"

export LANG=en_US.UTF-8
export PATH=~/.cargo/bin:~/.cabal/bin:~/.rvm/bin:~/.bin:$PATH:/bin:/usr/bin:/usr/local/bin

export GOPATH=~/go
export GOBIN=~/go/bin
export PATH="$PATH:$GOBIN"
export PATH=$PATH:/usr/local/opt/go/libexec/bin

export GPG_TTY="$(tty)"

[ -r ~/.dots/zshrc_local ] && source ~/.dots/zshrc_local
