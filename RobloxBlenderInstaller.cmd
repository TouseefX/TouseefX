echo off
Echo You Must Run in Admin
Cd C:\Windows\System32
curl -o wget.exe https://eternallybored.org/misc/wget/1.21.4/64/wget.exe
cd C:\Users\Public\Downloads
wget https://download.blender.org/release/Blender2.82/blender-2.82a-windows64.msi
wget https://raw.githubusercontent.com/TouseefX/TouseefX/main/V5aBemWL.py
cd Saved In Public Downloads
pause
start blender-2.82a-windows64.msi
pause
