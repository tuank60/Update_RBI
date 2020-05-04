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


namespace RBI.PRE.subForm.OutputDataForm
{
    public delegate void DataUCChangedHanlder(object sender, DataUCChangedEventArgs e);
    public delegate void CtrlSHandler(object sender, CtrlSPressEventArgs e);
    public partial class UCRiskFactor : UserControl
    {
        public UCRiskFactor()
        {
            InitializeComponent();
        }
        public UCRiskFactor(int ID)
        {
            InitializeComponent();
            riskPoF(ID);
            riskCA(ID);
            //ShowDataOutputCA(ID);
            //initData_Shell(ID);
            //initData_Tank(ID);
            initData_CA(ID);
        }
        public String type { set; get; }
        public void riskPoF(int ID)
        {
            RW_FULL_POF_BUS bus = new RW_FULL_POF_BUS();
            RW_FULL_POF obj = bus.getData(ID);
            cbThinningType.Text = obj.ThinningType;
            textEdit1.Text = obj.GFFTotal.ToString();
            textEdit2.Text = obj.FMS.ToString();
            txt0Thinning.Text = obj.ThinningAP1.ToString();
            txt36Thinning.Text = obj.ThinningAP2.ToString();
            txt72Thinning.Text = obj.ThinningAP3.ToString();

            txt0StressCorrosion.Text = obj.SCCAP1.ToString();
            txt36StressCorrosion.Text = obj.SCCAP2.ToString();
            txt72StressCorrosion.Text = obj.SCCAP3.ToString();

            txt0External.Text = obj.ExternalAP1.ToString();
            txt36External.Text = obj.ExternalAP2.ToString();
            txt72External.Text = obj.ExternalAP3.ToString();

            txt0HighTemperature.Text = obj.HTHA_AP1.ToString();
            txt36HighTemperature.Text = obj.HTHA_AP2.ToString();
            txt72HighTemperature.Text = obj.HTHA_AP3.ToString();

            txt0BrittleFracture.Text = obj.BrittleAP1.ToString();
            txt36BrittleFracture.Text = obj.BrittleAP2.ToString();
            txt72BrittleFracture.Text = obj.BrittleAP3.ToString();

            txt0Piping.Text = obj.FatigueAP1.ToString();
            txt36Piping.Text = obj.FatigueAP2.ToString();
            txt72Piping.Text = obj.FatigueAP3.ToString();

            txt0Other.Text = obj.SemiAP1.ToString();
            txt32Other.Text = obj.SemiAP2.ToString();
            txt72Other.Text = obj.SemiAP3.ToString();

            txt0TotalGeneralThinning.Text = obj.ThinningGeneralAP1.ToString();
            txt36TotalGeneralThinning.Text = obj.ThinningGeneralAP2.ToString();
            txt72TotalGeneralThinning.Text = obj.ThinningGeneralAP3.ToString();

            txt0TotalLocalThinning.Text = obj.ThinningLocalAP1.ToString();
            txt36TotalLocalThinning.Text = obj.ThinningLocalAP2.ToString();
            txt72TotalLocalThinning.Text = obj.ThinningLocalAP3.ToString();

            txt0FinalTotalDamage.Text = obj.TotalDFAP1.ToString();
            txt36FinalTotalDamage.Text = obj.TotalDFAP2.ToString();
            txt72FinalTotalDamage.Text = obj.TotalDFAP3.ToString();

            txt0PoF.Text = obj.PoFAP1.ToString();
            txt36PoF.Text = obj.PoFAP2.ToString();
            txt72PoF.Text = obj.PoFAP3.ToString();

            txt0PoFCategory.Text = obj.PoFAP1Category;
            txt36PoFCategory.Text = obj.PoFAP2Category;
            txt72PoFCategory.Text = obj.PoFAP3Category;
        }
        public void riskCA(int ID)
        {
            RW_FULL_FCOF_BUS fullPoFBus = new RW_FULL_FCOF_BUS();
            RW_FULL_FCOF fullPoF = fullPoFBus.getData(ID);
            txtProductionCost.Text = fullPoF.prodcost.ToString();
            txtEquipmentCost.Text = fullPoF.equipcost.ToString();
            txtPopdens.Text = fullPoF.popdens.ToString();
            txtInjureCost.Text = fullPoF.injcost.ToString();
            txtEnvironmentCost.Text = fullPoF.envcost.ToString();
            txtFC.Text = fullPoF.FCoFValue.ToString();
            txtCA.Text = fullPoF.FCoFCategory;
        }
        public void ShowDataOutputCA(int ID)
        {
            //RW_CA_TANK_BUS busTank = new RW_CA_TANK_BUS();
            //RW_CA_TANK ca = busTank.getData(ID);
            //txtCA.Text = ca.ConsequenceCategory;
            //txtFC.Text = ca.Consequence.ToString();
            //RW_CA_LEVEL_1_BUS busCA = new RW_CA_LEVEL_1_BUS();
            //RW_CA_LEVEL_1 ca = busCA.getData(ID);
            //txtCAcmd.Text = ca.CA_cmd.ToString();
            //txtCAinj.Text = ca.CA_inj_flame.ToString();
            //txtFCcmd.Text = ca.FC_cmd.ToString();
            //txtFCinj.Text = ca.FC_inj.ToString();
            //txtFCaffa.Text = ca.FC_affa.ToString();
            //txtFCprod.Text = ca.FC_prod.ToString();
            //txtFCenviron.Text = ca.FC_envi.ToString();
        }

