@echo off
title Anti-Recoil Script Launcher
color 0A

echo.
echo ========================================
echo    ANTI-RECOIL SCRIPT LAUNCHER
echo ========================================
echo.
echo Original Lua Script by: Seyed Jafar Yaghoubi
echo PowerShell Implementation by: GitHub Copilot
echo.
echo This script will launch the anti-recoil functionality
echo that works with ANY mouse (not just Logitech).
echo.
echo IMPORTANT: For best results, run this as Administrator
echo            Right-click this file and select "Run as administrator"
echo.
pause

cls
echo.
echo ========================================
echo         LAUNCHING ANTI-RECOIL
echo ========================================
echo.
echo Starting PowerShell anti-recoil script...
echo.
echo CONTROLS (once running):
echo   NumLock:      Toggle script ON/OFF
echo   CapsLock:     Toggle Auto-ADS mode
echo   Mouse Btn 9:  Switch weapon profiles
echo   Left Click:   Fire with recoil compensation
echo   Ctrl+C:       Exit script
echo.
echo The script will show real-time status in the console.
echo Turn NumLock ON to activate recoil compensation.
echo.
echo Starting in 3 seconds...
timeout /t 3 /nobreak >nul

cls
echo Launching Anti-Recoil Script...
echo.

REM Check if PowerShell script exists
if not exist "%~dp0AntiRecoil-PowerShell.ps1" (
    echo ERROR: AntiRecoil-PowerShell.ps1 not found!
    echo Please ensure the PowerShell script is in the same folder.
    pause
    exit /b 1
)

REM Launch PowerShell script with bypass execution policy
powershell.exe -WindowStyle Normal -ExecutionPolicy Bypass -File "%~dp0AntiRecoil-PowerShell.ps1"

echo.
echo Anti-Recoil Script has been terminated.
echo.
pause
