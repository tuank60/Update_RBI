using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace RBI.PRE.subForm.InputDataForm
{
    public partial class frmManageFactor : Form
    {
        public frmManageFactor()
        {
            InitializeComponent();
        }

        private void btnNext_1_Click(object sender, EventArgs e)
        {
            tabControlMF.SelectedTabPage = tabsafety;
        }
    }
}
