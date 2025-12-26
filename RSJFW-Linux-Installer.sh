#!/bin/bash

Green='\033[1;32m'
Red='\033[1;31m'
Yellow='\033[1;33m'
Blue='\033[1;34m'
Reset='\033[m'

# check if cpu supports avx
if ! lscpu | grep avx > /dev/null;
then 
	echo -e "${Yellow} Warning: Your CPU does not support AVX it may not work with RSJFW. Press return/enter to continue.${Reset}"
    read -p " "
fi

# check glibc is 2.31 or newer
if ldd --version | grep "2\\.30]\|2\\.2" > /dev/null;
then
	echo -e "${Red} Error: Your system is unsupported. Please update to glibc 2.31 or greater.${Reset}"
	exit
fi

full_setup ()
{

which yay >/dev/null 2>&1
if [ $? -eq 0 ]
then
    echo "Stopping Installer"
    echo "${Red}You have Yay installed,${Green} use this command,${Reset} yay -S rsjfw"
    main_menu
fi

# Install Requirements

if [ $distro_guess = "Arch" ] && ! $distro_check lib32-gnutls > /dev/null ;
then
  	 sudo $distro_install lib32-gnutls;
fi

if [ $distro_guess = "Arch" ] && ! $distro_check lib32-alsa-plugins > /dev/null ;
then
  	 sudo $distro_install lib32-alsa-plugins;
fi

if [ $distro_guess = "Arch" ] && ! $distro_check lib32-libpulse > /dev/null ;
then
  	 sudo $distro_install lib32-libpulse;
fi

if [ $distro_guess = "Arch" ] && ! $distro_check lib32-openal > /dev/null ;
then
  	 sudo $distro_install lib32-openal;
fi

if ! $distro_check xdg-utils > /dev/null ;
then
  sudo $distro_install xdg-utils;
fi

if ! $distro_check wget > /dev/null ;
then
  sudo $distro_install wget;
fi

if ! $distro_check tar > /dev/null ;
then
  sudo $distro_install tar;
fi

if [ $distro_guess = "Arch" ];
then
    if ! $distro_check libzip > /dev/null ;
    then
        sudo $distro_install libzip;
    fi

    if ! $distro_check glfw > /dev/null ;
    then
        sudo $distro_install glfw;
    fi
fi

if [ $distro_guess = "Fedora" ];
then
    if ! $distro_check libzip > /dev/null ;
    then
        sudo $distro_install libzip;
    fi

     if ! $distro_check libzip-devel > /dev/null ;
    then
        sudo $distro_install libzip-devel;
    fi

    if ! $distro_check glfw > /dev/null ;
    then
        sudo $distro_install glfw;
    fi

    if ! $distro_check glfw-devel > /dev/null ;
    then
        sudo $distro_install glfw-devel;
    fi
fi

if [ $distro_guess = "OpenSUSE" ];
then
    if ! $distro_check libzip5 > /dev/null ;
    then
        sudo $distro_install libzip5;
    fi

     if ! $distro_check libzip-devel > /dev/null ;
    then
        sudo $distro_install libzip-devel;
    fi

    if ! $distro_check glfw > /dev/null ;
    then
        sudo $distro_install glfw;
    fi

    if ! $distro_check glfw-devel > /dev/null ;
    then
        sudo $distro_install glfw-devel;
    fi
fi

if [ $distro_guess = "Debian" ];
then
    if ! $distro_check libzip5 > /dev/null ;
    then
        sudo $distro_install libzip5;
    fi

    if ! $distro_check libzip-dev > /dev/null ;
    then
        sudo $distro_install libzip-dev;
    fi

    if ! $distro_check libglfw3 > /dev/null ;
    then
        sudo $distro_install libglfw3;
    fi

    if ! $distro_check libglfw3-dev > /dev/null ;
    then
        sudo $distro_install libglfw3-dev;
    fi
fi

if ! $distro_check xdg-desktop-portal > /dev/null ;
then
    sudo $distro_install xdg-desktop-portal;
fi

# Make Installer Folder
echo -e "${Green} Starting.${Reset}"
cd $HOME
mkdir .RSJFW
cd .RSJFW

# install RSJFW
wget https://github.com/9nunya/RSJFW/releases/download/v2.0.0/rsjfw-2.0.0-arch-x86_64.tar.gz
tar -xvf rsjfw-2.0.0-arch-x86_64.tar.gz
sudo cp -rnpv usr/. /usr
rm -r usr
cd $HOME
rm -r .RSJFW

# Setup URL mimes
xdg-mime default rsjfw.desktop x-scheme-handler/roblox-studio
xdg-mime default rsjfw.desktop x-scheme-handler/roblox-studio-auth

# Done
echo "${Green}Install Done."
main_menu

}




# Main Menu

main_menu()
{

echo " "

which apt >/dev/null 2>&1
if [ $? -eq 0 ]
then
distro_guess="Debian"
distro_check="dpkg -l"
distro_install="apt install"
fi

which yum >/dev/null 2>&1
if [ $? -eq 0 ]
then
distro_guess="Fedora"
distro_check="rpm -q"
distro_install="yum install"
distro_update="dnf update && dnf upgrade"
fi

which zypper >/dev/null 2>&1
if [ $? -eq 0 ]
then
distro_guess="OpenSUSE"
distro_check="zypper search -i"
distro_install="zypper install"
distro_update="zypper update"
fi

which pacman >/dev/null 2>&1
if [ $? -eq 0 ]
then
distro_guess="Arch"
distro_check="pacman -Qs"
distro_install="pacman -S"
fi

if test -z $distro_guess;
then
echo "This Linux distro is not supported sorry. Now aborting."
exit
fi


PS3="Please make a selection:"
distros=("Install RSJFW" "Exit")
select fav in "${distros[@]}"; do
    case $fav in


#################################################################################
########################********Install RSJFW*********###########################
#################################################################################

        "Install RSJFW")

full_setup
clear
echo "Setup complete. If u Want Vulkan Please Install VulkanMod for Fabric."
main_menu
		;;
#exit
	    
	"Exit")
	exit
	    ;;
        *) echo "Invalid selection $REPLY. Valid selections are 1,2.3 and 4.";;
    esac
done
#exit

}

main_menu