autoload -Uz compinit && compinit

# Command History
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000
setopt SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS

# Editing mode (emacs)
bindkey -e

export EDITOR=vim

# Prompt
autoload -U colors && colors
autoload -Uz vcs_info

precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
#RPROMPT=\$vcs_info_msg_0_
zstyle ':vcs_info:git:*' formats '%b'

PROMPT="%B%{$fg[green]%}%n@%M%{$reset_color%}:%{$fg[blue]%}%~%{$reset_color%}%b %{$fg[red]%}[\$vcs_info_msg_0_]%{$reset_color%}
$ "
RPS1='%w %t'

# Load aliases
if [[ -r ~/.aliases ]]; then
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

freq () {
  sort | uniq -c | sort -n
}