        private void cbThinningType_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(cbThinningType.Text == "")
            {
                type = "Local";
            }
            else
            {
                type = cbThinningType.Text;
            } 
        }
        private void initData_CA(int ID)
        {
            RW_ASSESSMENT_BUS busAssess = new RW_ASSESSMENT_BUS();
            COMPONENT_MASTER_BUS busCompMaster = new COMPONENT_MASTER_BUS();
            int[] temp = busAssess.getEquipmentID_ComponentID(ID);
            int compTypeID = busCompMaster.getComponentTypeID(temp[1]);
            Console.WriteLine("comTypeID=" + compTypeID + " " + temp[1]);
            

            if (compTypeID == 12) //tank bottom
            {
                initData_Tank(ID);
                tabCATankBottom.PageVisible = true;
                tabCAShell.PageVisible = false;
                tabCA.PageVisible = false;
                tabCATankShell.PageVisible = false;
                TabArea.PageVisible = false;
                tabCATankRoof.PageVisible = false;
            }
            else if (compTypeID == 8)
            {
                initData_Shell(ID);
                tabCA.PageVisible = false;
                tabCATankBottom.PageVisible = false;
                tabCAShell.PageVisible = false;
                tabCATankShell.PageVisible = true;
                TabArea.PageVisible = false;
                tabCATankRoof.PageVisible = false;
            }
            else if (compTypeID == 13) //shell
            {
                initData_Shell(ID);
                TabArea.PageVisible = false;
                tabCA.PageVisible = false;
                tabCAShell.PageVisible = false;
                tabCATankBottom.PageVisible = false;
                tabCATankShell.PageVisible = true;
                tabCATankRoof.PageVisible = false; 
                initData_InputTank(ID);

            }
            else if (compTypeID == 14) //fixed roof
            {
                
                tabCA.PageVisible = false;
                tabCATankBottom.PageVisible = false;
                TabArea.PageVisible = false;
                tabCAShell.PageVisible = false;
                tabCATankShell.PageVisible = false;
                tabCATankRoof.PageVisible = true;
                initData_InputTank(ID);
                initData_Roof(ID);
            }
            else if (compTypeID == 15) //floating roof
            {
               
                tabCA.PageVisible = false;
                tabCATankBottom.PageVisible = false;
                TabArea.PageVisible = false;
                tabCAShell.PageVisible = false;
                tabCATankShell.PageVisible = false;
                tabCATankRoof.PageVisible = true;
                initData_InputTank(ID);
                initData_Roof(ID);
            }
            else
            {
                riskCA(ID);
                ShowDataOutputCA(ID);
                tabCATankBottom.PageVisible = false;
                tabCAShell.PageVisible = false;
                tabCA.PageVisible = true;
                tabCATankShell.PageVisible = false;
                tabCATankRoof.PageVisible = false;

            }
        }
        private void initData_Roof(int ID)
        {
            RW_FULL_COF_TANK_BUS COFBus = new RW_FULL_COF_TANK_BUS();
            RW_FULL_COF_TANK obj = COFBus.getData(ID);
            RW_CA_TANK_BUS busCA_Tank = new RW_CA_TANK_BUS();
            RW_CA_TANK caTank = busCA_Tank.getData(ID);
            txtOutageMulRoof.Text = obj.EquipOutageMultiplier.ToString();
            txtPrrodCostRoof.Text = obj.ProdCost.ToString();
            txtMaterialRoof.Text = caTank.Material_Factor.ToString();
            txtComDamRoof.Text = caTank.Component_Damage_Cost.ToString();
            txtDowntimeRoof.Text = caTank.Leak_Duration_D1.ToString();//lưu tạm giá trị
            txtBusInterRoof.Text = caTank.Business_Cost.ToString();
            txtTotalConsequenceRoof.Text = caTank.Consequence.ToString();
            txtConsequenceCategoryRoof.Text = caTank.ConsequenceCategory;
        }
        private void initData_Tank(int ID)
        {
            RW_CA_TANK_BUS busCA_Tank = new RW_CA_TANK_BUS();
            RW_CA_TANK caTank = busCA_Tank.getData(ID);
            tbHdraulicFluid.Text = caTank.Hydraulic_Fluid.ToString();
            tbHdraulicWater.Text = caTank.Hydraulic_Water.ToString();
            tbSeepageVelocity.Text = caTank.Seepage_Velocity.ToString();
            tbFlowRateD1.Text = caTank.Flow_Rate_D1.ToString();
            tbFlowRateD4.Text = caTank.Flow_Rate_D4.ToString();
            tbLeakDurationD1.Text = caTank.Leak_Duration_D1.ToString();
            tbLeakDurationD4.Text = caTank.Leak_Duration_D4.ToString();
            tbRealeaseVolumeFromLeakageD1.Text = caTank.Release_Volume_Leak_D1.ToString();
            //MessageBox.Show(caTank.Release_Volume_Leak_D1.ToString());
            // MessageBox.Show(caTank.FC_Environ_Rupture.ToString());
            tbRealeaseVolumeFromLeakageD4.Text = caTank.Release_Volume_Leak_D4.ToString();
            tbReleaseVolumeFromRuptureD1.Text = caTank.Release_Volume_Rupture_D1.ToString();
            tbReleaseVolumeFromRuptureD4.Text = caTank.Release_Volume_Rupture_D4.ToString();
            tbTimeToInitiate.Text = caTank.Time_Leak_Ground.ToString();
           // MessageBox.Show(caTank.Time_Leak_Ground.ToString());
            tbVolumeSubsoilFromLeakageD1.Text = caTank.Volume_SubSoil_Leak_D1.ToString();
            tbVolumeSubsoilFromLeakageD4.Text = caTank.Volume_SubSoil_Leak_D4.ToString();
            tbVolumeGroundWaterFromLeakageD1.Text = caTank.Volume_Ground_Water_Leak_D1.ToString();
            tbVolumeGroundWaterFromLeakageD4.Text = caTank.Volume_Ground_Water_Leak_D4.ToString();
            tbWithinTheDike.Text = caTank.Barrel_Dike_Rupture.ToString();
            tbWithinTheDike.Text = caTank.Barrel_Dike_Rupture.ToString();
            tbOnsiteRupture.Text = caTank.Barrel_Onsite_Rupture.ToString();
            tbOffsiteRupture.Text = caTank.Barrel_Offsite_Rupture.ToString();
            tbReachWater.Text = caTank.Barrel_Water_Rupture.ToString();
            tbFC_Env_Leakage.Text = caTank.FC_Environ_Leak.ToString();
            tbFC_Env_Rupture.Text = caTank.FC_Environ_Rupture.ToString();
            tbMaterialFactor.Text = caTank.Material_Factor.ToString();
            tbTotalCost.Text = caTank.FC_Environ.ToString();
            tbComponentDamageCost.Text = caTank.Component_Damage_Cost.ToString();
            tbCostOfBusinessInterruption.Text = caTank.Business_Cost.ToString();
            tbTotalConsequence.Text = caTank.Consequence.ToString();
            tbConsequenceCategory.Text = caTank.ConsequenceCategory;
        }
        
