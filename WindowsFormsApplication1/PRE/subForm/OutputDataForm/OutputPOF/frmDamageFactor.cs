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

namespace RBI.PRE.subForm.OutputDataForm.OutputPOF
{
    public partial class frmDamageFactor : DevExpress.XtraEditors.XtraForm
    {
        public frmDamageFactor()
        {
            InitializeComponent();
        }

        private void btnClose_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}