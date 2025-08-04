# Anti-Recoil Simple GUI - Fixed Version
# This version fixes all control reference issues

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

Add-Type -TypeDefinition @"
using System;
using System.Runtime.InteropServices;

public class MouseAPI
{
    [DllImport("user32.dll")]
    public static extern short GetAsyncKeyState(int vKey);

    [DllImport("user32.dll")]
    public static extern void mouse_event(uint dwFlags, uint dx, uint dy, uint dwData, UIntPtr dwExtraInfo);

    public const uint MOUSEEVENTF_MOVE = 0x0001;
    
    public const int VK_LBUTTON = 0x01;
    public const int VK_RBUTTON = 0x02;
    public const int VK_NUMLOCK = 0x90;
    public const int VK_CAPITAL = 0x14;
    public const int VK_XBUTTON2 = 0x06;
    public const int VK_F1 = 0x70;
    public const int VK_F2 = 0x71;
    public const int VK_F3 = 0x72;
    public const int VK_F4 = 0x73;
    public const int VK_F5 = 0x74;

    public static bool IsKeyPressed(int keyCode)
    {
        return (GetAsyncKeyState(keyCode) & 0x8000) != 0;
    }

    public static bool IsKeyToggled(int keyCode)
    {
        return (GetAsyncKeyState(keyCode) & 0x0001) != 0;
    }

    public static void MoveMouse(int deltaX, int deltaY)
    {
        mouse_event(MOUSEEVENTF_MOVE, (uint)deltaX, (uint)deltaY, 0, UIntPtr.Zero);
    }
}
"@

# Global variables
$global:IsActive = $false
$global:IsRunning = $false
$global:ActivationKey = 0x70  # F1
$global:AutoADSKey = 0x14     # CapsLock
$global:WeaponSwitchKey = 0x06 # Mouse Button 5
$global:CurrentWeapon = "Primary"
$global:Random = New-Object System.Random

$global:PrimaryWeapon = @{
    Horizontal = -0.2
    Vertical = 1.0
    FireDelay = 7
}

$global:SecondaryWeapon = @{
    Horizontal = -0.1
    Vertical = 2.0
    FireDelay = 8
}

function Get-CurrentWeapon {
    if ($global:CurrentWeapon -eq "Primary") {
        return $global:PrimaryWeapon
    } else {
        return $global:SecondaryWeapon
    }
}

function Apply-Recoil {
    $weapon = Get-CurrentWeapon
    $volatility = 0.7 + (0.7 * $global:Random.NextDouble())
    
    $moveX = [Math]::Floor($volatility * $weapon.Horizontal)
    $moveY = [Math]::Floor($volatility * $weapon.Vertical)
    
    if ($moveX -ne 0 -or $moveY -ne 0) {
        [MouseAPI]::MoveMouse($moveX, $moveY)
    }
}

function Update-Logic {
    # Check activation
    $global:IsActive = [MouseAPI]::IsKeyToggled($global:ActivationKey)
    
    if ($global:IsActive -and $global:IsRunning) {
        # Check weapon switch
        if ([MouseAPI]::IsKeyPressed($global:WeaponSwitchKey)) {
            if ($global:CurrentWeapon -eq "Primary") {
                $global:CurrentWeapon = "Secondary"
            } else {
                $global:CurrentWeapon = "Primary"
            }
            Start-Sleep -Milliseconds 200
        }
        
        # Check firing and apply recoil
        if ([MouseAPI]::IsKeyPressed(0x01)) {  # Left mouse button
            Apply-Recoil
            $weapon = Get-CurrentWeapon
            Start-Sleep -Milliseconds $weapon.FireDelay
        }
    }
}

# Create main form
$form = New-Object System.Windows.Forms.Form
$form.Text = "Anti-Recoil Control Panel"
$form.Size = New-Object System.Drawing.Size(450, 500)
$form.StartPosition = "CenterScreen"
$form.FormBorderStyle = "FixedDialog"
$form.MaximizeBox = $false

# Title
$titleLabel = New-Object System.Windows.Forms.Label
$titleLabel.Text = "Anti-Recoil Control Panel"
$titleLabel.Font = New-Object System.Drawing.Font("Arial", 14, [System.Drawing.FontStyle]::Bold)
$titleLabel.Location = New-Object System.Drawing.Point(80, 20)
$titleLabel.Size = New-Object System.Drawing.Size(300, 30)
$titleLabel.TextAlign = "MiddleCenter"
$form.Controls.Add($titleLabel)

