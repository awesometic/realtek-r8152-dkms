#!/bin/bash

if [[ $EUID -ne 0 ]]; then
  echo "You must run this with superuser priviliges.  Try \"sudo ./dkms-install.sh\"" 2>&1
  exit 1
else
  echo "About to run dkms install steps..."
fi

DRV_DIR="$(pwd)"
DRV_NAME=r8152
DRV_VERSION=2.18.1

cp -r ${DRV_DIR} /usr/src/${DRV_NAME}-${DRV_VERSION}

dkms add -m ${DRV_NAME} -v ${DRV_VERSION}
dkms build -m ${DRV_NAME} -v ${DRV_VERSION}
dkms install -m ${DRV_NAME} -v ${DRV_VERSION}
RESULT=$?

echo "Finished running dkms install steps."

echo "Copy the dedicated udev rules file..."
cp udev/rules.d/50-usb-realtek-net.rules /etc/udev/rules.d/

echo "Restarting udev..."
udevadm control --reload-rules

echo "Finished."

exit $RESULT
