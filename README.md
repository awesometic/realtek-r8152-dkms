# Realtek r8152 DKMS

![GitHub release (latest SemVer)](https://img.shields.io/github/v/release/awesometic/realtek-r8152-dkms?sort=semver&style=for-the-badge)

This provides Realtek r8152 driver in DKMS way so that you can keep the latest driver even after the kernel upgrade.

## Compatibility

The RTL8152 driver supports the following USB Ethernet chipsets.

- **RTL8156 / RTL8156B(S)(G)**: 2.5 GbE (USB 3.0)
- **RTL8153 / RTL8153B**: 10/100/1000 MbE (USB 3.0)
- **RTL8154 / RTL8154B**: 10/100/1000 MbE (USB 2.0)
- **RTL8152B**: 10/100M (USB2.0)

<br/>

## Installation

1. [Debian Package File](#debian-package-file)
2. [Launchpad PPA (Recommended)](#launchpad-ppa-recommended)
3. [autorun.sh](#autorunsh)
4. [dkms-install.sh](#dkms-installsh)
5. [Build Debian package yourself](#build-debian-package-yourself)

There are several ways to install this DKMS module. Choose one as your tastes.

These are not interfering with each other. So you can do all 3 methods but absolutely you don't need to.

Installation using the Debian package is recommended for the sake of getting the newer driver.

<br/>

## Debian package file

Download the latest Debian package from the Release tab on the Github repository.

1. **Install Kernel Headers**  
Type `uname -r` to see which kernel version you are currently using. Make sure the linux headers for that kernel are installed by using the following command, subsituting your kernel version and arch (usually `amd64` or `arm64`)  
```bash
sudo apt install linux-headers-{kernelversion}-{arch}
```
> If using Proxmox, install linux headers with
> ```bash
> sudo apt install pve-headers
> ```
<br/>

2. **Install package**  
Then enter the following command to install the `.deb` package and its dependences.  
```bash
sudo apt install -f ./realtek-r8152-dkms*.deb
```


> If multiple files selected by the wild card, you should type the specific version of the file.
>
> ```bash
> sudo apt install -f ./realtek-r8152-dkms_2.16.3-4_amd64.deb
> ```

<br/>

## Launchpad PPA (Recommended)

Add the Launchpad PPA.

```bash
sudo add-apt-repository ppa:awesometic/ppa
```

Then install the package using `apt` tool.

```bash
sudo apt install realtek-r8152-dkms
```

<br/>

## autorun.sh

Using the `autorun.sh` script that Realtek provides on their original driver package. This is **not installed as a DKMS**, only efforts to the current kernel.

Download or clone this repository and move to the extracted directory, then run the script.

```bash
sudo ./autorun.sh
```

<br/>

## dkms-install.sh

This script is from aircrack-ng team. You can install the DKMS module by a simple command.

Download or clone this repository and move to the extracted directory, then run the script.

```bash
sudo ./dkms-install.sh
```

<br/>

## Build Debian package yourself

You can build yourself this after installing some dependencies including `dkms`.

```bash
sudo apt install devscripts debmake debhelper build-essential dkms
```

```bash
dpkg-buildpackage -b -rfakeroot -us -uc
```

<br/>

## LICENSE

GPL-2 on Realtek driver and the debian packaing.

<br/>

## References

- [Realtek r8152 driver release page](https://www.realtek.com/en/component/zoo/category/network-interface-controllers-10-100-1000m-gigabit-ethernet-usb-3-0-software)
