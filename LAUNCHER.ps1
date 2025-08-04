# Anti-Recoil Direct PowerShell Launcher
# This script can be run directly in PowerShell without batch files

param(
    [switch]$QuickStart,
    [switch]$ShowHelp
)

if ($ShowHelp) {
    Write-Host "Anti-Recoil PowerShell Launcher" -ForegroundColor Cyan
    Write-Host "================================" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "Usage:"
    Write-Host "  .\LAUNCHER.ps1                 # Normal start with prompts"
    Write-Host "  .\LAUNCHER.ps1 -QuickStart     # Quick start without prompts"
    Write-Host "  .\LAUNCHER.ps1 -ShowHelp       # Show this help"
    Write-Host ""
    Write-Host "Controls (when running):"
    Write-Host "  NumLock     : Toggle script ON/OFF"
    Write-Host "  CapsLock    : Toggle Auto-ADS mode"
    Write-Host "  Mouse Btn 9 : Switch weapon profiles"
    Write-Host "  Left Click  : Fire with recoil compensation"
    Write-Host "  Ctrl+C      : Exit script"
    Write-Host ""
    exit
}

$ScriptPath = Join-Path $PSScriptRoot "AntiRecoil-PowerShell.ps1"

if (-not (Test-Path $ScriptPath)) {
    Write-Host "ERROR: AntiRecoil-PowerShell.ps1 not found!" -ForegroundColor Red
    Write-Host "Please ensure the PowerShell script is in the same directory." -ForegroundColor Red
    exit 1
}

if (-not $QuickStart) {
    Clear-Host
    Write-Host "========================================" -ForegroundColor Green
    Write-Host "    ANTI-RECOIL SCRIPT LAUNCHER" -ForegroundColor Green
    Write-Host "========================================" -ForegroundColor Green
    Write-Host ""
    Write-Host "Original Lua Script by: Seyed Jafar Yaghoubi" -ForegroundColor Gray
    Write-Host "PowerShell Implementation by: GitHub Copilot" -ForegroundColor Gray
    Write-Host ""
    Write-Host "This script provides anti-recoil functionality for ANY mouse." -ForegroundColor White
    Write-Host ""
    Write-Host "CONTROLS:" -ForegroundColor Cyan
    Write-Host "  NumLock     : Toggle script ON/OFF" -ForegroundColor Yellow
    Write-Host "  CapsLock    : Toggle Auto-ADS mode" -ForegroundColor Yellow
    Write-Host "  Mouse Btn 9 : Switch weapon profiles" -ForegroundColor Yellow
    Write-Host "  Left Click  : Fire with recoil compensation" -ForegroundColor Yellow
    Write-Host "  Ctrl+C      : Exit script" -ForegroundColor Yellow
    Write-Host ""
    
    # Check if running as administrator
    $isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")
    
    if ($isAdmin) {
        Write-Host "✓ Running as Administrator" -ForegroundColor Green
    } else {
        Write-Host "⚠ Not running as Administrator" -ForegroundColor Yellow
        Write-Host "  For best results, run PowerShell as Administrator" -ForegroundColor Gray
    }
    
    Write-Host ""
    Write-Host "Press any key to start the anti-recoil script..." -ForegroundColor White
    $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
}

Write-Host ""
Write-Host "Launching Anti-Recoil Script..." -ForegroundColor Green
Write-Host ""

# Execute the anti-recoil script
try {
    & $ScriptPath
} catch {
    Write-Host "Error running script: $($_.Exception.Message)" -ForegroundColor Red
}

Write-Host ""
Write-Host "Anti-Recoil Script terminated." -ForegroundColor Yellow
