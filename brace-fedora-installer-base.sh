#!/bin/bash
#Copyright (c) 2018 Divested Computing, Inc.
#License: GPLv3

if [[ $EUID -ne 0 ]]; then echo 'This script needs to be run as root!'; exit 1; fi;

if [ -f /etc/centos-release ]; then yum install epel-release; fi;

yum install --skip-broken irqbalance openssh nano htop wget screen p7zip pixz lm_sensors screenfetch ripgrep @multimedia aspell aspell-en dconf-editor numix-icon-theme-circle arc-theme seahorse gtkhash libva-utils vdpauinfo mesa-dri-drivers libva-intel-driver libvdpau-va-gl adobe-source-code-pro-fonts mozilla-fira-mono-fonts mozilla-fira-sans-fonts audacity lynis checksec spectre-meltdown-checker thunderbird thunderbird-enigmail testdisk smartmontools parted mediawriter gnome-multi-writer nwipe libreoffice meld pdfmod scribus backintime-qt4 ecryptfs-utils ecryptfs-simple encfs quadrapassel gnome-2048 gnome-mines gnome-chess gnome-sudoku aisleriot gimp gimpfx-foundry inkscape darktable pitivi jpegoptim optipng firefox mozilla-https-everywhere mozilla-ublock-origin liferea lollypop youtube-dl keepassxc pwgen diceware u2f-hidraw-policy ssss bleachbit srm wipe scrub clamav clamav-data-empty clamav-update clamtk unhide chkrootkit firewall-config tor torsocks nyx obfs4 onionshare torbrowser-launcher transmission whois mtr stress iotop wavemon pv tree iperf3 bmon powertop ncdu;