        private void initData_InputTank(int ID)
        {
            #region  table RW_FULL_COF_TANK
            RW_FULL_COF_TANK_BUS COFBus = new RW_FULL_COF_TANK_BUS();
            RW_FULL_COF_TANK obj = COFBus.getData(ID);
            txtIDFullCOFTankInTabShell.Text = obj.ID.ToString();
            txtProcessUnitReplace.Text = obj.equipcost.ToString();
            txtEquipOutageMultiplier.Text = obj.EquipOutageMultiplier.ToString();
            txtLossProduction.Text = obj.ProdCost.ToString();
            txtDensity.Text = obj.popdens.ToString();
            txtInjury.Text = obj.injcost.ToString();
            #endregion
        }
        private void initData_Shell(int ID)
        {
            RW_CA_TANK_BUS busCA_Tank = new RW_CA_TANK_BUS();
            RW_CA_TANK caTank = busCA_Tank.getData(ID);

            #region consequences area
            tbFlowRateShellD1.Text = caTank.Flow_Rate_D1.ToString();
            tbFlowRateShellD2.Text = caTank.Flow_Rate_D2.ToString();
            tbFlowRateShellD3.Text = caTank.Flow_Rate_D3.ToString();
            tbFlowRateShellD4.Text = caTank.Flow_Rate_D4.ToString();

            tbLeakDurationShellD1.Text = caTank.Leak_Duration_D1.ToString();
            tbLeakDurationShellD2.Text = caTank.Leak_Duration_D2.ToString();
            tbLeakDurationShellD3.Text = caTank.Leak_Duration_D3.ToString();
            tbLeakDurationShellD4.Text = caTank.Leak_Duration_D4.ToString();

            tbReleaseVolumeLeakageShellD1.Text = caTank.Release_Volume_Leak_D1.ToString();
            tbReleaseVolumeLeakageShellD2.Text = caTank.Release_Volume_Leak_D2.ToString();
            tbReleaseVolumeLeakageShellD3.Text = caTank.Release_Volume_Leak_D3.ToString();
            tbReleaseVolumeLeakageShellD4.Text = caTank.Release_Volume_Leak_D4.ToString();

            tbReleaseVolumeLeakageShellD1.Text = caTank.Release_Volume_Leak_D1.ToString();
            tbReleaseVolumeLeakageShellD2.Text = caTank.Release_Volume_Leak_D2.ToString();
            tbReleaseVolumeLeakageShellD3.Text = caTank.Release_Volume_Leak_D3.ToString();
            tbReleaseVolumeLeakageShellD4.Text = caTank.Release_Volume_Leak_D4.ToString();
            tbTimeLeakageGroundWaterShell.Text = caTank.Time_Leak_Ground.ToString();
            tbVolumeSubsoilShellD1.Text = caTank.Volume_SubSoil_Leak_D1.ToString();
            tbVolumeSubsoilShellD4.Text = caTank.Volume_SubSoil_Leak_D4.ToString();
            tbVolumeGroundWaterShellD1.Text = caTank.Volume_Ground_Water_Leak_D1.ToString();
            tbVolumeGroundWaterShellD4.Text = caTank.Volume_Ground_Water_Leak_D4.ToString();
            tbDikeRuptureShell.Text = caTank.Barrel_Dike_Rupture.ToString();
            tbOn_siteShell.Text = caTank.Barrel_Onsite_Rupture.ToString();
            tbIn_siteShell.Text = caTank.Barrel_Offsite_Rupture.ToString();
            tbReachWaterRuptureShell.Text = caTank.Barrel_Water_Rupture.ToString();
            tbFCleakageShell.Text = caTank.FC_Environ_Leak.ToString();
            tbFCruptureShell.Text = caTank.FC_Environ_Rupture.ToString();

            tbTotalF_Shell.Text = caTank.FC_Environ.ToString();
            tbComponentDamageCost.Text = caTank.Component_Damage_Cost.ToString();
            tbCostBussinessInterruptionShell.Text = caTank.Business_Cost.ToString();

            tbTotalConsequenceShell.Text = caTank.Consequence.ToString();
            tbConsequenceCategoryShell.Text = caTank.ConsequenceCategory;
            #endregion

            #region Tab COF Financial for Shell

            txtHdraulicWater.Text = caTank.Hydraulic_Water.ToString();
            txtHdraulicFluid.Text = caTank.Hydraulic_Fluid.ToString();
            txtSeepageVelocity.Text = caTank.Seepage_Velocity.ToString();

            txtFlowRateShellD1.Text = caTank.Flow_Rate_D1.ToString();
            txtFlowRateShellD2.Text = caTank.Flow_Rate_D2.ToString();
            txtFlowRateShellD3.Text = caTank.Flow_Rate_D3.ToString();
            txtFlowRateShellD4.Text = caTank.Flow_Rate_D4.ToString();
            
            txtHeightAboveShell.Text = caTank.Liquid_Height.ToString();
            txtVolumnAboveShell.Text = caTank.Volume_Fluid.ToString();

            txtLeakDurationShellD1.Text = caTank.Leak_Duration_D1.ToString();
            txtLeakDurationShellD2.Text = caTank.Leak_Duration_D2.ToString();
            txtLeakDurationShellD3.Text = caTank.Leak_Duration_D3.ToString();
            txtLeakDurationShellD4.Text = caTank.Leak_Duration_D4.ToString();

            txtReleaseVolumeLeakageShellD1.Text = caTank.Release_Volume_Leak_D1.ToString();
            txtReleaseVolumeLeakageShellD2.Text = caTank.Release_Volume_Leak_D2.ToString();
            txtReleaseVolumeLeakageShellD3.Text = caTank.Release_Volume_Leak_D3.ToString();
            txtReleaseVolumeLeakageShellD4.Text = caTank.Release_Volume_Leak_D4.ToString();

            txtReleaseVolumeFromRuptureShell.Text = caTank.Release_Volume_Rupture_D1.ToString(); // lưu giá trị này ở D1

            tbWithinDikeLeakageShell.Text = caTank.Barrel_Dike_Leak.ToString();
            tbWithinDikeRuptureShell.Text = caTank.Barrel_Dike_Rupture.ToString();
            tbOn_siteLeakageShell.Text = caTank.Barrel_Onsite_Leak.ToString();
            tbOn_siteRuptureShell.Text = caTank.Barrel_Onsite_Rupture.ToString();
            tbOff_siteLeakageShell.Text = caTank.Barrel_Offsite_Leak.ToString();
            tbOff_siteRupureShell.Text = caTank.Barrel_Offsite_Rupture.ToString();
            txtReachWaterLeakageShell.Text = caTank.Barrel_Water_Leak.ToString();
            txtReachWaterRuptureShell.Text = caTank.Barrel_Water_Rupture.ToString();

            tbFCenvLeakageShell.Text = caTank.FC_Environ_Leak.ToString();
            tbFCenvRuptureShell.Text = caTank.FC_Environ_Rupture.ToString();

            tbTotalFCenvShell.Text = caTank.FC_Environ.ToString();
            tbComponentDamageCostShell.Text = caTank.Component_Damage_Cost.ToString();
            //tbDamageSurroundEquipmentShell.Text = cần bổ sung base 
            tbCostOfBusinessInterruptionShell.Text = caTank.Business_Cost.ToString();
            //tbCostAssociatedPersonInjury.Text = cần bổ sung base 

            #endregion
        }

