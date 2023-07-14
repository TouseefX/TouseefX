ECHO OFF
echo if u run it admin it work without no work
cd
echo.
echo Installing Wget to
cd C:\Windows\System32
echo Press any key to start installing
pause>nul
rem nul
curl -LO http://eternallybored.org/misc/wget/1.21.4/64/wget.exe -O wget.exe
cd
cd C:\
mkdir Roblox
cd Roblox
wget https://roblox.com/download/client
Ren client Client.exe
start Client.exe
