#!/bin/bash


downloader()
{
	DL_NAME=$1
	DL_PATH=$2
	DL_URL=$3
	DL_MD5=$4

	for i in {1..5}
		do
	
			if [ $i == 5 ]; # tried 5 times now give up!
			then 
				echo "error: failed to download $DL_NAME now aboting"
				exit
			fi
	
			if [ ! -f $DL_PATH ];
			then
				wget --no-check-certificate $DL_URL -O $DL_PATH
			fi
		
			if md5sum $DL_PATH | grep -i $DL_MD5 > /dev/null;
			then 
				cd 
				tar -xf $DL_PATH -C "$HOME/.wine-roblox-TouseefX"
				break
			else 
				rm $DL_PATH
			fi
		done
}


#################################################################################
########################      FULL_SETUP    #####################################
#################################################################################

full_setup ()
{

# install "lib32-gnutls" if missing.
if [ $distro_guess = "Arch" ] && ! $distro_check lib32-gnutls > /dev/null ;
then
  	 sudo $distro_install lib32-gnutls;
fi

# install "lib32-alsa-plugins" if missing.
if [ $distro_guess = "Arch" ] && ! $distro_check lib32-alsa-plugins > /dev/null ;
then
  	 sudo $distro_install lib32-alsa-plugins;
fi

# install "lib32-libpulse" if missing.
if [ $distro_guess = "Arch" ] && ! $distro_check lib32-libpulse > /dev/null ;
then
  	 sudo $distro_install lib32-libpulse;
fi

# install "lib32-openal" if missing.
if [ $distro_guess = "Arch" ] && ! $distro_check lib32-openal > /dev/null ;
then
  	 sudo $distro_install lib32-openal;
fi

# install "xdg-utils" if missing.
if ! $distro_check xdg-utils > /dev/null ;
then
  sudo $distro_install xdg-utils;
fi

# install "git" if missing.
if ! $distro_check git > /dev/null ;
then
  sudo $distro_install git;
fi

# install "wget" if missing.
if ! $distro_check wget > /dev/null ;
then
  sudo $distro_install wget;
fi

# install "wine" if missing.
if ! $distro_check wine > /dev/null ;
then
  sudo dpkg --add-architecture i386 && sudo mkdir -pm755 /etc/apt/keyrings && wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key && sudo $distro_FastUpdate && sudo $distro_Update && sudo $distro_install --install-recommends winehq-stable;
fi

# install "unzip" if missing.
if ! $distro_check unzip > /dev/null ;
then
  sudo $distro_install unzip;
fi

# remove any other roblox launchers.
if [ -f "$HOME/.config/mimeapps.list" ];
then
	sed -i '/roblox/d' "$HOME/.config/mimeapps.list"
fi

# add my roblox launcher to xdg list.
xdg-mime default "roblox-malik.desktop" x-scheme-handler/roblox-player

# make custom directory if missing
if [ ! -d "$HOME/.wine-roblox-TouseefX" ];
then
	cd "$HOME/"
	mkdir .wine-roblox-TouseefX
fi

# set custom directory as default for wine to use
export WINEPREFIX="$HOME/.wine-roblox-TouseefX"
export WINEDEBUG=-all

# download and extract custom wine if needed.

	if [ ! -d "$HOME/.wine-roblox-TouseefX/$WINE_NAME" ];
	then
		
		downloader $WINE_NAME "$HOME/.wine-roblox-TouseefX/$WINE_NAME.tar.xz" $WINE_URL $WINE_MD5
	fi


# Download and Install Roblox if missing.
if [ ! -f "$HOME/.wine-roblox-TouseefX/RobloxPlayerLauncher.exe" ];
then

	#first lets block edge webview2 install
	mkdir -p "$HOME/.wine-roblox-TouseefX/drive_c/Program Files (x86)/Microsoft"
	chmod 000 "$HOME/.wine-roblox-TouseefX/drive_c/Program Files (x86)/Microsoft"
	#download and install roblox player
	wget -O "$HOME/.wine-roblox-TouseefX/RobloxPlayerLauncher.exe" https://setup.rbxcdn.com/RobloxPlayerLauncher.exe

	$WINE_RUN "$HOME/.wine-roblox-TouseefX/RobloxPlayerLauncher.exe"

	clear
	read -p "When setup has completed, press return to key to continue."
	rm "$HOME/Desktop/Roblox Player.desktop"
	rm "$HOME/Desktop/Roblox Player.lnk"
	rm "$HOME/Desktop/Roblox Studio.desktop"
	rm "$HOME/Desktop/Roblox Studio.lnk"
	wget https://i.postimg.cc/63pLwnmf/Roblox-Player-Launcher.png -O "$HOME/.wine-roblox-TouseefX/Roblox-Player-Launcher.png"
	wget https://i.postimg.cc/d1NR0DMP/Roblox-Studio-Beta.png -O "$HOME/.wine-roblox-TouseefX/Roblox-Studio-Beta.png"
	echo " "
fi

# make desktop entry for roblox player.
echo -e "[Desktop Entry]\nVersion=1.0\nName=roblox-player-Touseef\nExec=bash -c \"cp -r \\\"$HOME/.wine-roblox-TouseefX/ClientSettings\\\" \\\"\$(find \\\"$HOME/.wine-roblox-TouseefX/drive_c\\\" -name 'RobloxPlayerLauncher.exe' -not -path '*/Temp/*' -exec dirname {} ';' )\\\" && export MESA_GL_VERSION_OVERRIDE=\\\"4.4\\\" && export WINEPREFIX=\\\"$HOME/.wine-roblox-TouseefX\\\" && export WINEESYNC=1 && export WINEFSYNC=1 && \\\"$WINE_RUN\\\" \\\"\$(find \\\"$HOME/.wine-roblox-TouseefX/drive_c\\\" -name 'RobloxPlayerLauncher.exe' -not -path '*/Temp/*')\\\" %U \"\nType=Application\nIcon=$HOME/.wine-roblox-TouseefX/Roblox-Player-Launcher.png\nTerminal=false\n" > "$HOME/.local/share/applications/roblox-malik.desktop"
chmod +x "$HOME/.local/share/applications/roblox-malik.desktop"

# make desktop app loader for users who cant load games through the website.
echo -e "[Desktop Entry]\nVersion=1.0\nName=Roblox App Malik\nExec=bash -c \" cp -r \\\"$HOME/.wine-roblox-TouseefX/ClientSettings\\\" \\\"\$(find \\\"$HOME/.wine-roblox-TouseefX/drive_c\\\" -name 'RobloxPlayerLauncher.exe' -not -path '*/Temp/*' -exec dirname {} ';' )\\\" && export MESA_GL_VERSION_OVERRIDE=\\\"4.4\\\" && export WINEPREFIX=\\\"$HOME/.wine-roblox-TouseefX\\\" && export WINEESYNC=1 && export WINEFSYNC=1 && \\\"$WINE_RUN\\\" \\\"\$(find \\\"$HOME/.wine-roblox-TouseefX/drive_c\\\" -name 'RobloxPlayerLauncher.exe' -not -path '*/Temp/*')\\\" -app\"\nType=Application\nIcon=$HOME/.wine-roblox-TouseefX/Roblox-Player-Launcher.png\nTerminal=false\n" > "$HOME/Desktop/Roblox App Malik.desktop"
chmod +x "$HOME/Desktop/Roblox App Malik.desktop"

#set and update fflag settings
PS3="Please select Graphics API (OpenGL Recommended):"
APIs=("Vulkan" "OpenGL" "DirectX11")
select fav in "${APIs[@]}"; do
    case $fav in
"Vulkan")
api="{\"FFlagDebugGraphicsPreferVulkan\": true"
break
;;
"OpenGL")
api="{\"FFlagDebugGraphicsPreferOpenGL\": true"
break
;;
"DirectX11")
api="{\"FFlagDebugGraphicsPreferD3D11\": true"
break
;;
*) echo "Invalid selection $REPLY. Valid selections are 1, 2 and 3.";;
esac
done

