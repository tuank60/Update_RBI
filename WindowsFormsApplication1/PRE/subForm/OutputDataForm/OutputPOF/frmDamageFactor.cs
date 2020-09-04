using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;
using DevExpress.XtraEditors;
using RBI.PRE.subForm.OutputDataForm.OutputPOF;

namespace RBI.PRE.subForm.OutputDataForm.OutputPOF
{
    public partial class frmDamageFactor : DevExpress.XtraEditors.XtraForm
    {
        private Control uc { get; set; }
        private string _nameUC {get; set;}
        private int _idProposal;

        public frmDamageFactor()
        {
            InitializeComponent();
        }

        public frmDamageFactor(int ID, String Type)
        {
            InitializeComponent();
            _nameUC = Type;
            _idProposal = ID;
            SelectUC(ID,Type);
        }

        private void SelectUC(int ID, String Type)
        {
            
        }
        private void btnClose_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void frmDamageFactor_Load(object sender, EventArgs e)
        {
            flowLayoutPanel1.Controls.Clear();
            if (_nameUC == "UC_HF_Produced_HIC_SOHIC")
            {
                UC_HF_Produced_HIC_SOHIC uc = new UC_HF_Produced_HIC_SOHIC(_idProposal);
                uc.Parent = flowLayoutPanel1;
                uc.Show();
                uc.Dock = DockStyle.Top;
            }
            else if (_nameUC == "UC_HIC_SOHIC_H2S")
            {
                UC_HIC_SOHIC_H2S uc = new UC_HIC_SOHIC_H2S();
                uc.Parent = flowLayoutPanel1;
                uc.Show();
                uc.Dock = DockStyle.Top;
            }
            else if (_nameUC == "UCAmineStressCorrosionCracking")
            {
                UCAmineStressCorrosionCracking uc = new UCAmineStressCorrosionCracking();
                uc.Parent = flowLayoutPanel1;
                uc.Show();
                uc.Dock = DockStyle.Top;
            }
            else if (_nameUC == "UCBrittleFracture")
            {
                UCBrittleFracture uc = new UCBrittleFracture();
                uc.Parent = flowLayoutPanel1;
                uc.Show();
                uc.Dock = DockStyle.Top;
            }
            else if (_nameUC == "UCCarbonateCracking")
            {
                UCCarbonateCracking uc = new UCCarbonateCracking();
                uc.Parent = flowLayoutPanel1;
                uc.Show();
                uc.Dock = DockStyle.Top;
            }
            else if (_nameUC == "UCCausticCracking")
            {
                UCCausticCracking uc = new UCCausticCracking();
                uc.Parent = flowLayoutPanel1;
                uc.Show();
                uc.Dock = DockStyle.Top;
            }
            else if (_nameUC == "UCChlorideCracking")
            {
                UCChlorideCracking uc = new UCChlorideCracking();
                uc.Parent = flowLayoutPanel1;
                uc.Show();
                uc.Dock = DockStyle.Top;
            }
            else if (_nameUC == "UCExternalCLSCC")
            {
                UCExternalCLSCC uc = new UCExternalCLSCC();
                uc.Parent = flowLayoutPanel1;
                uc.Show();
                uc.Dock = DockStyle.Top;
            }
            else if (_nameUC == "UCExternalCorrosion")
            {
                UCExternalCorrosion uc = new UCExternalCorrosion();
                uc.Parent = flowLayoutPanel1;
                uc.Show();
                uc.Dock = DockStyle.Top;
            }
            else if (_nameUC == "UCExternalCUI_CLSCC")
            {
                UCExternalCUI_CLSCC uc = new UCExternalCUI_CLSCC();
                uc.Parent = flowLayoutPanel1;
                uc.Show();
                uc.Dock = DockStyle.Top;
            }
            else if (_nameUC == "UCHydrogenStressCracking_HSC_HF_")
            {
                UCHydrogenStressCracking_HSC_HF_ uc = new UCHydrogenStressCracking_HSC_HF_();
                uc.Parent = flowLayoutPanel1;
                uc.Show();
                uc.Dock = DockStyle.Top;
            }
            else if (_nameUC == "UCInternalLiningDegradation")
            {
                UCInternalLiningDegradation uc = new UCInternalLiningDegradation(_idProposal);
                uc.Parent = flowLayoutPanel1;
                uc.Show();
                uc.Dock = DockStyle.Top;
            }
            else if (_nameUC == "UCInternalThinning")
            {
                UCInternalThinning uc = new UCInternalThinning();
                uc.Parent = flowLayoutPanel1;
                uc.Show();
                uc.Dock = DockStyle.Top;
            }
            else if (_nameUC == "UCPolythionicAcidCracking")
            {
                UCPolythionicAcidCracking uc = new UCPolythionicAcidCracking();
                uc.Parent = flowLayoutPanel1;
                uc.Show();
                uc.Dock = DockStyle.Top;
            }
            else if (_nameUC == "UCSulphideStressCracking")
            {
                UCSulphideStressCracking uc = new UCSulphideStressCracking();
                uc.Parent = flowLayoutPanel1;
                uc.Show();
                uc.Dock = DockStyle.Top;
            }
            else if (_nameUC == "UCVibration_Induced_Mechanical_Fatigue")
            {
                UCVibration_Induced_Mechanical_Fatigue uc = new UCVibration_Induced_Mechanical_Fatigue();
                uc.Parent = flowLayoutPanel1;
                uc.Show();
                uc.Dock = DockStyle.Top;
            }
            else
            {
                UCInternalLiningDegradation uc = new UCInternalLiningDegradation();
                uc.Parent = flowLayoutPanel1;
                uc.Show();
                uc.Dock = DockStyle.Top;
            }
            
            //sidePanel1.Controls.Add( new UCInternalLiningDegradation());
          
        }
        
