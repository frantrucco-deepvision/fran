# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH=/home/fran/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="refined"
FZF_UNIQUE_HISTORY=1
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git, zsh-autosuggestions)

bindkey '><' autosuggest-execute
bindkey '<>' autosuggest-accept

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set all aliases
source ~/.oh-my-zsh/templates/zshrc.zsh-template

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
function playSound() {
    paplay /usr/share/sounds/KDE-Sys-App-Positive.ogg;
}

function s() {
    if [ "$#" -eq 0 ]; then
        playSound &;
    fi
    if [ "$#" -ne 0 ]; then
        for ((n=0;n<$1;n++)); do playSound &; done
    fi
}
function howtoprint() {
    echo "print odd"
    echo "turn the pages 180 in the horizontal plane (works for odd number of pages)"
    echo "print even and reversed"
}

alias emacs="emacs -nw"
alias install="sudo apt-get update; sudo apt-get upgrade -y; sudo apt-get install; playSound"
alias tree="tree -L 3"
alias sl="ls"

# Irace path
# Path given by system.file(package="irace")
export IRACE_HOME=/usr/local/lib/R/site-library/irace
export PATH=${IRACE_HOME}/bin/:$PATH

# OPAM configuration
. /home/fran/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

# OCR
function ocr = {
    convert $1 output_ocr.tif;
    tesseract output_ocr.tif output_ocr;
    rm output_ocr.tif;
    cat output_ocr.txt;
    rm output_ocr.txt;
}


# VIRTUALENVWRAPPER
VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
export WORKON_HOME
source /usr/local/bin/virtualenvwrapper.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# npm
export PATH="$PATH:$HOME/npm/bin"

# p ipython
alias p='ipython'


# Who uses python2??? :P
alias python=python3

# I'm not that smart
alias rm=trash

# Ghostscript is fucking annoying
alias gs='gst'

#
function va { atril $1 & }
function vo { okular $1 & }

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

export PATH="$HOME/.cabal/bin:/opt/cabal/1.22/bin:/opt/ghc/7.10.3/bin:$PATH"

export OPAMROOT=~/.opam-coq.8.8.2
eval `opam config env --root=/home/fran/.opam-coq.8.8.2`
