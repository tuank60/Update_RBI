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
using RBI.Object;
using RBI.Object.ObjectMSSQL;
using DevExpress.XtraGrid.Columns;
using DevExpress.DataAccess.Excel;
using DevExpress.XtraPivotGrid;
using DevExpress.XtraGrid.Views.Grid;


namespace RBI.PRE.subForm.InputDataForm
{
    public partial class frmInspectionPlanDetail : Form
    {
        bool changeINSPECTION_COVERAGE = false;
        int _coverageID = 1;
        public int planid;
        List<INSPECTION_DETAIL_TECHNIQUE> listNDT = new List<INSPECTION_DETAIL_TECHNIQUE>();
        public frmInspectionPlanDetail(int PlanID)
        {
            InitializeComponent();
            planid = PlanID;
            Display();
            
            //Displaytab2();
            radioGroup1.EditValue = 1;
            Showtab(PlanID);
            
            initCombox();
            gridview1(0,0,0);
            ShowGridview2(PlanID);

        }

        public void Showtab(int PlanID)
        {
            try
            {
                INSPECTION_PLAN_BUS businsplan = new INSPECTION_PLAN_BUS();
                InspectionPlanName.Text = businsplan.getPlanName(PlanID);
                InspectionDate.Text = businsplan.getPlanDate(PlanID);
                
            }
            catch
            {
                // do nothing
            }
        }  
        public void ShowGridview2(int PlanID)
        {
            INSPECTION_COVERAGE_BUS ICB = new INSPECTION_COVERAGE_BUS();
            List<INSPECTION_COVERAGE> IC = ICB.getDataID(PlanID);
            int n = gridView2.RowCount;
            foreach (INSPECTION_COVERAGE ic in IC)
            {
                EQUIPMENT_MASTER_BUS EMB = new EQUIPMENT_MASTER_BUS();
                //EMB.getEquipmentName(ic.EquipmentID);//lay ten equipment
                COMPONENT_MASTER_BUS CMB = new COMPONENT_MASTER_BUS();

                for (int i = 0; i < n; i++)
                {
                    if (gridView2.GetRowCellValue(i, "ComponentNumber").ToString() == CMB.getComponentNumber(ic.ComponentID) && gridView2.GetRowCellValue(i, "EquipmentNumber").ToString() == EMB.getEquipmentNumber(ic.EquipmentID))
                    {
                        gridView2.SelectRow(i);
                    }
                }
            }
         

        }

