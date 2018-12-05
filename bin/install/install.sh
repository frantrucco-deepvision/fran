#!/bin/bash
LOGFILE="logfile";

source ./handlers.sh &&
source ./packages.sh &&
source ./pacman.sh;
if [ $? -ne 0 ]; then
    exit 1;
fi

function install_virtualenv {
    function install {
        yes | sudo apt install virtualenv virtualenvwrapper;
    }
    h "install" "Installing virtualenv and virtualenvwrapper"
}

function run_all_scripts {
    for script in ./scripts/*.sh; do
        u "$script";
    done
}

function main {
    ask_user "Install apt packages?" "install_apt_packages";

    ask_user "Install apt additional packages?" "install_apt_additional_packages";

    ask_user "Install virtualenv?" "install_virtualenv";

    ask_user "Install pip packages?" "install_pip_packages";

    ask_user "Run all scripts?" "run_all_scripts";
}

main 1>&1 2>&1 | tee $LOGFILE;
cat $LOGFILE | grep "FAILED" &> /dev/null;

if [ $? -ne 0 ]; then
    echo -e "$OK";
else
    echo -e "Failures were found:";
    echo "See $LOGFILE for more information";
fi
