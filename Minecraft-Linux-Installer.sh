#!/bin/bash 
 
echo "Which Minecraft DO You Need? Must Paste Sudo su to run this script correctly and for TLaucherDesktop install TLauncher then exit then exit sudo su by typing exit then install TLaucherDesktop"
 
select os in SKLaucherForLow TLaucher TLaucherDesktop InstallJava
do
case $os in
  "SKLaucherForLow"|"SKLaucherForLow")
     echo "Soon"
     ;;
  "TLaucher"|"TLaucher")
     echo "Starting to Install"
     sleep 3
     sudo apt install rename
     cd /opt/
     mkdir TLDesktop
     cd TLDesktop
     sleep 3
     sudo apt install wget
     sudo apt update
     echo "Creating Desktop For TL (Then choose TLaucherDesktop)"
     sleep 5
     wget https://tlauncher.org/fav-pe-icon-512.png
     wget https://raw.githubusercontent.com/TouseefX/TouseefX/main/TL.desktop
     sudo mv /opt/TLDesktop/TL.desktop /usr/share/applications/
     wget https://raw.githubusercontent.com/TouseefX/TouseefX/main/TL.desktop
     sudo mv /opt/TLDesktop/TL.desktop ~/.local/share/applications/
     ehco "Creating Desktop File Done"
     ;;
     "TLaucherDesktop"|"TLaucherDesktop")
     echo "Starting" 
     cd /home
     mkdir TXRunner
     cd ~/TXRunner
     wget https://tlauncher.org/jar
     sudo mv jar TL.jar
     wget https://raw.githubusercontent.com/TouseefX/TouseefX/main/Run-App.sh
     ;;
     "InstallJava"|"InstallJava")
     echo "Starting to Install Java"
     sleep 5
     sudo apt update && sudo apt upgrade && wget https://github.com/adoptium/temurin18-binaries/releases/download/jdk-18.0.2.1%2B1/OpenJDK18U-jdk_x64_linux_hotspot_18.0.2.1_1.tar.gz && tar -xvf OpenJDK18U-jdk_x64_linux_hotspot_18.0.2.1_1.tar.gz && sudo mv jdk-18.0.2.1+1/ /opt/ && cd /opt/ && sudo update-alternatives --install /usr/bin/java java /opt/jdk-18.0.2.1+1/bin/java 500 && sudo update-alternatives --config java && java --version && cd
   ;;
*)
echo "Invalid entry."
break
;;
esac
done
