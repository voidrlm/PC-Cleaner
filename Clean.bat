@echo off
:clean
title PC Cleaner By vOiDrLm
mode con: cols=80 lines=20
del null
cls

color 03
echo --------------------------------------------------------------------------------
echo  \cleaner
echo --------------------------------------------------------------------------------
echo.
echo Options:
echo.
echo A)Complete Cleanup
echo 1)Clean Temp Files
echo 2)Clean Recycle Bin
echo 3)Remove Windows.old
echo 4)Clean internet data
echo 5)Remove bloatware
echo X)Exit
echo.
set /p input=" Enter Selection: "
IF /I "%input%" == "A" goto complete
IF /I "%input%" == "1" goto clearTemp
IF /I "%input%" == "2" goto remBin
IF /I "%input%" == "3" goto remWinOld
IF /I "%input%" == "4" goto remInetData
IF /I "%input%" == "5" goto remBloat
IF /I "%input%" == "X" goto exit
goto 404

:exit
del bloatScript.ps1
del null
exit

:remBloat
start cmd /k "@echo off && title Removing bloatware && color 0a && powershell -executionpolicy bypass -File bloatScript.ps1 && exit"
color 0a
goto clean


:complete
color 06
rd /s /q %systemdrive%\$Recycle.Bin
title Cleaning temp files
cls
del /s /f /q %HomePath%\AppData\LocalLow\Temp\*.*
cls
del /f /s /q %userprofile%\Local Settings\Temp\*.*
title Cleaning AMD files
rd /s /q %SYSTEMDRIVE%\AMD
cls
title Cleaning NVIDIA files
rd /s /q %SYSTEMDRIVE%\NVIDIA
cls
title Cleaning INTEL files
rd /s /q %SYSTEMDRIVE%\INTEL
title Cleaning temp files
cls
del /s /f /q “%SystemDrive%\Temp”*.*
rd /s /q “%SystemDrive%\Temp”
md “%SystemDrive%\Temp”
cls
rmdir %userprofile%\recent
cls
del /f /s /q %systemdrive%\*._mp
cls
title Cleaning log files
del /f /s /q %systemdrive%\*.log
cls
title Cleaning gid files
del /f /s /q %systemdrive%\*.gid
cls
title Cleaning corrupt files
del /f /s /q %systemdrive%\*.chk
cls
title Cleaning old files
del /f /s /q %systemdrive%\*.old
cls
title Cleaning backup files
del /f /s /q %windir%\*.bak
title Cleaning temp files
cls
del /s /f /q %windir%\temp*.*
rd /s /q %windir%\temp
md %windir%\temp
del /s /f /q %HomePath%\AppData\LocalLow\Temp\*.*
cls
del /f /s /q %userprofile%\Local Settings\Temp\*.*
title Cleaning Prefetch files
del /s /f /q %windir%\Prefetch*.*
cls
rd /s /q %windir%\Prefetch
cls
md %windir%\Prefetch
cls
title Cleaning cache files
cls
del /s /f /q %windir%\system32\dllcache*.*
rd /s /q %windir%\system32\dllcache
md %windir%\system32\dllcache
title Cleaning temp files
cls
del /s /f /q %temp%*.*
rd /s /q %temp%
md %temp%
title Cleaning temp setting files
cls
del /s /f /q “%USERPROFILE%\Local Settings\Temp”*.*
rd /s /q “%USERPROFILE%\Local Settings\Temp”
md “%USERPROFILE%\Local Settings\Temp”
del /s /f /q “%USERPROFILE%\Recent”*.*
rd /s /q “%USERPROFILE%\Recent”
md “%USERPROFILE%\Recent”
cls
attrib -h -r -s %windir%\system32\catroot2
cls
attrib -h -r -s %windir%\system32\catroot2.
cls
title Stopping wuauserv
net stop wuauserv
cls
title Stopping cryptSvc
net stop cryptSvc
cls
title Stopping bits
net stop bits
cls
title Stopping msiserver
net stop msiserver
cls
Ren %SystemDrive%\Windows\SoftwareDistribution SoftwareDistribution.old
cls
Ren %SystemDrive%\Windows\System32\catroot2 Catroot2.old
cls
title Starting wuauserv
cls
net start wuauserv
title Starting cryptSvc
cls
net start cryptSvc
title Starting bits
cls
net start bits
title Starting msiserver
cls
net start msiserver
cls
title Processing Files(Might take some time)...
takeown /F %SystemDrive%\Windows.old\* /R /A /D Y
cls
cacls %SystemDrive%\Windows.old\*.* /T /grant administrators:F
cls
title Removing Files...
rmdir /S /Q %SystemDrive%\Windows.old\
cls
taskkill /F /IM chrome.exe /T
cls
taskkill /F /IM safari.exe /T
cls
taskkill /F /IM msedge.exe /T
cls
taskkill /F /IM firefox.exe /T
cls
del /s /f /q “%USERPROFILE%\Local Settings\History”*.*
rd /s /q “%USERPROFILE%\Local Settings\History”
md “%USERPROFILE%\Local Settings\History”
del /s /f /q “%USERPROFILE%\Local Settings\Temporary Internet Files”*.*
rd /s /q “%USERPROFILE%\Local Settings\Temporary Internet Files”
md “%USERPROFILE%\Local Settings\Temporary Internet Files”
rmdir %userprofile%\Local Settings\Temporary Internet Files\
set FlashCookies=%systemdrive%\Users\%USERNAME%\AppData\Roaming\Macromedia\Flashp~1
del /q /s /f "%FlashCookies%"
rd /s /q "%FlashCookies%"
cls
set DataDir=%systemdrive%\Users\%USERNAME%\AppData\Local\Microsoft\Intern~1

