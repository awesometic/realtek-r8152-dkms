# Realtek r8152 DKMS / DELL ALIENWARE AW1022 support

This provides Realtek r8152 driver in DKMS way so that you can keep the latest driver even after the kernel upgrade.

### Changes and Optimizations - Version: 2.19.3 (2025/04/17)

- **Kernel Compatibility Improvements:**
  - Updated `src/compatibility.h` to better handle different kernel versions, ensuring compatibility with recent kernel releases and enabling smooth module integration across a range of versions.
  - Added conditional inclusion of headers for improved compatibility with kernel version `6.4.10` and newer, specifically related to the use of the `gso.h` header.

- **DKMS and Kernel Handling Adjustments:**
  - Modified `src/Makefile` to dynamically set the correct `KERNELRELEASE` value during the build process, ensuring that the module is built for the intended, newly installed kernel instead of the currently running kernel.
  - The DKMS configuration was updated to ensure that the module is properly built and installed when new kernel versions are triggered by DKMS.

- **Improved Module Installation Process:**
  - Enhanced `autorun.sh` and `dkms.conf` to streamline the installation of kernel modules, with automatic version checks and kernel-specific optimizations for module handling.
  - Updated rules for automatic installation of `r8152.ko` to ensure the proper integration of the Realtek network driver under various kernel environments.

These updates optimize the module build and installation process, enhancing compatibility across kernel versions and improving the overall user experience for DKMS-based kernel module management.

## Compatibility

Based on REALTEK USB NIC Linux driver for kernel up to 6.10
Version: 2.19.2 (2024/11/05)

The r8152 driver supports the following USB Ethernet chipsets.
*For RTL8157 (5 GbE), you need 2.18.1 or above*

Chipset          | Interface   | Performance
:----------------|:-----------:|:----------------:
RTL8157          | USB 3.0     | 5 GbE
RTL8156 /B       | USB 3.0     | 2.5 GbE
RTL8153 /B/C/D/E | USB 3.0     | 10/100/1000 MbE
RTL8154 /B       | USB 2.0     | 10/100/1000 MbE
RTL8152B         | USB 2.0     | 10/100M

> ## References Realtek official website
> - [Realtek r8152 driver download](https://www.realtek.com/Download/List?cate_id=585)
> - [Realtek r8152 direct download link](https://www.realtek.com/Download/ToDownload?type=direct&downloadid=3375)

### Add support for .ko.zst kernel modules in newer Ubuntu versions
This version enhances the project to ensure compatibility with newer Ubuntu versions (or similar other Linux distributions) that use .ko.zst (Zstandard compressed) kernel modules. The logic has been updated to correctly handle .ko.zst files, which are now standard in Ubuntu versions 21.10 and later. This improves functionality on modern systems.

### Add support for Network interface Dell Alienware AW1022 2.5Gb USB NIC (device ID 413C:B097)
Dell Alienware AW1022 2.5Gb USB NIC Support: Added driver support for the Dell Alienware AW1022 2.5Gb USB Network Interface Card, enabling proper detection and functionality of this NIC on supported systems.

### Fixed udev rules handling ###
Resolved an issue where the script could not locate the udev rules file when switching to the src subdirectory, resulting in an error. The handling of the udev rules file has been corrected, and the necessary entry for the Dell Alienware AW1022 NIC has been added to the udev rules as well.

## Installation

There are 3 ways to install this DKMS module. Choose one as your tastes.

Those are not interfering with each other. So you can do all 3 methods but absolutely you don't need to.

Installation using the Debian package is recommended for the sake of getting the newer driver.

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
sudo apt install devscripts debmake debhelper build-essential dkms dh-dkms
```

```bash
dpkg-buildpackage -b -rfakeroot -us -uc
```

### Debian package

#### Released package file

Download the latest Debian package from the Release tab on the Github repository.

Then enter the following command.

```bash
sudo dpkg -i realtek-r8152-dkms-2.19.2-1*.deb
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

## LICENSE

GPL-2 on Realtek driver and the debian packaging.

## CREDITS

Shoutout to [awesometic](https://github.com/awesometic/realtek-r8152-dkms), thanks for the great work!
