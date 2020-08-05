#!/bin/bash

sudo systemctl enable systemd-networkd 
sudo systemctl enable systemd-resolved
sudo systemctl start systemd-resolved

sudo rm /etc/resolv.conf
sudo ln -s /run/systemd/resolve/resolv.conf /etc/resolv.conf
