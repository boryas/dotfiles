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
autoload -Uz compinit 
compinit

# Prompt
PS1='%n@%M:%~
'
RPS1='%w %t'

# Other options

# automatically use 'cd' if you enter a directory name
setopt AUTO_CD
# automatically replace cd by pushd to always use directory stack
setopt AUTO_PUSHD
