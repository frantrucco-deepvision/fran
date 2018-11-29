#!/bin/bash

git clone https://github.com/manjaro/menda-icon-themes &&
cd menda-icon-themes &&
mv Menda-Circle ../MendaCircle &&
cd .. &&
rm -fr menda-icon-themes &&
sudo cp -fr MendaCircle /usr/share/icons &&
xfconf-query -c xsettings -p /Net/ThemeName -s "Numix" &&
xfconf-query -c xsettings -p /Net/IconThemeName -s "MendaCircle" &&
rm -fr MendaCircle;
