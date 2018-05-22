#! /bin/bash

VERSION="5.0.47"
ARCH="x86_64"
TMP="/tmp/zotero.tar.bz2"
DEST_FOLDER=zotero
EXEC=zotero
DEST="/opt"
MENU_PATH="/usr/share/applications/zotero.desktop"
MENU_DIR="/usr/share/applications"
URL="https://download.zotero.org/client/release/${VERSION}/Zotero-${VERSION}_linux-${ARCH}.tar.bz2"

sudo wget $URL -O $TMP
if [ $? -ne 0 ]; then
	echo ">>> Failed to download Zotero"
	echo ">>> Aborting installation, sorry!"
	exit 1
fi

if [ -d $DEST/$DEST_FOLDER ]; then
	echo ">>> The destination folder ($DEST/$DEST_FOLDER) exists."
    echo ">>> Removing old Zotero installation"
    sudo rm -Rf $DEST/$DEST_FOLDER
    if [ $? -ne 0 ]; then
        echo ">>> Failed to remove old Zotero installation"
        echo ">>> Aborting installation, sorry!"
        exit 1
	fi
fi

echo ">>> Extracting Zotero"
echo ">>> Target folder: $DEST/$DEST_FOLDER"

sudo tar -xpf $TMP -C $DEST
if [ $? -ne 0 ]; then
	echo ">>> Failed to extract Zotero"
	echo ">>> Aborting installation, sorry!"
	exit 1
fi

sudo mv $DEST/Zotero_linux-$ARCH $DEST/$DEST_FOLDER
if [ $? -ne 0 ]; then
	echo ">>> Failed to move Zotero to $DEST/$DEST_FOLDER"
	echo ">>> Aborting installation, sorry!"
	exit 1
fi

if [ -f $MENU_DIR ]; then
	echo ">>> Creating $MENU_DIR"
	sudo mkdir $MENU_DIR
fi

echo ">>> Creating menu entry"
sudo rm $MENU_PATH;
echo "[Desktop Entry]
Name=Zotero
Comment=Open-source reference manager (standalone version)
Exec=$DEST/$DEST_FOLDER/zotero
Icon=$DEST/$DEST_FOLDER/chrome/icons/default/default48.png
Type=Application
StartupNotify=true" | sudo tee --append $MENU_PATH > /dev/null
if [ $? -ne 0 ]; then
	echo ">>> Failed to create menu entry"
	echo ">>> Aborting installation, sorry!"
	exit 1
fi
