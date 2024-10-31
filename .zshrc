
# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored
zstyle :compinstall filename '/home/filip/.zshrc'

HISTFILE=~/.zsh-histfile
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
alias history='history 0'

bindkey -e
# End of lines configured by zsh-newuser-install

alias hconf='nvim ~/.config/hypr/hyprland.conf'
alias kittyconf='nvim ~/.config/kitty/kitty.conf'
alias wayconf='nvim ~/.config/waybar/'
alias nconf='nvim ~/.config/nvim/'
alias yeet='yay -Rs'
alias v='nvim'
alias ctl='systemctl'
alias cat='bat'
alias lock='hyprlock'
alias cd='z'
alias update='yay -Syyu --noconfirm --answerclean All --answerdiff All'
alias suspend='systemctl suspend && exit'
alias windows='sudo grub-reboot 2 && reboot'
# Because the shell only checks the first word for an alias this has to be done 
# to make aliases avaialble when using sudo 
# https://askubuntu.com/questions/22037/aliases-not-available-when-using-sudo
alias sudo='sudo '

setopt nobeep

# Fish like syntax highlighting: https://github.com/zsh-users/zsh-syntax-highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Fish Like inline autosuggestions: https://github.com/zsh-users/zsh-autosuggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Fish like history suubstring search: https://github.com/zsh-users/zsh-history-substring-search
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

source <(fzf --zsh)

# Git completion
# source /usr/share/git/completion/git-completion.zsh

# Completion
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'       # Case insensitive tab completion
zstyle ':completion:*' rehash true                              # automatically find new executables in path 
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"         # Colored completion (different colors for dirs/files/etc)
zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' menu select
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle ':completion:*:descriptions' format '%U%F{cyan}%d%f%u'

# autoload zkbd
# zkbd

# Speed up completions
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.cache/zcache

# KEY BINDINGS
# source ~/.zkbd/$TERM-${${DISPLAY:t}:$VENDOR-$OSTYPE}

bindkey '^[[H' beginning-of-line  # Home Key
bindkey '^[[F' end-of-line        # End Key

bindkey '^H' backward-kill-word   # Ctrl + Backspace to delete whole word
bindkey '5~' kill-word            # Ctrl + Delete to delete whole word in front

bindkey '^[[3~' delete-char       # Delete button (not backspace)

# Move whole words using CTRL + {Right | Left} Arrow
bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word

# PROMPT
export STARSHIP_CONFIG=~/.config/starship/starship.toml
eval "$(starship init zsh)"

# ZOXIDE
eval "$(zoxide init zsh)"

# Following 3 lines are only TEMPORARY for the duration of HLRA Praktikum
export LD_LIBRARY_PATH=~/Vc/lib:$LD_LIBRARY_PATH
export CPLUS_INCLUDE_PATH=~/Vc/include:$CPLUS_INCLUDE_PATH

# PATH
export PATH=~/Vc/bin:$PATH
export PATH=~/.local/bin:$PATH


export PATH=~/.config/Scripts:$PATH
. "/home/filip/.deno/env"