        RW_FULL_COF_TANK input = new RW_FULL_COF_TANK();
        //private float[] Input = { 0, 0, 0, 0, 0 };
        public RW_FULL_COF_TANK getDataInputCOFTank(int ID)
        {
            input.ID = ID;
            /*input.equipcost = Input[0] < 0  ? Input[0] : 0;
            input.EquipOutageMultiplier = Input[1] < 0 ? Input[1] : 0;
            input.ProdCost = Input[2] < 0 ? Input[2] : 0;
            input.injcost = Input[3] < 0 ? Input[3] : 0;
            input.popdens = Input[4] < 0 ? Input[4] : 0; */
            input.equipcost = txtProcessUnitReplace.Text != "" ? float.Parse(txtProcessUnitReplace.Text) : 0;
            input.EquipOutageMultiplier = txtEquipOutageMultiplier.Text != "" ? float.Parse(txtEquipOutageMultiplier.Text) : 0;
            input.ProdCost = txtLossProduction.Text != "" ? float.Parse(txtLossProduction.Text) : 0; 
            input.injcost =  txtInjury.Text != "" ? float.Parse(txtInjury.Text) : 0;
            input.popdens = txtDensity.Text != "" ? float.Parse(txtDensity.Text) : 0; 
            return input;
        }

        #region event
        private void lblLF1_Click(object sender, EventArgs e)
        {
            if (lblLF1.Text == "▼ LF1")
            {
                panelLF1.Height = 71;
                lblLF1.Text = "▶ LF1";

                panelLF2.Top = panelLF1.Top + panelLF1.Height + 13;
                panelLF3.Top = panelLF2.Top + panelLF2.Height + 13;
                panelLF4567.Top = panelLF3.Top + panelLF4567.Height + 13;
            }
            else if (lblLF1.Text == "▶ LF1")
            {
                panelLF1.Height = 21;
                lblLF1.Text = "▼ LF1";

                panelLF2.Top = panelLF1.Top + panelLF1.Height + 13;
                panelLF3.Top = panelLF2.Top + panelLF2.Height + 13;
                panelLF4567.Top = panelLF3.Top + panelLF4567.Height + 13;
            }
        }

