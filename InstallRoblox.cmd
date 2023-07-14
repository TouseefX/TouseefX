@ECHO OFF
ECHO OFF
echo if u run it admin it work without no work
pause
cd
cd C:\Windows\System32
curl -LO http://eternallybored.org/misc/wget/1.21.4/64/wget.exe -O wget.exe
cd
cd C:\
mkdir Roblox
cd Roblox
wget https://roblox.com/download/client
Ren client Client.exe
start Client.exe

now save it as cmd