        private void BTnCancel_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btnOK_Click(object sender, EventArgs e)
        {
            //do something
          // string obj = gridView2.GetRowCellValue(gridView2.FocusedRowHandle, "EquipmentNumber").ToString();
            int[] a = gridView2.GetSelectedRows();
            string obj = null;
            INSPECTION_COVERAGE IC = new INSPECTION_COVERAGE();
            INSPECTION_COVERAGE_BUS ICB=new INSPECTION_COVERAGE_BUS();
            if (changeINSPECTION_COVERAGE) ICB.deletebyPlanID(planid);
            for (int i = 0; i < gridView2.SelectedRowsCount; i++)
            {
                
                IC.PlanID = planid;
                EQUIPMENT_MASTER_BUS EMB = new EQUIPMENT_MASTER_BUS();
                obj = gridView2.GetRowCellValue(a[i], "EquipmentNumber").ToString();
                IC.EquipmentID = EMB.getIDbyName(obj);
                COMPONENT_MASTER_BUS CMB = new COMPONENT_MASTER_BUS();
                obj = gridView2.GetRowCellValue(a[i], "ComponentNumber").ToString();
                IC.ComponentID = CMB.getIDbyName(obj);
                ICB.add(IC);
                
               // Console.WriteLine(obj);
                
            }
            
           
           
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
            listNDT.Add(ipTech);           
            gridControlMethod.DataSource = null;
            gridControlMethod.DataSource = listNDT;            
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
        private List<ProcessPlant> getListProcessPlant()
        {
            List<ProcessPlant> listPro = new List<ProcessPlant>();
            RW_ASSESSMENT_BUS busAssessment = new RW_ASSESSMENT_BUS();
            List<RW_ASSESSMENT> assessment = busAssessment.getDataSource();
            EQUIPMENT_MASTER_BUS buseq = new EQUIPMENT_MASTER_BUS();
            EQUIPMENT_TYPE_BUS eqType = new EQUIPMENT_TYPE_BUS();
            COMPONENT_MASTER_BUS buscom = new COMPONENT_MASTER_BUS();
            COMPONENT_TYPE__BUS comType = new COMPONENT_TYPE__BUS();
            DESIGN_CODE_BUS desCode = new DESIGN_CODE_BUS();
            SITES_BUS site =new SITES_BUS();
            FACILITY_BUS facility = new FACILITY_BUS();
            //EquipmentProperty
            RW_EQUIPMENT_BUS rwEqB=new RW_EQUIPMENT_BUS();
            RW_EQUIPMENT rwEq=new RW_EQUIPMENT();
            RW_COMPONENT_BUS rwComB = new RW_COMPONENT_BUS();
            RW_COMPONENT rwCom = new RW_COMPONENT();
            int EquipmentID = 0;
            int ComponentID = 0;
            foreach (RW_ASSESSMENT inspCove in assessment)
            {
                EquipmentID = inspCove.EquipmentID;
                ComponentID = inspCove.ComponentID;
                ProcessPlant Pro = new ProcessPlant();
                Pro.EquipmentNumber = buseq.getEquipmentNumber(EquipmentID);
                Pro.ComponentNumber = buscom.getComponentNumber(ComponentID);
                Pro.Component=Pro.ComponentType = comType.getComponentTypeName(buscom.getComponentTypeID(ComponentID));
                Pro.Site = site.getSiteName(buseq.getSiteID(EquipmentID));
                Pro.Facility = facility.getFacilityName(buseq.getFacilityID(EquipmentID));
                Pro.AssessmentName = inspCove.ProposalName;
                Pro.AssessmentDate = inspCove.AdoptedDate.ToShortDateString();
                Pro.CommissionDate = buseq.getComissionDate(EquipmentID).ToShortDateString();
                Pro.RiskAnalysisPeriod = inspCove.RiskAnalysisPeriod.ToString();
                Pro.EquipmentType = eqType.getEquipmentTypeName(buseq.getEqTypeID(EquipmentID));
                Pro.DesignCode = desCode.getDesignCodeName(buseq.getDesignCodeID(EquipmentID));
                //EquipmentProperty
                rwEq = rwEqB.getData(inspCove.ID);
                Pro.AdministrativeControl = rwEq.AdminUpsetManagement == 1 ? "✔" : "✘";
                Pro.ContainsDeadlegs = rwEq.ContainsDeadlegs == 1 ? "✔" : "✘";
                Pro.PresenceofSulphidesOperation = rwEq.PresenceSulphidesO2 == 1 ? "✔" : "✘";
                Pro.SteamedOut = rwEq.SteamOutWaterFlush == 1 ? "✔" : "✘";
                Pro.ThermalHistory = rwEq.ThermalHistory;
                Pro.SystemManagementFactor = rwEq.ManagementFactor.ToString();
                Pro.PWHT = rwEq.PWHT == 1 ? "✔" : "✘";
                Pro.PressurisarionControlledbyAdmin = rwEq.PressurisationControlled == 1 ? "✔" : "✘";
                Pro.PresenceofSulphidesShutdown = rwEq.PresenceSulphidesO2Shutdown == 1 ? "✔" : "✘";
                Pro.OnlineMonitoring = rwEq.OnlineMonitoring;
                Pro.MinRequiredTemperature = rwEq.MinReqTemperaturePressurisation.ToString();
                Pro.MaterialisExposedtoFluids = rwEq.MaterialExposedToClExt == 1 ? "✔" : "✘";
                Pro.CyclicOperation = rwEq.CyclicOperation == 1 ? "✔" : "✘";
                Pro.LinerOnlineMonitoring = rwEq.LinerOnlineMonitoring == 1 ? "✔" : "✘";
                Pro.DowntimeProtectionUsed = rwEq.DowntimeProtectionUsed == 1 ? "✔" : "✘";
                Pro.EquipmentisOperating=rwEq.YearLowestExpTemp== 1 ? "✔" : "✘";
                Pro.EquipmentVolume = rwEq.Volume.ToString();
                Pro.InterfaceatSoilorWater = rwEq.InterfaceSoilWater == 1 ? "✔" : "✘";
                Pro.ExternalEnvironment = rwEq.ExternalEnvironment;
                Pro.HeatTraced = rwEq.HeatTraced == 1 ? "✔" : "✘";
                Pro.HighlyEffectiveInspection = rwEq.HighlyDeadlegInsp == 1 ? "✔" : "✘";
                //componentProperty
                Pro.MinimumMeasuredThickness = (100*rwCom.CurrentThickness).ToString();
                Pro.NominalThickness = (100*rwCom.NominalThickness).ToString();
                Pro.NominalDiameter = (100*rwCom.NominalDiameter).ToString();
                listPro.Add(Pro);

            }
            return listPro;
        }
      
        private List<RW_ASSESSMENT> getListAssessment(int EquipmentID)
        {
            List<RW_ASSESSMENT> listData = new List<RW_ASSESSMENT>();
            RW_ASSESSMENT_BUS busAssessment = new RW_ASSESSMENT_BUS();
            List<RW_ASSESSMENT> assessment;
            if(EquipmentID == 0 ){
                assessment= busAssessment.getDataSource();
            }
            else
            {
                assessment = busAssessment.getDataSourceEquipmentID(EquipmentID);
            }
            EQUIPMENT_MASTER_BUS buseq = new EQUIPMENT_MASTER_BUS();
            COMPONENT_MASTER_BUS buscom = new COMPONENT_MASTER_BUS();
            COMPONENT_TYPE__BUS comType = new COMPONENT_TYPE__BUS();
            foreach (RW_ASSESSMENT inspCove in assessment)
            {
                RW_ASSESSMENT rwAssessment = inspCove;
                rwAssessment.EquipmentNumber = buseq.getEquipmentNumber(inspCove.EquipmentID);
                rwAssessment.ComponentName = buscom.getComponentName(inspCove.ComponentID);//khong can
                rwAssessment.ComponentNumber = buscom.getComponentNumber(inspCove.ComponentID);

                rwAssessment.ComponentType = comType.getComponentTypeName(buscom.getComponentTypeID(inspCove.ComponentID));
                listData.Add(rwAssessment);
            }

            return listData;
        }

        public void gridview1(int SiteID,int FavilityID, int EquipmentID)
        {
            gridControl1.DataSource = null;
            RW_ASSESSMENT_BUS busAss = new RW_ASSESSMENT_BUS();
            gridControl1.DataSource = getListProcessPlant();
        }
        private void btnDelete_ButtonClick_1(object sender, DevExpress.XtraEditors.Controls.ButtonPressedEventArgs e)
        {
            //int a = (int)gridViewtab2.GetRowCellValue(gridViewtab2.FocusedRowHandle, colInvisiableID);
            INSPECTION_DETAIL_TECHNIQUE ip = new INSPECTION_DETAIL_TECHNIQUE();
            //ip.ID = a;
            INSPECTION_DETAIL_TECHNIQUE_BUS busisp = new INSPECTION_DETAIL_TECHNIQUE_BUS();
            busisp.delete(ip);
            //Displaytab2();
        }
        private void GridViewtab2_CellValueChanged(object sender, DevExpress.XtraGrid.Views.Base.CellValueChangedEventArgs e)
        {
            #region spinEdit in gridView
            INSPECTION_DETAIL_TECHNIQUE tech = new INSPECTION_DETAIL_TECHNIQUE();
            //tech.ID = (int)gridViewtab2.GetRowCellValue(gridViewtab2.FocusedRowHandle, colInvisiableID);
            tech.CoverageID = _coverageID;
            //tech.IMItemID = (int)gridViewtab2.GetRowCellValue(gridViewtab2.FocusedRowHandle, colInvisiableTechnique);
            //tech.IMTypeID = (int)gridViewtab2.GetRowCellValue(gridViewtab2.FocusedRowHandle, colInvisiableTypeMethod);
            //tech.InspectionType = (int)gridViewtab2.GetRowCellValue(gridViewtab2.FocusedRowHandle, colInvisiableIspType);
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
                //gridControlMethod.DataSource = null;
                //INSPECTION_DETAIL_TECHNIQUE_BUS busisp = new INSPECTION_DETAIL_TECHNIQUE_BUS();
                //RW_ASSESSMENT_BUS busisp = new RW_ASSESSMENT_BUS();
                //gridControlMethod.DataSource = busisp.getDataSource();
                //gridViewtab2.SetRowCellValue(2, 1, "aaa");
                //gridControlMethod.DataSource = listDetail;
                //gridViewtab2.AddNewRow();
                //DataRow dt = new DataRow();
                List<INSPECTION_DETAIL_TECHNIQUE> list= new List<INSPECTION_DETAIL_TECHNIQUE>();
                INSPECTION_DETAIL_TECHNIQUE ins = new INSPECTION_DETAIL_TECHNIQUE();
                ins.NDTMethod = "aaa";
                ins.Coverage = 12;
                list.Add(ins);
                gridControlMethod.DataSource = list;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
        }

        private void AddListData(String NDT)
        {
            //List<INSPECTION_DETAIL_TECHNIQUE> list = new List<INSPECTION_DETAIL_TECHNIQUE>();
            //list = obj;
            INSPECTION_DETAIL_TECHNIQUE ins = new INSPECTION_DETAIL_TECHNIQUE();
            ins.NDTMethod = NDT;
            //ins.Coverage = 12;
            listNDT.Add(ins);
            //return list;
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
                RW_INSPECTION_HISTORY_BUS busDetail = new RW_INSPECTION_HISTORY_BUS();
                gridControl3.DataSource = busisp.getDataSource();
                //gridControl3.DataSource = busDetail.getDataSource();
            }
            catch (Exception e)
            {
                MessageBox.Show(e.ToString());
            }
        }
        #endregion
        #region Combobox
        private void initCombox()
        {
            additemsSite();
        }
        private void additemsSite()
        {   
            
            SITES_BUS busSite = new SITES_BUS();
            List<SITES> listitemsSite = busSite.getData();
            int index = 0;
            cbSite.Properties.Items.Add("<ALL>", -1, -1);
            for (int i = 0; i < listitemsSite.Count; i++)
            {
                cbSite.Properties.Items.Add(listitemsSite[i].SiteName, i, i);
                index = i;
            }
            cbSite.SelectedIndex = 0;            
        }

