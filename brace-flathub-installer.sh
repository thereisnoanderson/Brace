#!/bin/bash
#Copyright (c) 2015-2018 Divested Computing, Inc.
#License: GPLv3
#Automatically generated! Please edit with care.

if [[ $EUID -ne 0 ]]; then echo 'This script needs to be run as root!'; exit 1; fi;

coloroff='\e[0m';
black='\e[0;30m';
blue='\e[0;34m';
cyan='\e[0;36m';
green='\e[0;32m';
purple='\e[0;35m';
red='\e[0;31m';
white='\e[0;37m';
yellow='\e[0;33m';
infoColor=${green};
questionColor=${yellow};
outputColor=${yellow};

if [ ! -f /usr/bin/flatpak ]; then echo 'flatpak is not installed!'; exit 1; fi;

flatpak remote-add flathub 'https://flathub.org/repo/flathub.flatpakrepo' &>/dev/null || true;

echo -e ${questionColor}Do you want Riot?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			flatpak install flathub im.riot.Riot;
			break;;
		No )
			flatpak remove im.riot.Riot;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want Signal?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			flatpak install flathub org.signal.Signal;
			break;;
		No )
			flatpak remove org.signal.Signal;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want Android Studio?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			flatpak install flathub com.google.AndroidStudio;
			break;;
		No )
			flatpak remove com.google.AndroidStudio;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want Arduino?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			flatpak install flathub cc.arduino.arduinoide;
			break;;
		No )
			flatpak remove cc.arduino.arduinoide;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want PyCharm?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			flatpak install flathub com.jetbrains.PyCharm-Community;
			break;;
		No )
			flatpak remove com.jetbrains.PyCharm-Community;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want OBS Studio?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			flatpak install flathub com.obsproject.Studio;
			break;;
		No )
			flatpak remove com.obsproject.Studio;
			break;;
		Skip )
			break;;
	esac;
done;

echo -e ${questionColor}Do you want Peek?${coloroff};
select yns in "Yes" "No" "Skip"; do
	case $yns in
		Yes )
			flatpak install flathub com.uploadedlobster.peek;
			break;;
		No )
			flatpak remove com.uploadedlobster.peek;
			break;;
		Skip )
			break;;
	esac;
done;

flatpak remove --unused;
