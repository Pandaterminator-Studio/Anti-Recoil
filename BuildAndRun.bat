@echo off
echo Building Anti-Recoil Executor...
cd /d "%~dp0AntiRecoilExecutor"

dotnet build --configuration Release
if %ERRORLEVEL% EQU 0 (
    echo Build successful!
    echo Starting application...
    dotnet run --configuration Release
) else (
    echo Build failed!
    pause
)