echo ""

read -p "Do you want boost FPS (y/n)?"
if [[ $REPLY =~ ^[Yy]$ ]]
then
	api="$api, \"FFlagGraphicsGLTextureReduction\": true"
fi

echo""

read -p "Do you want Install Vulkan? (y/n)?"
if [[ $REPLY =~ ^[Yy]$ ]]
then
	sudo $distro_install mesa-vulkan-drivers
fi


read -p "Do you want to unlock FPS (y/n)?"
if [[ $REPLY =~ ^[Yy]$ ]]
then
	api="$api, \"DFIntTaskSchedulerTargetFps\": 9999"
fi


if [ ! -d "$HOME/.wine-roblox-TouseefX/ClientSettings" ]; then mkdir "$HOME/.wine-roblox-TouseefX/ClientSettings"; fi

echo -e "$api}" > "$HOME/.wine-roblox-TouseefX/ClientSettings/ClientAppSettings.json"

wineserver -k

# Install or uninstall DXVK
if [ $REPLY == "3" ] || [ $REPLY == "4" ];
then

DXVK="dxvk-1.10.3"

	if [ -f "$HOME/.wine-roblox-TouseefX/dosdevices/c:/windows/syswow64/d3d11.dll.old" ];
	then
		read -p "Do you want to uninstall DXVK (y/n)?"
		if [[ $REPLY =~ ^[Yy]$ ]]
		then
		
		if [ ! -f "$HOME/.wine-roblox-TouseefX/$DXVK/setup_dxvk.sh" ];
		then
		downloader $DXVK "$HOME/.wine-roblox-TouseefX/$DXVK.tar.gz" "https://github.com/doitsujin/dxvk/releases/download/v1.10.3/dxvk-1.10.3.tar.gz" 1c07b9d70ecc5df6c3ba9d13efaa351e
		fi		
		bash "$HOME/.wine-roblox-TouseefX/$DXVK/setup_dxvk.sh" uninstall
		else
		 echo "Skipping DXVK!"
		fi
	else
		read -p "Do you want to install DXVK (y/n)?"
		if [[ $REPLY =~ ^[Yy]$ ]]
		then
			if [ ! -f "$HOME/.wine-roblox-TouseefX/$DXVK/setup_dxvk.sh" ];
			then
			downloader $DXVK "$HOME/.wine-roblox-TouseefX/$DXVK.tar.gz" "https://github.com/doitsujin/dxvk/releases/download/v1.10.3/dxvk-1.10.3.tar.gz" 1c07b9d70ecc5df6c3ba9d13efaa351e
			fi	
			bash "$HOME/.wine-roblox-TouseefX/$DXVK/setup_dxvk.sh" install
		else
			echo "Skipping DXVK!"
		fi
	fi