        private void additemsFacility()
        {
            cbFacility.Properties.Items.Add("<ALL>", -1, -1);
            cbFacility.SelectedIndex = 0;
            int SIteID = 0;
            if (cbSite.Text == "<ALL>")
            {
                SIteID = 0;
            }
            else
            {
                SITES_BUS busSite = new SITES_BUS();
                SIteID = busSite.getIDbyName(cbSite.Text);
            }
            FACILITY_BUS busFaci = new FACILITY_BUS();
            List<string> listitemsFaci = busFaci.getListFacilityName(SIteID);
            for (int i = 0; i < listitemsFaci.Count; i++)
            {
                cbFacility.Properties.Items.Add(listitemsFaci[i], i, i);
            }
        }
        private void cbSite_SelectedIndexChanged(object sender, EventArgs e)
        {
            cbFacility.Properties.Items.Clear();
            cbEquipment.Properties.Items.Clear();
            additemsFacility();
            additemsEquipment();
            SITES_BUS busSite = new SITES_BUS();
            FACILITY_BUS busFacility = new FACILITY_BUS();
            EQUIPMENT_MASTER_BUS busEquipment = new EQUIPMENT_MASTER_BUS();
            gridview1(busSite.getIDbyName(cbSite.Text), busFacility.getIDbyName(cbFacility.Text), busEquipment.getIDbyName(cbEquipment.Text));
        }

