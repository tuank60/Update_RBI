using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using RBI.Object.ObjectMSSQL;
using RBI.BUS.BUSMSSQL;
using RBI.Object;
using RBI.BUS.BUSMSSQL_CAL;
using RBI.DAL.MSSQL_CAL;
using DevExpress.XtraSplashScreen;

namespace RBI.PRE.subForm.OutputDataForm.OutputPOF
{
    public partial class UCCarbonateCracking : UserControl
    {
        public UCCarbonateCracking()
        {
            InitializeComponent();
        }
        public UCCarbonateCracking(int ID)
        {
            InitializeComponent();
            initinput(ID);
            Calculate();
        }
        private void initinput(int ID)
        {
            RW_COATING_BUS coatBus = new RW_COATING_BUS();
            RW_EQUIPMENT_BUS eqBus = new RW_EQUIPMENT_BUS();
            EQUIPMENT_MASTER_BUS busEquipmentMaster = new EQUIPMENT_MASTER_BUS();
            RW_COATING coat = new RW_COATING();
            RW_EQUIPMENT eq = new RW_EQUIPMENT();
            RW_ASSESSMENT_BUS busAssessment = new RW_ASSESSMENT_BUS();
            RW_ASSESSMENT ass = busAssessment.getData(ID);
            RW_INSPECTION_HISTORY_BUS busInspectionHistory = new RW_INSPECTION_HISTORY_BUS();
            RW_STREAM_BUS SteamBus = new RW_STREAM_BUS();
            RW_STREAM stream = SteamBus.getData(ID);
            //TimeSpan year = busAssessment.getAssessmentDate(IDProposal) - busInspectionHistory.getLastInsp(componentID, DM_ID[1], busEquipmentMaster.getComissionDate(equipmentID));
            int equipmentID = busAssessment.getEquipmentID(ID);
            
            txtAssDate.Text = Convert.ToString(busAssessment.getAssessmentDate(ID));
            txtInspecDate.Text = Convert.ToString(busEquipmentMaster.getComissionDate(equipmentID)); //test theo riskwwise
            txtComDate.Text = Convert.ToString(busEquipmentMaster.getComissionDate(equipmentID));
            txtCO3.Text = stream.CO3Concentration.ToString();
            txtPH.Text = stream.WaterpH.ToString();
            txtPeridod.Text = Convert.ToString(ass.RiskAnalysisPeriod);
            txtNumInspection.Text = "0"; //test
            txtHighEffective.Text = "E";
            txtCrack.Text = Convert.ToString(true);
            txtPHWT.Text = Convert.ToString(true);
        }
        public void Calculate()
        {
            MessageBox.Show("đang gọi đến điểm test");

            //cal.YEAR_IN_SERVICE = (int)Math.Ceiling((decimal)year.Days / 365); 
            //cal.LINNER_CONDITION = 
            //cal.INTERNAL_LINNING =


            //Input
            CAL_DM_CARBONATE_CRACKING CA_DM = new CAL_DM_CARBONATE_CRACKING();
            CA_DM.CACBONATE_INSP_NUM = txtNumInspection.Text != "" ? int.Parse(txtNumInspection.Text) : 0;
            CA_DM.CACBONATE_INSP_EFF = txtHighEffective.Text;
            CA_DM.CO3_CONCENTRATION = txtCO3.Text != "" ? int.Parse(txtCO3.Text) : 0;
            CA_DM.PH = txtPH.Text != "" ?  float.Parse(txtPH.Text) : 0;
            string temp = txtCrack.Text.ToLower();
            if (txtCrack.Text.ToLower() == "true")
            {
                CA_DM.CRACK_PRESENT = true;
            }
            else
            {
                CA_DM.CRACK_PRESENT = false;
            }
            if (txtPHWT.Text.ToLower() == "true")
            {
                CA_DM.PWHT = true;
            }
            else
            {
                CA_DM.PWHT = false;
            }

            // Select "true" to caculate
            CA_DM.EXPOSED_SULFUR = true;
            CA_DM.CARBON_ALLOY = true;

            // Time
            lbTime1.Text = lbTime4.Text = "0 months";
            int _period  = txtPeridod.Text != "" ? int.Parse(txtPeridod.Text) : 36;
            lbTime2.Text = lbTime5.Text = _period +" months";
            lbTime3.Text = lbTime6.Text = _period * 2 + " months";
            //lbTime4.Text = "0 months";
            //lbTime5.Text = txtPeridod.Text + " months";
            //lbTime6.Text = int.Parse(txtPeridod.Text) * 2 + " months";

            // Result
            txtSusceptibility.Text = CA_DM.GET_SUSCEPTIBILITY_CARBONATE();
            txtSVI.Text = (CA_DM.SVI_CARBONATE()).ToString();
            float age = 7;
            float i = _period / 12;
            txtSinceLastInspec1.Text = age.ToString();
            txtSinceLastInspec2.Text = (age + i).ToString();
            txtSinceLastInspec3.Text = (age + 2 * i).ToString();
            txtBaseValue1.Text = CA_DM.DF_CACBONATEforBase(age).ToString();
            txtBaseValue2.Text = CA_DM.DF_CACBONATEforBase(age + i).ToString();
            txtBaseValue3.Text = CA_DM.DF_CACBONATEforBase(age + 2 * i).ToString();
           
            txtTotal1.Text = CA_DM.DF_CACBONATE(age).ToString();
            txtTotal2.Text = CA_DM.DF_CACBONATE(age + i).ToString();
            txtTotal3.Text = CA_DM.DF_CACBONATE(age + 2 * i).ToString();
            //CA_DM.YEAR_IN_SERVICE =(int) (Math.Ceiling (yearService.TotalDays / 365.25)); //Yearinservice hiệu tham số giữa lần tính toán và ngày cài đặt hệ thống

            //TimeSpan age = Convert.ToDateTime(txtAssDate.Text) - Convert.ToDateTime(txtComDate.Text);
            //CA_DM.YEAR_IN_SERVICE = (int)(Math.Ceiling(age.TotalDays / 365.25)); //age dự đoán

            //int temp = 9;
            //txtFLC.Text = Convert.ToString(!float.IsNaN(CA_DM.FLC()) && CA_DM.FLC() > 0 ? CA_DM.FLC() : 0);
            //txtFLC.Text = Convert.ToString(!float.IsNaN(CA_DM.FOM()) && CA_DM.FOM() > 0 ? CA_DM.FOM() : 0);
            //double period = Convert.ToDouble(txtPeriod.Text);
            //period = 42;
            //period /= 12;
            //lb1.Text = 0 + " months";
            //lb2.Text = period + " months";
            //lb3.Text = period * 2  + " months";
            //txtAssDate.Text = Convert.ToString(!float.IsNaN(temp) && temp > 0 ? temp : 0);
            //txtPeriod.Text = Convert.ToString(!float.IsNaN(temp) && temp > 0 ? temp : 0);
            //txtComDate.Text = Convert.ToString(!float.IsNaN(temp) && temp > 0 ? temp : 0);
            //txtLastDate.Text = Convert.ToString(!float.IsNaN(temp) && temp > 0 ? temp : 0);
            //txtLinearCon.Text = Convert.ToString(!float.IsNaN(temp) && temp > 0 ? temp : 0);
            //txtLinearType.Text = Convert.ToString(!float.IsNaN(temp) && temp > 0 ? temp : 0);
            //txtOnlineMonitor.Text = Convert.ToString(!float.IsNaN(temp) && temp > 0 ? temp : 0);
        }

        private void load(object sender, EventArgs e)
        {

        }
    }
}