fi

echo " " 
# let user know their system has just been pimped :)
echo "Setup complete. You can now log in with the app on your desktop using \"quick login\" from the website."
main_menu

}


#################################################################################
########################      MAIN MENU    ######################################
#################################################################################


main_menu()
{

echo " "

which apt >/dev/null 2>&1
if [ $? -eq 0 ]
then
distro_guess="Debian"
distro_check="dpkg -l"
distro_install="apt install"
distro_update="apt update"
distro_FastInstall="apt-fast install"
distro_FastUpdate="apt-fast update"
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
distro_update="pacman -Syu"
fi

if test -z $distro_guess;
then
echo "This Linux distro is not supported sorry. Now aborting."
exit
fi

		WINE_NAME="wine-8.17-amd64"
		WINE_URL="https://github.com/Kron4ek/Wine-Builds/releases/download/8.17/wine-8.17-amd64.tar.xz"
		WINE_MD5="932480a9cc5fc70a3aa4de46184605f9"
		WINE_RUN="$HOME/.wine-roblox-TouseefX/$WINE_NAME/bin/wine"

PS3="Please make a selection:"
distros=("Install Roblox" "Install Roblox Studio" "Uninstall Roblox" "Exit")
select fav in "${distros[@]}"; do
    case $fav in

#################################################################################
########################      Install Roblox        #############################
#################################################################################

        "Install Roblox")

full_setup
clear
echo "Setup complete."
main_menu
		;;


#################################################################################
########################      Install Roblox Studio        ######################
#################################################################################
	    
	    "Install Roblox Studio")
	    
#check if Roblox installed  
if [ ! -f "$HOME/.wine-roblox-TouseefX/drive_c/users/$USER/AppData/Local/Roblox/Versions/RobloxStudioLauncherBeta.exe" ];
then
	echo "Roblox installation missing install Roblox first!"
	exit
fi

# add my roblox studio launcher to xdg list.
xdg-mime default "roblox-studio-malik.desktop" x-scheme-handler/roblox-studio
xdg-mime default "roblox-studio-auth-malik.desktop" x-scheme-handler/roblox-studio-auth
xdg-mime default "roblox-studio-malik.desktop" application/x-roblox-rbxl
xdg-mime default "roblox-studio-malik.desktop" application/x-roblox-rbxlx

