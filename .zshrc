# Add homebrew to path
export PATH=$HOME/.bin:$HOME/.brew/bin:$HOME/.brew/sbin:$PATH

# Opt out of Homebrew analytics
export HOMEBREW_NO_ANALYTICS=1

# Aliases
alias la="ls -lGa"
alias whatsmyip="wget -qO- http://ipecho.net/plain ; echo"
alias activate="source ./env/bin/activate"
dock () { eval $(docker-machine env $1) }
alias undock="docker-machine env -u"
alias dc="docker-compose"
alias beep="afplay /System/Library/Sounds/Hero.aiff"
alias ls="ls -G"
alias ctags="`brew --prefix`/bin/ctags --languages=python --python-kinds=-iv"
alias gitme="git config user.name 'jackno' && git config user.email 'jacknovotny8@gmail.com'"

# Vim Mode :-)
bindkey -v

# Ask to correct invalid commands as well as command arguments
setopt correct
setopt correctall

# Load autocompletions
fpath=(~/.zsh/completion $fpath)
autoload -Uz compinit && compinit -i
fpath=($fpath "/Users/jack/.zfunctions")

# Set homebrew prefix since brew is too lazy to do it automatically
export HOMEBREW_PREFIX=$(brew --prefix)

# Load zsh-autocorrect plugin
source $HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Load zsh-syntax-highlighting plugin
source $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Set Spaceship ZSH as a prompt
. ~/.spaceship.sh
autoload -U promptinit; promptinit
prompt spaceship
