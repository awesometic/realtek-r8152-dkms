# Realtek r8152 DKMS

![GitHub release (latest SemVer)](https://img.shields.io/github/v/release/awesometic/realtek-r8152-dkms?sort=semver&style=for-the-badge)

This provides Realtek r8152 driver in DKMS way so that you can keep the latest driver even after the kernel upgrade.

## Compatibility

The RTL8152 driver supports the following USB Ethernet chipsets.

- **RTL8156 / RTL8156B(S)(G)**: 2.5 GbE (USB 3.0)
- **RTL8153 / RTL8153B**: 10/100/1000 MbE (USB 3.0)
- **RTL8154 / RTL8154B**: 10/100/1000 MbE (USB 2.0)
- **RTL8152B**: 10/100M (USB2.0)

## Installation

There are 3 ways to install this DKMS module. Choose one as your tastes.

Those are not interfering with each other. So you can do all 3 methods but absolutely you don't need to.

Installation using the Debian package is recommended for the sake of getting the newer driver.

### Debian package

#### Released package file

Download the latest Debian package from the Release tab on the Github repository.

Then enter the following command.

```bash
sudo dpkg -i realtek-r8152-dkms*.deb
```

> If multiple files selected by the wild card, you should type the specific version of the file.
>
> ```bash
> sudo dpkg -i realtek-r8152-dkms*.deb
> ```

If dependency error occurs, try to fix that with `apt` command.

```bash
sudo apt install --fix-broken
```

#### Launchpad PPA (Recommended)

Add the Launchpad PPA.

```bash
sudo add-apt-repository ppa:awesometic/ppa
```

Then install the package using `apt` tool.

```bash
sudo apt install realtek-r8152-dkms
```

### autorun.sh

Using the `autorun.sh` script that Realtek provides on their original driver package. This is **not installed as a DKMS**, only efforts to the current kernel.

Download or clone this repository and move to the extracted directory, then run the script.

```bash
sudo ./autorun.sh
```

### dkms-install.sh

This script is from aircrack-ng team. You can install the DKMS module by a simple command.

Download or clone this repository and move to the extracted directory, then run the script.

```bash
sudo ./dkms-install.sh
```

## Debian package build

You can build yourself this after installing some dependencies including `dkms`.

```bash
sudo apt install devscripts debmake debhelper build-essential dkms
```

```bash
dpkg-buildpackage -b -rfakeroot -us -uc
```

## LICENSE

GPL-2 on Realtek driver and the debian packaing.

## References

- [Realtek r8152 driver downloads](https://www.realtek.com/Download/List?cate_id=585)
