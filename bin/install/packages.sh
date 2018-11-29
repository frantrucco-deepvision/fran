declare -A APT_ADDITIONAL_PACKAGES;

APT_ADDITIONAL_PACKAGES=(
    ["pdftk"]="ppa:malteworld/ppa"
    ["telegram-desktop"]="ppa:atareao/telegram"
)

APT_PROGRAMS=(
# Dev
    valgrind
    git
# Python
    python3-pip
# Haskell
    ghc
    cabal-install
# Ocaml
    ocaml
    opam
# Coq
    coq
    coqide
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
    emacs25
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
)