#create studio and studio auth desktop files for xdg-open
echo -e "[Desktop Entry]\nVersion=1.0\nName=roblox-studio-malik\nExec=bash -c \"export WINEPREFIX=\\\"$HOME/.wine-roblox-malik/studio-malik\\\" && export WINEESYNC=1 && export WINEFSYNC=1 && \\\"$WINE_RUN\\\" \\\"\$(find \\\"$HOME/.wine-roblox-malik/studio-malik/drive_c/users/$USER/AppData/Local/Roblox/Versions\\\" -name 'RobloxStudioLauncherBeta.exe' -not -path '*/Temp/*')\\\" %U\"\nIcon=$HOME/.wine-roblox-malik/Roblox-Studio-Beta.png\nMimeType=x-scheme-handler/roblox-studio;application/x-roblox-rbxl;application/x-roblox-rbxlx\nType=Application\nTerminal=false\n" > "$HOME/.local/share/applications/roblox-studio-malik.desktop"
chmod +x "$HOME/.local/share/applications/roblox-studio-malik.desktop"
echo -e "[Desktop Entry]\nVersion=1.0\nName=roblox-studio-auth-malik\nExec=bash -c \"export WINEPREFIX=\\\"$HOME/.wine-roblox-malik/studio-malik\\\" && export WINEESYNC=1 && export WINEFSYNC=1 && \\\"$WINE_RUN\\\" \\\"\$(find \\\"$HOME/.wine-roblox-malik/studio-malik/drive_c/users/$USER/AppData/Local/Roblox/Versions\\\" -name 'RobloxStudioBeta.exe' -not -path '*/Temp/*')\\\" %U\"\nIcon=$HOME/.wine-roblox-malik/Roblox-Studio-Beta.png\nMimeType=x-scheme-handler/roblox-studio-auth;application/x-roblox-rbxl;application/x-roblox-rbxlx\nType=Application\nTerminal=false\n" > "$HOME/.local/share/applications/roblox-studio-auth-malik.desktop"
chmod +x "$HOME/.local/share/applications/roblox-studio-auth-malik.desktop"

#install studio
WINEPREFIX="$HOME/.wine-roblox-malik/studio-malik" WINEDEBUG=-all WINEESYNC=1 WINEFSYNC=1 $WINE_RUN "$HOME/.wine-roblox-malik/drive_c/users/$USER/AppData/Local/Roblox/Versions/RobloxStudioLauncherBeta.exe"
rm "$HOME/Desktop/Roblox Studio.desktop"
rm "$HOME/Desktop/Roblox Studio.lnk"

echo -e "[Desktop Entry]\nVersion=1.0\nName=Roblox Studio Malik\nExec=bash -c \"export WINEPREFIX=\\\"$HOME/.wine-roblox-malik/studio-malik\\\" && export WINEESYNC=1 && export WINEFSYNC=1 && \\\"$WINE_RUN\\\" \\\"\$(find \\\"$HOME/.wine-roblox-malik/studio-malik/drive_c/users/$USER/AppData/Local/Roblox/Versions\\\" -name 'RobloxStudioLauncherBeta.exe' -not -path '*/Temp/*') \\\" -ide \"\nIcon=$HOME/.wine-roblox-malik/Roblox-Studio-Beta.png\nMimeType=x-scheme-handler/roblox-studio;application/x-roblox-rbxl;application/x-roblox-rbxlx\nType=Application\n" > "$HOME/Desktop/Roblox Studio Malik.desktop"
chmod +x "$HOME/Desktop/Roblox Studio Malik.desktop"

sleep 3

#update api to vulkan	
sed -i 's/"FFlagDebugGraphicsPreferVulkan":false/"FFlagDebugGraphicsPreferVulkan":true/g' "$HOME/.wine-roblox-malik/studio-malik/drive_c/users/$USER/AppData/Local/Roblox/ClientSettings/StudioAppSettings.json"

clear
echo "Roblox Studio setup complete."
main_menu
	    ;;

#################################################################################
########################      Uninstall Roblox        ###########################
#################################################################################

        "Uninstall Roblox")
        
if [ -d "$HOME/.wine-roblox-TouseefX" ];
then
	rm -rf "$HOME/.wine-roblox-TouseefX"
fi

if [ -f "$HOME/.local/share/applications/roblox-malik.desktop" ];
then
	rm "$HOME/.local/share/applications/roblox-malik.desktop"
fi

if [ -f "$HOME/.local/share/applications/roblox-studio-malik.desktop" ];
then
	rm "$HOME/.local/share/applications/roblox-studio-malik.desktop"
fi

if [ -f "$HOME/.local/share/applications/roblox-studio-auth-malik.desktop" ];
then
	rm "$HOME/.local/share/applications/roblox-studio-auth-malik.desktop"
fi

if [ -f "$HOME/Desktop/Roblox Studio Malik.desktop" ];
then
	rm "$HOME/Desktop/Roblox Studio Malik.desktop"
fi

if [ -f "$HOME/Desktop/Roblox App Malik.desktop" ];
then
	rm "$HOME/Desktop/Roblox App Malik.desktop"
fi

if [ -f "$HOME/.config/mimeapps.list" ];
then
	sed -i '/roblox/d' "$HOME/.config/mimeapps.list"
fi
clear
echo "Uninstall complete. Shits off."
main_menu
#exit
	    ;;
	"Exit")
	exit
	    ;;
        *) echo "Invalid selection $REPLY. Valid selections are 1,2.3 and 4.";;
    esac
done
#exit

}

main_menu