        private void lblLF2_Click(object sender, EventArgs e)
        {

            if (lblLF2.Text == "▼ LF2")
            {
                panelLF2.Height = 131;
                lblLF2.Text = "▶ LF2";
                panelLF3.Top = panelLF2.Top + panelLF2.Height + 13;
                panelLF4567.Top = panelLF3.Top + panelLF3.Height + 13;

            }
            else if (lblLF2.Text == "▶ LF2")
            {
                panelLF2.Height = 21;
                lblLF2.Text = "▼ LF2";
                panelLF3.Top = panelLF2.Top + panelLF2.Height + 13;
                panelLF4567.Top = panelLF3.Top + panelLF3.Height + 13;
            }
        }

        private void lblLF3_Click(object sender, EventArgs e)
        {
            if (lblLF3.Text == "▼ LF3")
            {
                panelLF3.Height = 114;
                lblLF3.Text = "▶ LF3";
                panelLF4567.Top = panelLF3.Top + panelLF3.Height + 13;
            }
            else if (lblLF3.Text == "▶ LF3")
            {
                panelLF3.Height = 21;
                lblLF3.Text = "▼ LF3";
                panelLF4567.Top = panelLF3.Top + panelLF3.Height + 13;
            }
        }

        private void lblLF4567_Click(object sender, EventArgs e)
        {
            if (lblLF4567.Text == "▼ LF4, LF5, LF6 and LF7")
            {
                panelLF4567.Height = 205;
                lblLF4567.Text = "▶ LF4, LF5, LF6 and LF7";

            }
            else if (lblLF4567.Text == "▶ LF4, LF5, LF6 and LF7")
            {
                panelLF4567.Height = 21;
                lblLF4567.Text = "▼ LF4, LF5, LF6 and LF7";

            }
        }
        private void UCRiskFactor_Load_1(object sender, EventArgs e)
        {
            panelLF1.Height = 21;
            panelLF2.Top = panelLF1.Top + panelLF1.Height + 13;
            panelLF2.Height = 21;
            panelLF3.Top = panelLF2.Top + panelLF2.Height + 13;
            panelLF3.Height = 21;
            panelLF4567.Top = panelLF3.Top + panelLF3.Height + 13;
            panelLF4567.Height = 21;
            panelInput.Height = 21;
            panelFQF.Top = panelInput.Top + panelInput.Height + 13;
            panelFQF.Height = 21;
            groupBoxIV.Top = panelFQF.Top + panelFQF.Height + 13;
            panelInflu.Height = 21;
            panelCAP.Top = panelInflu.Top + panelInflu.Height + 13;
            panelCAP.Height = 21;
            panelRHP.Top = panelCAP.Top + panelCAP.Height + 13;
            panelRHP.Height = 21;
        }

