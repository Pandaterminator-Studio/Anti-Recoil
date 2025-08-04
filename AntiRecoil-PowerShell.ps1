# Anti-Recoil Script for Windows PowerShell
# Based on the original Lua script by Seyed Jafar Yaghoubi
# This version works with any mouse without requiring Logitech software

Add-Type -TypeDefinition @"
using System;
using System.Runtime.InteropServices;
using System.Windows.Forms;

public class MouseController
{
    [DllImport("user32.dll")]
    public static extern bool SetCursorPos(int x, int y);

    [DllImport("user32.dll")]
    public static extern bool GetCursorPos(out POINT lpPoint);

    [DllImport("user32.dll")]
    public static extern short GetAsyncKeyState(int vKey);

    [DllImport("user32.dll")]
    public static extern void mouse_event(uint dwFlags, uint dx, uint dy, uint dwData, UIntPtr dwExtraInfo);

    [StructLayout(LayoutKind.Sequential)]
    public struct POINT
    {
        public int X;
        public int Y;
    }

    // Mouse event constants
    public const uint MOUSEEVENTF_MOVE = 0x0001;
    
    // Virtual key codes
    public const int VK_LBUTTON = 0x01;
    public const int VK_RBUTTON = 0x02;
    public const int VK_NUMLOCK = 0x90;
    public const int VK_CAPITAL = 0x14;
    public const int VK_XBUTTON2 = 0x06;
    public const int VK_F1 = 0x70;

    public static bool IsF1On()
    {
        return (GetAsyncKeyState(VK_F1) & 0x0001) != 0;
    }

    public static bool IsNumLockOn()
    {
        return (GetAsyncKeyState(VK_NUMLOCK) & 0x0001) != 0;
    }

    public static bool IsCapsLockOn()
    {
        return (GetAsyncKeyState(VK_CAPITAL) & 0x0001) != 0;
    }

    public static bool IsCapsLockToggled()
    {
        return Console.CapsLock;
    }

    public static bool IsLeftMousePressed()
    {
        return (GetAsyncKeyState(VK_LBUTTON) & 0x8000) != 0;
    }

    public static bool IsRightMousePressed()
    {
        return (GetAsyncKeyState(VK_RBUTTON) & 0x8000) != 0;
    }

    public static bool IsWeaponSwitchPressed()
    {
        return (GetAsyncKeyState(VK_XBUTTON2) & 0x8000) != 0;
    }

    public static void MoveMouse(int deltaX, int deltaY)
    {
        mouse_event(MOUSEEVENTF_MOVE, (uint)deltaX, (uint)deltaY, 0, UIntPtr.Zero);
    }
}
"@ -ReferencedAssemblies System.Windows.Forms

# Weapon configuration
$PrimaryWeapon = @{
    Horizontal = -0.2
    Vertical = 1.0
    FireDelay = 7
    AdsDelay = 300
}

$SecondaryWeapon = @{
    Horizontal = -0.1
    Vertical = 2.0
    FireDelay = 8
    AdsDelay = 130
}

$CurrentWeapon = "Primary"
$IsFirePressed = $false
$CounterX = 0.0
$CounterY = 0.0
$Random = New-Object System.Random

function Get-CurrentWeaponConfig {
    if ($CurrentWeapon -eq "Primary") {
        return $PrimaryWeapon
    } else {
        return $SecondaryWeapon
    }
}

function Get-Volatility([double]$range, [double]$impact) {
    return $range * (1 + $impact * $Random.NextDouble())
}

function Apply-RecoilCompensation {
    $config = Get-CurrentWeaponConfig
    
    # Apply volatility (randomization)
    $volatilityFactor = Get-Volatility 0.7 1.0  # 70% to 140%
    
    # Calculate movement
    $moveX = 0
    $moveY = 0

    # Handle horizontal recoil
    if ($config.Horizontal -ne 0) {
        if ($config.Horizontal -lt 0) {
            $moveX = [Math]::Floor($volatilityFactor * $config.Horizontal)
        } else {
            $moveX = [Math]::Floor($volatilityFactor * $config.Horizontal)
        }
    }

    # Handle vertical recoil
    if ($config.Vertical -ne 0) {
        if ($config.Vertical -lt 0) {
            $moveY = [Math]::Floor($volatilityFactor * $config.Vertical)
        } else {
            $moveY = [Math]::Floor($volatilityFactor * $config.Vertical)
        }
    }

    # Apply the mouse movement
    if ($moveX -ne 0 -or $moveY -ne 0) {
        [MouseController]::MoveMouse($moveX, $moveY)
    }
}

