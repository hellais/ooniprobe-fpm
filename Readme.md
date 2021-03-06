# ooniprobe packaging

This is an attempt of solving the packaging situation of ooniprobe.

Status:

* [x] Debian wheezy
* [x] Debian jessie
* [x] Debian stretch
* [x] Ubuntu xenial
* [x] Ubuntu trusty
* [x] macOS
* [x] Arch linux
* [ ] Fedora (WIP)
* [ ] CentOS (WIP)

## Requirements

You should have before starting installed the following dependencies:

* fpm
* virtualenv-tools
* all the requirements of ooniprobe

See `init.sh` for a initialisation script that works in ubuntu 16.04.

You can also use the provided `Vagrantfile` to setup the packaging environment
on any platform.

## Methodology

This packaging effort follows the YOLO approach.

In particular this means that we couldn't care less about your packaging ethos
or distribution specific philosophy. Our goal is to get our software installed
on the users machine whatever it takes and ship quickly :rocket:.

We take all the ooniprobe depedencies shove them into a virtualenv and do
ghetto hax with postinstall scripts to have the code hit the ground running.

## Usage

Remember to edit `build-config.sh` with the latest version of the package.

### Building debs

For debian package (both ubuntu and debian) run:

```
./build-deb.sh
```

You should then have a ready to ship in `dist/`.

This **must** be run from a debian or ubuntu machine that is the same architecture as the system you are targetting.

### Building macos

Before doing this be sure you have run `macos-init.sh`.

Also on macOS there is an issue with fpm so you should use my fork instead.

To build macOS packages you should run:

```
./build-macos.sh
```

You will then have a spiffy dmg inside of dist.

### Uploading packages

To upload packages be sure to edit `upload-deb.sh` to reflect the actual version number (and create `priv8.sh` with your bintray username and key see `priv8.sh.example`), then run:

```
./upload-deb.sh
```

## Installation

Note: I am not currently signing these packages as I am still testing this
out.

### Debian

On debian to install the package you will need to do (replace `{distribution}` with your distribution):

```
echo "deb https://dl.bintray.com/openobservatory/deb {distribution} main" | sudo tee -a /etc/apt/sources.list
sudo apt-get update
sudo apt-get install ooniprobe
```

### macOS

On macOS you can get it from:

https://dl.bintray.com/openobservatory/macOS/ooniprobe-2.2.0-0.dmg
