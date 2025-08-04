@echo off
title Anti-Recoil Administrator Launcher
color 0C

REM Force run as administrator
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM Check if we have admin rights
if '%errorlevel%' NEQ '0' (
    echo Requesting administrator privileges...
    goto UACPrompt
) else ( 
    goto gotAdmin 
)

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
    "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )
    pushd "%CD%"
    CD /D "%~dp0"

echo.
echo ========================================
echo   ANTI-RECOIL (Administrator Mode)
echo ========================================
echo.
echo ✓ Running with Administrator privileges
echo ✓ Optimal performance mode enabled
echo.
echo Launching Anti-Recoil Script...
echo.

powershell.exe -WindowStyle Normal -ExecutionPolicy Bypass -File "%~dp0AntiRecoil-PowerShell.ps1"

echo.
echo Script terminated.
pause
