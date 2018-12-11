#! /bin/bash

if [ "$#" -ne 2 ]; then

    echo "    Usage:";
    echo "    ./add_blank_pages.sh file n";
    echo "";
    echo "    Where file is the book file and n is the number of blank pages";
    echo "    that will be added to the end of the file.";
    echo "";
    echo "    Example:";
    echo "";
    echo "    ./add_blank_pages.sh harry_potter.pdf 10";

    exit
fi

if hash pdfunite 2>/dev/null; then
    echo "pdfunite is installed";
else
    echo "Installing pdfunite...";
    sudo apt-get install poppler-utils;
fi


if hash pdfunite 2>/dev/null; then
    file=$1;
    cp $file current.pdf;
    for ((n=0;n<$2;n++))
    do
        pdfunite current.pdf blank_page.pdf out.pdf;
        mv out.pdf current.pdf;
    done

    mv current.pdf out.pdf;
    echo "DONE!"
else
    echo "Something is wrong!";
fi

