using System;
using System.ComponentModel;
using System.Diagnostics;
using System.IO;
using System.Runtime.InteropServices;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace AntiRecoilExecutor
{
    public partial class MainForm : Form
    {
        private System.Windows.Forms.Timer statusTimer;
        private System.Windows.Forms.Timer recoilTimer;
        private bool isScriptRunning = false;
        private bool isFirePressed = false;
        private bool isAdsPressed = false;
        private string currentWeapon = "primary";
        private Random random = new Random();
        private float floatX = 0f;
        private float floatY = 0f;
        private float counterX = 0f;
        private float counterY = 0f;

        // Weapon configurations (from Lua script)
        private WeaponConfig primaryWeapon = new WeaponConfig
        {
            Horizontal = -0.2f,
            Vertical = 1f,
            FireDelay = 7,
            AdsDelay = 300
        };

        private WeaponConfig secondaryWeapon = new WeaponConfig
        {
            Horizontal = -0.1f,
            Vertical = 2f,
            FireDelay = 8,
            AdsDelay = 130
        };

        // Import Windows API functions for mouse control
        [DllImport("user32.dll")]
        static extern bool SetCursorPos(int x, int y);

        [DllImport("user32.dll")]
        static extern bool GetCursorPos(out POINT lpPoint);

        [DllImport("user32.dll")]
        static extern short GetAsyncKeyState(int vKey);

        [DllImport("user32.dll")]
        static extern void mouse_event(uint dwFlags, uint dx, uint dy, uint dwData, UIntPtr dwExtraInfo);

        [StructLayout(LayoutKind.Sequential)]
        public struct POINT
        {
            public int X;
            public int Y;
        }

        public class WeaponConfig
        {
            public float Horizontal { get; set; }
            public float Vertical { get; set; }
            public int FireDelay { get; set; }
            public int AdsDelay { get; set; }
        }

        // Mouse event constants
        private const uint MOUSEEVENTF_MOVE = 0x0001;
        private const uint MOUSEEVENTF_LEFTDOWN = 0x0002;
        private const uint MOUSEEVENTF_LEFTUP = 0x0004;
        private const uint MOUSEEVENTF_RIGHTDOWN = 0x0008;
        private const uint MOUSEEVENTF_RIGHTUP = 0x0010;

        // Virtual key codes
        private const int VK_LBUTTON = 0x01;
        private const int VK_RBUTTON = 0x02;
        private const int VK_NUMLOCK = 0x90;
        private const int VK_CAPITAL = 0x14;
        private const int VK_XBUTTON2 = 0x06; // Mouse button 9 (weapon switch)

        public MainForm()
        {
            InitializeComponent();
            InitializeApplication();
        }

        private void InitializeApplication()
        {
            // Initialize status timer
            statusTimer = new System.Windows.Forms.Timer();
            statusTimer.Interval = 100; // Check every 100ms
            statusTimer.Tick += StatusTimer_Tick;
            statusTimer.Start();

            // Initialize recoil compensation timer
            recoilTimer = new System.Windows.Forms.Timer();
            recoilTimer.Interval = 1; // High frequency for smooth movement
            recoilTimer.Tick += RecoilTimer_Tick;

            UpdateStatus();
        }

        private void RecoilTimer_Tick(object sender, EventArgs e)
        {
            // Only run recoil compensation when script is active and left mouse is pressed
            bool numLockOn = (GetAsyncKeyState(VK_NUMLOCK) & 0x0001) != 0;
            bool leftMousePressed = (GetAsyncKeyState(VK_LBUTTON) & 0x8000) != 0;

            if (numLockOn && leftMousePressed)
            {
                if (!isFirePressed)
                {
                    // Fire button just pressed
                    isFirePressed = true;
                    bool capsLockOn = (GetAsyncKeyState(VK_CAPITAL) & 0x0001) != 0;
                    
                    if (capsLockOn) // Auto ADS mode
                    {
                        StartADSFire();
                    }
                    else
                    {
                        StartDirectFire();
                    }
                }
                
                // Continue recoil compensation
                ApplyRecoilCompensation();
            }
            else
            {
                if (isFirePressed)
                {
                    // Fire button just released
                    isFirePressed = false;
                    StopFiring();
                }
            }

            // Check for weapon switch
            bool weaponSwitchPressed = (GetAsyncKeyState(VK_XBUTTON2) & 0x8000) != 0;
            if (weaponSwitchPressed && !isFirePressed)
            {
                SwitchWeapon();
                Thread.Sleep(200); // Prevent rapid switching
            }
        }

        private void StartADSFire()
        {
            // Simulate right mouse press for ADS
            isAdsPressed = true;
            var currentConfig = GetCurrentWeaponConfig();
            
            // Wait for ADS delay, then start firing
            Task.Run(async () =>
            {
                await Task.Delay(currentConfig.AdsDelay);
                if (isFirePressed) // Still firing
                {
                    StartDirectFire();
                }
            });
        }

        private void StartDirectFire()
        {
            var currentConfig = GetCurrentWeaponConfig();
            
            // Calculate float values for sub-pixel movement
            floatX = Math.Abs(currentConfig.Horizontal) - (float)Math.Floor(Math.Abs(currentConfig.Horizontal));
            floatY = Math.Abs(currentConfig.Vertical) - (float)Math.Floor(Math.Abs(currentConfig.Vertical));
            counterX = 0f;
            counterY = 0f;

            // Start the recoil compensation with appropriate delay
            recoilTimer.Interval = Math.Max(1, currentConfig.FireDelay);
            if (!recoilTimer.Enabled)
                recoilTimer.Start();
        }

        private void StopFiring()
        {
            recoilTimer.Stop();
            if (isAdsPressed)
            {
                isAdsPressed = false;
                // Release ADS if it was auto-activated
            }
        }

        private void ApplyRecoilCompensation()
        {
            var currentConfig = GetCurrentWeaponConfig();
            
            // Apply volatility (randomization like in Lua script)
            float volatilityFactor = 0.7f + (0.7f * (float)random.NextDouble()); // 70% to 140%
            
            // Calculate movement
            int moveX = 0;
            int moveY = 0;

            // Handle horizontal recoil
            if (currentConfig.Horizontal != 0)
            {
                if (currentConfig.Horizontal < 0)
                {
                    moveX = (int)Math.Floor(volatilityFactor * (currentConfig.Horizontal + floatX));
                }
                else
                {
                    moveX = (int)Math.Floor(volatilityFactor * (currentConfig.Horizontal - floatX));
                }
            }

            // Handle vertical recoil
            if (currentConfig.Vertical != 0)
            {
                if (currentConfig.Vertical < 0)
                {
                    moveY = (int)Math.Floor(volatilityFactor * (currentConfig.Vertical + floatY));
                }
                else
                {
                    moveY = (int)Math.Floor(volatilityFactor * (currentConfig.Vertical - floatY));
                }
            }

            // Handle sub-pixel horizontal movement
            if (floatX != 0)
            {
                counterX += floatX;
                if (counterX >= 1 * volatilityFactor)
                {
                    if (currentConfig.Horizontal > 0)
                        moveX += 1;
                    else
                        moveX -= 1;
                    counterX = 0;
                }
            }

            // Handle sub-pixel vertical movement
            if (floatY != 0)
            {
                counterY += floatY;
                if (counterY >= 1 * volatilityFactor)
                {
                    if (currentConfig.Vertical > 0)
                        moveY += 1;
                    else
                        moveY -= 1;
                    counterY = 0;
                }
            }

            // Apply the mouse movement
            if (moveX != 0 || moveY != 0)
            {
                mouse_event(MOUSEEVENTF_MOVE, (uint)moveX, (uint)moveY, 0, UIntPtr.Zero);
            }
        }

        private WeaponConfig GetCurrentWeaponConfig()
        {
            return currentWeapon == "primary" ? primaryWeapon : secondaryWeapon;
        }

        private void SwitchWeapon()
        {
            if (currentWeapon == "primary")
            {
                currentWeapon = "secondary";
                lblCurrentWeapon.Text = "Current Weapon: Secondary";
            }
            else
            {
                currentWeapon = "primary";
                lblCurrentWeapon.Text = "Current Weapon: Primary";
            }
        }

        private void StatusTimer_Tick(object sender, EventArgs e)
        {
            UpdateStatus();
        }

        private void UpdateStatus()
        {
            // Check if NumLock is on (script activation key)
            bool numLockOn = (GetAsyncKeyState(VK_NUMLOCK) & 0x0001) != 0;
            bool capsLockOn = (GetAsyncKeyState(VK_CAPITAL) & 0x0001) != 0;

            lblScriptStatus.Text = numLockOn ? "Script: ACTIVE" : "Script: INACTIVE";
            lblScriptStatus.ForeColor = numLockOn ? System.Drawing.Color.Green : System.Drawing.Color.Red;

            lblAutoADS.Text = capsLockOn ? "Auto ADS: ON" : "Auto ADS: OFF";
            lblAutoADS.ForeColor = capsLockOn ? System.Drawing.Color.Green : System.Drawing.Color.Gray;

            lblCurrentWeapon.Text = $"Current Weapon: {currentWeapon.ToUpper()}";
            lblCurrentWeapon.ForeColor = System.Drawing.Color.Blue;

            // Show current weapon settings
            var config = GetCurrentWeaponConfig();
            lblWeaponSettings.Text = $"H: {config.Horizontal}, V: {config.Vertical}, Delay: {config.FireDelay}ms";
        }

        private bool IsLogitechSoftwareRunning()
        {
            // This method is no longer needed since we don't use Logitech software
            return false;
        }

        private void btnLoadScript_Click(object sender, EventArgs e)
        {
            try
            {
                MessageBox.Show("Anti-Recoil Script is now ready!\n\n" +
                    "CONTROLS:\n" +
                    "• NumLock: Toggle script ON/OFF\n" +
                    "• CapsLock: Toggle Auto-ADS mode\n" +
                    "• Mouse Button 9 (side button): Switch weapon profiles\n" +
                    "• Left Click: Fire with recoil compensation\n" +
                    "• Right Click: Manual ADS\n\n" +
                    "The script will automatically compensate for recoil when NumLock is ON and you're firing.",
                    "Script Ready", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Error: {ex.Message}", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void btnEditSettings_Click(object sender, EventArgs e)
        {
            SettingsForm settingsForm = new SettingsForm(primaryWeapon, secondaryWeapon);
            if (settingsForm.ShowDialog() == DialogResult.OK)
            {
                primaryWeapon = settingsForm.PrimaryWeapon;
                secondaryWeapon = settingsForm.SecondaryWeapon;
                UpdateStatus();
            }
        }

        private void btnOpenScript_Click(object sender, EventArgs e)
        {
            try
            {
                string luaScriptPath = Path.Combine(Application.StartupPath, "Anti_Recoil.lua");
                if (File.Exists(luaScriptPath))
                {
                    Process.Start("notepad.exe", luaScriptPath);
                }
                else
                {
                    MessageBox.Show("Original Lua script file not found. The functionality is now built into this application.",
                        "Info", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Error: {ex.Message}", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void btnInstructions_Click(object sender, EventArgs e)
        {
            string instructions = @"ANTI-RECOIL SCRIPT INSTRUCTIONS

SETUP:
This application works with any mouse - no additional software required!

CONTROLS:
• NumLock: Toggle script ON/OFF
• CapsLock: Toggle Auto-ADS mode
• Mouse Button 9 (side button): Switch between weapon profiles
• Left Click: Fire (with recoil compensation when active)
• Right Click: ADS (Aim Down Sights)

WEAPON PROFILES:
• Primary: For main weapons (assault rifles, etc.)
• Secondary: For secondary weapons (pistols, SMGs, etc.)

CONFIGURATION:
Use the 'Settings' button to adjust weapon parameters:
• Horizontal: Left/Right recoil compensation (-/+)
• Vertical: Up/Down recoil compensation (-/+)
• FireDelay: Delay between recoil adjustments (ms)
• AdsDelay: Time to aim down sights (ms)

HOW IT WORKS:
1. Turn ON NumLock to activate the script
2. Hold left mouse button to fire
3. The script automatically moves your mouse to counter recoil
4. Use Mouse Button 9 to switch between weapon profiles
5. Turn ON CapsLock for automatic ADS when firing

IMPORTANT:
• This tool is for educational purposes only
• Use at your own risk and responsibility
• May be detected by anti-cheat systems
• Test settings in practice mode first
• Works with any game and any mouse";

            MessageBox.Show(instructions, "Instructions", MessageBoxButtons.OK, MessageBoxIcon.Information);
        }

        protected override void OnFormClosing(CancelEventArgs e)
        {
            statusTimer?.Stop();
            recoilTimer?.Stop();
            base.OnFormClosing(e);
        }
    }
}