del /q /s /f "%DataDir%"
rd /s /q "%DataDir%"
cls

set History=%systemdrive%\Users\%USERNAME%\AppData\Local\Microsoft\Windows\History

del /q /s /f "%History%"
rd /s /q "%History%"
cls
set IETemp=%systemdrive%\Users\%USERNAME%\AppData\Local\Microsoft\Windows\Tempor~1

del /q /s /f "%IETemp%"
rd /s /q "%IETemp%"
cls
set Cookies=%systemdrive%\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Cookies

del /q /s /f %systemdrive%\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Cookies
rd /s /q %systemdrive%\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Cookies
cls
%systemdrive%\bin\regdelete.exe HKEY_CURRENT_USER "Software\Microsoft\Internet Explorer\TypedURLs"
set DataDir=%systemdrive%\Users\%USERNAME%\AppData\Local\Microsoft\Intern~1

del /q /s /f "%DataDir%"
rd /s /q "%DataDir%"
cls
set History=%systemdrive%\Users\%USERNAME%\AppData\Local\Microsoft\Windows\History

del /q /s /f "%History%"
rd /s /q "%History%"
cls
set IETemp=%systemdrive%\Users\%USERNAME%\AppData\Local\Microsoft\Windows\Tempor~1

del /q /s /f "%IETemp%"
rd /s /q "%IETemp%"
cls
set Cookies=%systemdrive%\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Cookies

del /q /s /f "%Cookies%"
rd /s /q "%Cookies%"

cls
%systemdrive%\bin\regdelete.exe HKEY_CURRENT_USER "Software\Microsoft\Internet Explorer\TypedURLs"
set DataDir=%systemdrive%\Users\%USERNAME%\AppData\Local\Applec~1\Safari
set DataDir2=%systemdrive%\Users\%USERNAME%\AppData\Roaming\Applec~1\Safari

del /q /s /f "%DataDir%\History"
rd /s /q "%DataDir%\History"

del /q /s /f "%DataDir%\Cache.db"
del /q /s /f "%DataDir%\WebpageIcons.db"

del /q /s /f "%DataDir2%"
rd /s /q "%DataDir2%"
cls
set DataDir=%systemdrive%\Users\%USERNAME%\AppData\Local\Opera\Opera
set DataDir2=%systemdrive%\Users\%USERNAME%\AppData\Roaming\Opera\Opera

del /q /s /f "%DataDir%"
rd /s /q "%DataDir%"

del /q /s /f "%DataDir2%"
rd /s /q "%DataDir2%"
cls
set DataDir=%systemdrive%\Users\%USERNAME%\AppData\Local\Mozilla\Firefox\Profiles

del /q /s /f "%DataDir%"
rd /s /q "%DataDir%"

for /d %%x in (%systemdrive%\Users\%USERNAME%\AppData\Roaming\Mozilla\Firefox\Profiles\*) do del /q /s /f %%x\*sqlite
cls
set ChromeDir=%systemdrive%\Users\%USERNAME%\AppData\Local\Google\Chrome\User Data

