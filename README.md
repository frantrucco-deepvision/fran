# What the heck is this?
This repo contains all my scripts and configurations files. :)

# Installation

Run the following code to install and configure all programs:

```
sudo apt-get install --yes git &&
git clone https://github.com/frantrucco/fran &&
mv -f fran/.* ~/ &&
mv -f fran/* ~/ &&
rmdir fran &&
pushd ~/bin/install &&
chmod +x *.sh &&
./install-all.sh &&
popd;
```
