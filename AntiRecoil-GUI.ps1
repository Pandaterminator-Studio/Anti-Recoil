# Anti-Recoil GUI Application with Configuration
# Enhanced version with button mapping and settings

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

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
    public const int VK_MBUTTON = 0x04;
    public const int VK_XBUTTON1 = 0x05;
    public const int VK_XBUTTON2 = 0x06;
    public const int VK_NUMLOCK = 0x90;
    public const int VK_CAPITAL = 0x14;
    public const int VK_F1 = 0x70;
    public const int VK_F2 = 0x71;
    public const int VK_F3 = 0x72;
    public const int VK_F4 = 0x73;
    public const int VK_F5 = 0x74;
    public const int VK_F6 = 0x75;
    public const int VK_F7 = 0x76;
    public const int VK_F8 = 0x77;
    public const int VK_F9 = 0x78;
    public const int VK_F10 = 0x79;
    public const int VK_F11 = 0x7A;
    public const int VK_F12 = 0x7B;

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
"@ -ReferencedAssemblies System.Windows.Forms

# Configuration class
class AntiRecoilConfig {
    [int]$ActivationKey = 0x90  # NumLock
    [int]$AutoADSKey = 0x14     # CapsLock
    [int]$WeaponSwitchKey = 0x06 # Mouse Button 9
    [int]$FireKey = 0x01        # Left Mouse Button
    [int]$ADSKey = 0x02         # Right Mouse Button
    
    [hashtable]$PrimaryWeapon = @{
        Horizontal = -0.2
        Vertical = 1.0
        FireDelay = 7
        AdsDelay = 300
    }
    
    [hashtable]$SecondaryWeapon = @{
        Horizontal = -0.1
        Vertical = 2.0
        FireDelay = 8
        AdsDelay = 130
    }
    
    [string]$CurrentWeapon = "Primary"
    [bool]$IsActive = $false
    [bool]$IsAutoADS = $false
    [bool]$IsFirePressed = $false
    [double]$CounterX = 0.0
    [double]$CounterY = 0.0
    [System.Random]$Random = [System.Random]::new()
}

# Global configuration
$global:Config = [AntiRecoilConfig]::new()

# Key mapping for display
$global:KeyMappings = @{
    0x01 = "Left Mouse"
    0x02 = "Right Mouse" 
    0x04 = "Middle Mouse"
    0x05 = "Mouse Button 4"
    0x06 = "Mouse Button 5"
    0x90 = "NumLock"
    0x14 = "CapsLock"
    0x70 = "F1"
    0x71 = "F2"
    0x72 = "F3"
    0x73 = "F4"
    0x74 = "F5"
    0x75 = "F6"
    0x76 = "F7"
    0x77 = "F8"
    0x78 = "F9"
    0x79 = "F10"
    0x7A = "F11"
    0x7B = "F12"
}

function Get-CurrentWeaponConfig {
    if ($global:Config.CurrentWeapon -eq "Primary") {
        return $global:Config.PrimaryWeapon
    } else {
        return $global:Config.SecondaryWeapon
    }
}

function Get-Volatility([double]$range, [double]$impact) {
    return $range * (1 + $impact * $global:Config.Random.NextDouble())
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
        $moveX = [Math]::Floor($volatilityFactor * $config.Horizontal)
    }

    # Handle vertical recoil
    if ($config.Vertical -ne 0) {
        $moveY = [Math]::Floor($volatilityFactor * $config.Vertical)
    }

    # Apply the mouse movement
    if ($moveX -ne 0 -or $moveY -ne 0) {
        [MouseController]::MoveMouse($moveX, $moveY)
    }
}

function Update-AntiRecoilLogic {
    # Check activation key
    $global:Config.IsActive = [MouseController]::IsKeyToggled($global:Config.ActivationKey)
    
    # Check auto ADS key
    $global:Config.IsAutoADS = [MouseController]::IsKeyToggled($global:Config.AutoADSKey)
    
    if ($global:Config.IsActive) {
        # Check weapon switch
        if ([MouseController]::IsKeyPressed($global:Config.WeaponSwitchKey)) {
            if ($global:Config.CurrentWeapon -eq "Primary") {
                $global:Config.CurrentWeapon = "Secondary"
            } else {
                $global:Config.CurrentWeapon = "Primary"
            }
            Start-Sleep -Milliseconds 200  # Prevent rapid switching
        }
        
        # Check firing
        $firePressed = [MouseController]::IsKeyPressed($global:Config.FireKey)
        
        if ($firePressed) {
            if (-not $global:Config.IsFirePressed) {
                $global:Config.IsFirePressed = $true
                $global:Config.CounterX = 0.0
                $global:Config.CounterY = 0.0
            }
            
            # Apply recoil compensation
            Apply-RecoilCompensation
            
            # Add delay based on fire rate
            $config = Get-CurrentWeaponConfig
            Start-Sleep -Milliseconds $config.FireDelay
        } else {
            $global:Config.IsFirePressed = $false
        }
    }
}

