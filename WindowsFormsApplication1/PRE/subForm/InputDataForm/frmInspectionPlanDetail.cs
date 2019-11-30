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
using DevExpress.DataAccess.Excel;
using DevExpress.XtraPivotGrid;
using DevExpress.XtraGrid.Views.Grid;


namespace RBI.PRE.subForm.InputDataForm
{
    public partial class frmInspectionPlanDetail : Form
    {
        int _coverageID = 1;
        public frmInspectionPlanDetail()
        {
            InitializeComponent();
            Display();
            //Displaytab2();
            radioGroup1.EditValue = 1;

        }

        private void BTnCancel_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btnOK_Click(object sender, EventArgs e)
        {
            //do something
            this.Close();
        }

        #region tab Inspection Method
        public bool ButtonAddClicked { set; get; }
        private void btnAddIspMethod_Click(object sender, EventArgs e)
        {
            INSPECTION_DETAIL_TECHNIQUE ipTech = new INSPECTION_DETAIL_TECHNIQUE();
            ipTech.IMItemID = lstTechnique.SelectedIndex;
            ipTech.IMTypeID = lstMethod.SelectedIndex;
            if ((int)radioGroup1.EditValue == 1)
                ipTech.InspectionType = 1;
            else ipTech.InspectionType = 0;
            ipTech.Coverage = 0;
            ipTech.CoverageID = _coverageID;
            INSPECTION_DETAIL_TECHNIQUE_BUS ipTechBus = new INSPECTION_DETAIL_TECHNIQUE_BUS();
            List<INSPECTION_DETAIL_TECHNIQUE> listTech = ipTechBus.getDataSource();
            foreach (INSPECTION_DETAIL_TECHNIQUE ds in listTech)
            {
                if (ds.IMTypeID == lstMethod.SelectedIndex && ds.IMItemID == lstTechnique.SelectedIndex && ds.InspectionType == ipTech.InspectionType)
                {
                    return;
                }
            }
            string InspectionType = "Intrusive";
            if ((int)radioGroup1.EditValue == 0)
                InspectionType  = "Non-Intrusive";
            string item = InspectionType + " + "
                + this.lstMethod.GetItemText(this.lstMethod.SelectedItem) + " + " 
                + this.lstTechnique.GetItemText(this.lstTechnique.SelectedItem);
            MessageBox.Show(item);
            ipTech.NDTMethod = item;
            ButtonAddClicked = true;
            ipTechBus.add(ipTech);
            Displaytab2();
        }
        private void gridControlMethod_Load(object sender, EventArgs e)
        {
            try
            {
                gridControlMethod.DataSource = null;
                INSPECTION_DETAIL_TECHNIQUE_BUS busisp = new INSPECTION_DETAIL_TECHNIQUE_BUS();
                gridControlMethod.DataSource = busisp.getDataSource();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
        }
        private void lstMethod_SelectedIndexChanged(object sender, EventArgs e)
        {
            switch (lstMethod.SelectedIndex)
            {
                case 0:
                    lstTechnique.Items.Clear();
                    lstTechnique.Items.Add("Crack Detection");
                    lstTechnique.Items.Add("Leak Detection");
                    lstTechnique.SelectedIndex = 0;
                    break;
                case 1:
                    lstTechnique.Items.Clear();
                    lstTechnique.Items.Add("ACFM");
                    lstTechnique.Items.Add("Low frequency");
                    lstTechnique.Items.Add("Pulsed");
                    lstTechnique.Items.Add("Remote field");
                    lstTechnique.Items.Add("Standard (flat coil)");
                    lstTechnique.SelectedIndex = 0;
                    break;
                case 2:
                    lstTechnique.Items.Clear();
                    lstTechnique.Items.Add("Magnetic Fluorescent Inspection");
                    lstTechnique.Items.Add("Magnetic Flux Leakage");
                    lstTechnique.Items.Add("Magnetic Practicle Inspection");
                    lstTechnique.SelectedIndex = 0;
                    break;
                case 3:
                    lstTechnique.Items.Clear();
                    lstTechnique.Items.Add("Hardness Surveys");
                    lstTechnique.Items.Add("Microstructure Replication");
                    lstTechnique.SelectedIndex = 0;
                    break;
                case 4:
                    lstTechnique.Items.Clear();
                    lstTechnique.Items.Add("On-line Monitoring");
                    lstTechnique.SelectedIndex = 0;
                    break;
                case 5:
                    lstTechnique.Items.Clear();
                    lstTechnique.Items.Add("Liquid Penetrant Inspection");
                    lstTechnique.Items.Add("Penetrant Leak Inspection");
                    lstTechnique.SelectedIndex = 0;
                    break;
                case 6:
                    lstTechnique.Items.Clear();
                    lstTechnique.Items.Add("Compton Scatter");
                    lstTechnique.Items.Add("Gamma Radiography");
                    lstTechnique.Items.Add("Real-time Radiography");
                    lstTechnique.Items.Add("X-Radiography");
                    lstTechnique.SelectedIndex = 0;
                    break;
                case 7:
                    lstTechnique.Items.Clear();
                    lstTechnique.Items.Add("Passive Thermography");
                    lstTechnique.Items.Add("Transient Thermography");
                    lstTechnique.SelectedIndex = 0;
                    break;
                case 8:
                    lstTechnique.Items.Clear();
                    lstTechnique.Items.Add("Advanced Ultrasonic Backscatter Technique");
                    lstTechnique.Items.Add("Angled Compression Wave");
                    lstTechnique.Items.Add("Angled Shear Wave");
                    lstTechnique.Items.Add("A-scan Thickness Survey");
                    lstTechnique.Items.Add("Chime");
                    lstTechnique.Items.Add("C-scan");
                    lstTechnique.Items.Add("Digital Ultrasonic Thickness Gauge");
                    lstTechnique.Items.Add("International Rotational Inspection System");
                    lstTechnique.Items.Add("Lorus");
                    lstTechnique.Items.Add("Surface Waves");
                    lstTechnique.Items.Add("Teletest");
                    lstTechnique.Items.Add("TOFD");
                    lstTechnique.SelectedIndex = 0;
                    break;
                case 9:
                    lstTechnique.Items.Clear();
                    lstTechnique.Items.Add("Endoscopy");
                    lstTechnique.Items.Add("Holiday Test");
                    lstTechnique.Items.Add("Hydrotesting");
                    lstTechnique.Items.Add("Naked Eye");
                    lstTechnique.Items.Add("Video");
                    lstTechnique.SelectedIndex = 0;
                    break;
            }
        }
        private void btnDelete_ButtonClick_1(object sender, DevExpress.XtraEditors.Controls.ButtonPressedEventArgs e)
        {
            int a = (int)gridViewtab2.GetRowCellValue(gridViewtab2.FocusedRowHandle, colInvisiableID);
            INSPECTION_DETAIL_TECHNIQUE ip = new INSPECTION_DETAIL_TECHNIQUE();
            ip.ID = a;
            INSPECTION_DETAIL_TECHNIQUE_BUS busisp = new INSPECTION_DETAIL_TECHNIQUE_BUS();
            busisp.delete(ip);
            Displaytab2();
        }
        private void GridViewtab2_CellValueChanged(object sender, DevExpress.XtraGrid.Views.Base.CellValueChangedEventArgs e)
        {
            #region spinEdit in gridView
            INSPECTION_DETAIL_TECHNIQUE tech = new INSPECTION_DETAIL_TECHNIQUE();
            tech.ID = (int)gridViewtab2.GetRowCellValue(gridViewtab2.FocusedRowHandle, colInvisiableID);
            tech.CoverageID = _coverageID;
            tech.IMItemID = (int)gridViewtab2.GetRowCellValue(gridViewtab2.FocusedRowHandle, colInvisiableTechnique);
            tech.IMTypeID = (int)gridViewtab2.GetRowCellValue(gridViewtab2.FocusedRowHandle, colInvisiableTypeMethod);
            tech.InspectionType = (int)gridViewtab2.GetRowCellValue(gridViewtab2.FocusedRowHandle, colInvisiableIspType);
            tech.Coverage = (int)gridViewtab2.GetRowCellValue(gridViewtab2.FocusedRowHandle, colCoverage);
            tech.NDTMethod = (String)gridViewtab2.GetRowCellValue(gridViewtab2.FocusedRowHandle, colNDT);
            INSPECTION_DETAIL_TECHNIQUE_BUS busisp = new INSPECTION_DETAIL_TECHNIQUE_BUS();
            busisp.edit(tech);
            #endregion
            //#region cột NDT
            /*if ((int)gridViewtab2.GetFocusedRowCellValue(colInvisiableIspType) == 1)
                {
                chuoi1 = "Intrusive + ";
                }
            else chuoi1 = "Non-Intrusive + ";
            gridViewtab2.SetFocusedRowCellValue(colNDT, chuoi1);
            int a = (int)gridViewtab2.GetFocusedRowCellValue(colInvisiableTypeMethod);
            gridViewtab2.SetFocusedRowCellValue(colNDT, a);
            GridView view = sender as GridView;
            if (view == null) return;
            if (e.Column.FieldName != "IMItemID" && e.Column.FieldName != "InspectionType") return;
            int test = int.Parse(view.GetRowCellValue(e.RowHandle, "IMItemID").ToString()) 
            + int.Parse(view.GetRowCellValue(e.RowHandle, "InspectionType").ToString())*1000;
            view.SetRowCellValue(e.RowHandle, "ndt", test);*/
            /*GridView view = sender as GridView;
            if (view == null) return;
            if (e.Column.Caption != "Technique") return;
            string cellValue = e.Value.ToString() + " " + view.GetRowCellValue(e.RowHandle, view.Columns["IspType"]).ToString();
            view.SetRowCellValue(e.RowHandle, view.Columns["NDT Method"], cellValue);
            #endregion*/
        }
        private void Displaytab2() // dự tính bỏ function này thay bằng gridControlMethod_Load
        {
            try
            {
                gridControlMethod.DataSource = null;
                INSPECTION_DETAIL_TECHNIQUE_BUS busisp = new INSPECTION_DETAIL_TECHNIQUE_BUS();
                gridControlMethod.DataSource = busisp.getDataSource();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
        }
        #endregion
        #region test
        private void frmInspectionPlanDetail_Load(object sender, EventArgs e)
        {
            lstMethod.SelectedIndex = 0;
        }
        public bool ButtonSelectClicked { set; get; }
        private void btnSelect_ButtonClick(object sender, DevExpress.XtraEditors.Controls.ButtonPressedEventArgs e)
        {
            ButtonSelectClicked = true;
            this.Close();
        }
        private void Display()
        {
            try
            {
                gridControl3.DataSource = null;
                INSPECTION_PLAN_BUS busisp = new INSPECTION_PLAN_BUS();
                gridControl3.DataSource = busisp.getDataSource();
            }
            catch (Exception e)
            {
                MessageBox.Show(e.ToString());
            }
        }
        #endregion
    }
}