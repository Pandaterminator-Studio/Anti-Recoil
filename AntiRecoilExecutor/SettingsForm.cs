using System;
using System.Windows.Forms;

namespace AntiRecoilExecutor
{
    public partial class SettingsForm : Form
    {
        public MainForm.WeaponConfig PrimaryWeapon { get; set; }
        public MainForm.WeaponConfig SecondaryWeapon { get; set; }

        public SettingsForm(MainForm.WeaponConfig primary, MainForm.WeaponConfig secondary)
        {
            InitializeComponent();
            
            // Initialize with current values
            PrimaryWeapon = new MainForm.WeaponConfig
            {
                Horizontal = primary.Horizontal,
                Vertical = primary.Vertical,
                FireDelay = primary.FireDelay,
                AdsDelay = primary.AdsDelay
            };

            SecondaryWeapon = new MainForm.WeaponConfig
            {
                Horizontal = secondary.Horizontal,
                Vertical = secondary.Vertical,
                FireDelay = secondary.FireDelay,
                AdsDelay = secondary.AdsDelay
            };

            LoadValues();
        }

        private void LoadValues()
        {
            // Primary weapon
            numPrimaryHorizontal.Value = (decimal)PrimaryWeapon.Horizontal;
            numPrimaryVertical.Value = (decimal)PrimaryWeapon.Vertical;
            numPrimaryFireDelay.Value = PrimaryWeapon.FireDelay;
            numPrimaryAdsDelay.Value = PrimaryWeapon.AdsDelay;

            // Secondary weapon
            numSecondaryHorizontal.Value = (decimal)SecondaryWeapon.Horizontal;
            numSecondaryVertical.Value = (decimal)SecondaryWeapon.Vertical;
            numSecondaryFireDelay.Value = SecondaryWeapon.FireDelay;
            numSecondaryAdsDelay.Value = SecondaryWeapon.AdsDelay;
        }

        private void btnOK_Click(object sender, EventArgs e)
        {
            // Save values
            PrimaryWeapon.Horizontal = (float)numPrimaryHorizontal.Value;
            PrimaryWeapon.Vertical = (float)numPrimaryVertical.Value;
            PrimaryWeapon.FireDelay = (int)numPrimaryFireDelay.Value;
            PrimaryWeapon.AdsDelay = (int)numPrimaryAdsDelay.Value;

            SecondaryWeapon.Horizontal = (float)numSecondaryHorizontal.Value;
            SecondaryWeapon.Vertical = (float)numSecondaryVertical.Value;
            SecondaryWeapon.FireDelay = (int)numSecondaryFireDelay.Value;
            SecondaryWeapon.AdsDelay = (int)numSecondaryAdsDelay.Value;

            DialogResult = DialogResult.OK;
            Close();
        }

        private void btnCancel_Click(object sender, EventArgs e)
        {
            DialogResult = DialogResult.Cancel;
            Close();
        }

        private void btnResetPrimary_Click(object sender, EventArgs e)
        {
            numPrimaryHorizontal.Value = -0.2m;
            numPrimaryVertical.Value = 1m;
            numPrimaryFireDelay.Value = 7;
            numPrimaryAdsDelay.Value = 300;
        }

        private void btnResetSecondary_Click(object sender, EventArgs e)
        {
            numSecondaryHorizontal.Value = -0.1m;
            numSecondaryVertical.Value = 2m;
            numSecondaryFireDelay.Value = 8;
            numSecondaryAdsDelay.Value = 130;
        }
    }
}
