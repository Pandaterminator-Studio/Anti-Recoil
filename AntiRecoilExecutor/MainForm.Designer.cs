namespace AntiRecoilExecutor
{
    partial class MainForm
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.lblTitle = new System.Windows.Forms.Label();
            this.lblScriptStatus = new System.Windows.Forms.Label();
            this.lblAutoADS = new System.Windows.Forms.Label();
            this.lblCurrentWeapon = new System.Windows.Forms.Label();
            this.lblWeaponSettings = new System.Windows.Forms.Label();
            this.btnLoadScript = new System.Windows.Forms.Button();
            this.btnEditSettings = new System.Windows.Forms.Button();
            this.btnInstructions = new System.Windows.Forms.Button();
            this.groupBoxStatus = new System.Windows.Forms.GroupBox();
            this.groupBoxControls = new System.Windows.Forms.GroupBox();
            this.lblAuthor = new System.Windows.Forms.Label();
            this.lblWarning = new System.Windows.Forms.Label();
            this.groupBoxStatus.SuspendLayout();
            this.groupBoxControls.SuspendLayout();
            this.SuspendLayout();
            // 
            // lblTitle
            // 
            this.lblTitle.AutoSize = true;
            this.lblTitle.Font = new System.Drawing.Font("Microsoft Sans Serif", 14F, System.Drawing.FontStyle.Bold);
            this.lblTitle.Location = new System.Drawing.Point(12, 9);
            this.lblTitle.Name = "lblTitle";
            this.lblTitle.Size = new System.Drawing.Size(245, 24);
            this.lblTitle.TabIndex = 0;
            this.lblTitle.Text = "Anti-Recoil Script Executor";
            // 
            // lblScriptStatus
            // 
            this.lblScriptStatus.AutoSize = true;
            this.lblScriptStatus.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Bold);
            this.lblScriptStatus.ForeColor = System.Drawing.Color.Red;
            this.lblScriptStatus.Location = new System.Drawing.Point(6, 25);
            this.lblScriptStatus.Name = "lblScriptStatus";
            this.lblScriptStatus.Size = new System.Drawing.Size(125, 17);
            this.lblScriptStatus.TabIndex = 1;
            this.lblScriptStatus.Text = "Script: INACTIVE";
            // 
            // lblAutoADS
            // 
            this.lblAutoADS.AutoSize = true;
            this.lblAutoADS.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
            this.lblAutoADS.ForeColor = System.Drawing.Color.Gray;
            this.lblAutoADS.Location = new System.Drawing.Point(6, 50);
            this.lblAutoADS.Name = "lblAutoADS";
            this.lblAutoADS.Size = new System.Drawing.Size(92, 17);
            this.lblAutoADS.TabIndex = 2;
            this.lblAutoADS.Text = "Auto ADS: OFF";
            // 
            // lblCurrentWeapon
            // 
            this.lblCurrentWeapon.AutoSize = true;
            this.lblCurrentWeapon.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
            this.lblCurrentWeapon.ForeColor = System.Drawing.Color.Blue;
            this.lblCurrentWeapon.Location = new System.Drawing.Point(6, 75);
            this.lblCurrentWeapon.Name = "lblCurrentWeapon";
            this.lblCurrentWeapon.Size = new System.Drawing.Size(158, 17);
            this.lblCurrentWeapon.TabIndex = 3;
            this.lblCurrentWeapon.Text = "Current Weapon: PRIMARY";
            // 
            // lblWeaponSettings
            // 
            this.lblWeaponSettings.AutoSize = true;
            this.lblWeaponSettings.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F);
            this.lblWeaponSettings.ForeColor = System.Drawing.Color.DarkBlue;
            this.lblWeaponSettings.Location = new System.Drawing.Point(6, 100);
            this.lblWeaponSettings.Name = "lblWeaponSettings";
            this.lblWeaponSettings.Size = new System.Drawing.Size(150, 15);
            this.lblWeaponSettings.TabIndex = 4;
            this.lblWeaponSettings.Text = "H: -0.2, V: 1, Delay: 7ms";
            // 
            // btnLoadScript
            // 
            this.btnLoadScript.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
            this.btnLoadScript.Location = new System.Drawing.Point(6, 25);
            this.btnLoadScript.Name = "btnLoadScript";
            this.btnLoadScript.Size = new System.Drawing.Size(120, 35);
            this.btnLoadScript.TabIndex = 5;
            this.btnLoadScript.Text = "Start Script";
            this.btnLoadScript.UseVisualStyleBackColor = true;
            this.btnLoadScript.Click += new System.EventHandler(this.btnLoadScript_Click);
            // 
            // btnEditSettings
            // 
            this.btnEditSettings.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
            this.btnEditSettings.Location = new System.Drawing.Point(132, 25);
            this.btnEditSettings.Name = "btnEditSettings";
            this.btnEditSettings.Size = new System.Drawing.Size(120, 35);
            this.btnEditSettings.TabIndex = 6;
            this.btnEditSettings.Text = "Settings";
            this.btnEditSettings.UseVisualStyleBackColor = true;
            this.btnEditSettings.Click += new System.EventHandler(this.btnEditSettings_Click);
            // 
            // btnInstructions
            // 
            this.btnInstructions.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
            this.btnInstructions.Location = new System.Drawing.Point(258, 25);
            this.btnInstructions.Name = "btnInstructions";
            this.btnInstructions.Size = new System.Drawing.Size(120, 35);
            this.btnInstructions.TabIndex = 7;
            this.btnInstructions.Text = "Instructions";
            this.btnInstructions.UseVisualStyleBackColor = true;
            this.btnInstructions.Click += new System.EventHandler(this.btnInstructions_Click);
            // 
            // groupBoxStatus
            // 
            this.groupBoxStatus.Controls.Add(this.lblScriptStatus);
            this.groupBoxStatus.Controls.Add(this.lblAutoADS);
            this.groupBoxStatus.Controls.Add(this.lblCurrentWeapon);
            this.groupBoxStatus.Controls.Add(this.lblWeaponSettings);
            this.groupBoxStatus.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
            this.groupBoxStatus.Location = new System.Drawing.Point(12, 45);
            this.groupBoxStatus.Name = "groupBoxStatus";
            this.groupBoxStatus.Size = new System.Drawing.Size(400, 130);
            this.groupBoxStatus.TabIndex = 8;
            this.groupBoxStatus.TabStop = false;
            this.groupBoxStatus.Text = "Status";
            // 
            // groupBoxControls
            // 
            this.groupBoxControls.Controls.Add(this.btnLoadScript);
            this.groupBoxControls.Controls.Add(this.btnEditSettings);
            this.groupBoxControls.Controls.Add(this.btnInstructions);
            this.groupBoxControls.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
            this.groupBoxControls.Location = new System.Drawing.Point(12, 181);
            this.groupBoxControls.Name = "groupBoxControls";
            this.groupBoxControls.Size = new System.Drawing.Size(400, 75);
            this.groupBoxControls.TabIndex = 9;
            this.groupBoxControls.TabStop = false;
            this.groupBoxControls.Text = "Controls";
            // 
            // lblAuthor
            // 
            this.lblAuthor.AutoSize = true;
            this.lblAuthor.Font = new System.Drawing.Font("Microsoft Sans Serif", 8F);
            this.lblAuthor.ForeColor = System.Drawing.Color.Gray;
            this.lblAuthor.Location = new System.Drawing.Point(12, 265);
            this.lblAuthor.Name = "lblAuthor";
            this.lblAuthor.Size = new System.Drawing.Size(142, 13);
            this.lblAuthor.TabIndex = 10;
            this.lblAuthor.Text = "By: Seyed Jafar Yaghoubi";
            // 
            // lblWarning
            // 
            this.lblWarning.AutoSize = true;
            this.lblWarning.Font = new System.Drawing.Font("Microsoft Sans Serif", 8F);
            this.lblWarning.ForeColor = System.Drawing.Color.Red;
            this.lblWarning.Location = new System.Drawing.Point(12, 280);
            this.lblWarning.Name = "lblWarning";
            this.lblWarning.Size = new System.Drawing.Size(275, 13);
            this.lblWarning.TabIndex = 11;
            this.lblWarning.Text = "⚠️ Educational purposes only - Use at your own risk";
            // 
            // MainForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(424, 306);
            this.Controls.Add(this.lblWarning);
            this.Controls.Add(this.lblAuthor);
            this.Controls.Add(this.groupBoxControls);
            this.Controls.Add(this.groupBoxStatus);
            this.Controls.Add(this.lblTitle);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog;
            this.MaximizeBox = false;
            this.Name = "MainForm";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Anti-Recoil Script Executor v1.0";
            this.groupBoxStatus.ResumeLayout(false);
            this.groupBoxStatus.PerformLayout();
            this.groupBoxControls.ResumeLayout(false);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label lblTitle;
        private System.Windows.Forms.Label lblScriptStatus;
        private System.Windows.Forms.Label lblAutoADS;
        private System.Windows.Forms.Label lblCurrentWeapon;
        private System.Windows.Forms.Label lblWeaponSettings;
        private System.Windows.Forms.Button btnLoadScript;
        private System.Windows.Forms.Button btnEditSettings;
        private System.Windows.Forms.Button btnInstructions;
        private System.Windows.Forms.GroupBox groupBoxStatus;
        private System.Windows.Forms.GroupBox groupBoxControls;
        private System.Windows.Forms.Label lblAuthor;
        private System.Windows.Forms.Label lblWarning;
    }
}
