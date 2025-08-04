namespace AntiRecoilExecutor
{
    partial class SettingsForm
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
            this.groupBoxPrimary = new System.Windows.Forms.GroupBox();
            this.lblPrimaryHorizontal = new System.Windows.Forms.Label();
            this.lblPrimaryVertical = new System.Windows.Forms.Label();
            this.lblPrimaryFireDelay = new System.Windows.Forms.Label();
            this.lblPrimaryAdsDelay = new System.Windows.Forms.Label();
            this.numPrimaryHorizontal = new System.Windows.Forms.NumericUpDown();
            this.numPrimaryVertical = new System.Windows.Forms.NumericUpDown();
            this.numPrimaryFireDelay = new System.Windows.Forms.NumericUpDown();
            this.numPrimaryAdsDelay = new System.Windows.Forms.NumericUpDown();
            this.btnResetPrimary = new System.Windows.Forms.Button();
            this.groupBoxSecondary = new System.Windows.Forms.GroupBox();
            this.lblSecondaryHorizontal = new System.Windows.Forms.Label();
            this.lblSecondaryVertical = new System.Windows.Forms.Label();
            this.lblSecondaryFireDelay = new System.Windows.Forms.Label();
            this.lblSecondaryAdsDelay = new System.Windows.Forms.Label();
            this.numSecondaryHorizontal = new System.Windows.Forms.NumericUpDown();
            this.numSecondaryVertical = new System.Windows.Forms.NumericUpDown();
            this.numSecondaryFireDelay = new System.Windows.Forms.NumericUpDown();
            this.numSecondaryAdsDelay = new System.Windows.Forms.NumericUpDown();
            this.btnResetSecondary = new System.Windows.Forms.Button();
            this.btnOK = new System.Windows.Forms.Button();
            this.btnCancel = new System.Windows.Forms.Button();
            this.lblTitle = new System.Windows.Forms.Label();
            this.groupBoxPrimary.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.numPrimaryHorizontal)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.numPrimaryVertical)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.numPrimaryFireDelay)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.numPrimaryAdsDelay)).BeginInit();
            this.groupBoxSecondary.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.numSecondaryHorizontal)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.numSecondaryVertical)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.numSecondaryFireDelay)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.numSecondaryAdsDelay)).BeginInit();
            this.SuspendLayout();
            // 
            // groupBoxPrimary
            // 
            this.groupBoxPrimary.Controls.Add(this.btnResetPrimary);
            this.groupBoxPrimary.Controls.Add(this.numPrimaryAdsDelay);
            this.groupBoxPrimary.Controls.Add(this.numPrimaryFireDelay);
            this.groupBoxPrimary.Controls.Add(this.numPrimaryVertical);
            this.groupBoxPrimary.Controls.Add(this.numPrimaryHorizontal);
            this.groupBoxPrimary.Controls.Add(this.lblPrimaryAdsDelay);
            this.groupBoxPrimary.Controls.Add(this.lblPrimaryFireDelay);
            this.groupBoxPrimary.Controls.Add(this.lblPrimaryVertical);
            this.groupBoxPrimary.Controls.Add(this.lblPrimaryHorizontal);
            this.groupBoxPrimary.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
            this.groupBoxPrimary.Location = new System.Drawing.Point(12, 50);
            this.groupBoxPrimary.Name = "groupBoxPrimary";
            this.groupBoxPrimary.Size = new System.Drawing.Size(200, 180);
            this.groupBoxPrimary.TabIndex = 0;
            this.groupBoxPrimary.TabStop = false;
            this.groupBoxPrimary.Text = "Primary Weapon";
            // 
            // lblPrimaryHorizontal
            // 
            this.lblPrimaryHorizontal.AutoSize = true;
            this.lblPrimaryHorizontal.Location = new System.Drawing.Point(6, 30);
            this.lblPrimaryHorizontal.Name = "lblPrimaryHorizontal";
            this.lblPrimaryHorizontal.Size = new System.Drawing.Size(75, 17);
            this.lblPrimaryHorizontal.TabIndex = 0;
            this.lblPrimaryHorizontal.Text = "Horizontal:";
            // 
            // lblPrimaryVertical
            // 
            this.lblPrimaryVertical.AutoSize = true;
            this.lblPrimaryVertical.Location = new System.Drawing.Point(6, 60);
            this.lblPrimaryVertical.Name = "lblPrimaryVertical";
            this.lblPrimaryVertical.Size = new System.Drawing.Size(58, 17);
            this.lblPrimaryVertical.TabIndex = 1;
            this.lblPrimaryVertical.Text = "Vertical:";
            // 
            // lblPrimaryFireDelay
            // 
            this.lblPrimaryFireDelay.AutoSize = true;
            this.lblPrimaryFireDelay.Location = new System.Drawing.Point(6, 90);
            this.lblPrimaryFireDelay.Name = "lblPrimaryFireDelay";
            this.lblPrimaryFireDelay.Size = new System.Drawing.Size(78, 17);
            this.lblPrimaryFireDelay.TabIndex = 2;
            this.lblPrimaryFireDelay.Text = "Fire Delay:";
            // 
            // lblPrimaryAdsDelay
            // 
            this.lblPrimaryAdsDelay.AutoSize = true;
            this.lblPrimaryAdsDelay.Location = new System.Drawing.Point(6, 120);
            this.lblPrimaryAdsDelay.Name = "lblPrimaryAdsDelay";
            this.lblPrimaryAdsDelay.Size = new System.Drawing.Size(80, 17);
            this.lblPrimaryAdsDelay.TabIndex = 3;
            this.lblPrimaryAdsDelay.Text = "ADS Delay:";
            // 
            // numPrimaryHorizontal
            // 
            this.numPrimaryHorizontal.DecimalPlaces = 1;
            this.numPrimaryHorizontal.Increment = new decimal(new int[] {
            1,
            0,
            0,
            65536});
            this.numPrimaryHorizontal.Location = new System.Drawing.Point(90, 28);
            this.numPrimaryHorizontal.Maximum = new decimal(new int[] {
            10,
            0,
            0,
            0});
            this.numPrimaryHorizontal.Minimum = new decimal(new int[] {
            10,
            0,
            0,
            -2147483648});
            this.numPrimaryHorizontal.Name = "numPrimaryHorizontal";
            this.numPrimaryHorizontal.Size = new System.Drawing.Size(80, 23);
            this.numPrimaryHorizontal.TabIndex = 4;
            // 
            // numPrimaryVertical
            // 
            this.numPrimaryVertical.DecimalPlaces = 1;
            this.numPrimaryVertical.Increment = new decimal(new int[] {
            1,
            0,
            0,
            65536});
            this.numPrimaryVertical.Location = new System.Drawing.Point(90, 58);
            this.numPrimaryVertical.Maximum = new decimal(new int[] {
            10,
            0,
            0,
            0});
            this.numPrimaryVertical.Minimum = new decimal(new int[] {
            10,
            0,
            0,
            -2147483648});
            this.numPrimaryVertical.Name = "numPrimaryVertical";
            this.numPrimaryVertical.Size = new System.Drawing.Size(80, 23);
            this.numPrimaryVertical.TabIndex = 5;
            // 
            // numPrimaryFireDelay
            // 
            this.numPrimaryFireDelay.Location = new System.Drawing.Point(90, 88);
            this.numPrimaryFireDelay.Maximum = new decimal(new int[] {
            100,
            0,
            0,
            0});
            this.numPrimaryFireDelay.Minimum = new decimal(new int[] {
            1,
            0,
            0,
            0});
            this.numPrimaryFireDelay.Name = "numPrimaryFireDelay";
            this.numPrimaryFireDelay.Size = new System.Drawing.Size(80, 23);
            this.numPrimaryFireDelay.TabIndex = 6;
            this.numPrimaryFireDelay.Value = new decimal(new int[] {
            1,
            0,
            0,
            0});
            // 
            // numPrimaryAdsDelay
            // 
            this.numPrimaryAdsDelay.Increment = new decimal(new int[] {
            10,
            0,
            0,
            0});
            this.numPrimaryAdsDelay.Location = new System.Drawing.Point(90, 118);
            this.numPrimaryAdsDelay.Maximum = new decimal(new int[] {
            1000,
            0,
            0,
            0});
            this.numPrimaryAdsDelay.Name = "numPrimaryAdsDelay";
            this.numPrimaryAdsDelay.Size = new System.Drawing.Size(80, 23);
            this.numPrimaryAdsDelay.TabIndex = 7;
            // 
            // btnResetPrimary
            // 
            this.btnResetPrimary.Location = new System.Drawing.Point(90, 147);
            this.btnResetPrimary.Name = "btnResetPrimary";
            this.btnResetPrimary.Size = new System.Drawing.Size(80, 25);
            this.btnResetPrimary.TabIndex = 8;
            this.btnResetPrimary.Text = "Reset";
            this.btnResetPrimary.UseVisualStyleBackColor = true;
            this.btnResetPrimary.Click += new System.EventHandler(this.btnResetPrimary_Click);
            // 
            // groupBoxSecondary
            // 
            this.groupBoxSecondary.Controls.Add(this.btnResetSecondary);
            this.groupBoxSecondary.Controls.Add(this.numSecondaryAdsDelay);
            this.groupBoxSecondary.Controls.Add(this.numSecondaryFireDelay);
            this.groupBoxSecondary.Controls.Add(this.numSecondaryVertical);
            this.groupBoxSecondary.Controls.Add(this.numSecondaryHorizontal);
            this.groupBoxSecondary.Controls.Add(this.lblSecondaryAdsDelay);
            this.groupBoxSecondary.Controls.Add(this.lblSecondaryFireDelay);
            this.groupBoxSecondary.Controls.Add(this.lblSecondaryVertical);
            this.groupBoxSecondary.Controls.Add(this.lblSecondaryHorizontal);
            this.groupBoxSecondary.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
            this.groupBoxSecondary.Location = new System.Drawing.Point(230, 50);
            this.groupBoxSecondary.Name = "groupBoxSecondary";
            this.groupBoxSecondary.Size = new System.Drawing.Size(200, 180);
            this.groupBoxSecondary.TabIndex = 1;
            this.groupBoxSecondary.TabStop = false;
            this.groupBoxSecondary.Text = "Secondary Weapon";
            // 
            // lblSecondaryHorizontal
            // 
            this.lblSecondaryHorizontal.AutoSize = true;
            this.lblSecondaryHorizontal.Location = new System.Drawing.Point(6, 30);
            this.lblSecondaryHorizontal.Name = "lblSecondaryHorizontal";
            this.lblSecondaryHorizontal.Size = new System.Drawing.Size(75, 17);
            this.lblSecondaryHorizontal.TabIndex = 0;
            this.lblSecondaryHorizontal.Text = "Horizontal:";
            // 
            // lblSecondaryVertical
            // 
            this.lblSecondaryVertical.AutoSize = true;
            this.lblSecondaryVertical.Location = new System.Drawing.Point(6, 60);
            this.lblSecondaryVertical.Name = "lblSecondaryVertical";
            this.lblSecondaryVertical.Size = new System.Drawing.Size(58, 17);
            this.lblSecondaryVertical.TabIndex = 1;
            this.lblSecondaryVertical.Text = "Vertical:";
            // 
            // lblSecondaryFireDelay
            // 
            this.lblSecondaryFireDelay.AutoSize = true;
            this.lblSecondaryFireDelay.Location = new System.Drawing.Point(6, 90);
            this.lblSecondaryFireDelay.Name = "lblSecondaryFireDelay";
            this.lblSecondaryFireDelay.Size = new System.Drawing.Size(78, 17);
            this.lblSecondaryFireDelay.TabIndex = 2;
            this.lblSecondaryFireDelay.Text = "Fire Delay:";
            // 
            // lblSecondaryAdsDelay
            // 
            this.lblSecondaryAdsDelay.AutoSize = true;
            this.lblSecondaryAdsDelay.Location = new System.Drawing.Point(6, 120);
            this.lblSecondaryAdsDelay.Name = "lblSecondaryAdsDelay";
            this.lblSecondaryAdsDelay.Size = new System.Drawing.Size(80, 17);
            this.lblSecondaryAdsDelay.TabIndex = 3;
            this.lblSecondaryAdsDelay.Text = "ADS Delay:";
            // 
            // numSecondaryHorizontal
            // 
            this.numSecondaryHorizontal.DecimalPlaces = 1;
            this.numSecondaryHorizontal.Increment = new decimal(new int[] {
            1,
            0,
            0,
            65536});
            this.numSecondaryHorizontal.Location = new System.Drawing.Point(90, 28);
            this.numSecondaryHorizontal.Maximum = new decimal(new int[] {
            10,
            0,
            0,
            0});
            this.numSecondaryHorizontal.Minimum = new decimal(new int[] {
            10,
            0,
            0,
            -2147483648});
            this.numSecondaryHorizontal.Name = "numSecondaryHorizontal";
            this.numSecondaryHorizontal.Size = new System.Drawing.Size(80, 23);
            this.numSecondaryHorizontal.TabIndex = 4;
            // 
            // numSecondaryVertical
            // 
            this.numSecondaryVertical.DecimalPlaces = 1;
            this.numSecondaryVertical.Increment = new decimal(new int[] {
            1,
            0,
            0,
            65536});
            this.numSecondaryVertical.Location = new System.Drawing.Point(90, 58);
            this.numSecondaryVertical.Maximum = new decimal(new int[] {
            10,
            0,
            0,
            0});
            this.numSecondaryVertical.Minimum = new decimal(new int[] {
            10,
            0,
            0,
            -2147483648});
            this.numSecondaryVertical.Name = "numSecondaryVertical";
            this.numSecondaryVertical.Size = new System.Drawing.Size(80, 23);
            this.numSecondaryVertical.TabIndex = 5;
            // 
            // numSecondaryFireDelay
            // 
            this.numSecondaryFireDelay.Location = new System.Drawing.Point(90, 88);
            this.numSecondaryFireDelay.Maximum = new decimal(new int[] {
            100,
            0,
            0,
            0});
            this.numSecondaryFireDelay.Minimum = new decimal(new int[] {
            1,
            0,
            0,
            0});
            this.numSecondaryFireDelay.Name = "numSecondaryFireDelay";
            this.numSecondaryFireDelay.Size = new System.Drawing.Size(80, 23);
            this.numSecondaryFireDelay.TabIndex = 6;
            this.numSecondaryFireDelay.Value = new decimal(new int[] {
            1,
            0,
            0,
            0});
            // 
            // numSecondaryAdsDelay
            // 
            this.numSecondaryAdsDelay.Increment = new decimal(new int[] {
            10,
            0,
            0,
            0});
            this.numSecondaryAdsDelay.Location = new System.Drawing.Point(90, 118);
            this.numSecondaryAdsDelay.Maximum = new decimal(new int[] {
            1000,
            0,
            0,
            0});
            this.numSecondaryAdsDelay.Name = "numSecondaryAdsDelay";
            this.numSecondaryAdsDelay.Size = new System.Drawing.Size(80, 23);
            this.numSecondaryAdsDelay.TabIndex = 7;
            // 
            // btnResetSecondary
            // 
            this.btnResetSecondary.Location = new System.Drawing.Point(90, 147);
            this.btnResetSecondary.Name = "btnResetSecondary";
            this.btnResetSecondary.Size = new System.Drawing.Size(80, 25);
            this.btnResetSecondary.TabIndex = 8;
            this.btnResetSecondary.Text = "Reset";
            this.btnResetSecondary.UseVisualStyleBackColor = true;
            this.btnResetSecondary.Click += new System.EventHandler(this.btnResetSecondary_Click);
            // 
            // btnOK
            // 
            this.btnOK.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
            this.btnOK.Location = new System.Drawing.Point(270, 250);
            this.btnOK.Name = "btnOK";
            this.btnOK.Size = new System.Drawing.Size(75, 30);
            this.btnOK.TabIndex = 2;
            this.btnOK.Text = "OK";
            this.btnOK.UseVisualStyleBackColor = true;
            this.btnOK.Click += new System.EventHandler(this.btnOK_Click);
            // 
            // btnCancel
            // 
            this.btnCancel.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
            this.btnCancel.Location = new System.Drawing.Point(355, 250);
            this.btnCancel.Name = "btnCancel";
            this.btnCancel.Size = new System.Drawing.Size(75, 30);
            this.btnCancel.TabIndex = 3;
            this.btnCancel.Text = "Cancel";
            this.btnCancel.UseVisualStyleBackColor = true;
            this.btnCancel.Click += new System.EventHandler(this.btnCancel_Click);
            // 
            // lblTitle
            // 
            this.lblTitle.AutoSize = true;
            this.lblTitle.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold);
            this.lblTitle.Location = new System.Drawing.Point(12, 15);
            this.lblTitle.Name = "lblTitle";
            this.lblTitle.Size = new System.Drawing.Size(168, 20);
            this.lblTitle.TabIndex = 4;
            this.lblTitle.Text = "Weapon Settings";
            // 
            // SettingsForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(442, 292);
            this.Controls.Add(this.lblTitle);
            this.Controls.Add(this.btnCancel);
            this.Controls.Add(this.btnOK);
            this.Controls.Add(this.groupBoxSecondary);
            this.Controls.Add(this.groupBoxPrimary);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog;
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "SettingsForm";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterParent;
            this.Text = "Weapon Settings";
            this.groupBoxPrimary.ResumeLayout(false);
            this.groupBoxPrimary.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.numPrimaryHorizontal)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.numPrimaryVertical)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.numPrimaryFireDelay)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.numPrimaryAdsDelay)).EndInit();
            this.groupBoxSecondary.ResumeLayout(false);
            this.groupBoxSecondary.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.numSecondaryHorizontal)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.numSecondaryVertical)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.numSecondaryFireDelay)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.numSecondaryAdsDelay)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.GroupBox groupBoxPrimary;
        private System.Windows.Forms.Label lblPrimaryHorizontal;
        private System.Windows.Forms.Label lblPrimaryVertical;
        private System.Windows.Forms.Label lblPrimaryFireDelay;
        private System.Windows.Forms.Label lblPrimaryAdsDelay;
        private System.Windows.Forms.NumericUpDown numPrimaryHorizontal;
        private System.Windows.Forms.NumericUpDown numPrimaryVertical;
        private System.Windows.Forms.NumericUpDown numPrimaryFireDelay;
        private System.Windows.Forms.NumericUpDown numPrimaryAdsDelay;
        private System.Windows.Forms.Button btnResetPrimary;
        private System.Windows.Forms.GroupBox groupBoxSecondary;
        private System.Windows.Forms.Label lblSecondaryHorizontal;
        private System.Windows.Forms.Label lblSecondaryVertical;
        private System.Windows.Forms.Label lblSecondaryFireDelay;
        private System.Windows.Forms.Label lblSecondaryAdsDelay;
        private System.Windows.Forms.NumericUpDown numSecondaryHorizontal;
        private System.Windows.Forms.NumericUpDown numSecondaryVertical;
        private System.Windows.Forms.NumericUpDown numSecondaryFireDelay;
        private System.Windows.Forms.NumericUpDown numSecondaryAdsDelay;
        private System.Windows.Forms.Button btnResetSecondary;
        private System.Windows.Forms.Button btnOK;
        private System.Windows.Forms.Button btnCancel;
        private System.Windows.Forms.Label lblTitle;
    }
}
