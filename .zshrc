# Add homebrew to path
export PATH=$HOME/.bin:$HOME/.brew/bin:$HOME/.brew/sbin:$PATH

# Opt out of Homebrew analytics
export HOMEBREW_NO_ANALYTICS=1

# Aliases
alias whatsmyip="wget -qO- http://ipecho.net/plain ; echo"
alias activate="source ./env/bin/activate"
dock () { eval $(docker-machine env $1) }
alias undock="docker-machine env -u"
alias beep="afplay /System/Library/Sounds/Hero.aiff"
alias ls="ls -G"
alias ctags="`brew --prefix`/bin/ctags --languages=python --python-kinds=-iv"

fpath=($fpath "/Users/jack/.zfunctions")

# Set Spaceship ZSH as a prompt
. ~/.spaceship.sh
autoload -U promptinit; promptinit
prompt spaceship

# Vim Mode :-)
bindkey -v

