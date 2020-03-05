using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RBI.Object
{
    class ProcessPlant
    {
        public String EquipmentNumber { set; get; }
        public String Component { set; get; }
        public String ComponentNumber { set; get; }
        public String Site { set; get; }
        public String Facility { set; get; }
        String AP1 { set; get; }
        String AP2 { set; get; }
        String AP3 { set; get; }
        String RLI { set; get; }
        public String AssessmentName { set; get; }
        public String AssessmentDate { set; get; }
        public String CommissionDate { set; get; }
        public String RiskAnalysisPeriod { set; get; }
        public String EquipmentType { set; get; }
        public String ComponentType { set; get; }
        String InspectionDueDate { set; get; }//?
        public  String DesignCode { set; get; }
        public String AdministrativeControl { set; get; }
        public String ContainsDeadlegs { set; get; }
        public String PresenceofSulphidesOperation { set; get; }
        public String SteamedOut { set; get; }
        public String ThermalHistory { set; get; }
        public String SystemManagementFactor { set; get; }
        public String PWHT { set; get; }
        public String PressurisarionControlledbyAdmin { set; get; }
        public String PresenceofSulphidesShutdown { set; get; }
        public String OnlineMonitoring { set; get; }
        public String MinRequiredTemperature { set; get; }
        public String MaterialisExposedtoFluids { set; get; }
        public String CyclicOperation { set; get; }
        public String LinerOnlineMonitoring { set; get; }
        public String DowntimeProtectionUsed { set; get; }
        public String EquipmentisOperating { set; get; }
        public String EquipmentVolume { set; get; }
        public String InterfaceatSoilorWater { set; get; }
        public String ExternalEnvironment { set; get; }
        public String HeatTraced { set; get; }
        public String HighlyEffectiveInspection { set; get; }
        public String MinimumMeasuredThickness { set; get; }
        public String NominalThickness { set; get; }
        public String NominalDiameter { set; get; }
        public ProcessPlant()
        {

        }
    }
}