del /q /s /f "%ChromeDir%"
rd /s /q "%ChromeDir%"
cls
color 0a
goto successPause


:remBin
color 06
rd /s /q %systemdrive%\$Recycle.Bin
color 0a
goto successPause

:clearTemp
title Cleaning temp files
cls
del /s /f /q %HomePath%\AppData\LocalLow\Temp\*.*
cls
del /f /s /q %userprofile%\Local Settings\Temp\*.*
title Cleaning AMD files
rd /s /q %SYSTEMDRIVE%\AMD
cls
title Cleaning NVIDIA files
rd /s /q %SYSTEMDRIVE%\NVIDIA
cls
title Cleaning INTEL files
rd /s /q %SYSTEMDRIVE%\INTEL
title Cleaning temp files
cls
del /s /f /q “%SystemDrive%\Temp”*.*
rd /s /q “%SystemDrive%\Temp”
md “%SystemDrive%\Temp”
cls
rmdir %userprofile%\recent
cls
del /f /s /q %systemdrive%\*._mp
cls
title Cleaning log files
del /f /s /q %systemdrive%\*.log
cls
title Cleaning gid files
del /f /s /q %systemdrive%\*.gid
cls
title Cleaning corrupt files
del /f /s /q %systemdrive%\*.chk
cls
title Cleaning old files
del /f /s /q %systemdrive%\*.old
cls
title Cleaning backup files
del /f /s /q %windir%\*.bak
title Cleaning temp files
cls
del /s /f /q %windir%\temp*.*
rd /s /q %windir%\temp
md %windir%\temp
del /s /f /q %HomePath%\AppData\LocalLow\Temp\*.*
cls
del /f /s /q %userprofile%\Local Settings\Temp\*.*
title Cleaning Prefetch files
cls
del /s /f /q %windir%\Prefetch*.*
cls
rd /s /q %windir%\Prefetch
cls
md %windir%\Prefetch
cls
title Cleaning cache files
cls
del /s /f /q %windir%\system32\dllcache*.*
rd /s /q %windir%\system32\dllcache
md %windir%\system32\dllcache
title Cleaning temp files
cls
del /s /f /q %temp%*.*
rd /s /q %temp%
md %temp%
title Cleaning temp setting files
cls
del /s /f /q “%USERPROFILE%\Local Settings\Temp”*.*
rd /s /q “%USERPROFILE%\Local Settings\Temp”
md “%USERPROFILE%\Local Settings\Temp”
del /s /f /q “%USERPROFILE%\Recent”*.*
rd /s /q “%USERPROFILE%\Recent”
md “%USERPROFILE%\Recent”
cls
attrib -h -r -s %windir%\system32\catroot2
cls
attrib -h -r -s %windir%\system32\catroot2.
cls
title Stopping wuauserv
net stop wuauserv
cls
title Stopping cryptSvc
net stop cryptSvc
cls
title Stopping bits
net stop bits
cls
title Stopping msiserver
net stop msiserver
cls
Ren %SystemDrive%\Windows\SoftwareDistribution SoftwareDistribution.old
cls
Ren %SystemDrive%\Windows\System32\catroot2 Catroot2.old
cls
title Starting wuauserv
cls
net start wuauserv
title Starting cryptSvc
cls
net start cryptSvc
title Starting bits
cls
net start bits
title Starting msiserver
cls
net start msiserver
cls
color 0a
goto successPause

:remWinOld
color 06
title Processing Files(Might take some time)...
takeown /F %SystemDrive%\Windows.old\* /R /A /D Y
cls
cacls %SystemDrive%\Windows.old\*.* /T /grant administrators:F
cls
title Removing Files...
rmdir /S /Q %SystemDrive%\Windows.old\
cls
color 0a
goto successPause

:remInetData
color 06
title Clearing cookies and temp internet files...
echo Are you sure you want to close your browser?
echo Confirm Action?(y/n)
set /p input=" Enter Selection: "
IF /I "%input%" == "y" goto killbrowser
IF /I "%input%" == "n" goto clean
goto 404

