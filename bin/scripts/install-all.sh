#! /bin/bash
OK="\033[1;32m OK \033[0m";
FAILED="\033[1;31mFAILED\033[0m";
LOG_DIR="installation-logs"


PROGRAMS=(
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
# Latex
    chktex
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
    texlive-math-extra
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
# Power User
    zsh
    powertop
    tmux
    xsel
    htop
    tree
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
# Google Chrome ugly dependencies
    libxss1
    libappindicator1
    libindicator7
)

function ask_for_password {
    sudo echo -n "";
}

function try_mkdir_log {
    mkdir $1;
    if [ $? -ne 0 ]; then
        echo ">>> Failed to create $1 directory.";
        echo -e ">>> $FAILED: Aborting installation, sorry!";
        exit 1;
    fi
}

function try_update {
    echo -n ">>> Updating apt: ";
    sudo apt-get update &> update.apt.log;
    if [ $? -ne 0 ]; then
        echo -e "$FAILED: Aborting installation, sorry! See log update.apt.log";
        exit 1;
    else
        echo -e "$OK";
        rm update.apt.log;
    fi
    echo "";
}

function try_install {
    program=$1;
    command=$2;

    echo -n ">>> Installing $program: ";
    $command &> $LOG_DIR/$program.log;
    if [ $? -ne 0 ]; then
        echo -e "$FAILED: See log $program.log";
    else
        echo -e "$OK";
        rm $LOG_DIR/$program.log;
    fi
    echo "";
}

function install_menda_theme {
    git clone https://github.com/manjaro/menda-icon-themes &&
    cd menda-icon-themes &&
    mv Menda-Circle ../MendaCircle &&
    cd .. &&
    rm -fr menda-icon-themes &&
    sudo cp -fr MendaCircle /usr/share/icons &&
    xfconf-query -c xsettings -p /Net/ThemeName -s "Numix" &&
    xfconf-query -c xsettings -p /Net/IconThemeName -s "MendaCircle" &&
    rm -fr MendaCircle;
}

function install_google_chrome {
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb &&
    sudo dpkg -i google-chrome*.deb;
    rm google-chrome*.deb;
}

function install_powerline_font {
    git clone https://github.com/powerline/fonts.git;
    cd fonts &&
    ./install.sh &&
    cd .. &&
    rm -rf fonts;
}

function install_terminator {
    plugin_path="~/.config/terminator/plugins" &&
    sudo add-apt-repository --yes ppa:gnome-terminator &&
    sudo apt-get update &&
    sudo apt-get install --yes terminator &&
    mkdir $plugin_path &&
    wget https://git.io/v5Zww -O $plugin_path"/terminator-themes.py"
}

function install_coq {
    mkdir ~/.opam &&
    export OPAMROOT=~/.opam/opam-coq.8.8.1 &&
    opam init -n --comp=4.02.3 -j 4 &&
    opam repo add coq-released http://coq.inria.fr/opam/released &&
    opam install coq.8.8.1 && opam pin add coq 8.8.1;
}

# function main {
    ask_for_password;
    try_mkdir_log $LOG_DIR;
    try_update;

    for program in "${PROGRAMS[@]}"; do
        function install_program {
            sudo apt-get install --yes $program;
        }
        try_install $program "install_program";
    done
    try_install "google-chrome" "install_google_chrome";
    try_install "menda-theme" "install_menda_theme";
    try_install "zotero" "./zotero.sh";
    try_install "powerline_font" "install_powerline_font"

    try_install "coq using opam" "install_coq";
    try_install "terminator and terminator themes" "install_terminator";

    # Configure git
    git config --global user.name "Francisco Trucco"
    git config --global user.email "franciscoctrucco@gmail.com"

    echo "----------------------------------------------------------------------";
    echo ">>> Interactive";

    # Ubuntu restricted extras
    sudo apt-get install ubuntu-restricted-extras;
# }
