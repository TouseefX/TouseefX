#!/bin/bash 
 
echo "Which Minecraft DO You Need? Must Paste Sudo su to run this script correctly"
 
select os in SKLaucherForLow TLaucher
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
     wget https://tlauncher.org/jar
     cd $HOME
     mkdir TXRunner
     cd /opt/
     cd TLDesktop
     sudo mv jar ~/TXRunner
     cd ~/TXRunner
     sudo mv jar TL.jar
     echo "Creating Desktop For TL"
     sleep 5
     wget https://raw.githubusercontent.com/TouseefX/TouseefX/main/Run-App.sh
     sudo mv Run-App.sh ~/TXRunner
     wget https://tlauncher.org/fav-pe-icon-512.png
     wget https://raw.githubusercontent.com/TouseefX/TouseefX/main/TL.desktop
     sudo mv /opt/TLDesktop/TL.desktop /usr/share/applications/
     wget https://raw.githubusercontent.com/TouseefX/TouseefX/main/TL.desktop
     sudo mv /opt/TLDesktop/TL.desktop ~/.local/share/applications/
     ehco "Creating Desktop File Done"
   ;;
*)
echo "Invalid entry."
break
;;
esac
done
