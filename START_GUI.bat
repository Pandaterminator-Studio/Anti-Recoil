@echo off
title Anti-Recoil GUI Launcher
color 0B

echo.
echo ========================================
echo    ANTI-RECOIL GUI APPLICATION
echo ========================================
echo.
echo Starting GUI version with configuration...
echo.
echo Features:
echo - Button configuration setup
echo - Real-time status display
echo - Easy weapon settings
echo - Professional interface
echo.
echo Loading...

REM Check if GUI script exists
if not exist "%~dp0AntiRecoil-Simple-GUI.ps1" (
    echo ERROR: AntiRecoil-Simple-GUI.ps1 not found!
    echo Please ensure the GUI script is in the same folder.
    pause
    exit /b 1
)

REM Launch GUI PowerShell script
powershell.exe -WindowStyle Normal -ExecutionPolicy Bypass -File "%~dp0AntiRecoil-Simple-GUI.ps1"

echo.
echo GUI Application terminated.
pause