function Show-ConfigurationForm {
    $configForm = New-Object System.Windows.Forms.Form
    $configForm.Text = "Anti-Recoil Configuration"
    $configForm.Size = New-Object System.Drawing.Size(500, 600)
    $configForm.StartPosition = "CenterScreen"
    $configForm.FormBorderStyle = "FixedDialog"
    $configForm.MaximizeBox = $false
    
    $y = 20
    
    # Title
    $titleLabel = New-Object System.Windows.Forms.Label
    $titleLabel.Text = "Button Configuration"
    $titleLabel.Font = New-Object System.Drawing.Font("Arial", 12, [System.Drawing.FontStyle]::Bold)
    $titleLabel.Location = New-Object System.Drawing.Point(20, $y)
    $titleLabel.Size = New-Object System.Drawing.Size(300, 25)
    $configForm.Controls.Add($titleLabel)
    $y += 40
    
    # Activation Key
    $activationLabel = New-Object System.Windows.Forms.Label
    $activationLabel.Text = "Activation Key:"
    $activationLabel.Location = New-Object System.Drawing.Point(20, $y)
    $activationLabel.Size = New-Object System.Drawing.Size(150, 20)
    $configForm.Controls.Add($activationLabel)
    
    $activationCombo = New-Object System.Windows.Forms.ComboBox
    $activationCombo.Location = New-Object System.Drawing.Point(180, $y)
    $activationCombo.Size = New-Object System.Drawing.Size(150, 25)
    $activationCombo.DropDownStyle = "DropDownList"
    foreach ($key in $global:KeyMappings.GetEnumerator()) {
        $activationCombo.Items.Add("$($key.Value) (0x$($key.Key.ToString('X2')))")
    }
    $activationCombo.SelectedIndex = [array]::IndexOf($global:KeyMappings.Keys, $global:Config.ActivationKey)
    $configForm.Controls.Add($activationCombo)
    $y += 35
    
    # Auto ADS Key
    $adsLabel = New-Object System.Windows.Forms.Label
    $adsLabel.Text = "Auto ADS Key:"
    $adsLabel.Location = New-Object System.Drawing.Point(20, $y)
    $adsLabel.Size = New-Object System.Drawing.Size(150, 20)
    $configForm.Controls.Add($adsLabel)
    
    $adsCombo = New-Object System.Windows.Forms.ComboBox
    $adsCombo.Location = New-Object System.Drawing.Point(180, $y)
    $adsCombo.Size = New-Object System.Drawing.Size(150, 25)
    $adsCombo.DropDownStyle = "DropDownList"
    foreach ($key in $global:KeyMappings.GetEnumerator()) {
        $adsCombo.Items.Add("$($key.Value) (0x$($key.Key.ToString('X2')))")
    }
    $adsCombo.SelectedIndex = [array]::IndexOf($global:KeyMappings.Keys, $global:Config.AutoADSKey)
    $configForm.Controls.Add($adsCombo)
    $y += 35
    
    # Weapon Switch Key
    $switchLabel = New-Object System.Windows.Forms.Label
    $switchLabel.Text = "Weapon Switch Key:"
    $switchLabel.Location = New-Object System.Drawing.Point(20, $y)
    $switchLabel.Size = New-Object System.Drawing.Size(150, 20)
    $configForm.Controls.Add($switchLabel)
    
    $switchCombo = New-Object System.Windows.Forms.ComboBox
    $switchCombo.Location = New-Object System.Drawing.Point(180, $y)
    $switchCombo.Size = New-Object System.Drawing.Size(150, 25)
    $switchCombo.DropDownStyle = "DropDownList"
    foreach ($key in $global:KeyMappings.GetEnumerator()) {
        $switchCombo.Items.Add("$($key.Value) (0x$($key.Key.ToString('X2')))")
    }
    $switchCombo.SelectedIndex = [array]::IndexOf($global:KeyMappings.Keys, $global:Config.WeaponSwitchKey)
    $configForm.Controls.Add($switchCombo)
    $y += 50
    
    # Weapon Settings
    $weaponLabel = New-Object System.Windows.Forms.Label
    $weaponLabel.Text = "Weapon Settings"
    $weaponLabel.Font = New-Object System.Drawing.Font("Arial", 12, [System.Drawing.FontStyle]::Bold)
    $weaponLabel.Location = New-Object System.Drawing.Point(20, $y)
    $weaponLabel.Size = New-Object System.Drawing.Size(300, 25)
    $configForm.Controls.Add($weaponLabel)
    $y += 40
    
    # Primary Weapon Group
    $primaryGroup = New-Object System.Windows.Forms.GroupBox
    $primaryGroup.Text = "Primary Weapon"
    $primaryGroup.Location = New-Object System.Drawing.Point(20, $y)
    $primaryGroup.Size = New-Object System.Drawing.Size(200, 150)
    
    $primaryHLabel = New-Object System.Windows.Forms.Label
    $primaryHLabel.Text = "Horizontal:"
    $primaryHLabel.Location = New-Object System.Drawing.Point(10, 25)
    $primaryHLabel.Size = New-Object System.Drawing.Size(70, 20)
    $primaryGroup.Controls.Add($primaryHLabel)
    
    $primaryHText = New-Object System.Windows.Forms.TextBox
    $primaryHText.Text = $global:Config.PrimaryWeapon.Horizontal.ToString()
    $primaryHText.Location = New-Object System.Drawing.Point(90, 23)
    $primaryHText.Size = New-Object System.Drawing.Size(80, 20)
    $primaryGroup.Controls.Add($primaryHText)
    
    $primaryVLabel = New-Object System.Windows.Forms.Label
    $primaryVLabel.Text = "Vertical:"
    $primaryVLabel.Location = New-Object System.Drawing.Point(10, 55)
    $primaryVLabel.Size = New-Object System.Drawing.Size(70, 20)
    $primaryGroup.Controls.Add($primaryVLabel)
    
    $primaryVText = New-Object System.Windows.Forms.TextBox
    $primaryVText.Text = $global:Config.PrimaryWeapon.Vertical.ToString()
    $primaryVText.Location = New-Object System.Drawing.Point(90, 53)
    $primaryVText.Size = New-Object System.Drawing.Size(80, 20)
    $primaryGroup.Controls.Add($primaryVText)
    
    $primaryDelayLabel = New-Object System.Windows.Forms.Label
    $primaryDelayLabel.Text = "Fire Delay:"
    $primaryDelayLabel.Location = New-Object System.Drawing.Point(10, 85)
    $primaryDelayLabel.Size = New-Object System.Drawing.Size(70, 20)
    $primaryGroup.Controls.Add($primaryDelayLabel)
    
    $primaryDelayText = New-Object System.Windows.Forms.TextBox
    $primaryDelayText.Text = $global:Config.PrimaryWeapon.FireDelay.ToString()
    $primaryDelayText.Location = New-Object System.Drawing.Point(90, 83)
    $primaryDelayText.Size = New-Object System.Drawing.Size(80, 20)
    $primaryGroup.Controls.Add($primaryDelayText)
    
    $configForm.Controls.Add($primaryGroup)
    
    # Secondary Weapon Group
    $secondaryGroup = New-Object System.Windows.Forms.GroupBox
    $secondaryGroup.Text = "Secondary Weapon"
    $secondaryGroup.Location = New-Object System.Drawing.Point(240, $y)
    $secondaryGroup.Size = New-Object System.Drawing.Size(200, 150)
    
    $secondaryHLabel = New-Object System.Windows.Forms.Label
    $secondaryHLabel.Text = "Horizontal:"
    $secondaryHLabel.Location = New-Object System.Drawing.Point(10, 25)
    $secondaryHLabel.Size = New-Object System.Drawing.Size(70, 20)
    $secondaryGroup.Controls.Add($secondaryHLabel)
    
    $secondaryHText = New-Object System.Windows.Forms.TextBox
    $secondaryHText.Text = $global:Config.SecondaryWeapon.Horizontal.ToString()
    $secondaryHText.Location = New-Object System.Drawing.Point(90, 23)
    $secondaryHText.Size = New-Object System.Drawing.Size(80, 20)
    $secondaryGroup.Controls.Add($secondaryHText)
    
    $secondaryVLabel = New-Object System.Windows.Forms.Label
    $secondaryVLabel.Text = "Vertical:"
    $secondaryVLabel.Location = New-Object System.Drawing.Point(10, 55)
    $secondaryVLabel.Size = New-Object System.Drawing.Size(70, 20)
    $secondaryGroup.Controls.Add($secondaryVLabel)
    
    $secondaryVText = New-Object System.Windows.Forms.TextBox
    $secondaryVText.Text = $global:Config.SecondaryWeapon.Vertical.ToString()
    $secondaryVText.Location = New-Object System.Drawing.Point(90, 53)
    $secondaryVText.Size = New-Object System.Drawing.Size(80, 20)
    $secondaryGroup.Controls.Add($secondaryVText)
    
    $secondaryDelayLabel = New-Object System.Windows.Forms.Label
    $secondaryDelayLabel.Text = "Fire Delay:"
    $secondaryDelayLabel.Location = New-Object System.Drawing.Point(10, 85)
    $secondaryDelayLabel.Size = New-Object System.Drawing.Size(70, 20)
    $secondaryGroup.Controls.Add($secondaryDelayLabel)
    
    $secondaryDelayText = New-Object System.Windows.Forms.TextBox
    $secondaryDelayText.Text = $global:Config.SecondaryWeapon.FireDelay.ToString()
    $secondaryDelayText.Location = New-Object System.Drawing.Point(90, 83)
    $secondaryDelayText.Size = New-Object System.Drawing.Size(80, 20)
    $secondaryGroup.Controls.Add($secondaryDelayText)
    
    $configForm.Controls.Add($secondaryGroup)
    $y += 170
    
    # Buttons
    $okButton = New-Object System.Windows.Forms.Button
    $okButton.Text = "Save & Apply"
    $okButton.Location = New-Object System.Drawing.Point(280, $y)
    $okButton.Size = New-Object System.Drawing.Size(80, 30)
    $okButton.Add_Click({
        try {
            # Save button configurations
            $selectedActivation = $activationCombo.SelectedItem -replace '.*\(0x(.+)\)', '$1'
            $global:Config.ActivationKey = [Convert]::ToInt32($selectedActivation, 16)
            
            $selectedADS = $adsCombo.SelectedItem -replace '.*\(0x(.+)\)', '$1'
            $global:Config.AutoADSKey = [Convert]::ToInt32($selectedADS, 16)
            
            $selectedSwitch = $switchCombo.SelectedItem -replace '.*\(0x(.+)\)', '$1'
            $global:Config.WeaponSwitchKey = [Convert]::ToInt32($selectedSwitch, 16)
            
            # Save weapon configurations
            $global:Config.PrimaryWeapon.Horizontal = [double]$primaryHText.Text
            $global:Config.PrimaryWeapon.Vertical = [double]$primaryVText.Text
            $global:Config.PrimaryWeapon.FireDelay = [int]$primaryDelayText.Text
            
            $global:Config.SecondaryWeapon.Horizontal = [double]$secondaryHText.Text
            $global:Config.SecondaryWeapon.Vertical = [double]$secondaryVText.Text
            $global:Config.SecondaryWeapon.FireDelay = [int]$secondaryDelayText.Text
            
            $configForm.DialogResult = "OK"
            $configForm.Close()
        } catch {
            [System.Windows.Forms.MessageBox]::Show("Error saving configuration: $($_.Exception.Message)", "Error")
        }
    })
    $configForm.Controls.Add($okButton)
    
    $cancelButton = New-Object System.Windows.Forms.Button
    $cancelButton.Text = "Cancel"
    $cancelButton.Location = New-Object System.Drawing.Point(370, $y)
    $cancelButton.Size = New-Object System.Drawing.Size(80, 30)
    $cancelButton.Add_Click({
        $configForm.DialogResult = "Cancel"
        $configForm.Close()
    })
    $configForm.Controls.Add($cancelButton)
    
    return $configForm.ShowDialog()
}