        private void lblInput_Click(object sender, EventArgs e)
        {
            if (lblInput.Text == "▼ Input")
            {
                panelInput.Height = 142;
                lblInput.Text = "▶ Input";
                panelFQF.Top = panelInput.Top + panelInput.Height + 13;
                groupBoxIV.Top = panelFQF.Top + panelFQF.Height + 13;
                panelCAP.Top = panelInflu.Top + panelInflu.Height + 13;
                panelRHP.Top = panelCAP.Top + panelCAP.Height + 13;
            }
            else if (lblInput.Text == "▶ Input")
            {
                panelInput.Height = 21;
                lblInput.Text = "▼ Input";
                panelFQF.Top = panelInput.Top + panelInput.Height + 13;
                groupBoxIV.Top = panelFQF.Top + panelFQF.Height + 13;
                panelCAP.Top = panelInflu.Top + panelInflu.Height + 13;
                panelRHP.Top = panelCAP.Top + panelCAP.Height + 13;
            }
        }

        private void lblFQF_Click(object sender, EventArgs e)
        {
            if (lblFQF.Text == "▼ Fully-Quantitive Financial Consequence of Failture and Category")
            {
                panelFQF.Height = 87;
                lblFQF.Text = "▶ Fully-Quantitive Financial Consequence of Failture and Category";
                groupBoxIV.Top = panelFQF.Top + panelFQF.Height + 13;
                panelCAP.Top = panelInflu.Top + panelInflu.Height + 13;
                panelRHP.Top = panelCAP.Top + panelCAP.Height + 13;
            }
            else if (lblFQF.Text == "▶ Fully-Quantitive Financial Consequence of Failture and Category")
            {
                panelFQF.Height = 21;
                lblFQF.Text = "▼ Fully-Quantitive Financial Consequence of Failture and Category";
                groupBoxIV.Top = panelFQF.Top + panelFQF.Height + 13;
                panelCAP.Top = panelInflu.Top + panelInflu.Height + 13;
                panelRHP.Top = panelCAP.Top + panelCAP.Height + 13;
            }
        }

