#!/bin/bash
cd rtlwifi_new
make
sudo make install
sudo modprobe -r rtl8723be
sudo modprobe rtl8723be ant_sel=2
iwlist scan | egrep -i 'ssid|level'
echo "done!"
