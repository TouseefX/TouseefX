ECHO OFF
echo if u run it admin it work without no work
cd C:\Windows\System32
echo.
echo.
echo Installing Wget to
cd
echo Press any key to start installing
pause>nul
del nul
curl -LO http://eternallybored.org/misc/wget/1.21.4/64/wget.exe -O wget.exe
cd C:\
mkdir Bloxstrap
cd Bloxstrap
wget https://download.visualstudio.microsoft.com/download/pr/1146f414-17c7-4184-8b10-1addfa5315e4/39db5573efb029130add485566320d74/windowsdesktop-runtime-6.0.20-win-x64.exe
start windowsdesktop-runtime-6.0.20-win-x64.exe
pause
echo Start Installing Bloxstrap
wget https://github.com/pizzaboxer/bloxstrap/releases/download/v2.5.2/Bloxstrap-v2.5.2.exe
start Bloxstrap-v2.5.2.exe
cd C:\
mkdir BloxstrapTemp
cd BloxstrapTemp
echo Press Any Key To Exit
pause>nul
del nul
cd C:\
rmdir BloxstrapTemp
echo making Space In Free more a littile bit
cd C:\
cd Bloxstrap
del windowsdesktop-runtime-6.0.20-win-x64.exe
del Bloxstrap-v2.5.2.exe
cd C:\
rmdir Bloxstrap
