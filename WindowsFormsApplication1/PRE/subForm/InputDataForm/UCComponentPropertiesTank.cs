﻿using System;
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

namespace RBI.PRE.subForm.InputDataForm
{
    public partial class UCComponentPropertiesTank : UserControl
    {
        string[] itemsSeverity = { "None", "Low", "Medium", "High" };
        string[] itemsBrinnellHardness = { "Below 200", "Between 200 and 237", "Greater than 237" };
        string[] itemsComplexityProtrusion = { "Above average", "Average", "Below average" };
        private int datachange = 0;
        private int ctrlSpress = 0;
        public UCComponentPropertiesTank(int ID, string type, string diameterUnit, string thicknessUnit, string corrosionRateUnit)
        {
            InitializeComponent();
            panel1.Height = 20;
            panel2.Height = 20;
            panel3.Height = 20;
            panel4.Height = 20;
            panel5.Height = 20;
            panel6.Height = 20;
            panel2.Top = panel1.Top + panel1.Height + 20;
            panel3.Top = panel2.Top + panel2.Height + 20;
            panel4.Top = panel3.Top + panel3.Height + 20;
            panel5.Top = panel4.Top + panel4.Height + 20;
            panel6.Top = panel5.Top + panel5.Height + 20;
            ShowDataToControl(ID, diameterUnit, thicknessUnit, corrosionRateUnit);
            if (type == "Shell")
            {
                chkConcreteAsphalt.Enabled = false;
                chkPreventionBarrier.Enabled = false;
            }
            else
            lblDiameter.Text = diameterUnit;
            lblCorrosionRate.Text = corrosionRateUnit;
        }
        private void ShowDataToControl(int ID, string diameter, string thickness, string corrosionRate)
        {
            RW_COMPONENT_BUS busCom = new RW_COMPONENT_BUS();
            RW_COMPONENT com = busCom.getData(ID);
            BUS_UNITS convUnit = new BUS_UNITS();
            if (diameter == "in") txtTankDiameter.Text = (com.NominalDiameter/ convUnit.inch).ToString(); // converst mm sang in
            else if (diameter == "mm") txtTankDiameter.Text = com.NominalDiameter.ToString(); // giữ nguyên
            else txtTankDiameter.Text = (com.NominalDiameter / 1000).ToString(); // converst mm sang m

            if (thickness == "mm")
            {
                txtNominalThickness.Text = com.NominalThickness.ToString(); //giữ nguyên
                txtCurrentThickness.Text = com.CurrentThickness.ToString();// giữ nguyên
                txtMinRequiredThickness.Text = com.MinReqThickness.ToString();//  giữ nguyên
            }
            else if (thickness == "in")
            {
                txtNominalThickness.Text = (com.NominalThickness / convUnit.inch).ToString(); //converst mm sang in
                txtCurrentThickness.Text = (com.CurrentThickness / convUnit.inch).ToString(); //converst mm sang in
                txtMinRequiredThickness.Text = (com.MinReqThickness / convUnit.inch).ToString(); //converst mm sang in
            }
            else
            {
                txtNominalThickness.Text = (com.NominalThickness / 1000).ToString(); // converst mm sang m
                txtCurrentThickness.Text = (com.CurrentThickness / 1000).ToString(); // converst mm sang m
                txtMinRequiredThickness.Text = (com.MinReqThickness / 1000).ToString(); // converst mm sang m
            }

            if (corrosionRate == "mm/yr") txtCurrentCorrosionRate.Text = com.CurrentCorrosionRate.ToString(); // converst mm sang mm
            else txtCurrentCorrosionRate.Text = (com.CurrentCorrosionRate / convUnit.mil).ToString(); // converst mm sang mil
            chkConcreteAsphalt.Checked = com.ConcreteFoundation == 1 ? true : false;
            chkPresenceCracks.Checked = com.CracksPresent == 1 ? true : false;
            chkPreventionBarrier.Checked = com.ReleasePreventionBarrier == 1 ? true : false;
            for(int i = 0; i<itemsBrinnellHardness.Length;i++)
            {
                if(itemsBrinnellHardness[i] == com.BrinnelHardness)
                {
                    cbMaxBrillnessHardness.SelectedIndex = i + 1;
                    break;
                }
            }
            for(int i = 0; i < itemsComplexityProtrusion.Length; i++)
            {
                if(itemsComplexityProtrusion[i] == com.ComplexityProtrusion)
                {
                    cbComplexityProtrusion.SelectedIndex = i + 1;
                    break;
                }
            }
            for(int i = 0; i < itemsSeverity.Length; i++)
            {
                if(itemsSeverity[i] == com.SeverityOfVibration)
                {
                    cbSeverityVibration.SelectedIndex = i + 1;
                    break;
                }
            }
        }
        public RW_COMPONENT getData(int ID, string diameter, string thickness, string corrosionRate)
        {
            RW_COMPONENT comp = new RW_COMPONENT();
            comp.ID = ID;
            BUS_UNITS convUnit = new BUS_UNITS();
            //Generic Properties
            if (diameter == "mm") comp.NominalDiameter = txtTankDiameter.Text != "" ? float.Parse(txtTankDiameter.Text) : 0;
            else if (diameter == "in") comp.NominalDiameter = txtTankDiameter.Text != "" ? (float)(double.Parse(txtTankDiameter.Text) * convUnit.inch) : 0; // in sang mm
            else comp.NominalDiameter = txtTankDiameter.Text != "" ? float.Parse(txtTankDiameter.Text) * 1000 : 0; // m sang mm
            if (thickness == "mm")
            {
                comp.NominalThickness = txtNominalThickness.Text != "" ? float.Parse(txtNominalThickness.Text) : 0;
                comp.MinReqThickness = txtMinRequiredThickness.Text != "" ? float.Parse(txtMinRequiredThickness.Text) : 0;
                comp.BrittleFractureThickness = txtBrittleFractureThickness.Text != "" ? float.Parse(txtBrittleFractureThickness.Text) : 0;
                comp.StructuralThickness = txtStructuralThickness.Text != "" ? float.Parse(txtStructuralThickness.Text) : 0;

            }
            else if (thickness == "in")
            {
                comp.NominalThickness = txtNominalThickness.Text != "" ? (float)(double.Parse(txtNominalThickness.Text) * convUnit.inch) : 0; // in sang mm
                comp.MinReqThickness = txtMinRequiredThickness.Text != "" ? (float)(double.Parse(txtMinRequiredThickness.Text) * convUnit.inch) : 0;// in sang mm
                comp.BrittleFractureThickness = txtBrittleFractureThickness.Text != "" ? (float)(double.Parse(txtBrittleFractureThickness.Text) * convUnit.inch) : 0;
                comp.StructuralThickness = txtStructuralThickness.Text != "" ? (float)(double.Parse(txtStructuralThickness.Text) * convUnit.inch) : 0;
            }
            else
            {
                comp.NominalThickness = txtNominalThickness.Text != "" ? (float)(double.Parse(txtNominalThickness.Text) * 1000) : 0; // m sang mm
                comp.MinReqThickness = txtMinRequiredThickness.Text != "" ? (float)(double.Parse(txtMinRequiredThickness.Text) * 1000) : 0;// m sang mm
                comp.BrittleFractureThickness = txtBrittleFractureThickness.Text != "" ? (float)(double.Parse(txtBrittleFractureThickness.Text) * 1000) : 0;
                comp.StructuralThickness = txtStructuralThickness.Text != "" ? (float)(double.Parse(txtStructuralThickness.Text) *1000): 0;
            }
            if (corrosionRate == "mm/yr") comp.CurrentCorrosionRate = txtCurrentCorrosionRate.Text != "" ? (float)double.Parse(txtCurrentCorrosionRate.Text) : 0;
            else comp.CurrentCorrosionRate = txtCurrentCorrosionRate.Text != "" ? (float)(double.Parse(txtCurrentCorrosionRate.Text) * convUnit.mil) : 0; // mil/yr sang mm/yr
            comp.AllowableStress = txtAllowableStress.Text != "" ? float.Parse(txtAllowableStress.Text) : 0;
            comp.WeldJointEfficiency = txtWeldJointEfficiency.Text != "" ? float.Parse(txtWeldJointEfficiency.Text) : 0;
            comp.ComponentVolume = txtComponentVolume.Text != "" ? float.Parse(txtComponentVolume.Text) : 0;
            comp.ConfidenceCorrosionRate = cbConfidenceCorrosionRate.Text;
            comp.CracksPresent = chkPresenceCracks.Checked ? 1 : 0;
            comp.MinimumStructuralThicknessGoverns = chkMinimumStructuralThicknessGoverns.Checked ? 1 : 0;
            //Governing Stress Corrosion Cracking Damage Factor
            comp.BrinnelHardness = cbMaxBrillnessHardness.Text;
            //Governing Brittle Fracture Damage Factor
            comp.FabricatedSteel = chkFabricatedSteel.Checked ? 1 : 0;
            comp.EquipmentSatisfied = chkEquipmentSatisfied.Checked ? 1 : 0;
            comp.NominalOperatingConditions = chkNominalOperatingConditions.Checked ? 1 : 0;
            comp.CETGreaterOrEqual = chkCETGreaterOrEqual.Checked ? 1 : 0;
            comp.CyclicServiceFatigueVibration = chkCyclicServiceFatigueVibration.Checked ? 1 : 0;
            comp.EquipmentCircuitShock = chkEquipmentCircuitShock.Checked ? 1 : 0;
            //Governing Fatigue Damage Factor
            comp.SeverityOfVibration = cbSeverityVibration.Text;
            //Governing External Damage Factor
            comp.ComplexityProtrusion = cbComplexityProtrusion.Text;
            //Tank Consequence of Falure
            comp.ConcreteFoundation = chkConcreteAsphalt.Checked ? 1 : 0;
            comp.ShellHeight = txtShellHeight.Text != "" ? float.Parse(txtShellHeight.Text) : 0;
            comp.ReleasePreventionBarrier = chkPreventionBarrier.Checked ? 1 : 0;
            return comp;
        }

