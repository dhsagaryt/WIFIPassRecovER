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