        private void btnTemporaryCalculate_Click(object sender, EventArgs e)
        {
            if (_nameUC == "UC_HF_Produced_HIC_SOHIC")
            {
                UC_HF_Produced_HIC_SOHIC uc = new UC_HF_Produced_HIC_SOHIC(_idProposal);
            }
            else if (_nameUC == "UC_HIC_SOHIC_H2S")
            {
                UC_HIC_SOHIC_H2S uc = new UC_HIC_SOHIC_H2S();
            }
            else if (_nameUC == "UCAmineStressCorrosionCracking")
            {
                UCAmineStressCorrosionCracking uc = new UCAmineStressCorrosionCracking();
            }
            else if (_nameUC == "UCBrittleFracture")
            {
                UCBrittleFracture uc = new UCBrittleFracture();
            }
            else if (_nameUC == "UCCarbonateCracking")
            {
                UCCarbonateCracking uc = new UCCarbonateCracking();
            }
            else if (_nameUC == "UCCausticCracking")
            {
                UCCausticCracking uc = new UCCausticCracking();
            }
            else if (_nameUC == "UCChlorideCracking")
            {
                UCChlorideCracking uc = new UCChlorideCracking();
            }
            else if (_nameUC == "UCExternalCLSCC")
            {
                UCExternalCLSCC uc = new UCExternalCLSCC();
            }
            else if (_nameUC == "UCExternalCorrosion")
            {
                UCExternalCorrosion uc = new UCExternalCorrosion();
            }
            else if (_nameUC == "UCExternalCUI_CLSCC")
            {
                UCExternalCUI_CLSCC uc = new UCExternalCUI_CLSCC();
            }
            else if (_nameUC == "UCHydrogenStressCracking_HSC_HF_")
            {
                UCHydrogenStressCracking_HSC_HF_ uc = new UCHydrogenStressCracking_HSC_HF_();
            }
            else if (_nameUC == "UCInternalLiningDegradation")
            {
                UCInternalLiningDegradation uc = new UCInternalLiningDegradation(_idProposal);
                uc.Calculate();
            }
            else if (_nameUC == "UCInternalThinning")
            {
                UCInternalThinning uc = new UCInternalThinning();
            }
            else if (_nameUC == "UCPolythionicAcidCracking")
            {
                UCPolythionicAcidCracking uc = new UCPolythionicAcidCracking();
            }
            else if (_nameUC == "UCSulphideStressCracking")
            {
                UCSulphideStressCracking uc = new UCSulphideStressCracking();
            }
            else if (_nameUC == "UCVibration_Induced_Mechanical_Fatigue")
            {
                UCVibration_Induced_Mechanical_Fatigue uc = new UCVibration_Induced_Mechanical_Fatigue();
            }
            else
            {
                UCInternalLiningDegradation uc = new UCInternalLiningDegradation();
                uc.Calculate();
                MessageBox.Show("FAIL");
            }

        }

        
    }
}