# Command History
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS

# Editing mode (emacs)
bindkey -e

# Completion
zstyle :compinstall filename '/home/boris/.zshrc'
autoload -Uz compinit && compinit

# Prompt
autoload -U colors && colors
PS1="%B%{$fg[green]%}%n@%M%{$reset_color%}:%{$fg[blue]%}%~%{$reset_color%}%b
"
RPS1='%w %t'

# Load aliases
if [[ -r .aliases ]]; then
    . ~/.aliases
fi

# Other options
# automatically use 'cd' if you enter a directory name
setopt AUTO_CD
# automatically replace cd by pushd to always use directory stack
setopt AUTO_PUSHD
# no beeping!
setopt NO_BEEP
# fancy globbing
setopt EXTENDED_GLOB
# attempt to correct mess-ups in commands
setopt CORRECT