function Show-MainForm {
    $form = New-Object System.Windows.Forms.Form
    $form.Text = "Anti-Recoil Control Panel"
    $form.Size = New-Object System.Drawing.Size(500, 400)
    $form.StartPosition = "CenterScreen"
    $form.FormBorderStyle = "FixedDialog"
    $form.MaximizeBox = $false
    
    # Title
    $titleLabel = New-Object System.Windows.Forms.Label
    $titleLabel.Text = "Anti-Recoil Script Control Panel"
    $titleLabel.Font = New-Object System.Drawing.Font("Arial", 14, [System.Drawing.FontStyle]::Bold)
    $titleLabel.Location = New-Object System.Drawing.Point(50, 20)
    $titleLabel.Size = New-Object System.Drawing.Size(400, 30)
    $titleLabel.TextAlign = "MiddleCenter"
    $form.Controls.Add($titleLabel)
    
    # Status Group
    $statusGroup = New-Object System.Windows.Forms.GroupBox
    $statusGroup.Text = "Current Status"
    $statusGroup.Location = New-Object System.Drawing.Point(20, 60)
    $statusGroup.Size = New-Object System.Drawing.Size(450, 120)
    
    # Create status label with a unique variable reference
    $script:statusLabel = New-Object System.Windows.Forms.Label
    $script:statusLabel.Location = New-Object System.Drawing.Point(15, 25)
    $script:statusLabel.Size = New-Object System.Drawing.Size(420, 80)
    $script:statusLabel.Font = New-Object System.Drawing.Font("Consolas", 10)
    $statusGroup.Controls.Add($script:statusLabel)
    $form.Controls.Add($statusGroup)
    
    # Controls Group
    $controlsGroup = New-Object System.Windows.Forms.GroupBox
    $controlsGroup.Text = "Controls"
    $controlsGroup.Location = New-Object System.Drawing.Point(20, 190)
    $controlsGroup.Size = New-Object System.Drawing.Size(450, 100)
    
    $configButton = New-Object System.Windows.Forms.Button
    $configButton.Text = "Configure Buttons"
    $configButton.Location = New-Object System.Drawing.Point(20, 30)
    $configButton.Size = New-Object System.Drawing.Size(120, 35)
    $configButton.Add_Click({
        Show-ConfigurationForm
    })
    $controlsGroup.Controls.Add($configButton)
    
    $script:startButton = New-Object System.Windows.Forms.Button
    $script:startButton.Text = "Start Anti-Recoil"
    $script:startButton.Location = New-Object System.Drawing.Point(160, 30)
    $script:startButton.Size = New-Object System.Drawing.Size(120, 35)
    $script:startButton.BackColor = [System.Drawing.Color]::LightGreen
    $controlsGroup.Controls.Add($script:startButton)
    
    $testButton = New-Object System.Windows.Forms.Button
    $testButton.Text = "Test Movement"
    $testButton.Location = New-Object System.Drawing.Point(300, 30)
    $testButton.Size = New-Object System.Drawing.Size(120, 35)
    $testButton.Add_Click({
        [System.Windows.Forms.MessageBox]::Show("Open Notepad and hold left mouse button to test recoil compensation!", "Test Instructions")
    })
    $controlsGroup.Controls.Add($testButton)
    
    $form.Controls.Add($controlsGroup)
    
    # Instructions
    $instructionsLabel = New-Object System.Windows.Forms.Label
    $instructionsLabel.Text = "Instructions: Configure your buttons, then click Start. Use your configured activation key to toggle the script."
    $instructionsLabel.Location = New-Object System.Drawing.Point(20, 300)
    $instructionsLabel.Size = New-Object System.Drawing.Size(450, 40)
    $instructionsLabel.Font = New-Object System.Drawing.Font("Arial", 9)
    $form.Controls.Add($instructionsLabel)
    
    # Timer for status updates
    $script:timer = New-Object System.Windows.Forms.Timer
    $script:timer.Interval = 100
    $script:timer.Add_Tick({
        $statusText = "Script Status: "
        if ($global:Config.IsActive) {
            $statusText += "ACTIVE`n"
        } else {
            $statusText += "INACTIVE`n"
        }
        
        $statusText += "Auto ADS: "
        if ($global:Config.IsAutoADS) {
            $statusText += "ON`n"
        } else {
            $statusText += "OFF`n"
        }
        
        $statusText += "Current Weapon: $($global:Config.CurrentWeapon)`n"
        
        $config = Get-CurrentWeaponConfig
        $statusText += "Settings: H:$($config.Horizontal) V:$($config.Vertical) D:$($config.FireDelay)ms"
        
        # Fixed control reference
        $script:statusLabel.Text = $statusText
        
        # Update anti-recoil logic
        Update-AntiRecoilLogic
    })
    
    $script:startButton.Add_Click({
        if ($script:timer.Enabled) {
            $script:timer.Stop()
            $script:startButton.Text = "Start Anti-Recoil"
            $script:startButton.BackColor = [System.Drawing.Color]::LightGreen
        } else {
            $script:timer.Start()
            $script:startButton.Text = "Stop Anti-Recoil"
            $script:startButton.BackColor = [System.Drawing.Color]::LightCoral
        }
    })
    
    $form.Add_FormClosing({
        $script:timer.Stop()
    })
    
    [System.Windows.Forms.Application]::Run($form)
}

# Show configuration first
if ((Show-ConfigurationForm) -eq "OK") {
    Show-MainForm
}
