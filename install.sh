#!/bin/bash

if [[ $EUID -ne 0 ]]; then
  echo "Please run this install script as root (or with sudo)."
  exit 1
fi

chmod +x ./fan-controller.sh
mv ./fan-controller.sh /usr/local/bin/

chmod +x ./fan-control.sh
mv ./fan-control.sh /etc/init.d/

update-rc.d fan-control.sh defaults