# Status display
$statusBox = New-Object System.Windows.Forms.TextBox
$statusBox.Multiline = $true
$statusBox.ReadOnly = $true
$statusBox.Font = New-Object System.Drawing.Font("Consolas", 10)
$statusBox.Location = New-Object System.Drawing.Point(20, 60)
$statusBox.Size = New-Object System.Drawing.Size(400, 120)
$form.Controls.Add($statusBox)

# Configuration section
$configLabel = New-Object System.Windows.Forms.Label
$configLabel.Text = "Button Configuration"
$configLabel.Font = New-Object System.Drawing.Font("Arial", 12, [System.Drawing.FontStyle]::Bold)
$configLabel.Location = New-Object System.Drawing.Point(20, 190)
$configLabel.Size = New-Object System.Drawing.Size(200, 25)
$form.Controls.Add($configLabel)

# Activation key
$activationLabel = New-Object System.Windows.Forms.Label
$activationLabel.Text = "Activation Key:"
$activationLabel.Location = New-Object System.Drawing.Point(20, 220)
$activationLabel.Size = New-Object System.Drawing.Size(100, 20)
$form.Controls.Add($activationLabel)

$activationCombo = New-Object System.Windows.Forms.ComboBox
$activationCombo.Location = New-Object System.Drawing.Point(130, 218)
$activationCombo.Size = New-Object System.Drawing.Size(120, 25)
$activationCombo.DropDownStyle = "DropDownList"
$activationCombo.Items.AddRange(@("NumLock", "F1", "F2", "F3", "F4", "F5"))
$activationCombo.SelectedIndex = 1  # F1 as default
$form.Controls.Add($activationCombo)

# Auto ADS key
$adsLabel = New-Object System.Windows.Forms.Label
$adsLabel.Text = "Auto ADS Key:"
$adsLabel.Location = New-Object System.Drawing.Point(20, 250)
$adsLabel.Size = New-Object System.Drawing.Size(100, 20)
$form.Controls.Add($adsLabel)

$adsCombo = New-Object System.Windows.Forms.ComboBox
$adsCombo.Location = New-Object System.Drawing.Point(130, 248)
$adsCombo.Size = New-Object System.Drawing.Size(120, 25)
$adsCombo.DropDownStyle = "DropDownList"
$adsCombo.Items.AddRange(@("CapsLock", "F1", "F2", "F3", "F4", "F5"))
$adsCombo.SelectedIndex = 0
$form.Controls.Add($adsCombo)

# Weapon switch key
$switchLabel = New-Object System.Windows.Forms.Label
$switchLabel.Text = "Weapon Switch:"
$switchLabel.Location = New-Object System.Drawing.Point(20, 280)
$switchLabel.Size = New-Object System.Drawing.Size(100, 20)
$form.Controls.Add($switchLabel)

$switchCombo = New-Object System.Windows.Forms.ComboBox
$switchCombo.Location = New-Object System.Drawing.Point(130, 278)
$switchCombo.Size = New-Object System.Drawing.Size(120, 25)
$switchCombo.DropDownStyle = "DropDownList"
$switchCombo.Items.AddRange(@("Mouse Btn 5", "F1", "F2", "F3", "F4", "F5"))
$switchCombo.SelectedIndex = 0
$form.Controls.Add($switchCombo)

# Weapon settings
$weaponLabel = New-Object System.Windows.Forms.Label
$weaponLabel.Text = "Primary Weapon Settings"
$weaponLabel.Font = New-Object System.Drawing.Font("Arial", 10, [System.Drawing.FontStyle]::Bold)
$weaponLabel.Location = New-Object System.Drawing.Point(20, 320)
$weaponLabel.Size = New-Object System.Drawing.Size(200, 20)
$form.Controls.Add($weaponLabel)

$hLabel = New-Object System.Windows.Forms.Label
$hLabel.Text = "Horizontal:"
$hLabel.Location = New-Object System.Drawing.Point(20, 345)
$hLabel.Size = New-Object System.Drawing.Size(70, 20)
$form.Controls.Add($hLabel)

$hText = New-Object System.Windows.Forms.TextBox
$hText.Text = "-0.2"
$hText.Location = New-Object System.Drawing.Point(90, 343)
$hText.Size = New-Object System.Drawing.Size(60, 20)
$form.Controls.Add($hText)

$vLabel = New-Object System.Windows.Forms.Label
$vLabel.Text = "Vertical:"
$vLabel.Location = New-Object System.Drawing.Point(160, 345)
$vLabel.Size = New-Object System.Drawing.Size(50, 20)
$form.Controls.Add($vLabel)

$vText = New-Object System.Windows.Forms.TextBox
$vText.Text = "1.0"
$vText.Location = New-Object System.Drawing.Point(210, 343)
$vText.Size = New-Object System.Drawing.Size(60, 20)
$form.Controls.Add($vText)

