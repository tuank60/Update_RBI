using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using RBI.BUS.BUSMSSQL_CAL.Table;

namespace RBI.BUS.BUSMSSQL_CAL
{
    class CAL_DM_CARBONATE_CRACKING
    {
        //<Carboonate Cracking>
        // 1. material is carbon or allow stell
        // 2. Environment Content H2S
        // 3. PH > 7.5
        public String CACBONATE_INSP_EFF { set; get; }
        public int CACBONATE_INSP_NUM { set; get; }
        public float CO3_CONCENTRATION { set; get; }
        public float PH { set; get; }
        public Boolean CRACK_PRESENT { set; get; }
        public Boolean PWHT { set; get; }
        public Boolean EXPOSED_SULFUR { set; get; }
        public Boolean CARBON_ALLOY { set; get; }

        //</Carboonate Cracking>
        public string GET_SUSCEPTIBILITY_CARBONATE()
        {
            string sus = "None";
            if (CRACK_PRESENT) sus = "High";
            else if (PWHT)
            {
                sus = "None";
            }
            else
            {
                if (CO3_CONCENTRATION < 100)
                    sus = (PH >= 9.0) ? "High" : ((PH >= 7.5) ? "Low" : "None");
                else
                    sus = (PH >= 8.0) ? "High" : ((PH >= 7.5) ? "Medium" : "None");
            }
            return sus;
        }
        public int SVI_CARBONATE()
        {
            switch (GET_SUSCEPTIBILITY_CARBONATE())
            {
                case "High": return 1000;
                case "Medium": return 100;
                case "Low": return 10;
                default: return 0;
            }
        }
        Table6_3 table = new Table6_3();
        public float DF_CACBONATEforBase(float age)
        {
            if (CARBON_ALLOY && EXPOSED_SULFUR && PH >= 7.5)
            {
                float DFB_CACBONATE = (float)table.LookupSCCDamageFactor(CACBONATE_INSP_EFF, CACBONATE_INSP_NUM, SVI_CARBONATE());
                return DFB_CACBONATE;
            }
            else
                return -1;
        }
        public float DF_CACBONATE(float age)
        {
            if (CARBON_ALLOY && EXPOSED_SULFUR && PH >= 7.5)
            {
                float DFB_CACBONATE = (float)table.LookupSCCDamageFactor(CACBONATE_INSP_EFF, CACBONATE_INSP_NUM,SVI_CARBONATE());
                return DFB_CACBONATE * (float)Math.Pow(Math.Max(age, 1.0), 1.1);
            }
            else
                return -1;
        }
    }

}
