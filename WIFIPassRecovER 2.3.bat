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
