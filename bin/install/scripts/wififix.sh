#!/bin/bash
sudo apt-get update
sudo apt-get install build-essential git
git clone https://github.com/lwfinger/rtlwifi_new/
cd rtlwifi_new
make
sudo make install
sudo modprobe -r rtl8723be
sudo modprobe rtl8723be ant_sel=2
iwlist scan | egrep -i 'ssid|level'
echo "options rtl8723be ant_sel=2" | sudo tee -a /etc/modprobe.d/rtl8723be.conf
echo "done!"
