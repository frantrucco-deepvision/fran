#!/bin/bash
LOGFILE="logfile";

source ./handlers.sh && source ./packages.sh;
if [ $? -ne 0 ]; then
    exit 1;
fi

function check_if_apt_installed {
    program=$1
    sudo apt install -s "$program" | grep "already";
    return $?;
}

function install_apt_packages {
    e "sudo apt update";
    for program in "${APT_PACKAGES[@]}"; do
        function install {
            check_if_apt_installed "$program" &> /dev/null;
            if [ $? -ne 0 ]; then
                yes | sudo apt install $program;
            fi
        }
        h "install" "Installing $program.";
    done
}

function install_apt_additional_packages {
    for program in "${!APT_ADDITIONAL_PACKAGES[@]}"; do
        repo=${APT_ADDITIONAL_PACKAGES[$program]}

        function install {
            check_if_apt_installed "$program" &> /dev/null;
            if [ $? -ne 0 ]; then
               yes | sudo add-apt-repository $repo &&
               yes | sudo apt update &&
               yes | sudo apt install $program;
            fi
        }

        h "install" "Installing $program.";
    done
}

function check_if_pip_installed {
    program=$1;
    python3 -c "import $program";
}

function install_pip_packages {
    export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3;
    export WORKON_HOME=~/.virtualenvs;
    e "source /usr/local/bin/virtualenvwrapper.sh";
    workon general;
    if [ $? -ne 0 ]; then
        e "mkvirtualenv general";
    fi
    for program in "${PIP_PACKAGES[@]}"; do
        function install {
            check_if_pip_installed "$program" &> /dev/null;
            if [ $? -ne 0 ]; then
                yes | pip3 install $program;
            fi
        }
        h "install" "Installing $program.";
    done
}

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

    ask_user "Create virtualenv general and install pip packages?" \
             "install_pip_packages";

    ask_user "Run all scripts?" "run_all_scripts";
}

main 1>&1 2>&1 | tee $LOGFILE;
cat $LOGFILE | grep "FAILED" &> /dev/null;

if [ $? -ne 0 ]; then
    echo -e "$OK";
else
    echo -e "The following failures were found:";
    echo "";
    cat $LOGFILE | grep "FAILED";
    echo "";
    echo "See $LOGFILE for more information";
fi
