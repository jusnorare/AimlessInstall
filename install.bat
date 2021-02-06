@echo off
title Installing
:spigot
cls
powershell "(new-Object System.Net.WebClient).DownloadFile('https://papermc.io/api/v2/projects/paper/versions/1.16.4/builds/416/downloads/paper-1.16.4-416.jar', '%~dp0paper-1.16.4-416.jar')"
echo Papermc downloaded
echo.
pause

:eula
cls
echo Agree EULA?
echo.
choice /c yn /n /m "(Y/N):"
set eul=%errorlevel%
If %eul%==1 goto yes
If %eul%==2 goto no


:yes
cls
powershell "(new-Object System.Net.WebClient).DownloadFile('https://blog.kakaocdn.net/dn/DmO8s/btqVZRt6BP0/voLp3KlSXKrZPkfNDlQWI1/start.bat?attach=1&knm=tfile.bat', '%~dp0start.bat')"
powershell "(new-Object System.Net.WebClient).DownloadFile('https://blog.kakaocdn.net/dn/0EoM3/btqTEL9rfox/D0N9eMzRkkKhjew82hkV20/eula.txt?attach=1&knm=tfile.txt', '%~dp0eula.txt')"
mkdir plugins
powershell "(new-Object System.Net.WebClient).DownloadFile('https://blog.kakaocdn.net/dn/twsf5/btqV9ZjIguN/iaYBZxlCM9RL8QXSLJC0Y0/caramelAimlessSurvival.jar?attach=1&knm=tfile.jar', '%~dp0plugins\caramelAimlessSurvival.jar')"
powershell "(new-Object System.Net.WebClient).DownloadFile('https://blog.kakaocdn.net/dn/cdqDsV/btqV2JV3HM6/KvJ9KtLmtoZMJ5v0ClySY1/ProtocolLib.jar?attach=1&knm=tfile.jar', '%~dp0plugins\ProtocolLib.jar')"
mkdir plugins\caramelAimlessSurvival
powershell "(new-Object System.Net.WebClient).DownloadFile('https://blog.kakaocdn.net/dn/bwyIW7/btqVRYgasBt/YcpSQ1o4koWp3oRPq1okg1/config.yml?attach=1&knm=tfile.yml', '%~dp0plugins\caramelAimlessSurvival\config.yml')"
start %~dp0start.bat ""
del /q /f "%~dp0install.exe"
exit


:no
cls
del /q /f "%~dp0paper-1.16.4-416.jar"
echo If you don't agree EULA and you can't open server
echo.
pause