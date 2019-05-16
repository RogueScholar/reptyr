# Purpose

The reptyr package available in the official Debian repositories (even sid) is
outdated. These files are provided to aid you in building your own package to
install from the most recent release in this repository.

# How to build

## Dependences

If starting from a very clean Debian installation, please make sure you have
`software-properties-common` and the "multiverse" repository enabled, then
install the basic packages required for .deb package creation:

```bash
sudo apt update
sudo apt install -y software-properties-common && sudo add-apt-repository -y multiverse
sudo apt install -y wget git build-essential debhelper devscripts dpkg-dev python python-pexpect
```

## Building the package

```bash
git clone -b debian https://github.com/nelhage/reptyr.git
cd reptyr/debian
chmod +x ./make_deb_package.sh
./make_deb_package.sh
```