        public RW_INPUT_CA_TANK getDataforTank(int ID, string diameter)
        {
            RW_INPUT_CA_TANK tank = new RW_INPUT_CA_TANK();
            BUS_UNITS convUnit = new BUS_UNITS();
            tank.ID = ID;
            if (diameter == "mm") tank.TANK_DIAMETTER = txtTankDiameter.Text != "" ? float.Parse(txtTankDiameter.Text) : 0;
            else if (diameter == "in") tank.TANK_DIAMETTER = txtTankDiameter.Text != "" ? (float)(double.Parse(txtTankDiameter.Text) * convUnit.inch) : 0; // in sang mm
            else tank.TANK_DIAMETTER = txtTankDiameter.Text != "" ? float.Parse(txtTankDiameter.Text) * 1000 : 0; // m sang mm
            tank.TANK_DIAMETTER = txtTankDiameter.Text != "" ? float.Parse(txtTankDiameter.Text) : 0;
            tank.Prevention_Barrier = chkPreventionBarrier.Checked ? 1 : 0;
            return tank;
        }
        private void addItemsBrinnellHardness()
        {
            cbMaxBrillnessHardness.Properties.Items.Add("", -1, -1);
            for(int i = 0; i < itemsBrinnellHardness.Length; i++)
            {
                cbMaxBrillnessHardness.Properties.Items.Add(itemsBrinnellHardness[i], i, i);
            }
        }
        #region Key Press Event

