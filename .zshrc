# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/kiowa/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
fpath=($fpath "/home/kiowa/.zfunctions" "/home/kiowa/.gem/ruby/2.5.0/gems/timetrap-1.15.1/completions/zsh")

# Set Spaceship ZSH as a prompt
autoload -U promptinit; promptinit
prompt spaceship


alias startx="ssh-agent startx"
alias ls="ls --color"
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

export PATH=$PATH:$HOME/.gem/ruby/2.5.0/bin:$HOME/bin:/var/lib/snapd/snap/bin:$HOME/go/bin
export EDITOR=vim
export VISUAL=vim
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
export WORKON_HOME=$HOME/.local/share/virtualenvs