        private void additemsEquipment()
        {
            cbEquipment.Properties.Items.Add("<ALL>", -1, -1);
            cbEquipment.SelectedIndex = 0;
            int FacilityID1 = 0;
            if (cbFacility.Text == "<ALL>")
            {
                FacilityID1 = 0;
            }
            else
            {
                FACILITY_BUS busFaci = new FACILITY_BUS();
                FacilityID1 = busFaci.getIDbyName(cbFacility.Text);
            }
            EQUIPMENT_MASTER_BUS busequip = new EQUIPMENT_MASTER_BUS();
            List<String> listitemsEquip = busequip.getListEquipmentName(FacilityID1);    
            for (int i = 0; i < listitemsEquip.Count; i++)
            {
                cbEquipment.Properties.Items.Add(listitemsEquip[i], i, i);
            }
        }
        private void cbFacility_SelectedIndexChanged(object sender, EventArgs e)
        {
            cbEquipment.Properties.Items.Clear();
            additemsEquipment();
            SITES_BUS busSite = new SITES_BUS();
            FACILITY_BUS busFacility = new FACILITY_BUS();
            EQUIPMENT_MASTER_BUS busEquipment = new EQUIPMENT_MASTER_BUS();
            gridview1(0, busFacility.getIDbyName(cbFacility.Text), 0);
        }

        private void btnRefesh_Click(object sender, EventArgs e)
        {
            cbSite.Properties.Items.Clear();
            cbFacility.Properties.Items.Clear();
            cbEquipment.Properties.Items.Clear();
            additemsSite();
            additemsFacility();
            additemsEquipment();
        }

        private void cbEquipment_SelectedIndexChanged(object sender, EventArgs e)
        {
            SITES_BUS busSite = new SITES_BUS();
            FACILITY_BUS busFacility = new FACILITY_BUS();
            EQUIPMENT_MASTER_BUS busEquipment = new EQUIPMENT_MASTER_BUS();
            gridview1(0, 0, busEquipment.getIDbyName(cbEquipment.Text));
        }
        #endregion 

        private void gridView2_SelectionChanged(object sender, DevExpress.Data.SelectionChangedEventArgs e)
        {
            changeINSPECTION_COVERAGE = true;//bi thay doi, cap nhat lai
        }

        

        
        

    }
}