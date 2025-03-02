@echo off & setlocal enabledelayedexpansion

:: Default Variable
Set "autName=Sagar Mondal"
Set "proName=WIFIPassRecovER"
Set "proVer=2.3"

Title  %proName% by %autName%

:: Program File Check!!
IF NOT "%~n0"=="%proName% %proVer%" (
	echo.
    ECHO Incorrect Namespace! This program made by %autName%".
    timeout /t 5 /nobreak
    exit
)

Mode con cols=75 lines=8
cls & color 0A
	echo __          _______ ______ _____  _____              _____                     ______ _____  
	echo \ \        / /_   _^|  ____^|_   _^|^|  __ \            ^|  __ \                   ^|  ____^|  __ \ 
	echo  \ \  /\  / /  ^| ^| ^| ^|__    ^| ^|  ^| ^|__) ^|_ _ ___ ___^| ^|__) ^|___  ___ _____   _^| ^|__  ^| ^|__) ^|
	echo   \ \/  \/ /   ^| ^| ^|  __^|   ^| ^|  ^|  ___/ _` / __/ __^|  _  // _ \/ __/ _ \ \ / /  __^| ^|  _  / 
	echo    \  /\  /   _^| ^|_^| ^|     _^| ^|_ ^| ^|  ^| (_^| \__ \__ \ ^| \ \  __/ (_^| (_) \ V /^| ^|____^| ^| \ \ 
	echo     \/  \/   ^|_____^|_^|    ^|_____^|^|_^|   \__,_^|___/___/_^|  \_\___^|\___\___/ \_/ ^|______^|_^|  \_\
	echo.
	echo(
if _%1_==_Main_  goto :Main
Set Count=0
Set L=0

Mode con cols=75 lines=8
cls & color 0A
	echo __          _______ ______ _____  _____              _____                     ______ _____  
	echo \ \        / /_   _^|  ____^|_   _^|^|  __ \            ^|  __ \                   ^|  ____^|  __ \ 
	echo  \ \  /\  / /  ^| ^| ^| ^|__    ^| ^|  ^| ^|__) ^|_ _ ___ ___^| ^|__) ^|___  ___ _____   _^| ^|__  ^| ^|__) ^|
	echo   \ \/  \/ /   ^| ^| ^|  __^|   ^| ^|  ^|  ___/ _` / __/ __^|  _  // _ \/ __/ _ \ \ / /  __^| ^|  _  / 
	echo    \  /\  /   _^| ^|_^| ^|     _^| ^|_ ^| ^|  ^| (_^| \__ \__ \ ^| \ \  __/ (_^| (_) \ V /^| ^|____^| ^| \ \ 
	echo     \/  \/   ^|_____^|_^|    ^|_____^|^|_^|   \__,_^|___/___/_^|  \_\___^|\___\___/ \_/ ^|______^|_^|  \_\
	echo.
	echo(
if _%1_==_Main_  goto :Main
Set Count=0
Set L=0

REM ===================== Get Admin
:getAdmin
    echo               %~nx0 : self elevating
    set vbs=%temp%\getAdmin.vbs
(
	echo Set UAC = CreateObject^("Shell.Application"^)
	echo UAC.ShellExecute "%~s0", "Main %~sdp0 %*", "", "runas", 1
)> "%vbs%"
    "%temp%\getAdmin.vbs"
    del "%temp%\getAdmin.vbs"
goto :eof

REM ===================== Main Program
:Main
Call :init
Call :LineCount
Set "PasswordLog=%~dp0Wifi_Passwords_on_%ComputerName%.txt"
%Mod%
	echo(
	echo             ***********************************************
	echo                   %proName% %proVer% by %autName%
	echo             ***********************************************
	echo(
Call :colorCMD 0E "                 [N][SSID] ================ Password" 1
echo(
(
	echo             ***********************************************
	echo                   %proName% %proVer% by %autName%
	echo             ***********************************************
	echo(
	echo                  [N][SSID] ==============^> "Password"
	echo(
	
)>"%PasswordLog%"
for /f "skip=2 delims=: tokens=2" %%a in ('netsh wlan show profiles') do (
    if not "%%a"=="" (
        set "ssid=%%a"
        set "ssid=!ssid:~1!"
		call :Getpassword "!ssid!"
    )
)
echo(
echo Done
If exist "%PasswordLog%" start "" "%PasswordLog%"
pause>nul
exit
