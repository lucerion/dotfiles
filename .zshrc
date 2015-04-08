autoload -U compinit && compinit
autoload -U promptinit && promptinit
autoload -U colors && colors

setopt autocd
setopt extended_glob
setopt interactive_comments
setopt correct
setopt correct_all
setopt extended_history
setopt share_history
setopt inc_append_history
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt complete_aliases

zstyle ':completion:*' menu select

export PROMPT="%~> "
export RPROMPT="%n@%M"

HISTFILE=~/.zsh_history
HISTSIZE=4096
SAVEHIST=4096

bindkey -e

export EDITOR='vim'
export VISUAL='vim'

case $TERM in
  xterm*|rxvt*)
    precmd () { print -Pn "\e]0;%n@%m: %~\a" }
  ;;
esac

if [ -f ~/.aliases ]; then
  . ~/.aliases
fi
