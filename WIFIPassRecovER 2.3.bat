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

REM ===================== Get Admin
:getAdmin
    echo               %~nx0 : Self Elevating..
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
Set "PasswordLog=%~dp0WIFIPassRecovER_%COMPUTERNAME%_%date%.txt"
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
pause>nul
If exist "%PasswordLog%" start "" "%PasswordLog%"
exit

REM ===================== Get Password Function
:Getpassword
set "name=%1"
set "name=!name:"=!"
Set "passwd="
for /f "delims=: tokens=2" %%a in ('netsh wlan show profiles %1 key^=clear ^|find /I "Cont"') do (
	set "passwd=%%a"
	Set /a Count+=1
)

If defined passwd (
	set passwd=!passwd:~1!
	echo                  [!Count!][!name!] ====^> "!passwd!"
	echo                  [!Count!][!name!] ====^> "!passwd!" >> "%PasswordLog%"
) else (
	Set /a Count+=1
call :colorCMD 0C "                 [!Count!][!name!] The Password is empty" 1
	echo                  [!Count!][!name!] The Password is empty >> "%PasswordLog%"
)
exit /b

REM ===================== init
:init
prompt $g
for /F "delims=." %%a in ('"prompt $H. & for %%b in (1) do rem"') do set "BS=%%a"
exit /b

REM ===================== colorCMD
:colorCMD
set nL=%3
if not defined nL echo requires third argument & pause > nul & goto :eof
if %3 == 0 (
    <nul set /p ".=%bs%">%2 & findstr /v /a:%1 /r "^$" %2 nul & del %2 2>&1 & goto :eof
) else if %3 == 1 (
    echo %bs%>%2 & findstr /v /a:%1 /r "^$" %2 nul & del %2 2>&1 & goto :eof
)
exit /b

REM ===================== Line Count
:LineCount
for /f "skip=2 delims=: tokens=2" %%a in ('netsh wlan show profiles') do (
    if not "%%a"=="" (
		set /a L+=1
	)
)
set /a L=!L! + 10
Set Mod=Mode con cols=75 Lines=!L!
exit /b