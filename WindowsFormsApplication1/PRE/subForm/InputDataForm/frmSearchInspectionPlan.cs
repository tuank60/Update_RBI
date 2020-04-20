using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using DevExpress.XtraEditors;
using RBI.BUS.BUSMSSQL;
using RBI.Object.ObjectMSSQL;
using DevExpress.XtraGrid.Columns;
using RBI.PRE.subForm.OutputDataForm;

namespace RBI.PRE.subForm.InputDataForm
{
    public partial class frmSearchInspectionPlan : Form
    {
        public frmSearchInspectionPlan()
        {
            InitializeComponent();
            Display();
        }
        public int ButtonSelectClicked { set; get; }
        private void btnSelect_ButtonClick(object sender, DevExpress.XtraEditors.Controls.ButtonPressedEventArgs e)
        {
            int _id = (int)gridView1.GetRowCellValue(gridView1.FocusedRowHandle, ColInvisiblePlanID);
            INSPECTION_PLAN ip = new INSPECTION_PLAN();
            ip.PlanID = _id;           
            UCInspectionHistory uchis = new UCInspectionHistory(ip.PlanID);            
            ButtonSelectClicked = ip.PlanID;
            this.Close();
        }
        private void btnDelete_ButtonClick(object sender, DevExpress.XtraEditors.Controls.ButtonPressedEventArgs e)
        {
            DialogResult dlr = MessageBox.Show("Are you sure to  delete this inspection plan detail!", "Inspection Planner", MessageBoxButtons.YesNoCancel, MessageBoxIcon.Question, MessageBoxDefaultButton.Button2);
            if (dlr == DialogResult.Yes)
            {
                //int rowSelected = gridView1.FocusedRowHandle;DataRow row = gridView1.GetFocusedDataRow();
                // lấy dòng đang chọn
                int _id = (int) gridView1.GetRowCellValue(gridView1.FocusedRowHandle, ColInvisiblePlanID);
                INSPECTION_PLAN ip = new INSPECTION_PLAN();
                ip.PlanID = _id;
                INSPECTION_PLAN_BUS busisp = new INSPECTION_PLAN_BUS();
                busisp.delete(ip);
                Display();
            }
        }
       
        private void Display()
        {
            try
            {
                gridControl.DataSource = null;
                INSPECTION_PLAN_BUS busisp = new INSPECTION_PLAN_BUS();
                gridControl.DataSource = busisp.getDataSource();
            }
            catch (Exception e)
            {
                MessageBox.Show(e.ToString());
            }
        }
        private void frmSearchInspectionPlan_Load(object sender, EventArgs e)
        {
            Display();
        }
    }
}    

   