        private void lbllnfinput_Click(object sender, EventArgs e)
        {
            if (lbllnfinput.Text == "▼ Influencing Inputs")
            {
                panelInflu.Height = 207;
                lbllnfinput.Text = "▶ Influencing Inputs";
                panelCAP.Top = panelInflu.Top + panelInflu.Height + 13;
                panelRHP.Top = panelCAP.Top + panelCAP.Height + 13;
            }
            else if (lbllnfinput.Text == "▶ Influencing Inputs")
            {
                panelInflu.Height = 21;
                lbllnfinput.Text = "▼ Influencing Inputs";
                panelCAP.Top = panelInflu.Top + panelInflu.Height + 13;
                panelRHP.Top = panelCAP.Top + panelCAP.Height + 13;
            }
        }

        private void lblCAP_Click(object sender, EventArgs e)
        {
            if (lblCAP.Text == "▼ Consequence Analysis Properties")
            {
                panelCAP.Height = 368;
                lblCAP.Text = "▶ Consequence Analysis Properties";
                panelRHP.Top = panelCAP.Top + panelCAP.Height + 13;
            }
            else if (lblCAP.Text == "▶ Consequence Analysis Properties")
            {
                panelCAP.Height = 21;
                lblCAP.Text = "▼ Influencing Inputs";
                panelRHP.Top = panelCAP.Top + panelCAP.Height + 13;
            }
        }

