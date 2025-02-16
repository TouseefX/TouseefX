#!/bin/bash
# new update affer a long time
#text colours
Green='\033[1;32m'
Red='\033[1;31m'
Yellow='\033[1;33m'
Blue='\033[1;34m'
Reset='\033[m'

# check if cpu supports avx
if ! lscpu | grep avx > /dev/null;
then 
	echo -e "${Red} Warning: Your CPU does not support AVX it may not work with Minecraft. Press return to continue.${Reset}"
read -p " "
fi

# check glibc is 2.31 or newer
if ldd --version | grep "2\\.30]\|2\\.2" > /dev/null;
then
	echo -e "${Red} Error: Your system is unsupported. Please update to glibc 2.31 or greater. Press return to continue.${Reset}"
	read -p " "
	exit
fi

full_setup ()
{

sudo $distro_install wget
sudo $distro_install unzip
sudo $distro_install git
sudo $distro_install tar
echo -e "${Green} Starting.${Reset}"
sleep 2
cd $HOME
sleep 1
mdkir .MinecraftInstaller

# install "java" if missing.
if ! $distro_check openjdk-21-jdk > /dev/null ;
then
  echo -e "${Red} Java Not Found Installing Java 21.${Reset}"
  sleep 3 
   sudo $distro_install openjdk-21-jdk 
   wget https://github.com/adoptium/temurin21-binaries/releases/download/jdk-21.0.6%2B7/OpenJDK21U-jdk_x64_linux_hotspot_21.0.6_7.tar.gz && tar -xvf OpenJDK21U-jdk_x64_linux_hotspot_21.0.6_7.tar.gz && sudo mv jdk-21.0.6+7 /opt/ && cd /opt/ && sudo update-alternatives --install /usr/bin/java java /opt/jdk-21.0.6+7/bin/java 500 && clear && echo choose adoptium java (jdk-21.0.6+7 in opt) && sudo update-alternatives --config java && java --version && cd;
fi

cd $HOME
wget https://github.com/TouseefX/TouseefX/raw/refs/heads/main/SKlauncher-3.2.10.jar -O "$HOME/SK.jar"
cd .MinecraftInstaller
wget https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ-oKBN_VeJyWQbqPU3nX1DxOchUcYy4sPTY0a9c_6c_Q&s -O "$HOME/.MinecraftInstaller/SK.icon.png"
echo " "
echo -e "[Desktop Entry]\nVersion=1.0\nName=SKLauncher\nExec=java -jar SK.jar \nType=Application\nIcon=$HOME/.MinecraftInstaller/SKicon.png\nTerminal=false\n" > "$HOME/.local/share/applications/SKLauncher.desktop"
chmod +x "$HOME/.local/share/applications/SKLauncher.desktop"
clear
Echo -e "${Green} Setup Done${Reset}"
sleep 3

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
distros=("Install SKLauncher" "Exit")
select fav in "${distros[@]}"; do
    case $fav in


#################################################################################
########################******Install Minecraft*******###########################
#################################################################################

        "Install SKLauncher")

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