$delayLabel = New-Object System.Windows.Forms.Label
$delayLabel.Text = "Delay (ms):"
$delayLabel.Location = New-Object System.Drawing.Point(280, 345)
$delayLabel.Size = New-Object System.Drawing.Size(70, 20)
$form.Controls.Add($delayLabel)

$delayText = New-Object System.Windows.Forms.TextBox
$delayText.Text = "7"
$delayText.Location = New-Object System.Drawing.Point(350, 343)
$delayText.Size = New-Object System.Drawing.Size(40, 20)
$form.Controls.Add($delayText)

# Apply settings button
$applyButton = New-Object System.Windows.Forms.Button
$applyButton.Text = "Apply Settings"
$applyButton.Location = New-Object System.Drawing.Point(20, 375)
$applyButton.Size = New-Object System.Drawing.Size(100, 30)
$applyButton.Add_Click({
    try {
        # Update key mappings
        $keyMap = @{
            "NumLock" = 0x90; "F1" = 0x70; "F2" = 0x71; "F3" = 0x72; "F4" = 0x73; "F5" = 0x74
            "CapsLock" = 0x14; "Mouse Btn 5" = 0x06
        }
        
        $global:ActivationKey = $keyMap[$activationCombo.SelectedItem]
        $global:AutoADSKey = $keyMap[$adsCombo.SelectedItem]
        $global:WeaponSwitchKey = $keyMap[$switchCombo.SelectedItem]
        
        # Update weapon settings
        $global:PrimaryWeapon.Horizontal = [double]$hText.Text
        $global:PrimaryWeapon.Vertical = [double]$vText.Text
        $global:PrimaryWeapon.FireDelay = [int]$delayText.Text
        
        [System.Windows.Forms.MessageBox]::Show("Settings applied successfully!", "Success")
    } catch {
        [System.Windows.Forms.MessageBox]::Show("Error applying settings: $($_.Exception.Message)", "Error")
    }
})
$form.Controls.Add($applyButton)

# Start/Stop button
$startButton = New-Object System.Windows.Forms.Button
$startButton.Text = "Start Anti-Recoil"
$startButton.Location = New-Object System.Drawing.Point(140, 375)
$startButton.Size = New-Object System.Drawing.Size(120, 30)
$startButton.BackColor = [System.Drawing.Color]::LightGreen
$form.Controls.Add($startButton)

# Test button
$testButton = New-Object System.Windows.Forms.Button
$testButton.Text = "Test"
$testButton.Location = New-Object System.Drawing.Point(280, 375)
$testButton.Size = New-Object System.Drawing.Size(60, 30)
$testButton.Add_Click({
    [System.Windows.Forms.MessageBox]::Show("Open Notepad, turn on your activation key, then hold left mouse button to test!", "Test Instructions")
})
$form.Controls.Add($testButton)

# Timer for updates
$timer = New-Object System.Windows.Forms.Timer
$timer.Interval = 100
$timer.Add_Tick({
    # Update status display
    $status = "=== ANTI-RECOIL STATUS ===`n"
    $status += "Script Running: $(if ($global:IsRunning) { 'YES' } else { 'NO' })`n"
    $status += "Activation Key Active: $(if ($global:IsActive) { 'YES' } else { 'NO' })`n"
    $status += "Auto ADS: $(if ([MouseAPI]::IsKeyToggled($global:AutoADSKey)) { 'ON' } else { 'OFF' })`n"
    $status += "Current Weapon: $global:CurrentWeapon`n"
    $weapon = Get-CurrentWeapon
    $status += "Settings: H:$($weapon.Horizontal) V:$($weapon.Vertical) D:$($weapon.FireDelay)ms`n"
    $status += "`nInstructions: Configure buttons, click Apply, then Start"
    
    $statusBox.Text = $status
    
    # Update anti-recoil logic
    if ($global:IsRunning) {
        Update-Logic
    }
})

$startButton.Add_Click({
    if ($global:IsRunning) {
        $global:IsRunning = $false
        $timer.Stop()
        $startButton.Text = "Start Anti-Recoil"
        $startButton.BackColor = [System.Drawing.Color]::LightGreen
    } else {
        $global:IsRunning = $true
        $timer.Start()
        $startButton.Text = "Stop Anti-Recoil"
        $startButton.BackColor = [System.Drawing.Color]::LightCoral
    }
})

$form.Add_FormClosing({
    $timer.Stop()
    $global:IsRunning = $false
})

# Start the timer for status updates
$timer.Start()

# Show the form
[System.Windows.Forms.Application]::Run($form)
