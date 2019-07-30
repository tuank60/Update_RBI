namespace RBI.PRE.subForm.InputDataForm
{
    partial class UCMaterialTank
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

        #region Component Designer generated code

        /// <summary> 
        /// Required method for Designer support - do not modify 
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.txtMaterial = new System.Windows.Forms.TextBox();
            this.cbPTAMaterialGrade = new DevExpress.XtraEditors.ImageComboBoxEdit();
            this.cbHeatTreatment = new DevExpress.XtraEditors.ImageComboBoxEdit();
            this.cbSulfurContent = new DevExpress.XtraEditors.ImageComboBoxEdit();
            this.chkNickelAlloy = new System.Windows.Forms.CheckBox();
            this.chkAusteniticSteel = new System.Windows.Forms.CheckBox();
            this.chkIsPTASeverity = new System.Windows.Forms.CheckBox();
            this.chkChromium = new System.Windows.Forms.CheckBox();
            this.chkCarbonLowAlloySteel = new System.Windows.Forms.CheckBox();
            this.label13 = new System.Windows.Forms.Label();
            this.label6 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.label12 = new System.Windows.Forms.Label();
            this.label11 = new System.Windows.Forms.Label();
            this.label10 = new System.Windows.Forms.Label();
            this.txtBrittleFracture = new System.Windows.Forms.TextBox();
            this.txtAllowableStress = new System.Windows.Forms.TextBox();
            this.txtReferenceTemperature = new System.Windows.Forms.TextBox();
            this.lblBritFracGovThickness = new System.Windows.Forms.Label();
            this.txtProductionCost = new System.Windows.Forms.TextBox();
            this.txtMaterialCostFactor = new System.Windows.Forms.TextBox();
            this.txtDesignPressure = new System.Windows.Forms.TextBox();
            this.txtMinDesignTemperature = new System.Windows.Forms.TextBox();
            this.lblAllowableStress = new System.Windows.Forms.Label();
            this.lblRefTem = new System.Windows.Forms.Label();
            this.label20 = new System.Windows.Forms.Label();
            this.label21 = new System.Windows.Forms.Label();
            this.label18 = new System.Windows.Forms.Label();
            this.txtMaxDesignTemperature = new System.Windows.Forms.TextBox();
            this.label27 = new System.Windows.Forms.Label();
            this.label26 = new System.Windows.Forms.Label();
            this.label23 = new System.Windows.Forms.Label();
            this.label16 = new System.Windows.Forms.Label();
            this.label17 = new System.Windows.Forms.Label();
            this.label28 = new System.Windows.Forms.Label();
            this.label22 = new System.Windows.Forms.Label();
            this.lblMinDesignTem = new System.Windows.Forms.Label();
            this.lblDesignPressure = new System.Windows.Forms.Label();
            this.lblMaxDesignTem = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.panel1 = new System.Windows.Forms.Panel();
            this.label2 = new System.Windows.Forms.Label();
            this.label15 = new System.Windows.Forms.Label();
            this.lblCorrosion = new System.Windows.Forms.Label();
            this.txtCorrosionAllowance = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.panel2 = new System.Windows.Forms.Panel();
            this.panel3 = new System.Windows.Forms.Panel();
            this.label5 = new System.Windows.Forms.Label();
            this.panel4 = new System.Windows.Forms.Panel();
            this.label7 = new System.Windows.Forms.Label();
            this.groupBox1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.cbPTAMaterialGrade.Properties)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.cbHeatTreatment.Properties)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.cbSulfurContent.Properties)).BeginInit();
            this.panel1.SuspendLayout();
            this.panel2.SuspendLayout();
            this.panel3.SuspendLayout();
            this.panel4.SuspendLayout();
            this.SuspendLayout();
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.panel4);
            this.groupBox1.Controls.Add(this.panel3);
            this.groupBox1.Controls.Add(this.panel2);
            this.groupBox1.Controls.Add(this.panel1);
            this.groupBox1.Controls.Add(this.cbHeatTreatment);
            this.groupBox1.Controls.Add(this.label13);
            this.groupBox1.Controls.Add(this.label6);
            this.groupBox1.Controls.Add(this.txtBrittleFracture);
            this.groupBox1.Controls.Add(this.txtAllowableStress);
            this.groupBox1.Controls.Add(this.lblBritFracGovThickness);
            this.groupBox1.Controls.Add(this.txtProductionCost);
            this.groupBox1.Controls.Add(this.lblAllowableStress);
            this.groupBox1.Controls.Add(this.label23);
            this.groupBox1.Controls.Add(this.label16);
            this.groupBox1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.groupBox1.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.groupBox1.Location = new System.Drawing.Point(0, 0);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(864, 791);
            this.groupBox1.TabIndex = 1;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Material";
            this.groupBox1.TextChanged += new System.EventHandler(this.txtMaterial_TextChanged);
            // 
            // txtMaterial
            // 
            this.txtMaterial.Location = new System.Drawing.Point(206, 25);
            this.txtMaterial.Name = "txtMaterial";
            this.txtMaterial.Size = new System.Drawing.Size(220, 22);
            this.txtMaterial.TabIndex = 19;
            this.txtMaterial.TextChanged += new System.EventHandler(this.txtMaterial_TextChanged);
            this.txtMaterial.KeyDown += new System.Windows.Forms.KeyEventHandler(this.txtMaterial_KeyDown);
            // 
            // cbPTAMaterialGrade
            // 
            this.cbPTAMaterialGrade.Enabled = false;
            this.cbPTAMaterialGrade.Location = new System.Drawing.Point(285, 100);
            this.cbPTAMaterialGrade.Name = "cbPTAMaterialGrade";
            this.cbPTAMaterialGrade.Properties.Buttons.AddRange(new DevExpress.XtraEditors.Controls.EditorButton[] {
            new DevExpress.XtraEditors.Controls.EditorButton(DevExpress.XtraEditors.Controls.ButtonPredefines.Combo)});
            this.cbPTAMaterialGrade.Size = new System.Drawing.Size(248, 20);
            this.cbPTAMaterialGrade.TabIndex = 16;
            this.cbPTAMaterialGrade.TextChanged += new System.EventHandler(this.txtMaterial_TextChanged);
            this.cbPTAMaterialGrade.KeyDown += new System.Windows.Forms.KeyEventHandler(this.txtMaterial_KeyDown);
            // 
            // cbHeatTreatment
            // 
            this.cbHeatTreatment.Location = new System.Drawing.Point(188, 702);
            this.cbHeatTreatment.Name = "cbHeatTreatment";
            this.cbHeatTreatment.Properties.Buttons.AddRange(new DevExpress.XtraEditors.Controls.EditorButton[] {
            new DevExpress.XtraEditors.Controls.EditorButton(DevExpress.XtraEditors.Controls.ButtonPredefines.Combo)});
            this.cbHeatTreatment.Size = new System.Drawing.Size(125, 20);
            this.cbHeatTreatment.TabIndex = 14;
            this.cbHeatTreatment.TextChanged += new System.EventHandler(this.txtMaterial_TextChanged);
            this.cbHeatTreatment.KeyDown += new System.Windows.Forms.KeyEventHandler(this.txtMaterial_KeyDown);
            // 
            // cbSulfurContent
            // 
            this.cbSulfurContent.Location = new System.Drawing.Point(285, 54);
            this.cbSulfurContent.Name = "cbSulfurContent";
            this.cbSulfurContent.Properties.Buttons.AddRange(new DevExpress.XtraEditors.Controls.EditorButton[] {
            new DevExpress.XtraEditors.Controls.EditorButton(DevExpress.XtraEditors.Controls.ButtonPredefines.Combo)});
            this.cbSulfurContent.Size = new System.Drawing.Size(248, 20);
            this.cbSulfurContent.TabIndex = 13;
            this.cbSulfurContent.TextChanged += new System.EventHandler(this.txtMaterial_TextChanged);
            this.cbSulfurContent.KeyDown += new System.Windows.Forms.KeyEventHandler(this.txtMaterial_KeyDown);
            // 
            // chkNickelAlloy
            // 
            this.chkNickelAlloy.AutoSize = true;
            this.chkNickelAlloy.Location = new System.Drawing.Point(285, 34);
            this.chkNickelAlloy.Name = "chkNickelAlloy";
            this.chkNickelAlloy.Size = new System.Drawing.Size(15, 14);
            this.chkNickelAlloy.TabIndex = 12;
            this.chkNickelAlloy.UseVisualStyleBackColor = true;
            this.chkNickelAlloy.CheckedChanged += new System.EventHandler(this.txtMaterial_TextChanged);
            this.chkNickelAlloy.KeyDown += new System.Windows.Forms.KeyEventHandler(this.txtMaterial_KeyDown);
            // 
            // chkAusteniticSteel
            // 
            this.chkAusteniticSteel.AutoSize = true;
            this.chkAusteniticSteel.Location = new System.Drawing.Point(206, 73);
            this.chkAusteniticSteel.Name = "chkAusteniticSteel";
            this.chkAusteniticSteel.Size = new System.Drawing.Size(15, 14);
            this.chkAusteniticSteel.TabIndex = 11;
            this.chkAusteniticSteel.UseVisualStyleBackColor = true;
            this.chkAusteniticSteel.CheckedChanged += new System.EventHandler(this.txtMaterial_TextChanged);
            this.chkAusteniticSteel.KeyDown += new System.Windows.Forms.KeyEventHandler(this.txtMaterial_KeyDown);
            // 
            // chkIsPTASeverity
            // 
            this.chkIsPTASeverity.AutoSize = true;
            this.chkIsPTASeverity.Location = new System.Drawing.Point(285, 80);
            this.chkIsPTASeverity.Name = "chkIsPTASeverity";
            this.chkIsPTASeverity.Size = new System.Drawing.Size(15, 14);
            this.chkIsPTASeverity.TabIndex = 15;
            this.chkIsPTASeverity.UseVisualStyleBackColor = true;
            this.chkIsPTASeverity.CheckedChanged += new System.EventHandler(this.txtMaterial_TextChanged);
            this.chkIsPTASeverity.KeyDown += new System.Windows.Forms.KeyEventHandler(this.txtMaterial_KeyDown);
            // 
            // chkChromium
            // 
            this.chkChromium.AutoSize = true;
            this.chkChromium.Location = new System.Drawing.Point(287, 60);
            this.chkChromium.Name = "chkChromium";
            this.chkChromium.Size = new System.Drawing.Size(15, 14);
            this.chkChromium.TabIndex = 10;
            this.chkChromium.UseVisualStyleBackColor = true;
            this.chkChromium.CheckedChanged += new System.EventHandler(this.txtMaterial_TextChanged);
            this.chkChromium.KeyDown += new System.Windows.Forms.KeyEventHandler(this.txtMaterial_KeyDown);
            // 
            // chkCarbonLowAlloySteel
            // 
            this.chkCarbonLowAlloySteel.AutoSize = true;
            this.chkCarbonLowAlloySteel.Location = new System.Drawing.Point(206, 53);
            this.chkCarbonLowAlloySteel.Name = "chkCarbonLowAlloySteel";
            this.chkCarbonLowAlloySteel.Size = new System.Drawing.Size(15, 14);
            this.chkCarbonLowAlloySteel.TabIndex = 9;
            this.chkCarbonLowAlloySteel.UseVisualStyleBackColor = true;
            this.chkCarbonLowAlloySteel.CheckedChanged += new System.EventHandler(this.txtMaterial_TextChanged);
            this.chkCarbonLowAlloySteel.KeyDown += new System.Windows.Forms.KeyEventHandler(this.txtMaterial_KeyDown);
            // 
            // label13
            // 
            this.label13.AutoSize = true;
            this.label13.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label13.ForeColor = System.Drawing.Color.Black;
            this.label13.Location = new System.Drawing.Point(685, 692);
            this.label13.Name = "label13";
            this.label13.Size = new System.Drawing.Size(23, 13);
            this.label13.TabIndex = 3;
            this.label13.Text = "mm";
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label6.ForeColor = System.Drawing.Color.Black;
            this.label6.Location = new System.Drawing.Point(332, 738);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(20, 13);
            this.label6.TabIndex = 3;
            this.label6.Text = "psi";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label4.ForeColor = System.Drawing.Color.Black;
            this.label4.Location = new System.Drawing.Point(350, 96);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(20, 13);
            this.label4.TabIndex = 3;
            this.label4.Text = "psi";
            // 
            // label12
            // 
            this.label12.AutoSize = true;
            this.label12.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label12.ForeColor = System.Drawing.Color.Black;
            this.label12.Location = new System.Drawing.Point(431, 80);
            this.label12.Name = "label12";
            this.label12.Size = new System.Drawing.Size(18, 13);
            this.label12.TabIndex = 3;
            this.label12.Text = "⁰C";
            // 
            // label11
            // 
            this.label11.AutoSize = true;
            this.label11.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label11.ForeColor = System.Drawing.Color.Black;
            this.label11.Location = new System.Drawing.Point(431, 34);
            this.label11.Name = "label11";
            this.label11.Size = new System.Drawing.Size(18, 13);
            this.label11.TabIndex = 3;
            this.label11.Text = "⁰C";
            // 
            // label10
            // 
            this.label10.AutoSize = true;
            this.label10.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label10.ForeColor = System.Drawing.Color.Black;
            this.label10.Location = new System.Drawing.Point(350, 119);
            this.label10.Name = "label10";
            this.label10.Size = new System.Drawing.Size(18, 13);
            this.label10.TabIndex = 3;
            this.label10.Text = "⁰C";
            // 
            // txtBrittleFracture
            // 
            this.txtBrittleFracture.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtBrittleFracture.Location = new System.Drawing.Point(540, 697);
            this.txtBrittleFracture.Name = "txtBrittleFracture";
            this.txtBrittleFracture.Size = new System.Drawing.Size(138, 21);
            this.txtBrittleFracture.TabIndex = 8;
            this.txtBrittleFracture.TextChanged += new System.EventHandler(this.txtMaterial_TextChanged);
            this.txtBrittleFracture.KeyDown += new System.Windows.Forms.KeyEventHandler(this.txtMaterial_KeyDown);
            this.txtBrittleFracture.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.txtBrittleFracture_KeyPress);
            // 
            // txtAllowableStress
            // 
            this.txtAllowableStress.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtAllowableStress.Location = new System.Drawing.Point(188, 743);
            this.txtAllowableStress.Name = "txtAllowableStress";
            this.txtAllowableStress.Size = new System.Drawing.Size(138, 21);
            this.txtAllowableStress.TabIndex = 4;
            this.txtAllowableStress.TextChanged += new System.EventHandler(this.txtMaterial_TextChanged);
            this.txtAllowableStress.KeyDown += new System.Windows.Forms.KeyEventHandler(this.txtMaterial_KeyDown);
            this.txtAllowableStress.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.txtAllowableStress_KeyPress);
            // 
            // txtReferenceTemperature
            // 
            this.txtReferenceTemperature.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtReferenceTemperature.Location = new System.Drawing.Point(287, 79);
            this.txtReferenceTemperature.Name = "txtReferenceTemperature";
            this.txtReferenceTemperature.Size = new System.Drawing.Size(138, 21);
            this.txtReferenceTemperature.TabIndex = 7;
            this.txtReferenceTemperature.TextChanged += new System.EventHandler(this.txtMaterial_TextChanged);
            this.txtReferenceTemperature.KeyDown += new System.Windows.Forms.KeyEventHandler(this.txtMaterial_KeyDown);
            this.txtReferenceTemperature.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.txtReferenceTemperature_KeyPress);
            // 
            // lblBritFracGovThickness
            // 
            this.lblBritFracGovThickness.AutoSize = true;
            this.lblBritFracGovThickness.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblBritFracGovThickness.Location = new System.Drawing.Point(387, 692);
            this.lblBritFracGovThickness.Name = "lblBritFracGovThickness";
            this.lblBritFracGovThickness.Size = new System.Drawing.Size(121, 30);
            this.lblBritFracGovThickness.TabIndex = 0;
            this.lblBritFracGovThickness.Text = "Brittle Fracture\r\nGoverning Thickness";
            // 
            // txtProductionCost
            // 
            this.txtProductionCost.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtProductionCost.Location = new System.Drawing.Point(513, 746);
            this.txtProductionCost.Name = "txtProductionCost";
            this.txtProductionCost.Size = new System.Drawing.Size(138, 22);
            this.txtProductionCost.TabIndex = 18;
            this.txtProductionCost.TextChanged += new System.EventHandler(this.txtMaterial_TextChanged);
            this.txtProductionCost.KeyDown += new System.Windows.Forms.KeyEventHandler(this.txtMaterial_KeyDown);
            this.txtProductionCost.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.txtProductionCost_KeyPress);
            // 
            // txtMaterialCostFactor
            // 
            this.txtMaterialCostFactor.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtMaterialCostFactor.Location = new System.Drawing.Point(601, 96);
            this.txtMaterialCostFactor.Name = "txtMaterialCostFactor";
            this.txtMaterialCostFactor.Size = new System.Drawing.Size(138, 22);
            this.txtMaterialCostFactor.TabIndex = 17;
            this.txtMaterialCostFactor.TextChanged += new System.EventHandler(this.txtMaterial_TextChanged);
            this.txtMaterialCostFactor.KeyDown += new System.Windows.Forms.KeyEventHandler(this.txtMaterial_KeyDown);
            this.txtMaterialCostFactor.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.txtMaterialCostFactor_KeyPress);
            // 
            // txtDesignPressure
            // 
            this.txtDesignPressure.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtDesignPressure.Location = new System.Drawing.Point(206, 93);
            this.txtDesignPressure.Name = "txtDesignPressure";
            this.txtDesignPressure.Size = new System.Drawing.Size(138, 21);
            this.txtDesignPressure.TabIndex = 3;
            this.txtDesignPressure.TextChanged += new System.EventHandler(this.txtMaterial_TextChanged);
            this.txtDesignPressure.KeyDown += new System.Windows.Forms.KeyEventHandler(this.txtMaterial_KeyDown);
            this.txtDesignPressure.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.txtDesignPressure_KeyPress);
            // 
            // txtMinDesignTemperature
            // 
            this.txtMinDesignTemperature.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtMinDesignTemperature.Location = new System.Drawing.Point(287, 33);
            this.txtMinDesignTemperature.Name = "txtMinDesignTemperature";
            this.txtMinDesignTemperature.Size = new System.Drawing.Size(138, 21);
            this.txtMinDesignTemperature.TabIndex = 6;
            this.txtMinDesignTemperature.TextChanged += new System.EventHandler(this.txtMaterial_TextChanged);
            this.txtMinDesignTemperature.KeyDown += new System.Windows.Forms.KeyEventHandler(this.txtMaterial_KeyDown);
            this.txtMinDesignTemperature.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.txtMinDesignTemperature_KeyPress);
            // 
            // lblAllowableStress
            // 
            this.lblAllowableStress.AutoSize = true;
            this.lblAllowableStress.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblAllowableStress.Location = new System.Drawing.Point(34, 738);
            this.lblAllowableStress.Name = "lblAllowableStress";
            this.lblAllowableStress.Size = new System.Drawing.Size(147, 30);
            this.lblAllowableStress.TabIndex = 0;
            this.lblAllowableStress.Text = "Allowable Stress at\r\nAssessment Temperature";
            // 
            // lblRefTem
            // 
            this.lblRefTem.AutoSize = true;
            this.lblRefTem.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblRefTem.Location = new System.Drawing.Point(25, 82);
            this.lblRefTem.Name = "lblRefTem";
            this.lblRefTem.Size = new System.Drawing.Size(138, 15);
            this.lblRefTem.TabIndex = 0;
            this.lblRefTem.Text = "Reference Temperature";
            // 
            // label20
            // 
            this.label20.AutoSize = true;
            this.label20.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label20.ForeColor = System.Drawing.Color.Red;
            this.label20.Location = new System.Drawing.Point(23, 33);
            this.label20.Name = "label20";
            this.label20.Size = new System.Drawing.Size(107, 15);
            this.label20.TabIndex = 0;
            this.label20.Text = "Nickel-based Alloy";
            // 
            // label21
            // 
            this.label21.AutoSize = true;
            this.label21.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label21.ForeColor = System.Drawing.Color.Red;
            this.label21.Location = new System.Drawing.Point(25, 58);
            this.label21.Name = "label21";
            this.label21.Size = new System.Drawing.Size(103, 15);
            this.label21.TabIndex = 0;
            this.label21.Text = "Chromium ≥ 12%";
            // 
            // label18
            // 
            this.label18.AutoSize = true;
            this.label18.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label18.ForeColor = System.Drawing.Color.Red;
            this.label18.Location = new System.Drawing.Point(21, 71);
            this.label18.Name = "label18";
            this.label18.Size = new System.Drawing.Size(90, 15);
            this.label18.TabIndex = 0;
            this.label18.Text = "Austenitic Steel";
            // 
            // txtMaxDesignTemperature
            // 
            this.txtMaxDesignTemperature.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtMaxDesignTemperature.Location = new System.Drawing.Point(206, 116);
            this.txtMaxDesignTemperature.Name = "txtMaxDesignTemperature";
            this.txtMaxDesignTemperature.Size = new System.Drawing.Size(138, 21);
            this.txtMaxDesignTemperature.TabIndex = 2;
            this.txtMaxDesignTemperature.TextChanged += new System.EventHandler(this.txtMaterial_TextChanged);
            this.txtMaxDesignTemperature.KeyDown += new System.Windows.Forms.KeyEventHandler(this.txtMaterial_KeyDown);
            this.txtMaxDesignTemperature.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.txtMaxDesignTemperature_KeyPress);
            // 
            // label27
            // 
            this.label27.AutoSize = true;
            this.label27.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label27.Location = new System.Drawing.Point(23, 101);
            this.label27.Name = "label27";
            this.label27.Size = new System.Drawing.Size(114, 15);
            this.label27.TabIndex = 0;
            this.label27.Text = "PTA Material Grade";
            // 
            // label26
            // 
            this.label26.AutoSize = true;
            this.label26.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label26.ForeColor = System.Drawing.Color.Black;
            this.label26.Location = new System.Drawing.Point(23, 78);
            this.label26.Name = "label26";
            this.label26.Size = new System.Drawing.Size(169, 15);
            this.label26.TabIndex = 0;
            this.label26.Text = "Material is Susceptible to PTA";
            // 
            // label23
            // 
            this.label23.AutoSize = true;
            this.label23.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label23.Location = new System.Drawing.Point(34, 703);
            this.label23.Name = "label23";
            this.label23.Size = new System.Drawing.Size(92, 15);
            this.label23.TabIndex = 0;
            this.label23.Text = "Heat Treatment";
            // 
            // label16
            // 
            this.label16.AutoSize = true;
            this.label16.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label16.Location = new System.Drawing.Point(387, 749);
            this.label16.Name = "label16";
            this.label16.Size = new System.Drawing.Size(93, 15);
            this.label16.TabIndex = 0;
            this.label16.Text = "Production Cost";
            // 
            // label17
            // 
            this.label17.AutoSize = true;
            this.label17.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label17.ForeColor = System.Drawing.Color.Red;
            this.label17.Location = new System.Drawing.Point(21, 51);
            this.label17.Name = "label17";
            this.label17.Size = new System.Drawing.Size(146, 15);
            this.label17.TabIndex = 0;
            this.label17.Text = "Carbon or Low Alloy Steel";
            // 
            // label28
            // 
            this.label28.AutoSize = true;
            this.label28.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label28.Location = new System.Drawing.Point(447, 95);
            this.label28.Name = "label28";
            this.label28.Size = new System.Drawing.Size(116, 15);
            this.label28.TabIndex = 0;
            this.label28.Text = "Material Cost Factor";
            // 
            // label22
            // 
            this.label22.AutoSize = true;
            this.label22.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label22.Location = new System.Drawing.Point(23, 55);
            this.label22.Name = "label22";
            this.label22.Size = new System.Drawing.Size(84, 15);
            this.label22.TabIndex = 0;
            this.label22.Text = "Sulfur Content";
            // 
            // lblMinDesignTem
            // 
            this.lblMinDesignTem.AutoSize = true;
            this.lblMinDesignTem.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblMinDesignTem.ForeColor = System.Drawing.Color.Red;
            this.lblMinDesignTem.Location = new System.Drawing.Point(25, 36);
            this.lblMinDesignTem.Name = "lblMinDesignTem";
            this.lblMinDesignTem.Size = new System.Drawing.Size(147, 15);
            this.lblMinDesignTem.TabIndex = 0;
            this.lblMinDesignTem.Text = "Min. Design Temperature";
            // 
            // lblDesignPressure
            // 
            this.lblDesignPressure.AutoSize = true;
            this.lblDesignPressure.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblDesignPressure.Location = new System.Drawing.Point(21, 94);
            this.lblDesignPressure.Name = "lblDesignPressure";
            this.lblDesignPressure.Size = new System.Drawing.Size(98, 15);
            this.lblDesignPressure.TabIndex = 0;
            this.lblDesignPressure.Text = "Design Pressure";
            // 
            // lblMaxDesignTem
            // 
            this.lblMaxDesignTem.AutoSize = true;
            this.lblMaxDesignTem.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblMaxDesignTem.Location = new System.Drawing.Point(21, 119);
            this.lblMaxDesignTem.Name = "lblMaxDesignTem";
            this.lblMaxDesignTem.Size = new System.Drawing.Size(150, 15);
            this.lblMaxDesignTem.TabIndex = 0;
            this.lblMaxDesignTem.Text = "Max. Design Temperature";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(21, 28);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(52, 15);
            this.label1.TabIndex = 0;
            this.label1.Text = "Material";
            // 
            // panel1
            // 
            this.panel1.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            this.panel1.Controls.Add(this.label2);
            this.panel1.Controls.Add(this.txtMaterial);
            this.panel1.Controls.Add(this.label1);
            this.panel1.Controls.Add(this.label17);
            this.panel1.Controls.Add(this.chkCarbonLowAlloySteel);
            this.panel1.Controls.Add(this.label18);
            this.panel1.Controls.Add(this.chkAusteniticSteel);
            this.panel1.Controls.Add(this.txtDesignPressure);
            this.panel1.Controls.Add(this.lblDesignPressure);
            this.panel1.Controls.Add(this.label4);
            this.panel1.Controls.Add(this.txtMaxDesignTemperature);
            this.panel1.Controls.Add(this.lblMaxDesignTem);
            this.panel1.Controls.Add(this.label10);
            this.panel1.Controls.Add(this.label28);
            this.panel1.Controls.Add(this.txtMaterialCostFactor);
            this.panel1.Location = new System.Drawing.Point(22, 33);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(762, 158);
            this.panel1.TabIndex = 20;
            // 
            // label2
            // 
            this.label2.BackColor = System.Drawing.SystemColors.Highlight;
            this.label2.Location = new System.Drawing.Point(-3, 0);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(764, 17);
            this.label2.TabIndex = 0;
            this.label2.Text = "▼ Generic Properties";
            // 
            // label15
            // 
            this.label15.AutoSize = true;
            this.label15.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label15.ForeColor = System.Drawing.Color.Black;
            this.label15.Location = new System.Drawing.Point(352, 29);
            this.label15.Name = "label15";
            this.label15.Size = new System.Drawing.Size(23, 13);
            this.label15.TabIndex = 3;
            this.label15.Text = "mm";
            // 
            // lblCorrosion
            // 
            this.lblCorrosion.AutoSize = true;
            this.lblCorrosion.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblCorrosion.Location = new System.Drawing.Point(23, 32);
            this.lblCorrosion.Name = "lblCorrosion";
            this.lblCorrosion.Size = new System.Drawing.Size(119, 15);
            this.lblCorrosion.TabIndex = 0;
            this.lblCorrosion.Text = "Corrosion Allowance";
            // 
            // txtCorrosionAllowance
            // 
            this.txtCorrosionAllowance.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtCorrosionAllowance.Location = new System.Drawing.Point(208, 26);
            this.txtCorrosionAllowance.Name = "txtCorrosionAllowance";
            this.txtCorrosionAllowance.Size = new System.Drawing.Size(138, 21);
            this.txtCorrosionAllowance.TabIndex = 5;
            this.txtCorrosionAllowance.TextChanged += new System.EventHandler(this.txtMaterial_TextChanged);
            this.txtCorrosionAllowance.KeyDown += new System.Windows.Forms.KeyEventHandler(this.txtMaterial_KeyDown);
            this.txtCorrosionAllowance.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.txtCorrosionAllowance_KeyPress);
            // 
            // label3
            // 
            this.label3.BackColor = System.Drawing.SystemColors.Highlight;
            this.label3.Location = new System.Drawing.Point(2, 0);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(760, 17);
            this.label3.TabIndex = 0;
            this.label3.Text = "▼ Governing Thinning Damage Factor Properties";
            // 
            // panel2
            // 
            this.panel2.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            this.panel2.Controls.Add(this.label3);
            this.panel2.Controls.Add(this.txtCorrosionAllowance);
            this.panel2.Controls.Add(this.lblCorrosion);
            this.panel2.Controls.Add(this.label15);
            this.panel2.Location = new System.Drawing.Point(22, 220);
            this.panel2.Name = "panel2";
            this.panel2.Size = new System.Drawing.Size(762, 61);
            this.panel2.TabIndex = 21;
            // 
            // panel3
            // 
            this.panel3.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            this.panel3.Controls.Add(this.label5);
            this.panel3.Controls.Add(this.label20);
            this.panel3.Controls.Add(this.chkNickelAlloy);
            this.panel3.Controls.Add(this.cbPTAMaterialGrade);
            this.panel3.Controls.Add(this.cbSulfurContent);
            this.panel3.Controls.Add(this.label22);
            this.panel3.Controls.Add(this.chkIsPTASeverity);
            this.panel3.Controls.Add(this.label26);
            this.panel3.Controls.Add(this.label27);
            this.panel3.Location = new System.Drawing.Point(22, 310);
            this.panel3.Name = "panel3";
            this.panel3.Size = new System.Drawing.Size(762, 131);
            this.panel3.TabIndex = 22;
            // 
            // label5
            // 
            this.label5.BackColor = System.Drawing.SystemColors.Highlight;
            this.label5.Location = new System.Drawing.Point(-2, -3);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(764, 17);
            this.label5.TabIndex = 13;
            this.label5.Text = "▼ Governing Stress Corrorion Cracking Damage Factor Properties";
            // 
            // panel4
            // 
            this.panel4.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            this.panel4.Controls.Add(this.label7);
            this.panel4.Controls.Add(this.lblMinDesignTem);
            this.panel4.Controls.Add(this.txtMinDesignTemperature);
            this.panel4.Controls.Add(this.label11);
            this.panel4.Controls.Add(this.label21);
            this.panel4.Controls.Add(this.chkChromium);
            this.panel4.Controls.Add(this.lblRefTem);
            this.panel4.Controls.Add(this.label12);
            this.panel4.Controls.Add(this.txtReferenceTemperature);
            this.panel4.Location = new System.Drawing.Point(22, 464);
            this.panel4.Name = "panel4";
            this.panel4.Size = new System.Drawing.Size(762, 118);
            this.panel4.TabIndex = 23;
            // 
            // label7
            // 
            this.label7.BackColor = System.Drawing.SystemColors.Highlight;
            this.label7.Location = new System.Drawing.Point(-2, -1);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(764, 19);
            this.label7.TabIndex = 7;
            this.label7.Text = "▼ Governing Brittle Fracture Damage Factor Properties";
            // 
            // UCMaterialTank
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this.groupBox1);
            this.Name = "UCMaterialTank";
            this.Size = new System.Drawing.Size(864, 791);
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.cbPTAMaterialGrade.Properties)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.cbHeatTreatment.Properties)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.cbSulfurContent.Properties)).EndInit();
            this.panel1.ResumeLayout(false);
            this.panel1.PerformLayout();
            this.panel2.ResumeLayout(false);
            this.panel2.PerformLayout();
            this.panel3.ResumeLayout(false);
            this.panel3.PerformLayout();
            this.panel4.ResumeLayout(false);
            this.panel4.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.GroupBox groupBox1;
        private DevExpress.XtraEditors.ImageComboBoxEdit cbPTAMaterialGrade;
        private DevExpress.XtraEditors.ImageComboBoxEdit cbHeatTreatment;
        private DevExpress.XtraEditors.ImageComboBoxEdit cbSulfurContent;
        private System.Windows.Forms.CheckBox chkNickelAlloy;
        private System.Windows.Forms.CheckBox chkAusteniticSteel;
        private System.Windows.Forms.CheckBox chkIsPTASeverity;
        private System.Windows.Forms.CheckBox chkChromium;
        private System.Windows.Forms.CheckBox chkCarbonLowAlloySteel;
        private System.Windows.Forms.Label label13;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label12;
        private System.Windows.Forms.Label label11;
        private System.Windows.Forms.Label label10;
        private System.Windows.Forms.TextBox txtBrittleFracture;
        private System.Windows.Forms.TextBox txtAllowableStress;
        private System.Windows.Forms.TextBox txtReferenceTemperature;
        private System.Windows.Forms.Label lblBritFracGovThickness;
        private System.Windows.Forms.TextBox txtMaterialCostFactor;
        private System.Windows.Forms.TextBox txtDesignPressure;
        private System.Windows.Forms.TextBox txtMinDesignTemperature;
        private System.Windows.Forms.Label lblAllowableStress;
        private System.Windows.Forms.Label lblRefTem;
        private System.Windows.Forms.Label label20;
        private System.Windows.Forms.Label label21;
        private System.Windows.Forms.Label label18;
        private System.Windows.Forms.TextBox txtMaxDesignTemperature;
        private System.Windows.Forms.Label label27;
        private System.Windows.Forms.Label label26;
        private System.Windows.Forms.Label label23;
        private System.Windows.Forms.Label label17;
        private System.Windows.Forms.Label label28;
        private System.Windows.Forms.Label label22;
        private System.Windows.Forms.Label lblMinDesignTem;
        private System.Windows.Forms.Label lblDesignPressure;
        private System.Windows.Forms.Label lblMaxDesignTem;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox txtProductionCost;
        private System.Windows.Forms.Label label16;
        private System.Windows.Forms.TextBox txtMaterial;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Panel panel3;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Panel panel2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox txtCorrosionAllowance;
        private System.Windows.Forms.Label lblCorrosion;
        private System.Windows.Forms.Label label15;
        private System.Windows.Forms.Panel panel4;
        private System.Windows.Forms.Label label7;
    }
}
