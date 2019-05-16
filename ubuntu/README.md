# Purpose

On many Ubuntu versions, the reptyr package available in the official repositories is outdated. These files are provided to aid you in building your own package to install from the most recent release.

# How to build

## Dependences

If starting from a very clean Ubuntu installation, please make sure you have `software-properties-common` and the "multiverse" repository enabled, then install the basic packages required for .deb package creation:

```bash
sudo apt update
sudo apt install -y software-properties-common && sudo add-apt-repository -y multiverse
sudo apt install -y wget git build-essential debhelper devscripts
```

## Building the package

```bash
git clone -b debian https://github.com/nelhage/reptyr.git
cd reptyr/ubuntu
./make_deb_package.sh
```
