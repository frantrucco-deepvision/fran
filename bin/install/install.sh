#!/bin/bash

source ./handlers.sh && source ./packages.sh;
if [ $? -ne 0 ]; then
    exit 1;
fi

function check_if_installed {
    sudo apt install -s "$program" | grep "already";
    return $?;
}

function install_apt_packages {
    e "sudo apt update";
    for program in "${APT_PROGRAMS[@]}"; do
	function install {
            check_if_installed 2> /dev/null;
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
            check_if_installed 2> /dev/null;
            if [ $? -ne 0 ]; then
               yes | sudo add-apt-repository $repo &&
               yes | sudo apt update &&
               yes | sudo apt install $program;
	    fi
        }
      
        h "install" "Installing $program.";
    done
}

function run_all_scripts {
    for script in ./scripts/*.sh; do
        u "$script";
    done
}

function main {
    ask_user "Install apt packages?" "install_apt_packages";
    ask_user "Install apt additional packages?" "install_apt_additional_packages";
    ask_user "Run all scripts?" "run_all_scripts";
}

logfile="logfile";
main 1>&1 2>&1 | tee $logfile;
cat $logfile | grep "FAILED" &> /dev/null;

if [ $? -ne 0 ]; then
    echo -e "$OK";
else
    echo -e "The following failures were found:";
    echo;
    cat $logfile | grep "FAILED";
    echo;
    echo "See $logfile for more information";
fi

