#!/usr/bin/env bash

## rofi sudo askpass
export SUDO_ASKPASS=/usr/local/bin/askpass_rofi.sh

## Execute the application
sudo -A $1