        private void keyPressEvent(TextBox textbox, KeyPressEventArgs ev)
        {
            string a = textbox.Text;
            if (!char.IsControl(ev.KeyChar) && !char.IsDigit(ev.KeyChar) && (ev.KeyChar != '.'))
            {
                ev.Handled = true;
            }
            if (a.Contains('.') && ev.KeyChar == '.')
            {
                ev.Handled = true;
            }
        }

        private void txtTankDiameter_KeyPress(object sender, KeyPressEventArgs e)
        {
            keyPressEvent(txtTankDiameter, e);
        }

        private void txtCurrentThickness_KeyPress(object sender, KeyPressEventArgs e)
        {
            keyPressEvent(txtCurrentThickness, e);
        }

        private void txtCurrentCorrosionRate_KeyPress(object sender, KeyPressEventArgs e)
        {
            keyPressEvent(txtCurrentCorrosionRate, e);
        }

        private void txtNominalThickness_KeyPress(object sender, KeyPressEventArgs e)
        {
            keyPressEvent(txtNominalThickness, e);
        }

        private void txtMinRequiredThickness_KeyPress(object sender, KeyPressEventArgs e)
        {
            keyPressEvent(txtMinRequiredThickness, e);
        }
        #endregion

        #region Xu ly su kien data thay doi

