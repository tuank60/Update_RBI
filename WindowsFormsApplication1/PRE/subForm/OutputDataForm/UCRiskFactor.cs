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


namespace RBI.PRE.subForm.OutputDataForm
{
    public delegate void DataUCChangedHanlder(object sender, DataUCChangedEventArgs e);
    public delegate void CtrlSHandler(object sender, CtrlSPressEventArgs e);
    public partial class UCRiskFactor : UserControl
    {
        string[] itemDetectionSystem= { "Instrumentation designed specifically to detect material losses by changes in operating conditions (i.e., loss of pressure or flow) in the system",
                                        "Suitably located detectors to determine when the material is present outside the pressure-containing envelope",
                                        "Visual detection, cameras, or detectors with marginal coverage" };
        string[] itemIsolationSystem= { "Isolation or shutdown systems activated directly from process instrumentation or detectors, with no operator intervention",
                                        "Isolation or shutdown systems activated by operators in the control room or other suitable locations remote from the leak",
                                        "Isolation dependent on manually-operated valves" };
        string[] itemMitigationSystem= {"Inventory Blowdown, coupled with isolation system actived remotely or automatically",
                                        "Fire water deluge system and monitors",
                                        "Foam spray system",
                                        "Fire water monitor only",
                                        "None"};
        public UCRiskFactor()
        {
            InitializeComponent();
        }
        private int id = -1;
        public UCRiskFactor(int ID)
        {
            id = ID;
            InitializeComponent();
            riskPoF(ID);
            riskCA(ID);
            addItemDetectionSystem();
            initAreabaseCOF(ID);
            addItemIsolationSystem();
            addItemMitigation();
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
        public void initAreabaseCOF(int ID)
        {
            RW_FULL_COF_HOLE_SIZE_BUS hsbus = new RW_FULL_COF_HOLE_SIZE_BUS();
            RW_FULL_COF_HOLE_SIZE obj = hsbus.getData(ID);
            RW_FULL_COF_INPUT_BUS fcipbus= new RW_FULL_COF_INPUT_BUS();
            RW_FULL_COF_INPUT fcip = fcipbus.getData(ID);

            //Console.WriteLine("haha tuan giat= " + obj.A1.ToString());
            textBox26.Text = obj.A1.ToString();
            textBox36.Text = obj.A2.ToString();
            textBox47.Text = obj.A3.ToString();
            textBox58.Text = obj.A4.ToString();

            textBox25.Text = obj.W1.ToString();
            textBox35.Text = obj.W2.ToString();
            textBox46.Text = obj.W3.ToString();
            textBox57.Text = obj.W4.ToString();

            textBox16.Text = obj.GFF_small.ToString();
            textBox15.Text = obj.GFF_medium.ToString();
            textBox37.Text = obj.GFF_large.ToString();
            textBox48.Text = obj.GFF_rupture.ToString();

            textBox17.Text = obj.mass_add_1.ToString();
            textBox27.Text = obj.mass_add_2.ToString();
            textBox38.Text = obj.mass_add_3.ToString();
            textBox49.Text = obj.mass_add_4.ToString();

            textBox18.Text = obj.mass_avail_1.ToString();
            textBox28.Text = obj.mass_avail_2.ToString();
            textBox39.Text = obj.mass_avail_3.ToString();
            textBox50.Text = obj.mass_avail_4.ToString();

            textBox19.Text = obj.t_n1.ToString();
            textBox29.Text = obj.t_n2.ToString();
            textBox40.Text = obj.t_n3.ToString();
            textBox51.Text = obj.t_n4.ToString();

            textBox20.Text = obj.ReleaseType_1.ToString();
            textBox30.Text = obj.ReleaseType_2.ToString();
            textBox41.Text = obj.ReleaseType_3.ToString();
            textBox52.Text = obj.ReleaseType_4.ToString();

            textBox21.Text = obj.ld_max_1.ToString();
            textBox31.Text = obj.ld_max_2.ToString();
            textBox42.Text = obj.ld_max_3.ToString();
            textBox53.Text = obj.ld_max_4.ToString();

            textBox22.Text = obj.rate_1.ToString();
            textBox32.Text = obj.rate_2.ToString();
            textBox43.Text = obj.rate_3.ToString();
            textBox54.Text = obj.rate_4.ToString();

            textBox23.Text = obj.ld_1.ToString();
            textBox33.Text = obj.ld_2.ToString();
            textBox44.Text = obj.ld_3.ToString();
            textBox55.Text = obj.ld_4.ToString();

            textBox24.Text = obj.mass_1.ToString();
            textBox34.Text = obj.mass_2.ToString();
            textBox45.Text = obj.mass_3.ToString();
            textBox56.Text = obj.mass_4.ToString();

        }
        public void initinput()
        {

        }
        public void initCAP()
        {

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
                TabArea.PageVisible = false;
                tabCAShell.PageVisible = true;
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
            }
        }
        private void addItemDetectionSystem()
        {
            cbDetectionSystem.Properties.Items.Add("", -1, -1);
            for (int i = 0; i < itemDetectionSystem.Length; i++)
            {
                cbDetectionSystem.Properties.Items.Add(itemDetectionSystem[i], i, i);
            }
        }
        private void addItemIsolationSystem()
        {
            cbIsolationSystem.Properties.Items.Add("", -1, -1);
            for (int i = 0; i < itemIsolationSystem.Length; i++)
            {
                cbIsolationSystem.Properties.Items.Add(itemIsolationSystem[i], i, i);
            }
        }
        private void addItemMitigation()
        {
            cbMitigationSystem.Properties.Items.Add("", -1, -1);
            for (int i = 0; i < itemMitigationSystem.Length; i++)
            {
                cbMitigationSystem.Properties.Items.Add(itemMitigationSystem[i], i, i);
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
            int test = ID; // test ở đây
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
        public RW_FULL_COF_TANK getDataInputCOFTank(int ID)
        {
            input.ID = ID;
            //input.ProdCost = float.Parse(a) ;
            //MessageBox.Show(txtProdCost.ToString(), txtDensity.ToString());
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
            //panelFCA.Top = panelRHP.Top + panelRHP.Height + 13;
            //panelFCA.Height = 21;
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
                //panelFCA.Top = panelRHP.Top + panelRHP.Height + 13;
            }
            else if (lblInput.Text == "▶ Input")
            {
                panelInput.Height = 21;
                lblInput.Text = "▼ Input";
                panelFQF.Top = panelInput.Top + panelInput.Height + 13;
                groupBoxIV.Top = panelFQF.Top + panelFQF.Height + 13;
                panelCAP.Top = panelInflu.Top + panelInflu.Height + 13;
                panelRHP.Top = panelCAP.Top + panelCAP.Height + 13;
                //panelFCA.Top = panelRHP.Top + panelRHP.Height + 13;
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
                //panelFCA.Top = panelRHP.Top + panelRHP.Height + 13;
            }
            else if (lblFQF.Text == "▶ Fully-Quantitive Financial Consequence of Failture and Category")
            {
                panelFQF.Height = 21;
                lblFQF.Text = "▼ Fully-Quantitive Financial Consequence of Failture and Category";
                groupBoxIV.Top = panelFQF.Top + panelFQF.Height + 13;
                panelCAP.Top = panelInflu.Top + panelInflu.Height + 13;
                panelRHP.Top = panelCAP.Top + panelCAP.Height + 13;
                //panelFCA.Top = panelRHP.Top + panelRHP.Height + 13;
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
                //panelFCA.Top = panelRHP.Top + panelRHP.Height + 13;
            }
            else if (lbllnfinput.Text == "▶ Influencing Inputs")
            {
                panelInflu.Height = 21;
                lbllnfinput.Text = "▼ Influencing Inputs";
                panelCAP.Top = panelInflu.Top + panelInflu.Height + 13;
                panelRHP.Top = panelCAP.Top + panelCAP.Height + 13;
                //panelFCA.Top = panelRHP.Top + panelRHP.Height + 13;
            }
        }

        private void lblCAP_Click(object sender, EventArgs e)
        {
            if (lblCAP.Text == "▼ Consequence Analysis Properties")
            {
                panelCAP.Height = 368;
                lblCAP.Text = "▶ Consequence Analysis Properties";
                panelRHP.Top = panelCAP.Top + panelCAP.Height + 13;
                //panelFCA.Top = panelRHP.Top + panelRHP.Height + 13;
            }
            else if (lblCAP.Text == "▶ Consequence Analysis Properties")
            {
                panelCAP.Height = 21;
                lblCAP.Text = "▼ Influencing Inputs";
                panelRHP.Top = panelCAP.Top + panelCAP.Height + 13;
                //panelFCA.Top = panelRHP.Top + panelRHP.Height + 13;
            }
        }

        private void lblRHP_Click(object sender, EventArgs e)
        {
            if (lblRHP.Text == "▼ Release Holes Properties")
            {
                panelRHP.Height = 342;
                lblRHP.Text = "▶ Release Holes Properties";
                //panelFCA.Top = panelRHP.Top + panelRHP.Height + 13;
            }
            else if (lblRHP.Text == "▶ Release Holes Properties")
            {
                panelRHP.Height = 21;
                lblRHP.Text = "▼ Release Holes Properties";
                //panelFCA.Top = panelFCA.Top + panelFCA.Height + 13;
            }
        }
        private void lblFCA_Click(object sender, EventArgs e)
        {
            if (lblFCA.Text == "▼ Flammable Consequence Area")
            {
                panelFCA.Height = 860;
                lblFCA.Text = "▶ Flammable Consequence Area";
            }
            else if (lblFCA.Text == "▶ Flammable Consequence Area")
            {
                panelFCA.Height = 21;
                lblFCA.Text = "▼ Flammable Consequence Area";
            }
        }
        private void lblTCA_Click(object sender, EventArgs e)
        {
            if (lblTCA.Text == "▼ Toxic Consequence Area")
            {
                panelTCA.Height = 398;
                lblTCA.Text = "▶ Toxic Consequence Area";
            }
            else if (lblTCA.Text == "▶ Toxic Consequence Area")
            {
                panelTCA.Height = 21;
                lblTCA.Text = "▼ Toxic Consequence Area";
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
        private void showData(int ID, float mass_inv, String DetectionType, String IsolationType, String Mitigation )
        {
            RW_FULL_COF_INPUT_BUS busfcip = new RW_FULL_COF_INPUT_BUS();
            RW_FULL_COF_INPUT obj = busfcip.getData(ID);
            cbDetectionSystem.SelectedItem = obj.DetectionType;
            cbIsolationSystem.SelectedItem = obj.IsolationType;
            cbMitigationSystem.SelectedItem = obj.Mitigation;
            txtFM.Text = obj.mass_inv.ToString();

        }
        public void getData(int ID)
        {
            RW_FULL_COF_INPUT fcip = new RW_FULL_COF_INPUT();
            RW_FULL_COF_INPUT_BUS fcipbus = new RW_FULL_COF_INPUT_BUS();
            fcip.ID=ID;
            fcip.DetectionType = cbDetectionSystem.Text;
            fcip.IsolationType = cbIsolationSystem.Text;
            fcip.Mitigation = cbMitigationSystem.Text;         
            fcip.mass_inv = float.Parse(txtFM.Text);
            fcipbus.add(fcip);
            // return fcip;

        }

        private void cbDetectionSystem_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        private void tabRisk_TabIndexChanged(object sender, EventArgs e)
        {
           
        }
        void calculatioArea()
        {

        }
        private void tabRisk_SelectedPageChanged(object sender, DevExpress.XtraTab.TabPageChangedEventArgs e)
        {
            
            if (tabRisk.SelectedTabPage.Name == "TabArea")
            {
                MSSQL_CA_CAL_FLAMMABLE CA_CAL_FLA = new MSSQL_CA_CAL_FLAMMABLE();
                Console.WriteLine("fact_mit= " + CA_CAL_FLA.fact_mit());

            }
                MessageBox.Show("shfgsdhfgsd");
        }

       
    }
}