:killbrowser
taskkill /F /IM chrome.exe /T
cls
taskkill /F /IM safari.exe /T
cls
taskkill /F /IM msedge.exe /T
cls
taskkill /F /IM firefox.exe /T
cls
del /s /f /q “%USERPROFILE%\Local Settings\History”*.*
rd /s /q “%USERPROFILE%\Local Settings\History”
md “%USERPROFILE%\Local Settings\History”
del /s /f /q “%USERPROFILE%\Local Settings\Temporary Internet Files”*.*
rd /s /q “%USERPROFILE%\Local Settings\Temporary Internet Files”
md “%USERPROFILE%\Local Settings\Temporary Internet Files”
rmdir %userprofile%\Local Settings\Temporary Internet Files\
set FlashCookies=%systemdrive%\Users\%USERNAME%\AppData\Roaming\Macromedia\Flashp~1
del /q /s /f "%FlashCookies%"
rd /s /q "%FlashCookies%"
cls
set DataDir=%systemdrive%\Users\%USERNAME%\AppData\Local\Microsoft\Intern~1

del /q /s /f "%DataDir%"
rd /s /q "%DataDir%"
cls

set History=%systemdrive%\Users\%USERNAME%\AppData\Local\Microsoft\Windows\History

del /q /s /f "%History%"
rd /s /q "%History%"
cls
set IETemp=%systemdrive%\Users\%USERNAME%\AppData\Local\Microsoft\Windows\Tempor~1

del /q /s /f "%IETemp%"
rd /s /q "%IETemp%"
cls
set Cookies=%systemdrive%\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Cookies

del /q /s /f %systemdrive%\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Cookies
rd /s /q %systemdrive%\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Cookies
cls
%systemdrive%\bin\regdelete.exe HKEY_CURRENT_USER "Software\Microsoft\Internet Explorer\TypedURLs"
set DataDir=%systemdrive%\Users\%USERNAME%\AppData\Local\Microsoft\Intern~1

del /q /s /f "%DataDir%"
rd /s /q "%DataDir%"
cls
set History=%systemdrive%\Users\%USERNAME%\AppData\Local\Microsoft\Windows\History

del /q /s /f "%History%"
rd /s /q "%History%"
cls
set IETemp=%systemdrive%\Users\%USERNAME%\AppData\Local\Microsoft\Windows\Tempor~1

del /q /s /f "%IETemp%"
rd /s /q "%IETemp%"
cls
set Cookies=%systemdrive%\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Cookies

del /q /s /f "%Cookies%"
rd /s /q "%Cookies%"

cls
%systemdrive%\bin\regdelete.exe HKEY_CURRENT_USER "Software\Microsoft\Internet Explorer\TypedURLs"
set DataDir=%systemdrive%\Users\%USERNAME%\AppData\Local\Applec~1\Safari
set DataDir2=%systemdrive%\Users\%USERNAME%\AppData\Roaming\Applec~1\Safari

del /q /s /f "%DataDir%\History"
rd /s /q "%DataDir%\History"

del /q /s /f "%DataDir%\Cache.db"
del /q /s /f "%DataDir%\WebpageIcons.db"

del /q /s /f "%DataDir2%"
rd /s /q "%DataDir2%"
cls
set DataDir=%systemdrive%\Users\%USERNAME%\AppData\Local\Opera\Opera
set DataDir2=%systemdrive%\Users\%USERNAME%\AppData\Roaming\Opera\Opera

del /q /s /f "%DataDir%"
rd /s /q "%DataDir%"

del /q /s /f "%DataDir2%"
rd /s /q "%DataDir2%"
cls
set DataDir=%systemdrive%\Users\%USERNAME%\AppData\Local\Mozilla\Firefox\Profiles

del /q /s /f "%DataDir%"
rd /s /q "%DataDir%"

for /d %%x in (%systemdrive%\Users\%USERNAME%\AppData\Roaming\Mozilla\Firefox\Profiles\*) do del /q /s /f %%x\*sqlite
cls
set ChromeDir=%systemdrive%\Users\%USERNAME%\AppData\Local\Google\Chrome\User Data

del /q /s /f "%ChromeDir%"
rd /s /q "%ChromeDir%"
cls
color 0a
goto successPause

























:successPause
cls
title success
color 0a
echo --------------------------------------------------------------------------------
echo  \success
echo --------------------------------------------------------------------------------
echo.
echo  Operation Completed Successfully
echo.
echo  Press Any Key To Continue.
pause>null
cls
color 0a
goto clean

:404
cls
title 404
color 04
echo --------------------------------------------------------------------------------
echo  \404
echo --------------------------------------------------------------------------------
echo.
echo  Unknown Command Entered
echo.
cls
color 0a
goto clean