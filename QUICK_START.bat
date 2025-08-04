@echo off
title Anti-Recoil Quick Start
color 0E

REM Quick launch with version selection
echo ========================================
echo     ANTI-RECOIL QUICK LAUNCHER
echo ========================================
echo.
echo Choose your version:
echo.
echo [1] GUI Version (Recommended)
echo     - Button configuration
echo     - Real-time status display
echo     - Easy settings management
echo.
echo [2] Console Version
echo     - Terminal interface
echo     - Lightweight
echo     - Quick start
echo.
set /p choice="Enter your choice (1 or 2): "

if "%choice%"=="1" (
    echo.
    echo Starting GUI version...
    powershell.exe -WindowStyle Normal -ExecutionPolicy Bypass -File "%~dp0AntiRecoil-Simple-GUI.ps1"
) else if "%choice%"=="2" (
    echo.
    echo Starting console version...
    powershell.exe -WindowStyle Normal -ExecutionPolicy Bypass -File "%~dp0AntiRecoil-PowerShell.ps1"
) else (
    echo.
    echo Invalid choice. Starting GUI version by default...
    powershell.exe -WindowStyle Normal -ExecutionPolicy Bypass -File "%~dp0AntiRecoil-Simple-GUI.ps1"
)

REM Return here when script exits
echo.
echo Script terminated.
timeout /t 2 /nobreak >nul
