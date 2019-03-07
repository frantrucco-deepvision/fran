#! /bin/bash

check_process() {
    echo "$ts: checking $1";
    [ "$1" = "" ]  && return 0;
    [ `pgrep -n $1` ] && return 1 || return 0;
};

check_process emacs26 && emacs26 -mm;
