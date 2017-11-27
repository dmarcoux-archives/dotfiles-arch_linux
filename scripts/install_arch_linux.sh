#!/usr/bin/env bash

if [ ! -d /sys/firmware/efi ]; then
  echo "ERROR: Kernel didn't boot in UEFI mode"
  echo "Exiting..."
  exit 1
fi
echo "Booted in UEFI mode"

ping -c 3 www.google.com &> /dev/null
if [ "$?" -ne 0 ]; then
  dhcpcd &> /dev/null
  ping -c 3 www.google.com &> /dev/null
  if [ "$?" -ne 0 ]; then
    # TODO: Add WLAN. Now, it is only working with LAN
    # wifi-menu (needs package dialog)

    echo "ERROR: Internet connection isn't working"
    echo "Exiting..."
    exit 1
  fi

  # TODO: Change this when WLAN added
  echo "Connected to Internet through LAN"
fi
