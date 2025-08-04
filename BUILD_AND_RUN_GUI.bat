@echo off
title Anti-Recoil C# Application Builder
color 0B

echo.
echo ========================================
echo    C# APPLICATION BUILDER/RUNNER
echo ========================================
echo.
echo This will attempt to build and run the C# GUI version
echo of the Anti-Recoil application.
echo.

REM Check if .NET is installed
dotnet --version >nul 2>&1
if %errorLevel% == 0 (
    echo ✓ .NET SDK detected
    dotnet --version
    echo.
    echo Building C# application...
    cd /d "%~dp0AntiRecoilExecutor"
    
    dotnet build --configuration Release
    if %errorLevel% == 0 (
        echo.
        echo ✓ Build successful! Launching GUI application...
        echo.
        dotnet run --configuration Release
    ) else (
        echo.
        echo ✗ Build failed. Check for compilation errors.
        echo.
        echo Falling back to PowerShell version...
        cd /d "%~dp0"
        powershell.exe -ExecutionPolicy Bypass -File "AntiRecoil-PowerShell.ps1"
    )
) else (
    echo ✗ .NET SDK not found
    echo.
    echo The C# version requires .NET 6.0 SDK to be installed.
    echo Download from: https://dotnet.microsoft.com/download
    echo.
    echo Launching PowerShell version instead...
    echo.
    timeout /t 3 /nobreak >nul
    powershell.exe -ExecutionPolicy Bypass -File "%~dp0AntiRecoil-PowerShell.ps1"
)

echo.
echo Application terminated.
pause