        public event DataUCChangedHanlder DataChanged;
        public event CtrlSHandler CtrlS_Press;
        public int DataChange
        {
            get { return datachange; }
            set
            {
                datachange = value;
                OnDataChanged(new DataUCChangedEventArgs(datachange));
            }
        }
        public int CtrlSPress
        {
            get { return ctrlSpress; }
            set
            {
                ctrlSpress = value;
                OnCtrlS_Press(new CtrlSPressEventArgs(ctrlSpress));
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

        private void KeyPress1(KeyEventArgs e)
        {
            if (e.Control && e.KeyCode == Keys.S)
            {
                CtrlSPress++;
            }
        }
        private void txtTankDiameter_TextChanged(object sender, EventArgs e)
        {
            DataChange++;
        }

        private void txtTankDiameter_KeyDown(object sender, KeyEventArgs e)
        {
            KeyPress1(e);
        }
        #endregion

        private void label7_Click(object sender, EventArgs e)
        {
            if (label7.Text == "▼ Generic Properties")
            {
                panel1.Height = 220;
                label7.Text = "▶ Generic Properties";
                panel2.Top = panel1.Top + panel1.Height + 20;
                panel3.Top = panel2.Top + panel2.Height + 20;
                panel4.Top = panel3.Top + panel3.Height + 20;
                panel5.Top = panel4.Top + panel4.Height + 20;
                panel6.Top = panel5.Top + panel5.Height + 20;
            }
            else if (label7.Text == "▶ Generic Properties")
            {
                panel1.Height = 26;
                label7.Text = "▼ Generic Properties";
                panel2.Top = panel1.Top + panel1.Height + 20;
                panel3.Top = panel2.Top + panel2.Height + 20;
                panel4.Top = panel3.Top + panel3.Height + 20;
                panel5.Top = panel4.Top + panel4.Height + 20;
                panel6.Top = panel5.Top + panel5.Height + 20;
            }
        }

        private void label8_Click(object sender, EventArgs e)
        {
            if (label8.Text == "▼ Governing External Damage Factor Properties")
            {
                panel2.Height = 50;
                label8.Text = "▶ Governing External Damage Factor Properties";
                panel3.Top = panel2.Top + panel2.Height + 20;
                panel4.Top = panel3.Top + panel3.Height + 20;
                panel5.Top = panel4.Top + panel4.Height + 20;
                panel6.Top = panel5.Top + panel5.Height + 20;
            }
            else if (label8.Text == "▶ Governing External Damage Factor Properties")
            {
                panel2.Height = 26;
                label8.Text = "▼ Governing External Damage Factor Properties";
                panel3.Top = panel2.Top + panel2.Height + 20;
                panel4.Top = panel3.Top + panel3.Height + 20;
                panel5.Top = panel4.Top + panel4.Height + 20;
                panel6.Top = panel5.Top + panel5.Height + 20;
            }
        }

        private void label9_Click(object sender, EventArgs e)
        {
            if (label9.Text == "▼ Governing Stress Corrosion Cracking Damage Factor Properties")
            {
                panel3.Height = 50;
                label9.Text = "▶ Governing Stress Corrosion Cracking Damage Factor Properties";
                panel4.Top = panel3.Top + panel3.Height + 20;
                panel5.Top = panel4.Top + panel4.Height + 20;
                panel6.Top = panel5.Top + panel5.Height + 20;
            }
            else if (label9.Text == "▶ Governing Stress Corrosion Cracking Damage Factor Properties")
            {
                panel3.Height = 26;
                label9.Text = "▼ Governing Stress Corrosion Cracking Damage Factor Properties";
                panel4.Top = panel3.Top + panel3.Height + 20;
                panel5.Top = panel4.Top + panel4.Height + 20;
                panel6.Top = panel5.Top + panel5.Height + 20;
            }
        }

        private void label13_Click(object sender, EventArgs e)
        {
            if (label13.Text == "▼ Governing Brittle Fracture Damage Factor Properties")
            {
                panel4.Height = 320;
                label13.Text = "▶ Governing Brittle Fracture Damage Factor Properties";
                panel5.Top = panel4.Top + panel4.Height + 20;
                panel6.Top = panel5.Top + panel5.Height + 20;
            }
            else if (label13.Text == "▶ Governing Brittle Fracture Damage Factor Properties")
            {
                panel4.Height = 26;
                label13.Text = "▼ Governing Brittle Fracture Damage Factor Properties";
                panel5.Top = panel4.Top + panel4.Height + 20;
                panel6.Top = panel5.Top + panel5.Height + 20;
            }
        }

        private void label40_Click(object sender, EventArgs e)
        {
            if (label40.Text == "▼ Governing Fatique Damage Factor Properties")
            {
                panel5.Height = 60;
                label40.Text = "▶ Governing Fatique Damage Factor Properties";
                panel6.Top = panel5.Top + panel5.Height + 20;
            }
            else if (label40.Text == "▶ Governing Fatique Damage Factor Properties")
            {
                panel5.Height = 26;
                label40.Text = "▼ Governing Fatique Damage Factor Properties";
                panel6.Top = panel5.Top + panel5.Height + 20;
            }
        }

        private void label20_Click(object sender, EventArgs e)
        {
            if (label20.Text == "▼ Tank Consequence of Failure Properties")
            {
                panel6.Height = 120;
                label20.Text = "▶ Tank Consequence of Failure Properties";
            }
            else if (label20.Text == "▶ Tank Consequence of Failure Properties")
            {
                panel6.Height = 26;
                label20.Text = "▼ Tank Consequence of Failure Properties";
            }
        }
    }
}