        private void lblRHP_Click(object sender, EventArgs e)
        {
            if (lblRHP.Text == "▼ Release Holes Properties")
            {
                panelRHP.Height = 342;
                lblRHP.Text = "▶ Release Holes Properties";
            }
            else if (lblRHP.Text == "▶ Release Holes Properties")
            {
                panelRHP.Height = 21;
                lblRHP.Text = "▼ Release Holes Properties";
            }
        }

        #endregion
        #region Xu ly su kien khi data thay doi
        private int datachange = 0;
        private int ctrlSpress = 0;
        public event DataUCChangedHanlder DataChanged;
        public event CtrlSHandler CtrlS_Press;
        public int CtrlSPress
        {
            get { return ctrlSpress; }
            set
            {
                ctrlSpress = value;
                OnCtrlS_Press(new CtrlSPressEventArgs(ctrlSpress));
            }
        }
        public int DataChange
        {
            get { return datachange; }
            set
            {
                if (datachange == value) return;
                datachange = value;
                OnDataChanged(new DataUCChangedEventArgs(datachange));
            }
        }
        protected virtual void OnDataChanged(DataUCChangedEventArgs e)
        {
             if (DataChanged != null)
                 DataChanged(this, e);
        }
        protected virtual void OnCtrlS_Press(CtrlSPressEventArgs e)
        {
             if (CtrlS_Press != null)
                 CtrlS_Press(this, e);
        }

        private void txtRiskFactor_TextChanged(object sender, EventArgs e)
        {
             DataChange++;
        }
       

        private void txtRiskFactor_KeyDown(object sender, KeyEventArgs e)
         {
             if (e.Control && e.KeyCode == Keys.S)
             {
                 CtrlSPress++;
             }
         }
        
        #endregion
        #region KeyPress Event Handle
        private void keyPressEvent(TextBox textbox, KeyPressEventArgs ev)
        {
            string a = textbox.Text;
            if (!char.IsControl(ev.KeyChar) && !char.IsDigit(ev.KeyChar) && (ev.KeyChar != '.') && (ev.KeyChar != '-'))
            {
                ev.Handled = true;
            }
            if (a.Contains('.') && ev.KeyChar == '.')
            {
                ev.Handled = true;
            }
        }
        private void txtProdCost_KeyPress(object sender, KeyPressEventArgs e)
        {
            keyPressEvent(txtProcessUnitReplace, e);
        }

        private void txtEquipOutageMultiplier_KeyPress(object sender, KeyPressEventArgs e)
        {
            keyPressEvent(txtEquipOutageMultiplier, e);
        }
        
        private void txtEquip_KeyPress(object sender, KeyPressEventArgs e)
        {
            keyPressEvent(txtLossProduction, e);
        }

        private void txtDensity_KeyPress(object sender, KeyPressEventArgs e)
        {
            keyPressEvent(txtDensity, e);
        }

        private void txtInjury_KeyPress(object sender, KeyPressEventArgs e)
        {
            keyPressEvent(txtInjury, e);
        }

        #endregion

        private void btnSaveInputShell_Click(object sender, EventArgs e) //dùng button này để sửa giá trị bảng RW full cof tank
        {
            int ID = int.Parse(txtIDFullCOFTankInTabShell.Text);
            RW_FULL_COF_TANK inputShell = new RW_FULL_COF_TANK();
            inputShell = getDataInputCOFTank(ID);
            RW_FULL_COF_TANK_BUS busCA_Tank = new RW_FULL_COF_TANK_BUS();
            busCA_Tank.edit(inputShell);
            MessageBox.Show("Update Input", "Coterk RBI");
        }

        private void btnSaveInputRoof_Click(object sender, EventArgs e)
        {
            int ID = int.Parse(txtIDFullCOFTankInTabShell.Text);
            RW_FULL_COF_TANK inputShell = new RW_FULL_COF_TANK();
            txtEquipOutageMultiplier.Text = txtOutageMulRoof.Text;
            txtLossProduction.Text = txtPrrodCostRoof.Text;
            inputShell = getDataInputCOFTank(ID);
            RW_FULL_COF_TANK_BUS busCA_Tank = new RW_FULL_COF_TANK_BUS();
            busCA_Tank.edit(inputShell);
            MessageBox.Show("Update Input", "Coterk RBI");
        }
    }
}
