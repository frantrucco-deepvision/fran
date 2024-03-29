#! /bin/bash

RED="$(tput setaf 1)"
GREEN="$(tput setaf 2)"
YELLOW="$(tput setaf 3)"
BLUE="$(tput setaf 4)"
BOLD="$(tput bold)"
NORMAL="$(tput sgr0)"

if [ ! -n "$ZSH" ]; then
ZSH=~/.oh-my-zsh
fi

if [ -d "$ZSH" ]; then
    printf "${YELLOW}You already have Oh My Zsh installed.${NORMAL}\n"
    printf "You'll need to remove $ZSH if you want to re-install.\n"
exit
fi

# Just in case
rm -f ~/.zsh-update;
printf "${BLUE}Cloning Oh My Zsh...${NORMAL}\n"

command -v git >/dev/null 2>&1 || {
    echo "Error: git is not installed"
    exit 1
}

env git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git $ZSH || {
    printf "Error: git clone of oh-my-zsh repo failed\n"
    exit 1
}

# install autocomplete
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