function Show-Status {
    $f1Key = [MouseController]::IsF1On()
    $capsLock = [System.Console]::CapsLock  # Use Console.CapsLock for proper toggle state
    $leftMouse = [MouseController]::IsLeftMousePressed()
    
    $statusScript = if ($f1Key) { "ACTIVE" } else { "INACTIVE" }
    $statusADS = if ($capsLock) { "ON" } else { "OFF" }
    $statusFiring = if ($leftMouse) { "FIRING" } else { "READY" }
    
    $config = Get-CurrentWeaponConfig
    
    Clear-Host
    Write-Host "===============================================" -ForegroundColor Cyan
    Write-Host "        ANTI-RECOIL SCRIPT EXECUTOR" -ForegroundColor Yellow
    Write-Host "===============================================" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "Script Status: " -NoNewline
    Write-Host $statusScript -ForegroundColor $(if ($f1Key) { "Green" } else { "Red" })
    Write-Host "Auto ADS: " -NoNewline
    Write-Host $statusADS -ForegroundColor $(if ($capsLock) { "Green" } else { "Gray" })
    Write-Host "Current Weapon: " -NoNewline
    Write-Host $CurrentWeapon -ForegroundColor Blue
    Write-Host "Status: " -NoNewline
    Write-Host $statusFiring -ForegroundColor $(if ($leftMouse) { "Yellow" } else { "Gray" })
    Write-Host ""
    Write-Host "Current Weapon Settings:" -ForegroundColor Cyan
    Write-Host "  Horizontal: $($config.Horizontal)"
    Write-Host "  Vertical: $($config.Vertical)"
    Write-Host "  Fire Delay: $($config.FireDelay)ms"
    Write-Host "  ADS Delay: $($config.AdsDelay)ms"
    Write-Host ""
    Write-Host "CONTROLS:" -ForegroundColor Green
    Write-Host "  F1: Toggle script ON/OFF"
    Write-Host "  CapsLock: Toggle Auto-ADS mode"
    Write-Host "  Mouse Button 9: Switch weapon profiles"
    Write-Host "  Left Click: Fire with recoil compensation"
    Write-Host "  Ctrl+C: Exit script"
    Write-Host ""
    Write-Host "Press Ctrl+C to exit..." -ForegroundColor Red
}

# Main execution loop
Write-Host "Starting Anti-Recoil Script..." -ForegroundColor Green
Write-Host "Make sure to run this as Administrator for best results." -ForegroundColor Yellow
Write-Host ""

$lastWeaponSwitchTime = Get-Date
$lastStatusUpdate = Get-Date

try {
    while ($true) {
        $currentTime = Get-Date
        
        # Update status display every 500ms
        if (($currentTime - $lastStatusUpdate).TotalMilliseconds -gt 500) {
            Show-Status
            $lastStatusUpdate = $currentTime
        }

        # Check if script is active (F1 ON)
        if ([MouseController]::IsF1On()) {
            $leftMousePressed = [MouseController]::IsLeftMousePressed()
            $capsLockOn = [System.Console]::CapsLock  # Fixed CapsLock detection
            
            # Handle weapon switching
            if ([MouseController]::IsWeaponSwitchPressed() -and ($currentTime - $lastWeaponSwitchTime).TotalMilliseconds -gt 300) {
                if ($CurrentWeapon -eq "Primary") {
                    $CurrentWeapon = "Secondary"
                } else {
                    $CurrentWeapon = "Primary"
                }
                $lastWeaponSwitchTime = $currentTime
            }
            
            # Handle firing with recoil compensation
            if ($leftMousePressed) {
                if (-not $IsFirePressed) {
                    $IsFirePressed = $true
                    # Reset counters when starting to fire
                    $CounterX = 0.0
                    $CounterY = 0.0
                }
                
                # Apply recoil compensation
                Apply-RecoilCompensation
                
                # Add delay based on fire rate
                $config = Get-CurrentWeaponConfig
                Start-Sleep -Milliseconds $config.FireDelay
            } else {
                if ($IsFirePressed) {
                    $IsFirePressed = $false
                }
            }
        }
        
        # Small delay to prevent excessive CPU usage
        Start-Sleep -Milliseconds 10
    }
}
catch [System.Management.Automation.PipelineStoppedException] {
    Write-Host "`nScript stopped by user." -ForegroundColor Yellow
}
catch {
    Write-Host "`nError occurred: $($_.Exception.Message)" -ForegroundColor Red
}
finally {
    Write-Host "Anti-Recoil Script terminated." -ForegroundColor Green
}
