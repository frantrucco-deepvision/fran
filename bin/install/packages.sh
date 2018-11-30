declare -A APT_ADDITIONAL_PACKAGES;

APT_ADDITIONAL_PACKAGES=(
    ["pdftk"]="ppa:malteworld/ppa"
    ["telegram-desktop"]="ppa:atareao/telegram"
    ["emacs26"]="ppa:kelleyk/emacs"
)

APT_PACKAGES=(
# Dev
    valgrind
    git
# Python
    python3-pip
    python-pip
    python-dev
    build-essential
# Haskell
    ghc
    cabal-install
# Ocaml
    ocaml
    opam
# Coq
    m4
# Latex
    latexmk
    latex2html
    texlive-bibtex-extra
    texlive-fonts-extra
    texlive-lang-spanish
    texlive-latex-extra
    texlive-latex-recommended
    texlive-pictures
    texlive-publishers
    texlive-science
    texlive-xetex
    texlive-luatex
# Libraries
    ghostscript
    gphoto2
    sox
# GUI User Programs
    gparted
    inkscape
    meld
    kolourpaint4
    firefox
    transmission-gtk
    vlc
    vim-gtk3
    okular
# CLI User Programs
    cmus
    ranger
    w3m
    trash-cli
# Power User
    zsh
    powertop
    tmux
    xsel
    htop
    tree
    snap
# Network
    wget
    curl
    mu4e
    openssh-client
    openssh-server
    speedtest-cli
# Format conversion and manipulation
    ffmpeg
# My library dependencies
    id3tool
    youtube-dl
# xmonad
    xmonad
    xscreensaver
    libghc-xmonad-contrib-dev
    xmobar
    stalonetray
    suckless-tools
    scrot
    cabal-install
    xcompmgr
)

PIP_PACKAGES=(
    pandas
    seaborn
    scikit-learn
    jupyter
    scrapy
    pillow
    sqlalchemy
    twisted
    numpy
    scipy
    matplotlib
    pygame
    pyglet
    scapy
    nltk
    nose
    sympy
    ipython
    matplotlib
    Django
)
