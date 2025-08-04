@echo off
echo Starting Anti-Recoil Script...
echo.
echo This script will run the anti-recoil functionality directly in PowerShell.
echo Make sure to run this as Administrator for best results.
echo.
pause

powershell.exe -ExecutionPolicy Bypass -File "%~dp0AntiRecoil-PowerShell.ps1"

echo.
echo Script terminated. Press any key to exit...
pause > nul
